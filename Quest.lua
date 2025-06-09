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
        hrp.CFrame = target.CFrame * CFrame.new(0, -15, 0)
    end
end

function gelo(selteam)
    getquest(9)

    local tool = game:GetService("Players").LocalPlayer.Character.BuildingTool.RF
    local plr = game:GetService("Players").LocalPlayer
    local wood = plr.Data.WoodBlock.Value

    local function place(zone, cf1, cf2)
        tool:InvokeServer("WoodBlock", wood, zone, cf1, true, cf2, false)
    end

    place(workspace:FindFirstChild("Really blueZone"), CFrame.new(6, 6.1, -143), CFrame.new(364.834, -11.9, 295.493) * CFrame.Angles(0, -math.pi/2, 0))
    place(workspace.WhiteZone, CFrame.new(28, 6.1, -126), CFrame.new(-25.566, -11.9, -471.507))
    place(workspace.BlackZone, CFrame.new(10, 6.1, -126), CFrame.new(-454.966, -11.9, -82.107) * CFrame.Angles(0, math.pi/2, 0))
    place(workspace.CamoZone, CFrame.new(8, 6.1, -137), CFrame.new(-465.966, -11.9, 277.893) * CFrame.Angles(0, math.pi/2, 0))
    place(workspace.MagentaZone, CFrame.new(3, 6.1, -143), CFrame.new(364.834, -11.9, 650.693) * CFrame.Angles(0, -math.pi/2, 0))
    place(workspace:FindFirstChild("Really redZone"), CFrame.new(2, 6.1, -144), CFrame.new(365.834, -11.9, -66.707) * CFrame.Angles(0, -math.pi/2, 0))
    place(workspace:FindFirstChild("New YellerZone"), CFrame.new(1, 6.1, -137), CFrame.new(-465.966, -11.9, 642.893) * CFrame.Angles(0, math.pi/2, 0))

    selteam.VoteLaunchRE:FireServer()

    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = CFrame.new(76, -7, 1358)
    task.wait(3)
    hrp.CFrame = CFrame.new(-53, -363, 9502)
end
