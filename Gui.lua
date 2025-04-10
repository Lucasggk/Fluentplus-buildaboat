local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Fluent"):WaitForChild("MainModule"))

local Window = Library:Window{
    Title = `Fluent {Library.Version}`,
    SubTitle = "Teste Básico",
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
}

local MainTab = Window:Tab{Title = "Principal", Icon = "home"}

MainTab:Button{
    Title = "Clique aqui",
    Description = "Um botão de teste",
    Callback = function()
        print("Botão clicado!")
    end
}

Library:Notify{
    Title = "Sucesso!",
    Content = "A interface foi carregada.",
    Duration = 5
}
