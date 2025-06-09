local spike = game:GetService("Players").LocalPlayer.Data.SpikeTrap.Value
local spike_suf = 20
local bspike
local buyspike = 
if spike < spike_suf then
  bspike = spike_suf - spike
  buyspike:FireServer(bspike, )
