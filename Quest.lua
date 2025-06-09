function getquest(a)
    workspace.QuestMakerEvent:FireServer(a)
    task.wait(1)
end

function tlob(selteam)
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)

    if not selteam or not hrp then return end

    local part = selteam:FindFirstChild("Part1") or selteam:FindFirstChildWhichIsA("BasePart")
    if part then
        hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
    end
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

