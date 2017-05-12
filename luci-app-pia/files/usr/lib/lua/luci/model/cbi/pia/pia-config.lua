local fs = require "nixio.fs"

m = Map("openvpn", "Private Internet Access")

s = m:section(TypedSection, "openvpn", "Login")
s.addremove = false 
s.anonymous = true
function s:filter(value)
   return value == "pia" and value -- Don't touch loopback
end 

u = s:option(Value, "user", "PIA Username", "Username for your PIA Account")
pw1 = s:option(Value, "password", "PIA Password", "Password for your PIA account")
pw1.password = true

s:option(Flag, "boot", "Connect VPN on start", "Connects the VPN on boot of the router")


e = s:option(ListValue, "remote", "PIA Location", "Choose a location geographically close to you.")
e:value("aus-melbourne.privateinternetaccess.com 1198", "AU Melbourne")
e:value("aus-sydney.privateinternetaccess.com 1198", "AU Sydney")
e:value("denmark.privateinternetaccess.com 1198", "Denmark")
e:value("france.privateinternetaccess.com 1198", "France")
e:value("us-california.privateinternetaccess.com 1198","US California")
e:value("us-newyorkcity.privateinternetaccess.com 1198", "US New York City")
e:value("us-east.privateinternetaccess.com 1198", "US East")
e.default = "US East"

return m
