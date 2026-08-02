local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zynthire/Nebula/main/main.lua"))()
end)

if success then
    print("[NEBULA] Loaded Successfully")
else
    warn("[NEBULA] Failed to Load:", err)
end
