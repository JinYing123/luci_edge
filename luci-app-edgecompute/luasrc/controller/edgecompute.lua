module("luci.controller.edgecompute", package.seeall)

function index()
    entry({"admin", "services", "edgecompute"}, firstchild(), _("Edge Compute"), 60).dependent = false
    entry({"admin", "services", "edgecompute", "settings"}, cbi("edgecompute/settings"), _("Settings"), 10)
    entry({"admin", "services", "edgecompute", "status"}, template("edgecompute/status"), _("Status"), 20)
    entry({"admin", "services", "edgecompute", "status", "json"}, call("action_status_json"))
end

function action_status_json()
    local data = {
        running = luci.sys.call("pgrep edge-compute >/dev/null") == 0,
        compute_power = tonumber(luci.util.trim(luci.sys.exec("uci get edgecompute.@settings[0].compute_power"))) or 0
    }
    
    luci.http.prepare_content("application/json")
    luci.http.write_json(data)
end

entry({"admin", "services", "edgecompute", "status"}, call("action_status"))

function action_status()
    local uci = require("luci.model.uci").cursor()
    local compute_power = uci:get("edgecompute", "settings", "compute_power") or "0"
    local enable = uci:get("edgecompute", "settings", "enable") or "0"
    luci.http.prepare_content("application/json")
    luci.http.write_json({compute_power = compute_power, enable = enable})
end
