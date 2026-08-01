print("Loader started")

local success, result = pcall(function()
    return require("main")
end)

if success then
    print("main.lua loaded successfully")
else
    warn("Failed to load main.lua:", result)
end
