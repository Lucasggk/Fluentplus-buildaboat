local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
task.wait(0.1)
Fluent:Destroy()

function getquest(a)
    workspace.QuestMakerEvent:FireServer(a)
    task.wait(1)
end

function noti()
    Fluent:Notify({
        Title = "Fazendo missão..",
        Content = "Aguarde",
        Duration = 3
    })
end

function Cloud(selteam)
    getquest(1)
    noti()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not selteam then return end
    local part = selteam.Quest.Cloud:FindFirstChild("Part1")
    if hrp and part then
        hrp.CFrame = part.CFrame
    end
end

function Target(selteam)
    getquest(2)
    noti()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not selteam then return end
    local part = selteam.Quest.Target:GetChildren()[6]
    if hrp and part then
        hrp.CFrame = part.CFrame
    end
end

function Futeboll(selteam)
    getquest(3)
    Fluent:Notify({
        Title = "Fazendo missão..",
        Content = "Sem suporte para essa missão no momento.",
        Duration = 3
    })
end

function Ramp(selteam)
    getquest(4)
    noti()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not selteam then return end
    local target = selteam.Quest.Ramp:GetChildren()[25]
    if hrp and target then
        hrp.CFrame = target.CFrame * CFrame.new(0, -15, 0)
    end
end
