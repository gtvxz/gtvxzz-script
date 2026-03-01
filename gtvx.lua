-- [[ SISTEMA DE ROLETA DE PERSONAGENS - gtvx ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

-- 1. DATABASE DE PERSONAGENS
local CharacterData = {
    ["Hinata"] = {Rarity = "Rare", Color = Color3.fromRGB(255, 165, 0)},
    ["Kageyama"] = {Rarity = "Epic", Color = Color3.fromRGB(0, 0, 255)},
    ["Oikawa"] = {Rarity = "Legendary", Color = Color3.fromRGB(0, 255, 255)},
    ["Bokuto"] = {Rarity = "Rare", Color = Color3.fromRGB(200, 200, 200)},
    ["Standard Player"] = {Rarity = "Common", Color = Color3.fromRGB(255, 255, 255)}
}

-- 2. CRIAÇÃO DA INTERFACE
local sg = Instance.new("ScreenGui")
sg.Name = "GtvxRoleta"
sg.Parent = (gethui and gethui()) or CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 350)
main.Position = UDim2.new(0.5, -150, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "ROLETA DE ESTILOS - GTVX"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.Parent = main

local listFrame = Instance.new("ScrollingFrame")
listFrame.Size = UDim2.new(0.9, 0, 0.4, 0)
listFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
listFrame.CanvasSize = UDim2.new(0, 0, 1.5, 0)
listFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
listFrame.BorderSizePixel = 0
listFrame.Parent = main

local uiList = Instance.new("UIListLayout")
uiList.Parent = listFrame
uiList.Padding = UDim.new(0, 5)

local resultLabel = Instance.new("TextLabel")
resultLabel.Size = UDim2.new(0.9, 0, 0.15, 0)
resultLabel.Position = UDim2.new(0.05, 0, 0.6, 0)
resultLabel.Text = "Aguardando..."
resultLabel.TextColor3 = Color3.new(1, 1, 1)
resultLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
resultLabel.Parent = main

local spinBtn = Instance.new("TextButton")
spinBtn.Size = UDim2.new(0.9, 0, 0.15, 0)
spinBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
spinBtn.Text = "GIRAR ROLETA"
spinBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
spinBtn.TextColor3 = Color3.new(1, 1, 1)
spinBtn.Font = Enum.Font.SourceSansBold
spinBtn.TextSize = 22
spinBtn.Parent = main

-- 3. LÓGICA DE FUNCIONAMENTO
local function Spin()
    spinBtn.Text = "SORTEANDO..."
    spinBtn.Active = false
    
    task.wait(0.8) -- Simula o tempo da roleta
    
    local names = {}
    for name, _ in pairs(CharacterData) do table.insert(names, name) end
    local luckyName = names[math.random(1, #names)]
    local data = CharacterData[luckyName]
    
    resultLabel.Text = "OBTEVE: " .. luckyName:upper()
    resultLabel.TextColor3 = data.Color
    spinBtn.Text = "GIRAR NOVAMENTE"
    spinBtn.Active = true
end

spinBtn.MouseButton1Click:Connect(Spin)
print("✅ Script gtvx carregado com sucesso!")
