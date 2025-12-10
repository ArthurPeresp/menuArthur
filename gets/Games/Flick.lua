local Library = loadstring(readfile("gets/Obsidian_Library.lua"))()
local ThemeManager = loadstring(readfile("gets/Obsidian_ThemeManager.lua"))()
local SaveManager = loadstring(readfile("gets/Obsidian_SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "LynX Hub",
    Footer = "Version: " .. (getgenv().unxshared and getgenv().unxshared.version or "Unknown") .. ", Game: " .. (getgenv().unxshared and getgenv().unxshared.gamename or "Unknown") .. ", Player: " .. (getgenv().unxshared and getgenv().unxshared.playername or "Unknown"),
    Icon = 73740010358428,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

-- ...restante do código do Flick.lua...
