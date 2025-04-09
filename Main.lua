local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Fluent"):WaitForChild("MainModule"))

local Window = Library:Window{
    Title = `Fluent {Library.Version}`,
    ...
}

local Tabs = {
    Main = Window:Tab{Title = "Main", Icon = "phosphor-users-bold"},
    Settings = Window:Tab{Title = "Settings", Icon = "settings"}
}
