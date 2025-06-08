if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()

Button_Icon = "rbxassetid://137592432303285"
              

local Window = Fluent:CreateWindow({
    Title = "Build A Boat",
    SubTitle = "Feito por Lucas",
    TabWidth = 150,
    Size = UDim2.fromOffset(400, 340),
    Acrylic = false,
    Theme = "Dark"
})

local Main = Window:AddTab({
    Title = "Main farm",
    Icon = "home"
})

local loja = Window:AddTab({
    Title = "loja",
    Icon = "list"
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



local ipv = 1
local ipc 
local vpi

local Dropdown = loja:AddDropdown("", {
    Title = "Baú para comprar\n",
    Description = "Selecione o baú\n",
    Values = {"Common Chest", "Uncommon Chest", "Rare Chest", "Epic Chest", "Legendary Chest"},
    Multi = false,
    Default = "Common Chest",
})

Dropdown:OnChanged(function(Value)
    ipc = Value
    if ipc == "Common Chest" then
        vpi = 5
    elseif ipc == "Uncommon Chest" then
        vpi = 15
    elseif ipc == "Rare Chest" then
        vpi = 45
    elseif ipc == "Epic Chest" then
        vpi = 135
    elseif ipc == "Legendary Chest" then
        vpi = 405
    end
end)

loja:AddInput("", {
    Title = "Número de item para comprar\n",
    Description = "Selecione o tanto de itens por compra.\n",
    Default = "1",
    Placeholder = "Número",
    Numeric = true,
    Finished = true,
    Callback = function(Value)
        ipv = Value 
    end
})

function Comprar()
    if ipc and ipv then
        local args = {
            [1] = ipc,
            [2] = tonumber(ipv)
        }

        workspace.ItemBoughtFromShop:InvokeServer(unpack(args))
    end
end

loja:AddButton({
    Title = "Compra o baú selecionado + quantidade",
    Callback = function()
        local vt = (tonumber(vpi) or 0) * (tonumber(ipv) or 0)
        local md = 
        if vt > md then
            local vtdc = vt - md
            Fluent:Notify({
                Title = "Dinheiro insuficiente",
                Content = "Dinheiro que falta: " .. vtdc .. " Dinheiro que tem: " .. md,
                SubContent = "",
                Duration = 5
            })
        else
            Comprar()
        end
    end
})
