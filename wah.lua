local a = "sussybaka"
local placeId = game.PlaceId
local baseUrl = "https://naughty-kitty.sadacat.workers.dev/"

if placeId == 77747658251236 or placeId == 130167267952199 then
    local githubUrl = "https://raw.githubusercontent.com/gix314/crispy-waffle/refs/heads/main/sc/2jtesafSai_125uansfM.lua"
    
    local success, result = pcall(function()
        return game:HttpGet(githubUrl)
    end)
    
    if success then
        loadstring(result)()
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
