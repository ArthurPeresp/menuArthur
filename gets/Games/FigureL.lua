local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Updated Assets detection to use CurrentRooms instead of Map
local function FindAssetsFolder()
    local currentRooms = workspace:FindFirstChild("CurrentRooms")
    if currentRooms then
        for _, room in ipairs(currentRooms:GetChildren()) do
            if room:IsA("Model") then
                local assetsFolder = room:FindFirstChild("Assets")
                if assetsFolder then
                    return assetsFolder
                end
            end
        end
    end
    
    -- Fallback to old method if CurrentRooms fails
    warn("[LynX Hub] CurrentRooms not found or no Assets in rooms, trying fallback method")
    local mapFolder = workspace:FindFirstChild("Map")
    if mapFolder then
        local assetsFolder = mapFolder:FindFirstChild("Assets")
        if assetsFolder then
            warn("[LynX Hub] Using fallback Assets folder from workspace.Map.Assets")
            return assetsFolder
        end
    end
    
    warn("[LynX Hub] No Assets folder found in CurrentRooms or Map")
    return nil
end

local BOOKSHELF_NAME = "Super Cool Bookshelf With Hint Book"
local DOOR_CFRAME = CFrame.new(
    0.88565439, 19.2949562, -109.371742,
    -0.998881638, 0.00240474031, -0.0472193025,
    -7.93140771e-08, 0.998705626, 0.0508628227,
    0.0472804941, 0.0508059449, -0.997588754)

local BPAPER_CFRAME = CFrame.new(
    -53.6578979, 11.3413105, -21.9969749,
    0.423553586, -0.90396452, -0.0587408952,
    0.1525819, 0.00727360509, 0.988264024,
    -0.892928481, -0.427545547, 0.141009375)

local SAFE_POSITIONS = {
    CFrame.new(
        -53.4432106, 14.2561035, 40.7111435,
        0.856820285, 7.64594255e-09, -0.515615106,
        -7.48528883e-09, 1, 2.39014608e-09,
        0.515615106, 1.81160231e-09, 0.856820285
    ),
    CFrame.new(
        54.5029144, 14.2513294, 43.7026443,
        0.940911651, 1.41327362e-07, -0.338652134,
        -1.34159876e-07, 1, 4.45730777e-08,
        0.338652134, 3.49420026e-09, 0.940911651
    )
}

-- ...restante do código do FigureL.lua...
