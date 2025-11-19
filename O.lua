local screen = Instance.new("ScreenGui")
screen.Parent = game.CoreGui
local RunService = game:GetService("RunService")

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 200, 0, 30)
textLabel.Position = UDim2.new(0.5, -100, 0.08, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "https://discord.gg/x4bFpGU5"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextStrokeTransparency = 0
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 14
textLabel.Parent = screen

local buttonsFrame = Instance.new("Frame")
buttonsFrame.Size = UDim2.new(0, 140, 0, 25)
buttonsFrame.Position = UDim2.new(0.5, -70, 0.15, 0)
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Parent = screen

local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 65, 0, 20)
startButton.Position = UDim2.new(0, 0, 0, 0)
startButton.BackgroundColor3 = Color3.new(1, 0, 0)
startButton.Text = "start"
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.TextStrokeColor3 = Color3.new(0, 0, 0)
startButton.TextStrokeTransparency = 0
startButton.Font = Enum.Font.Gotham
startButton.TextSize = 11
startButton.Parent = buttonsFrame

local settingsButton = Instance.new("TextButton")
settingsButton.Size = UDim2.new(0, 65, 0, 20)
settingsButton.Position = UDim2.new(0, 75, 0, 0)
settingsButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
settingsButton.Text = "settings"
settingsButton.TextColor3 = Color3.new(1, 1, 1)
settingsButton.TextStrokeColor3 = Color3.new(0, 0, 0)
settingsButton.TextStrokeTransparency = 0
settingsButton.Font = Enum.Font.Gotham
settingsButton.TextSize = 11
settingsButton.Parent = buttonsFrame

local function addCorner(button)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = button
end

addCorner(startButton)
addCorner(settingsButton)

local settingsGUI = Instance.new("Frame")
settingsGUI.Size = UDim2.new(0, 300, 0, 250)
settingsGUI.Position = UDim2.new(0.5, -150, 0.5, -125)
settingsGUI.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
settingsGUI.BorderSizePixel = 1
settingsGUI.BorderColor3 = Color3.new(0, 0, 0)
settingsGUI.Visible = false
settingsGUI.Active = true
settingsGUI.Draggable = true
settingsGUI.Parent = screen

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 128)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128))
})
gradient.Parent = settingsGUI

settingsGUI.BackgroundTransparency = 0

local settingsCorner = Instance.new("UICorner")
settingsCorner.CornerRadius = UDim.new(0, 12)
settingsCorner.Parent = settingsGUI

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0, 40)
settingsTitle.Position = UDim2.new(0, 0, 0, 0)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "Settings"
settingsTitle.TextColor3 = Color3.new(1, 1, 1)
settingsTitle.TextStrokeColor3 = Color3.new(0, 0, 0)
settingsTitle.TextStrokeTransparency = 0
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextSize = 20
settingsTitle.Parent = settingsGUI

local BackgroundParticles = Instance.new("Folder")
BackgroundParticles.Name = "BackgroundParticles"
BackgroundParticles.Parent = settingsGUI

local function createParticle()
    local particle = Instance.new("Frame")
    particle.Name = "Particle"
    particle.Size = UDim2.new(0, math.random(15, 40), 0, math.random(15, 40))
    particle.Position = UDim2.new(0, math.random(-20, 280), 0, math.random(-20, 230))
    particle.BackgroundTransparency = 0.8
    particle.BorderSizePixel = 0
    particle.ZIndex = -1
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    local particleGradient = Instance.new("UIGradient")
    particleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 43, 226)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 128)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 20, 60))
    })
    particleGradient.Rotation = math.random(0, 360)
    particleGradient.Parent = particle
    
    particle.Parent = BackgroundParticles
    return particle
end

local particles = {}
for i = 1, 6 do
    table.insert(particles, createParticle())
end

local pulseGradient = Instance.new("UIGradient")
pulseGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 0, 130)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(138, 43, 226)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 20, 60))
})
pulseGradient.Rotation = 45
pulseGradient.Enabled = true
pulseGradient.Parent = settingsGUI

local UIStroke = Instance.new("UIStroke")
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(138, 43, 226)
UIStroke.Thickness = 2
UIStroke.Parent = settingsGUI

