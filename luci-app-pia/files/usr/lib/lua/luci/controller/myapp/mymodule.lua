module("luci.controller.myapp.mymodule", package.seeall)

function index()
    entry({"admin", "services", "PIA"}, cbi("pia/pia-config"), "PIA", 10).dependent=false
end
     
