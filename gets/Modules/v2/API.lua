local plr = game.Players.LocalPlayer

local function Nukegame()
    for _, obj in ipairs(workspace:GetChildren()) do
        pcall(function() obj:Destroy() end)
    end
    for _, obj in ipairs(plr.PlayerGui:GetChildren()) do
        pcall(function() obj:Destroy() end)
    end
    for _, obj in ipairs(game.CoreGui:GetChildren()) do
        pcall(function() obj:Destroy() end)
    end
end

local BannedUsers = {
    {UserId = 9850758639, Reason = "You Are Not Welcome Here."},
    {UserId = 7826981289, Reason = "Certain Suspicious Actions Detected! https://discord.gg/Kgew2Grefs for more information."},
}

local BannedGames = {
    {PlaceId = 4924922222, Reason = "Please get your stinky Brookhaven out of here."}
}

for _, banInfo in ipairs(BannedUsers) do
    if plr.UserId == banInfo.UserId then
        Nukegame()
        print("[API]: User is banned from using LynX Hub. Reason: " .. banInfo.Reason)
        plr:Kick("LynX Hub | Banned\n\nSorry, but you are banned from using the main loadstring.\nReason: " .. banInfo.Reason)
        return
    end
end

for _, banInfo in ipairs(BannedGames) do
    if game.PlaceId == banInfo.PlaceId then
        Nukegame()
        print("[API]: Game is banned from using LynX Hub. Reason: " .. banInfo.Reason)
        plr:Kick("LynX Hub | Game Blocked\n\nSorry, but the game you are playing is banned from using LynX Hub.\nReason: " .. banInfo.Reason)
        return
    end
end

print("[API]: All checks done. User is not banned and the game is not restricted.")
