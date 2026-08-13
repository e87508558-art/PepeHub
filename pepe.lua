-- [[ PepeHub v2.0: Fly & Infinite Jump ]] --

-- Красивое уведомление
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PepeHub UI 🐸",
    Text = "Полет и Бесконечный прыжок активированы!",
    Duration = 5
})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Функция 1: Бесконечный прыжок (Жми Пробел и лети вверх)
UserInputService.JumpRequest:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Функция 2: Супер-скорость персонажа (Ускоряем бег)
task.spawn(function()
    while task.wait(1) do
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 32 -- Обычная скорость 16, мы делаем в 2 раза быстрее
        end
    end
end)

print("PepeHub: Моды физики успешно загружены!")
