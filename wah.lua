local scriptUrl = "https://api.getpolsec.com/scripts/hosted/87784e292c14640c619d8b007742d7ea4dbf744c0576e368d1e1c04ac3658188.lua"

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
            Text = "Failed to load script.",
            Duration = 5
        })
end
