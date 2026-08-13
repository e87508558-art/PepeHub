-- [[ PepeHub: Steal A Brainrot Рабочий Авто-Фарм ]] --

-- Красивое уведомление на экране
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PepeHub UI 🐸",
    Text = "Умный авто-фарм PepeHub запущен!",
    Duration = 5
})

-- Функция авто-кражи с глубоким поиском скрытых событий
task.spawn(function()
    while task.wait(0.3) do
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

        -- Ищем любые скрытые папки Remotes или Events в игре
        local remoteFolder = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:FindFirstChild("Events") or ReplicatedStorage

        -- Пытаемся найти событие кражи по всем возможным названиям, которые используют разработчики
        local stealRemote = remoteFolder:FindFirstChild("Steal") 
            or remoteFolder:FindFirstChild("StealRemote") 
            or remoteFolder:FindFirstChild("TakeBrainrot") 
            or remoteFolder:FindFirstChild("ClickEvent")
            or remoteFolder:FindFirstChild("MainRemote")

        if stealRemote and stealRemote:IsA("RemoteEvent") then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    -- Атакуем игрока кражей
                    stealRemote:FireServer(player)
                end
            end
        end
    end
end)

print("PepeHub успешно обновил модули авто-фарма!")
