-- [[ PepeHub: Steal A Brainrot Script ]] --

-- 1. Уведомление на экране при запуске
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "PepeHub UI 🐸",
    Text = "Скрипт PepeHub успешно активирован! Начинаем скам ауры...",
    Duration = 5
})

-- База мемных фраз для спама в чат
local brainrot_phrases = {
    "Вы ограблены PepeHub! Минус аура, бро! 🐸",
    "минус вайб. Твой мозг официально украден читом PepeHub.",
    "REEEEEEE! Истинный Сигма забирает твои монеты! 💀",
    "Ты потерял свои очки риддлера. PepeHub топ!"
}

-- 2. Функция автоматической кражи (Auto-Steal)
task.spawn(function()
    while task.wait(0.3) do -- Цикл срабатывает каждые 0.3 секунды
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        -- Перебираем всех игроков на сервере
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                
                -- Ищем событие кражи в игре (в большинстве режимов это RemoteEvent)
                local replicated = game:GetService("ReplicatedStorage")
                local stealRemote = replicated:FindFirstChild("StealRemote") or replicated:FindFirstChild("Steal") or replicated:FindFirstChild("RemoteEvent")
                
                if stealRemote then
                    -- Автоматически отправляем запрос на кражу у этого игрока
                    stealRemote:FireServer(player)
                end
            end
        end
    end
end)

-- 3. Функция спама мемных фраз в чат
task.spawn(function()
    while task.wait(10) do -- Каждые 10 секунд пишет бред в чат
        local chatRemote = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if chatRemote then
            local sayRequest = chatRemote:FindFirstChild("SayMessageRequest")
            if sayRequest then
                local randomMessage = brainrot_phrases[math.random(1, #brainrot_phrases)]
                sayRequest:FireServer(randomMessage, "All")
            end
        end
    end
end)

print("PepeHub полностью загружен!")
