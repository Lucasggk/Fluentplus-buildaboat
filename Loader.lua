if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()


local Window = Fluent:CreateWindow({
    Title = "Build A Boat",
    SubTitle = "Feito por Lucas",
    TabWidth = 150,
    Size = UDim2.fromOffset(400, 340),
    Acrylic = false,
    Theme = "Dark"
})

local Main = Window:AddTab({
    Title = "Main",
    Icon = "home"
})

local AutoFarmAtivo = false
local AutoFarmConnection

Main:AddToggle(".", {
    Title = "Auto Farm",
    Description = "Farma dinheiro e bloco de ouro",
    Default = false,
    Callback = function(state)
        AutoFarmAtivo = state

        if AutoFarmAtivo then
            local TweenService = game:GetService("TweenService")
            local Player = game.Players.LocalPlayer

            AutoFarmConnection = task.spawn(function()
                while AutoFarmAtivo do
                    if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then
                        Player.CharacterAdded:Wait()
                        task.wait(3)
                    end

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

                    task.wait(5)
                    pcall(function()
                        workspace.ClaimRiverResultsGold:FireServer()
                    end)

							
                    task.wait(14)
                end
            end)

        else
            if AutoFarmConnection then
                task.cancel(AutoFarmConnection)
            end
        end
    end
})
