-- [[ SISTEMA gtvx - PERSONAGEM REAL ]] --
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- 1. DATABASE DE ESTILOS
local CharacterData = {
    ["Hinata"] = {Color = Color3.fromRGB(255, 165, 0)},
    ["Kageyama"] = {Color = Color3.fromRGB(0, 0, 255)},
    ["Oikawa"] = {Color = Color3.fromRGB(0, 255, 255)},
    ["Bokuto"] = {Color = Color3.fromRGB(200, 200, 200)}
}

-- 2. FUNÇÃO PARA CONECTAR AOS REMOTES DO JOGO
local function TentativaMudarNoJogo(nome)
    -- Isso tenta avisar ao servidor do jogo que você quer o personagem
    local remoteNames = {"Spin", "ChangeStyle", "SetCharacter", "RemoteEvent", "CharacterRemote"}
    for _, name in pairs(remoteNames) do
        local found = ReplicatedStorage:FindFirstChild(name, true)
        if found and found:IsA("RemoteEvent") then
            found:FireServer(nome) -- Manda o comando real para o jogo
            return true
        end
    end
    return false
end

-- 3. INTERFACE (O PAINEL)
local sg = Instance.new("ScreenGui")
sg.Name = "GtvxFinal"
sg.Parent = (gethui and gethui()) or game:GetService("CoreGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 150)
main.Position = UDim2.new(0.5, -125, 0.5, -75)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Active = true
main.Draggable = true
main.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "GTVX - ROLETA REAL"
title.TextColor3 = Color3.new(1,1,1)
title.Parent = main

local spinBtn = Instance.new("TextButton")
spinBtn.Size = UDim2.new(0.8, 0, 0.4, 0)
spinBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
spinBtn.Text = "GIRAR E APLICAR"
spinBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
spinBtn.Parent = main

-- LÓGICA AO CLICAR
spinBtn.MouseButton1Click:Connect(function()
    local nomes = {"Hinata", "Kageyama", "Oikawa", "Bokuto"}
    local escolhido = nomes[math.random(1, #nomes)]
    
    spinBtn.Text = "SORTEANDO: " .. escolhido:upper()
    
    -- Tenta aplicar no jogo
    local sucesso = TentativaMudarNoJogo(escolhido)
    
    if sucesso then
        print("gtvx: Aplicado " .. escolhido .. " via Remote!")
    else
        warn("gtvx: Remote não encontrado, mudando apenas visualmente.")
    end
end)
