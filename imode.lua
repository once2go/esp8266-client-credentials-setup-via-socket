wifi.setmode(wifi.SOFTAP)
cfg={}
cfg.ssid="AP psw:12345678 sprt:9876"
cfg.pwd="12345678"
wifi.ap.config(cfg)
dofile("credset.lua")
print("Waiting for setup")