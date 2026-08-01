local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zynthire/Nebula/main/main.lua"))()
end)

local function notify(text, isError)
    local gui = Instance.new("ScreenGui")
    gui.Name = "NebulaNotif"
    gui.ResetOnSpawn = false
    gui.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 270, 0, 48)
    frame.Position = UDim2.new(1, -290, 1, -65)
    frame.BackgroundColor3 = isError and Color3.fromRGB(35, 18, 18) or Color3.fromRGB(18, 18, 28)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 7)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.4
    stroke.Color = isError and Color3.fromRGB(170, 45, 45) or Color3.fromRGB(90, 90, 240)
    stroke.Parent = frame

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, -16, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextColor3 = Color3.fromRGB(240, 240, 240)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = text
    label.Parent = frame

    -- tuff fade in
    frame.BackgroundTransparency = 1
    label.TextTransparency = 1
    stroke.Transparency = 1

    local ts = game:GetService("TweenService")
    ts:Create(frame, TweenInfo.new(0.25), {BackgroundTransparency = 0}):Play()
    ts:Create(label, TweenInfo.new(0.25), {TextTransparency = 0}):Play()
    ts:Create(stroke, TweenInfo.new(0.25), {Transparency = 0}):Play()

    task.delay(2.8, function()
        ts:Create(frame, TweenInfo.new(0.35), {BackgroundTransparency = 1}):Play()
        ts:Create(label, TweenInfo.new(0.35), {TextTransparency = 1}):Play()
        ts:Create(stroke, TweenInfo.new(0.35), {Transparency = 1}):Play()
        task.wait(0.4)
        gui:Destroy()
    end)
end

if success then
    print("[NEBULA] Loaded Successfully")
    notify("[NEBULA] Loaded Successfully", false)
else
    warn("[NEBULA] Failed to Load:", err)
    notify("[NEBULA] Failed to Load", true)
end
