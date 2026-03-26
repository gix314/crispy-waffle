repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.GameId ~= 0

local PlaceId = game.PlaceId

local gameConfigs = {
    [77747658251236] = {Name = "Sailor Piece - Main",   Id = "88b7af606e9ad28e802160016a410a80.lua"},

    [99684056491472] = {Name = "Sailor Piece - Rune",   Id = "dab714a37f9f0ad1fee40523e2cc22a3.lua"},
    [75159314259063] = {Name = "Sailor Piece - Cid",    Id = "dab714a37f9f0ad1fee40523e2cc22a3.lua"},
    [123955125827131] = {Name = "Sailor Piece - DoubleDungeon", Id = "dab714a37f9f0ad1fee40523e2cc22a3.lua"},
    [96767841099256] = {Name = "Sailor Piece - BossRush", Id = "dab714a37f9f0ad1fee40523e2cc22a3.lua"},
    [138368689293913] = {Name = "Sailor Piece - Tower", Id = "dab714a37f9f0ad1fee40523e2cc22a3.lua"},

--    [84988808589910] = {Name = "Rogue Piece - Main", Id = ""},
--    [96105075537655] = {Name = "Rogue Piece - Dungeon", Id = ""},
}

local config = gameConfigs[PlaceId]

if config then
    local success = false
    local scriptContent = ""
    local attempts = 0
    local maxAttempts = 5

    while not success and attempts < maxAttempts do
        attempts = attempts + 1
        local ok, result = pcall(function()
            return game:HttpGet("https://api.luarmor.net/files/v4/loaders/" .. config.Id)
        end)

        if ok and result then
            success = true
            scriptContent = result
        else
            task.wait(2)
        end
    end

 if success and scriptContent ~= "" then
    local func, err = loadstring(scriptContent)
    if func then
        func()
    else
        warn("Syntax error in loaded script: " .. tostring(err))
    end
else
    warn("Failed to load script after " .. maxAttempts .. " attempts.")
end
end
