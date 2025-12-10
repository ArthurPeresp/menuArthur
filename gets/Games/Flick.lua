local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "UNXHub",
    Footer = "Version: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown") .. ", Game: " .. (getgenv().unxshared and getgenv().unxshared.gamename or "Unknown") .. ", Player: " .. (getgenv().unxshared and getgenv().unxshared.playername or "Unknown"),
    Icon = 73740010358428,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

-- ...restante do código do Flick.lua...
