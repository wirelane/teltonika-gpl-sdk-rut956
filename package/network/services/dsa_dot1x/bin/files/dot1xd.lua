#!/usr/bin/lua
local IDENTITY_REQUEST_TIMEOUT=30000
local util = require "vuci.util"
local board = require("vuci.board")
local single_port = not board:has_dsa() and not board:has_switch()
local uci = require("uci")
require "ubus"
require "uloop"

uloop.init()

local conn = ubus.connect()
if not conn then
	error("Failed to connect to ubus")
end

local port_settings = {}

local ubus_handler = function(msg, name)
	if name ~= "ieee802_1x" then return end
	local settings = port_settings[msg.iface]

	local authorized = msg.authorized or (settings.use_vlans and settings.reject_vlan ~= "disabled")
	util.exec(string.format("/usr/sbin/dot1x_port_blocker toggle_controlled_port %s %s %s", msg.iface, tostring(not authorized), msg.address or ""))

	if not settings.use_vlans then return end
	if msg.authorized then
		util.exec(string.format("/usr/sbin/dot1x_port_blocker assign_vlan %s %s", msg.iface,
			settings.accept_vlan ~= "radius_assigned" and settings.accept_vlan or msg.vid))
	elseif settings.reject_vlan ~= "disabled" then
		util.exec(string.format("/usr/sbin/dot1x_port_blocker assign_vlan %s %s", msg.iface, settings.reject_vlan))
	end
	util.exec("/usr/sbin/dot1x_port_blocker sync")
end

local dot1x_reader = { notify = ubus_handler }

local valid_hostapd_ifaces = { }

local function load_uci_settings()
	port_settings = {}
	valid_hostapd_ifaces = {}
	uci.cursor():foreach("dot1x", "port", function(s)
		table.insert(valid_hostapd_ifaces, "hostapd."..s.iface)
		port_settings[s.iface] = {
			enabled = s.enabled == "1" and s.role == "server",
			accept_vlan = s.accept_vlan,
			reject_vlan = s.reject_vlan,
			use_vlans = s.no_vlans ~= "1",
			port = s.iface
		}
	end)
end

load_uci_settings()

local existing_objects = conn:objects()
for _, obj in ipairs(existing_objects) do
	if util.contains(valid_hostapd_ifaces, obj) then
		conn:subscribe(obj, dot1x_reader)
	end
end

local objects = {
	["ubus.object.add"] = function(msg)
		if util.contains(valid_hostapd_ifaces, msg.path) then
			conn:subscribe(msg.path, dot1x_reader)
		end
	end
}

local function port_events(msg, name)
	if name ~= "link_update" then return end
	if msg.state ~= "DOWN" then return end
	local port = string.lower(msg.port)
	if single_port and port == "lan1" then port = "eth0" end
	local settings = port_settings[port] or port_settings["1x_"..port]
	if not settings or not settings.enabled then return end
	util.exec(string.format("/usr/sbin/dot1x_port_blocker toggle_controlled_port %s true", settings.port))
	util.exec("/usr/sbin/dot1x_port_blocker sync")
	conn:call("hostapd."..settings.port, "reload", {})
end
local port_events_table = {notify = port_events}
conn:subscribe("port_events", port_events_table)

local methods = {
	dot1x_glue = {
		status = {
			function(req, _)
				local port_status = {}
				uci.cursor():foreach("dot1x", "port", function(s)
					local state = string.gsub(util.exec("/usr/sbin/dot1x_port_blocker get_port_state "..s.iface), "%s+", "")
					port_status[s[".name"]] = {state = state}
				end)
				conn:reply(req, port_status)
			end, {}
		},
		reload = {
			function(_, _)
				load_uci_settings()
			end, {}
		},
	}
}

local identity_timer
local function request_identity()
	identity_timer:set(IDENTITY_REQUEST_TIMEOUT)
	uci.cursor():foreach("dot1x", "port", function(s)
		if s.enabled ~= "1" or s.role ~= "server" then return end
		local state = string.gsub(util.exec("/usr/sbin/dot1x_port_blocker get_port_state "..s.iface), "%s+", "")
		if state == "AUTHORIZED" then return end
		util.exec("/usr/sbin/eap_sender "..s.iface)
	end)
end
identity_timer = uloop.timer(request_identity)
identity_timer:set(IDENTITY_REQUEST_TIMEOUT)

conn:listen(objects)
conn:add(methods)

uloop.run()
