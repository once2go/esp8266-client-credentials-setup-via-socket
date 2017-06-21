print("Connect to "..s_ssid..". Please wait")
wifi.setmode(wifi.STATION)
wifi.sta.config(s_ssid, s_passwd)
wifi.sta.connect()

cnt = 0
tmr.alarm(1, 3000, 1, function() 
if (wifi.sta.getip() == nil) and (cnt < 5) then 
    print("Wait...")
    cnt = cnt + 1 
else 
    tmr.stop(1)
    if (cnt < 5) then 
    	print("Config done, IP is "..wifi.sta.getip())
    else
		dofile("imode.lua")
        gpio.write(NET_INDICATOR, gpio.LOW)
	end 
	cnt = nil
	collectgarbage()
end 
end)

