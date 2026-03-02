--[[
WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
warn("Anti afk running")
game:GetService("Players").LocalPlayer.Idled:connect(function()
warn("Anti afk ran")
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local guiScreen = Instance.new("ScreenGui")
guiScreen.Name = "TopGUI"
guiScreen.DisplayOrder = 1000
guiScreen.Parent = game.CoreGui
local guiFrame = Instance.new("Frame")
guiFrame.Size = UDim2.new(0, 200, 0, 150)
guiFrame.Position = UDim2.new(0, 10, 0, 10)
guiFrame.BackgroundTransparency = 0.5
guiFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
guiFrame.BorderSizePixel = 0
guiFrame.Parent = guiScreen
local autoFarmToggle = Instance.new("TextButton")
autoFarmToggle.Size = UDim2.new(0, 180, 0, 30)
autoFarmToggle.Position = UDim2.new(0.5, -90, 0, 10)
autoFarmToggle.Text = "Auto Farm: OFF"
autoFarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmToggle.BackgroundTransparency = 0.3
autoFarmToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
autoFarmToggle.Parent = guiFrame
local autoFarmActive = false
autoFarmToggle.MouseButton1Click:Connect(function()
autoFarmActive = not autoFarmActive
if autoFarmActive then
autoFarmToggle.Text = "Auto Farm: ON"
-- Implement the Auto Farm functionality here
spawn(function()
while autoFarmActive do
for i, v in pairs(workspace:GetChildren()) do
if v.ClassName == "Model" and v:FindFirstChild("Container") or v.Name == "PortCraneOversized" then
v:Destroy()
end
end
wait(1)
end
end)
spawn(function()
while autoFarmActive do
local hum = game.Players.LocalPlayer.Character.Humanoid
local car = hum.SeatPart.Parent
car.PrimaryPart = car.Body:FindFirstChild("#Weight")
if not getfenv().first then
if workspace.Workspace:FindFirstChild("Buildings") then
workspace.Workspace.Buildings:Destroy()