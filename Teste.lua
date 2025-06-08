getgenv().Script = [[
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
]]
