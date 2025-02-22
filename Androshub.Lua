-- Andros Hub (финальная версия с анимацией и функциями)

-- Анимация появления Андроса с темной аурой (не визуальная, но эпичная) local TweenService = game:GetService("TweenService") local Players = game:GetService("Players") local player = Players.LocalPlayer local character = player.Character or player.CharacterAdded:Wait() local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local aura = Instance.new("Part") aura.Anchored = true aura.CanCollide = false aura.Size = Vector3.new(0, 0, 0) aura.Position = humanoidRootPart.Position aura.Transparency = 1 aura.Parent = workspace

tween = TweenService:Create(aura, TweenInfo.new(2), {Size = Vector3.new(15, 15, 15), Transparency = 0.5}) tween:Play() tween.Completed:Wait() aura:Destroy()

-- Загрузка Fly GUI loadstring(game:HttpGet("https://raw.githubusercontent.com/mikeexc/Dsc-Mike-Fly-Gui/main/Fly%20Gui"))()

-- Настройка гравитации, скорости, силы прыжка и вращения local function applySettings(speed, jumpPower, gravity, spinSpeed) local humanoid = character:FindFirstChildWhichIsA("Humanoid") if humanoid then humanoid.WalkSpeed = speed humanoid.JumpPower = jumpPower workspace.Gravity = gravity

if spinSpeed > 0 then
        while true do
            humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
            task.wait()
        end
    end
end

end

-- Пример вызова функции applySettings(50, 100, 50, 10)

-- Основное меню категорий (краш, тролль и базовые функции) local categories = { ["Crash"] = function() -- Краш функция while true do for _, plr in pairs(Players:GetPlayers()) do if plr ~= player then plr:Kick("Andros Hub Crash Activated!") end end task.wait(1) end end, ["Troll"] = function() -- Троллинг функция while true do character.HumanoidRootPart.CFrame = CFrame.new(math.random(-100,100), 50, math.random(-100,100)) task.wait(0.5) end end }

-- Интерфейс выбора категорий for category, func in pairs(categories) do print("[Andros Hub] Category loaded:", category) -- Чтобы активировать категорию, вызови: func() end

print("[Andros Hub] Скрипт успешно загружен!")

