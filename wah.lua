repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.GameId ~= nil

local PlaceId = game.PlaceId

local gameConfigs = {
    [99684056491472] = {Name = "Sailor Piece - Rune", Id = "Dungeon"},
    [75159314259063] = {Name = "Sailor Piece - Cid", Id = "Dungeon"},
    [77747658251236] = {Name = "Sailor Piece - Main", Id = "Main"},
    [96767841099256] = {Name = "Sailor Piece - BossRush", Id = "Dungeon"},
    [123955125827131] = {Name = "Sailor Piece - Double", Id = "Dungeon"}
}

local config = gameConfigs[PlaceId]

if config then
    local scriptUrl = ""
    
    if config.Id == "Main" then
        scriptUrl = "https://api.getpolsec.com/scripts/hosted/87784e292c14640c619d8b007742d7ea4dbf744c0576e368d1e1c04ac3658188.lua"
    elseif config.Id == "Dungeon" then
        scriptUrl = "https://api.getpolsec.com/scripts/hosted/38ceee4df1da761a9a3d13cdf6b7f309f8a82220de014927f474bd298dab2a25.lua"
    end

    local function safeLoad(url)
        local success, content = pcall(game.HttpGet, game, url)
        
        if success and content and #content > 0 then
            local executable, loadError = loadstring(content)
            
            if executable then
                task.spawn(executable)
                return true
            else
                warn("Failed to compile script: " .. tostring(loadError))
            end
        else
            warn("Failed to fetch script from: " .. url)
        end
        
        return false
    end

    if not safeLoad(scriptUrl) then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WAHHHH",
            Text = "Failed to load script for " .. config.Name,
            Duration = 5
        })
    end
end
