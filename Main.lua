local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Fluent"):WaitForChild("MainModule"))

local Window = Library:Window{
    Title = `Fluent {Library.Version}`,
    SubTitle = "Interface de Exemplo",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
}

local Tabs = {
    Main = Window:Tab{Title = "Main", Icon = "phosphor-users-bold"},
    Settings = Window:Tab{Title = "Settings", Icon = "settings"}
}

Tabs.Main:Button{
    Title = "Ativar Farm",
    Description = "Ativa o sistema de farm.",
    Callback = function()
        print("Farm ativado!")
    end
}

Tabs.Main:Toggle{
    Title = "Modo Rápido",
    Default = false,
    Callback = function(state)
        print("Modo Rápido:", state)
    end
}

Tabs.Settings:Dropdown{
    Title = "Tema",
    Values = {"Dark", "Light", "Amoled"},
    Default = "Dark",
    Callback = function(option)
        print("Tema selecionado:", option)
    end
}

Tabs.Settings:Keybind{
    Title = "Tecla do Menu",
    Mode = "Toggle",
    Default = Enum.KeyCode.LeftControl,
    Callback = function(key)
        print("Nova tecla definida:", key)
    end
}

Library:Notify{
    Title = "Fluent",
    Content = "Script carregado com sucesso!",
    Duration = 5
}
