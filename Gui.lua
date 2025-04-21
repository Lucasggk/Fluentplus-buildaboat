if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Fluent = loadstring(Game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()

local Window = Main:CreateWindow({
    Title = "Build A Boat",
    SubTitle = "Feito por Lucas",
    TabWidth = 160, 
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark"
})

Local main = Window:AddTab({
        Title = "Main",
        Icon = "home"
    })

Main:AddToggle({
	Título = "Auto Farm",
	Descrição = "Farma dinheiro e bloco de ouro",
	Default = false,
	Callback = function(state)
		local ativo = state
		if ativo then
			local TweenService = game:GetService("TweenService")
			local Player = game.Players.LocalPlayer
			local UIS = game:GetService("UserInputService")

			local function moveToPosition(targetPos, speed, HRP)
				local distance = (HRP.Position - targetPos).Magnitude
				local time = distance / speed
				local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
				local goal = {CFrame = CFrame.new(targetPos)}
				local tween = TweenService:Create(HRP, tweenInfo, goal)
				tween:Play()
				tween.Completed:Wait()
			end

			spawn(function()
				while ativo do
					Player.CharacterAdded:Wait()
					wait(3)

					local Character = Player.Character
					local HRP = Character:WaitForChild("HumanoidRootPart")

					moveToPosition(Vector3.new(-49.45867156982422, 65.89, 408.0811767578125), 10000, HRP)
					moveToPosition(Vector3.new(-59.10210037231445, 65.66454315185547, 8656.818359375), 650, HRP)
					moveToPosition(Vector3.new(-54.430076599121094, -357.6433410644531, 9500.1552734375), 4000, HRP)

					wait(1)
					workspace.ClaimRiverResultsGold:FireServer()
				end
			end)
		end
	end
})
