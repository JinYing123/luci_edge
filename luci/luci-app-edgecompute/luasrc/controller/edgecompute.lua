module("luci.controller.edgecompute", package.seeall)

function index()
    entry({"admin", "edgecompute"}, template("edgecompute/status"), _("Edge Compute"), 31)
end