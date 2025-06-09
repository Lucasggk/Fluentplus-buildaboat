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
    getquest(8)
    Fluent:Notify({
        Title = "Fazendo missão..",
        Content = "Sem suporte para essa missão no momento.",
        Duration = 3
    })
end

function Ramp(selteam)
    getquest(3)
    noti()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if not selteam then return end
    local target = selteam.Quest.Ramp:GetChildren()[25]
    if hrp and target then
        hrp.CFrame = target.CFrame * CFrame.new(0, 0, 0)
    end
end

function gelo()
    getquest(9)

    local TweenService = game:GetService("TweenService")
    local Player = game.Players.LocalPlayer
    local HRP = Player.Character:WaitForChild("HumanoidRootPart")

    local function moveToPosition(targetPos, speed)
        local distance = (HRP.Position - targetPos).Magnitude
        local time = distance / speed
        local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
        local goal = {CFrame = CFrame.new(targetPos)}
        local tween = TweenService:Create(HRP, tweenInfo, goal)
        tween:Play()
        tween.Completed:Wait()
    end

    moveToPosition(Vector3.new(-49.458, 65.89, 408.081), 10000)
    moveToPosition(Vector3.new(-59.102, 65.665, 8656.818), 650)
    moveToPosition(Vector3.new(-54.430, -357.643, 9500.155), 500)

    for i = 1, 5 do
        HRP.CFrame = CFrame.new(-53, -363, 9502)
    end
end

function manteiga(selteam)
    getquest(4)

    local objeto = selteam.Quest.Butter.PPart
    local clickDetector = objeto:FindFirstChild("ClickDetector")

    while objeto.Parent and objeto:IsDescendantOf(game) do
        if clickDetector then
            fireclickdetector(clickDetector)
        end
        task.wait()
    end
end
