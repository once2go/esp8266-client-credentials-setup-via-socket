ready = false
response = ""
sv=net.createServer(net.TCP, 30)
	sv:listen(9876,function(c)
     c:on("receive", function(c, pl)
     ok, t = pcall(cjson.decode, pl)
     if ok then
          for k,v in pairs(t) do 
          if( k == "credentials") and ( v == "set") then 
          	 ready = true
     		 response = '{"status":"OK"}'
          end
          if ready and ( k == "ssid") then 
          	if (v == nil) or (v == '') then 
          		response = '{"status":"SSID not correct"}'
          	else 
          	    n_ssid = v
     		    response = '{"status":"OK"}'
     		end
          end
          if ready and ( k == "password") then 
          	n_passwd = v
     		response = '{"status":"OK"}'
          end
          if ready and ( k == "config") then 
          	if v then 
          		dofile("writecred.lua")
          	else 
          		node.restart()
          	end
          end
          if response == '' then response = '{"status":"Unknown command"}' end 
          end
     else 
          response = '{"status":"Invalid JSON"}'
     end
     c:send(response)
     end)
     c:send("Connected")
end)
