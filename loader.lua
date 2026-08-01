local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zynthire/Nebula/main/main.lua"))()
end)

if success then
    print("Nebula loaded successfully!")
else
    warn("Failed to load Nebula:", err)
end
