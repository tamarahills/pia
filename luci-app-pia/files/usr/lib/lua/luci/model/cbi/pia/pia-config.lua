local fs = require "nixio.fs"

m = Map("pia", "Private Internet Access")

s = m:section(TypedSection, "pia-config-section", "Config")
s.addremove = false
s.anonymous = true

u = s:option(Value, "user", "PIA Username", "Username for your PIA Account")
pw1 = s:option(Value, "password", "PIA Password", "Password for your PIA account")
pw1.password = true

function s.cfgsections()
        return { "_pass" }
end

m.on_commit = function(map)

end

function u:validate(value) -- Now, that's nifty, eh?
            local v1 = pw1:formvalue("_pass")
            local f = io.open("/etc/openvpn/pialogin.pem", "w+")
            if f then
                     f:write(v1, "\n")
                     f:write(value, "\n")
                     f:close()
            end

    return value:match(value)
end


s:option(Flag, "boot", "Connect VPN on start", "Connects the VPN on boot of the router")

e = s:option(ListValue, "remote", "PIA Location", "Choose a location geographically close to you.")
e:value("aus-melbourne.privateinternetaccess.com", "AU Melbourne")
e:value("aus-sydney.privateinternetaccess.com", "AU Sydney")
e:value("denmark.privateinternetaccess.com", "Denmark")
e:value("france.privateinternetaccess.com", "France")
e:value("us-california.privateinternetaccess.com","US California")
e:value("us-newyorkcity.privateinternetaccess.com", "US New York City")
e:value("us-east.privateinternetaccess.com", "US East")
e.default = "US East"

return m

