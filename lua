-- Get the LocalPlayer
local player = game.Players.LocalPlayer

-- Function to trigger the action normally associated with pressing 'E'
local function performEKeyAction()
    -- Replace this with the actual function or event triggered by 'E'
    print("Performing action associated with 'E' key.")
    -- Example: If 'E' triggers some function in your game, call that function here
    -- SomeFunctionTriggeredByE()
end

-- Function to teleport the player to the specific position and perform actions
local function teleportAndPerformActions()
    -- Define the specific position you want to teleport to
    local targetPosition = Vector3.new(775.6051, 4.4884, -902.9689)
    
    -- Get the player's character
    local character = player.Character

    -- Check if the character exists
    if character then
        -- Get the humanoid root part of the character
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        
        -- Check if the humanoid root part exists
        if humanoidRootPart then
            -- Teleport the character to the specified position
            humanoidRootPart.CFrame = CFrame.new(targetPosition)
            
            -- Wait for 2 seconds to ensure the player is in position
            wait(2)
            
            -- Find and teleport to every part named "DeliveryPosition"
            local deliveryPositions = {}
            
            -- Collect all parts named "DeliveryPosition"
            for _, part in pairs(game.Workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.Name == "DeliveryPosition" then
                    table.insert(deliveryPositions, part)
                end
            end
            
            -- Teleport to each "DeliveryPosition" part
            for _, pos in ipairs(deliveryPositions) do
                humanoidRootPart.CFrame = pos.CFrame
                wait(0.5) -- Optionally wait a bit between teleportations
            end
            
            -- Simulate holding down 'E' by calling the function
            local startTime = tick()
            local duration = 4  -- Duration to simulate 'E' key hold
            
            while tick() - startTime < duration do
                performEKeyAction()
                wait(0.5) -- Optionally adjust this interval
            end
            
        else
            warn("HumanoidRootPart not found in character.")
        end
    else
        warn("Character not found for player.")
    end
end

-- Main loop to continuously perform the teleportation and action
while true do
    teleportAndPerformActions()
    wait(3) -- Adjust this interval as needed (time to wait before repeating)
end
