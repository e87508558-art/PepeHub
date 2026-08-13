-- [[ PepeHub GUI: Спид 50, Прыжки 80 + New Smug Pepe ]] --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

if PlayerGui:FindFirstChild("PepeHubSafeMenu") then
    PlayerGui.PepeHubSafeMenu:Destroy()
end

-- 1. ИНТЕРФЕЙС
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PepeHubSafeMenu"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 280, 0, 360)
MainFrame.Position = UDim2.new(0.4, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(0, 255, 127)
UIStroke.Thickness = 2

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(15, 18, 15)
Title.Text = "🐸 PepeHub Classic"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 12)

-- ПЕРЕМЕННЫЕ
local JumpEnabled = false
local SpeedEnabled = false

-- КНОПКА 1: ПРЫЖОК
local JumpButton = Instance.new("TextButton")
JumpButton.Size = UDim2.new(0, 230, 0, 45)
JumpButton.Position = UDim2.new(0.09, 0, 0.14, 0)
JumpButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
JumpButton.Text = "Мега-Прыжок: ВЫКЛ ❌"
JumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpButton.TextSize = 14
JumpButton.Font = Enum.Font.GothamBold
JumpButton.Parent = MainFrame
Instance.new("UICorner", JumpButton).CornerRadius = UDim.new(0, 8)

-- КНОПКА 2: СКОРОСТЬ
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 230, 0, 45)
SpeedButton.Position = UDim2.new(0.09, 0, 0.30, 0)
SpeedButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
SpeedButton.Text = "Супер-Скорость: ВЫКЛ ❌"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.TextSize = 14
SpeedButton.Font = Enum.Font.GothamBold
SpeedButton.Parent = MainFrame
Instance.new("UICorner", SpeedButton).CornerRadius = UDim.new(0, 8)

-- Новая крутая аватарка лягушки Smug Pepe снизу
local PepeImage = Instance.new("ImageLabel")
PepeImage.Size = UDim2.new(0, 110, 0, 110) -- Оптимальный размер
PepeImage.Position = UDim2.new(0.30, 0, 0.52, 0) -- Точное центрирование по кнопкам
PepeImage.BackgroundTransparency = 1
PepeImage.Image = "http://roblox.com" -- Прямой линк в обход ошибок
PepeImage.ScaleType = Enum.ScaleType.Fit
PepeImage.Parent = MainFrame

-- Скругление углов для аватарки (делает картинку стильной)
local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(0, 12)
ImageCorner.Parent = PepeImage

-- НАЖАТИЯ КНОПОК
JumpButton.MouseButton1Click:Connect(function()
    JumpEnabled = not JumpEnabled
    JumpButton.BackgroundColor3 = JumpEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
    JumpButton.Text = JumpEnabled and "Мега-Прыжок: ВКЛ ⚡" or "Мега-Прыжок: ВЫКЛ ❌"
end)

SpeedButton.MouseButton1Click:Connect(function()
    SpeedEnabled = not SpeedEnabled
    SpeedButton.BackgroundColor3 = SpeedEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
    SpeedButton.Text = SpeedEnabled and "Супер-Скорость: ВКЛ ⚡" or "Супер-Скорость: ВЫКЛ ❌"
end)

-- НАДЕЖНЫЙ СТАНДАРТНЫЙ ЦИКЛ (СКОРОСТЬ 50, ПРЫЖОК 80)
RunService.PostSimulation:Connect(function()
    pcall(function()
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                if SpeedEnabled then humanoid.WalkSpeed = 50 else if humanoid.WalkSpeed == 50 then humanoid.WalkSpeed = 16 end end
                if JumpEnabled then humanoid.JumpPower = 80 humanoid.UseJumpPower = true else humanoid.UseJumpPower = false end
            end
        end
    end)
end)

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(0.88, 0, 0.02, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame
CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
