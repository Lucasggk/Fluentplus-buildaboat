if not game:IsLoaded() then
    game.Loaded:Wait()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/Fluentplus-buildaboat/refs/heads/main/Fix%20ui%20name.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/Fluentplus-buildaboat/refs/heads/main/Quest.lua"))()
local dni = game.Players.LocalPlayer:WaitForChild("Data"):WaitForChild("Gold").Value

local function getMoney()
    return game.Players.LocalPlayer:WaitForChild("Data"):WaitForChild("Gold").Value
end
			
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() 


local Window = Fluent:CreateWindow({
    Title = "Build A Boat",
    SubTitle = "Made By Lucas",
    TabWidth = 150,
    Size = UDim2.fromOffset(550, 380),
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

local quest = Window:AddTab({
    Title = "quest",
    Icon = "list"
})

local config = Window:AddTab({
    Title = "configurações",
    Icon = "settings"
})

local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
InterfaceManager:SetLibrary(Fluent) 
InterfaceManager:SetFolder("BuildABoat") 
InterfaceManager:BuildInterfaceSection(config) 
config:AddButton({Title = "Destruir Interface",Callback = function() Fluent:Destroy() end }) 


local AutoFarmAtivo = false
local AutoFarmConnection

local Toggle = Main:AddToggle(".", {
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

Main:AddParagraph({
    Title = "Dinheiro ao executar o script: " .. dni,
})

local dinatual = Main:AddParagraph({
    Title = "Dinheiro atual: ",
    Content = dni
})

local dnat
local dnatual = Main:AddParagraph({
    Title = "Dinheiro ganhado/perdido ao executar o script",
    Content = "Carregando..."
})

task.spawn(function()
    while true do 
        dnat = game.Players.LocalPlayer:WaitForChild("Data"):WaitForChild("Gold").Value
	diferenca = (dnat - dni)
        dnatual:SetDesc(diferenca)
	dinatual:SetDesc(dnat)
        task.wait(0.5)
    end
end)

-- outro tab

local ipv = 1
local ipc 
local vpi
local md = getMoney()

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
    Finished = false,
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
        local md = getMoney()
        if vt > md then
            local vtdc = vt - md
            Fluent:Notify({
                Title = "Dinheiro insuficiente",
                Content = "Dinheiro que falta: " .. vtdc,
                SubContent = "Dinheiro que tem: " .. md,
                Duration = 5
            })
        else
            Comprar()
            local it_qu = "Item: " .. ipc .. " | Quantidade: " .. ipv
	    Fluent:Notify({
                Title = "Compra Realizada",
                Content = "Valor total: " .. vt,
                SubContent = it_qu,
                Duration = 5
            })
        end
    end
})

-- outro tab

local selteam

local section = quest:AddSection("Coloque seu time:")

local TeamSelect = quest:AddDropdown("TeamSelect", {
    Title = "Selecione o time",
    Description = "Escolha um time da lista",
    Values = {"Branco", "Preto", "Vermelho", "Verde", "Azul", "Amarelo", "Magenta"},
    Multi = false,
    Default = 1,
})

TeamSelect:OnChanged(function(Value)
    if Value == "Azul" then
        selteam = workspace["Really blueZone"]
    elseif Value == "Vermelho" then
        selteam = workspace["Really redZone"]
    elseif Value == "Branco" then
        selteam = workspace.WhiteZone
    elseif Value == "Preto" then
        selteam = workspace.BlackZone
    elseif Value == "Verde" then
        selteam = workspace.CamoZone
    elseif Value == "Amarelo" then
        selteam = workspace["New YellerZone"]
    elseif Value == "Magenta" then
        selteam = workspace.MagentaZone
    end
end)

local section = quest:AddSection("Escolha a Quest: ")

local selectquest = quest:AddDropdown("", {
    Title = "Escolha a quest\n",
    Description = "",
    Values = {
        "[1] Cloud",
        "[2] Target",
        "[3] Ramp",
        "[8] Futeboll",
        "[9] Ice"
    },
    Multi = false,
    Default = "",
})

selectquest:OnChanged(function(Value)
    if Value == "[1] Cloud" then
        Cloud(selteam)
    elseif Value == "[2] Target" then
        Target(selteam)
    elseif Value == "[3] Ramp" then
        Ramp(selteam)
    elseif Value == "[8] Futeboll" then
        Futeboll(selteam)
    elseif Value == "[9] Ice" then
        gelo()
    end
    selectquest:SetValue()
end)
