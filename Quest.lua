function getquest(a)
    workspace.QuestMakerEvent:FireServer(a)
    task.wait(1)
end



function Cloud(selteam)
    getquest(1)
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not selteam then return end
    local part = selteam.Quest.Cloud:FindFirstChild("Part1")
    if hrp and part then
        hrp.CFrame = part.CFrame
    end
end

