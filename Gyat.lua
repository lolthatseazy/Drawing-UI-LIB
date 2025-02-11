local CoreGui = cloneref(game:GetService("CoreGui"))
local TweenService = cloneref(game:GetService("TweenService"))
local userInput = cloneref(game:GetService("UserInputService"))

local module = {}

local RobloxModule = Instance.new("ScreenGui", CoreGui)
local ScrollingFrame = Instance.new("ScrollingFrame", RobloxModule)
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local Button = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Toggled = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")

RobloxModule.Name = "RobloxModule"
RobloxModule.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ScrollingFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.185000002, 0, 0.236000001, 0)
ScrollingFrame.Size = UDim2.new(0, 735, 0, 394)

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = ScrollingFrame

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)

local dragging, dragInput, startPos, startInputPos

ScrollingFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		startPos = ScrollingFrame.Position
		startInputPos = input.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

ScrollingFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

userInput.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - startInputPos
		ScrollingFrame.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

function module:NewButton(name, callback)
	local Button = Instance.new("TextButton", ScrollingFrame)
	local UICorner_2 = Instance.new("UICorner")
	local UICorner_3 = Instance.new("UICorner")

	Button.Name = "Button"
	Button.Text = tostring(name) or "NaN"
	Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.0653061196, 0, 0, 0)
	Button.Size = UDim2.new(0, 149, 0, 39)
	Button.ZIndex = 2
	Button.Font = Enum.Font.Fantasy
	Button.TextColor3 = Color3.fromRGB(231, 231, 231)
	Button.TextSize = 14.000

	UICorner_2.CornerRadius = UDim.new(0, 10)
	UICorner_2.Parent = Button


	Button.MouseButton1Down:Connect(function()
		callback()
	end)
end

function module:NewToggle(name, callback)
	local IsToggled = false

	local Button = Instance.new("TextButton", ScrollingFrame)
	local UICorner_2 = Instance.new("UICorner")
	local Toggled = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")

	Button.Name = "Button"
	Button.Text = tostring(name) or "NaN"
	Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.0653061196, 0, 0, 0)
	Button.Size = UDim2.new(0, 149, 0, 39)
	Button.ZIndex = 2
	Button.Font = Enum.Font.Fantasy
	Button.TextColor3 = Color3.fromRGB(231, 231, 231)
	Button.TextSize = 14.000

	UICorner_2.CornerRadius = UDim.new(0, 10)
	UICorner_2.Parent = Button

	Toggled.Name = "Toggled"
	Toggled.Parent = Button
	Toggled.BackgroundColor3 = Color3.fromRGB(59, 198, 0)
	Toggled.BackgroundTransparency = 0.950
	Toggled.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Toggled.BorderSizePixel = 0
	Toggled.Position = UDim2.new(-0.28859061, 0, 0, 0)
	Toggled.Size = UDim2.new(0, 37, 0, 39)

	UICorner_3.CornerRadius = UDim.new(0, 20)
	UICorner_3.Parent = Toggled

	Button.MouseButton1Down:Connect(function()
		IsToggled = not IsToggled
		if IsToggled then
			TweenService:Create(Toggled, TweenInfo.new(0.26, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
		else
			TweenService:Create(Toggled, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.95}):Play()
		end
		callback(IsToggled)
	end)
end

function module:NewLabelTextBox(string, defaultValue, callback)
	local NewValue = Instance.new("Frame", ScrollingFrame)
	local Value = Instance.new("TextLabel")
	local TextBox = Instance.new("TextBox")
	local UICorner = Instance.new("UICorner")
	
	NewValue.Name = "NewValue"
	NewValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NewValue.BackgroundTransparency = 1.000
	NewValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NewValue.BorderSizePixel = 0
	NewValue.Position = UDim2.new(0.431972802, 0, 0.137055844, 0)
	NewValue.Size = UDim2.new(0, 100, 0, 27)
	
	Value.Name = "Value"
	Value.Parent = NewValue
	Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Value.BackgroundTransparency = 1.000
	Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Value.BorderSizePixel = 0
	Value.Position = UDim2.new(-1.34707463, 0, 0.600388825, 0)
	Value.Size = UDim2.new(0, 133, 0, 27)
	Value.Font = Enum.Font.SourceSansBold
	Value.Text = tostring(string) or "label"
	Value.TextColor3 = Color3.fromRGB(255, 255, 255)
	Value.TextSize = 17.000
	Value.TextWrapped = true
	
	TextBox.Parent = Value
	TextBox.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.836146295, 0, 0.188889116, 0)
	TextBox.Size = UDim2.new(0, 148, 0, 21)
	TextBox.Font = Enum.Font.SourceSansBold
	TextBox.PlaceholderText = tostring(defaultValue)
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(218, 218, 218)
	TextBox.TextScaled = true
	TextBox.TextSize = 14.000
	TextBox.TextWrapped = true
	
	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = TextBox

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		callback(tonumber(TextBox.Text) or 0)
	end)
	
	callback(tonumber(TextBox.Text) or 0)
end

return module
