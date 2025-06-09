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

