local a = "sussybaka"
local placeId = game.PlaceId
local baseUrl = "https://naughty-kitty.sadacat.workers.dev/"

if placeId == 77747658251236 or placeId == 130167267952199 then
    local githubUrl = "https://api.jnkie.com/api/v1/luascripts/public/52d7bb3829a25a2f9b476d1eb84c8d1d4271fda532b61574b926dd7cd2e9d3e9/download"
    
    local success, result = pcall(function()
        return game:HttpGet(githubUrl)
    end)
    
    if success then
        loadstring('getgenv().SCRIPT_KEY = "KEYLESS"; ' .. result)()
    else
        warn("Failed to load from GitHub")
    end
else
    local url = baseUrl .. "?key=" .. a .. "&placeId=" .. tostring(placeId)
    
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and result then
        if string.sub(result, 1, 5) == "Error" or string.sub(result, 1, 6) == "Access" then
            warn("rejected request: " .. result)
        else
            local func, err = loadstring(result)
            if func then
                func()
            end
        end
    else
        warn("Could not connect.")
    end
end
