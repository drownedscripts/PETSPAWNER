local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- Hide Roblox UI
for _, guiType in ipairs(Enum.CoreGuiType:GetEnumItems()) do
	StarterGui:SetCoreGuiEnabled(guiType, false)
end

local LOAD_TIME = 240

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 10000
screenGui.Parent = player:WaitForChild("PlayerGui")

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.08, 0)
title.Position = UDim2.new(0, 0, 0.2, 0)
title.BackgroundTransparency = 1
title.Text = "🍍 Grow a Garden Spawner Loading.. 🍉"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextStrokeTransparency = 0
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = background

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0.05, 0)
subtitle.Position = UDim2.new(0, 0, 0.35, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Please be patient..."
subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
subtitle.TextStrokeTransparency = 0.3
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = background

local progressBarContainer = Instance.new("Frame")
progressBarContainer.Size = UDim2.new(0.6, 0, 0.05, 0)
progressBarContainer.Position = UDim2.new(0.2, 0, 0.45, 0)
progressBarContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
progressBarContainer.BorderSizePixel = 0
progressBarContainer.Parent = background

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(1, 0)
uicorner.Parent = progressBarContainer

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBarContainer

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = progressFill

local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, 0, 0.05, 0)
percentLabel.Position = UDim2.new(0, 0, 0.52, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.TextStrokeTransparency = 0
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.GothamBold
percentLabel.Parent = background

task.spawn(function()
	local start = tick()
	while true do
		local elapsed = tick() - start
		local progress = math.clamp(elapsed / LOAD_TIME, 0, 1)
		progressFill.Size = UDim2.new(progress, 0, 1, 0)
		percentLabel.Text = string.format("%.0f%%", progress * 100)

		if progress >= 1 then
			break
		end

		task.wait(0.1)
	end
end)
