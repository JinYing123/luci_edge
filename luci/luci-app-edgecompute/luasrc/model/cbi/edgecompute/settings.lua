local m, s, o
local uci = luci.model.uci.cursor()
local i18n = require "luci.i18n"
local _ = i18n.translate

m = Map("edgecompute", _("Edge Compute Settings"), _("Configure the edge computing parameters."))

s = m:section(TypedSection, "settings", _("Settings"))
s.addremove = false
s.anonymous = true

o1 = s:option(Value, "compute_power", _("Compute Power (MHz)"))
o1.datatype = "uinteger"
o1.default = 1000

o2 = s:option(Flag, "enable", _("Enable Edge Compute"))
o2.default = 0

return m
