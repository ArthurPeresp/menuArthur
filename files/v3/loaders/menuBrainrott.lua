
-- menuBrainrott.lua
-- Roblox UI menu, styled similar to LynXHub loader

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local theme = {
    Background = Color3.fromRGB(26,26,26),
    BackgroundLight = Color3.fromRGB(35,35,35),
    BackgroundDark = Color3.fromRGB(20,20,20),
    Text = Color3.fromRGB(255,255,255),
    TextDim = Color3.fromRGB(180,180,180),
    Border = Color3.fromRGB(50,50,50),
    Accent = Color3.fromRGB(0,127,255),
    Success = Color3.fromRGB(40,200,100),
    Error = Color3.fromRGB(255,80,80)
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LynXBrainrottMenu"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.45,0,0.5,0)
mainFrame.Position = UDim2.new(0.275,0,0.25,0)
mainFrame.BackgroundColor3 = theme.Background
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 2
mainFrame.Parent = screenGui
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0,12)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = theme.Border
mainStroke.Thickness = 1
mainStroke.Transparency = 0.3
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1,0,0,38)
header.BackgroundColor3 = theme.BackgroundLight
header.Text = "LYnXHub - Brainrott Menu"
header.Font = Enum.Font.GothamBold
header.TextColor3 = theme.Text
header.TextSize = 16
header.BorderSizePixel = 0
header.ZIndex = 3
header.Parent = mainFrame
local headerCorner = Instance.new("UICorner", header)
headerCorner.CornerRadius = UDim.new(0,12)

local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(1,-20,0,22)
userLabel.Position = UDim2.new(0,10,0,44)
userLabel.BackgroundTransparency = 1
userLabel.Text = "Welcome, " .. LocalPlayer.Name
userLabel.Font = Enum.Font.Gotham
userLabel.TextColor3 = theme.TextDim
userLabel.TextSize = 13
userLabel.TextXAlignment = Enum.TextXAlignment.Left
userLabel.ZIndex = 3
userLabel.Parent = mainFrame

local menuList = Instance.new("Frame")
menuList.Size = UDim2.new(1,-24,1,-90)
menuList.Position = UDim2.new(0,12,0,70)
menuList.BackgroundTransparency = 1
menuList.ZIndex = 4
menuList.Parent = mainFrame
local menuLayout = Instance.new("UIListLayout", menuList)
menuLayout.Padding = UDim.new(0,8)
menuLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function addMenuButton(text, callback, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,36)
    btn.BackgroundColor3 = color or theme.Accent
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = theme.Text
    btn.TextSize = 15
    btn.BorderSizePixel = 0
    btn.ZIndex = 5
    btn.Parent = menuList
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0,8)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = theme.Success}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = color or theme.Accent}):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        if callback then
            local ok, err = pcall(callback)
            if not ok then
                warn("[Menu Error]", err)
            end
        end
    end)
    return btn
end

-- Example menu options (customize as needed)
addMenuButton("Iniciar", function()
    print("Iniciando Brainrott...")
    -- Add your game logic here
end)
addMenuButton("Opções", function()
    print("Exibindo opções...")
    -- Add options logic here
end)
addMenuButton("Sair", function()
    TweenService:Create(mainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(screenGui, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    task.wait(0.3)
    screenGui:Destroy()
end, theme.Error)

-- You can add more buttons or logic as needed

return true