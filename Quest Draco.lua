local glue = game:GetService("Players").LocalPlayer.Data.Glue.Value
local spike = game:GetService("Players").LocalPlayer.Data.SpikeTrap.Value
local spike_suf = 20
local bspike
local buyspike = workspace.ItemBoughtFromShop 
local din_nes

function buy()
if spike < spike_suf then
  bspike = spike_suf - spike
  din = game.Players.LocalPlayer:WaitForChild("Data"):WaitForChild("Gold").Value
  din_nes = bspike * 25
  if din > din_nes then
  buyspike:InvokeServer("SpikeTrap", bspike)
  else
  print("sem dinheiro para a ação 1!")
  return
  end
end 
end

function getglue()
  if glue < 3 then
    