local function animateParticles()
    while settingsGUI.Visible do
        for _, particle in ipairs(particles) do
            spawn(function()
                local goalPos = UDim2.new(
                    0, math.random(-20, 280),
                    0, math.random(-20, 230)
                )
                
                local tweenInfo = TweenInfo.new(
                    math.random(3, 6),
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                )
                
                local tween = game:GetService("TweenService"):Create(
                    particle,
                    tweenInfo,
                    {Position = goalPos}
                )
                tween:Play()
            end)
            
            spawn(function()
                local gradient = particle:FindFirstChildOfClass("UIGradient")
                if gradient then
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Circular,
                        Enum.EasingDirection.InOut
                    )
                    
                    local tween = game:GetService("TweenService"):Create(
                        gradient,
                        tweenInfo,
                        {Rotation = gradient.Rotation + 180}
                    )
                    tween:Play()
                end
            end)
        end
        wait(0.5)
    end
end

local function animateBackgroundPulse()
    while settingsGUI.Visible do
        local tweenInfo1 = TweenInfo.new(
            2,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )
        
        local tween1 = game:GetService("TweenService"):Create(
            pulseGradient,
            tweenInfo1,
            {Rotation = pulseGradient.Rotation + 90}
        )
        tween1:Play()
        
        local tweenInfo2 = TweenInfo.new(
            1.5,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.InOut
        )
        
        local tween2 = game:GetService("TweenService"):Create(
            UIStroke,
            tweenInfo2,
            {Color = Color3.fromRGB(255, 0, 128)}
        )
        tween2:Play()
        
        wait(3)
    end
end

local waveFrame = Instance.new("Frame")
waveFrame.Name = "WaveFrame"
waveFrame.Size = UDim2.new(1, 0, 1, 0)
waveFrame.BackgroundTransparency = 1
waveFrame.ZIndex = -1
waveFrame.Parent = settingsGUI

local waveGradient = Instance.new("UIGradient")
waveGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 0, 130)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(138, 43, 226)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(199, 21, 133)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 20, 60))
})
waveGradient.Parent = waveFrame

local waveEffect = Instance.new("UIGradient")
waveEffect.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.8),
    NumberSequenceKeypoint.new(0.5, 0.4),
    NumberSequenceKeypoint.new(1, 0.8)
})
waveEffect.Parent = waveFrame

local function animateWave()
    while settingsGUI.Visible do
        local tweenInfo = TweenInfo.new(
            4,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )
        
        local tween = game:GetService("TweenService"):Create(
            waveEffect,
            tweenInfo,
            {Offset = Vector2.new(1, 0)}
        )
        tween:Play()
        wait(2)
    end
end

settingsButton.MouseButton1Click:Connect(function()
    settingsGUI.Visible = not settingsGUI.Visible
    if settingsGUI.Visible then
        spawn(animateParticles)
        spawn(animateBackgroundPulse)
        spawn(animateWave)
    else
        for _, particle in ipairs(particles) do
            game:GetService("TweenService"):Create(particle, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        end
    end
end)

local loadingAnimationActive = false
local loadingDots = {"", ".", "..", "..."}
local startingDots = {"", ".", "..", "..."}
local dotIndex = 1

local function animateLoadingText()
    loadingAnimationActive = true
    local startTime = tick()
    
    while loadingAnimationActive and tick() - startTime < 30 do
        startButton.Text = "loading bots" .. loadingDots[dotIndex]
        dotIndex = dotIndex + 1
        if dotIndex > #loadingDots then
            dotIndex = 1
        end
        wait(0.5)
    end
    
    if tick() - startTime >= 30 then
        dotIndex = 1
        for i = 1, 8 do
            if loadingAnimationActive then
                startButton.Text = "starting" .. startingDots[dotIndex]
                dotIndex = dotIndex + 1
                if dotIndex > #startingDots then
                    dotIndex = 1
                end
                wait(0.5)
            end
        end
        startButton.Text = "start"
        startButton.BackgroundColor3 = Color3.new(1, 0, 0)
    else
        startButton.Text = "start"
    end
    
    loadingAnimationActive = false
end

startButton.MouseButton1Click:Connect(function()
    if not loadingAnimationActive then
        animateLoadingText()
    end
end)

print("mtx joiner / discord GUI loaded - ANIMATED SETTINGS BACKGROUND ACTIVATED")
