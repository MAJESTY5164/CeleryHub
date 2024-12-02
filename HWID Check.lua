-- LocalScript inside StarterPlayer -> StarterPlayerScripts

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the ScreenGui and add it to the Player's PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Create the frame for the GUI (Dark Mode)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Dark background
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create the text label that the user will see
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, -20, 0.6, -20)
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.Text = "Check F9/Dev console if Copy dosent work"  -- Example text, replace as needed
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
textLabel.TextSize = 20
textLabel.TextWrapped = true  -- Prevents wrapping so it stays on one line
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.TextYAlignment = Enum.TextYAlignment.Center
textLabel.BackgroundTransparency = 1
textLabel.TextTruncate = Enum.TextTruncate.AtEnd  -- Truncate text if it overflows
textLabel.Parent = frame

-- Function to adjust text size to fit within the available space
local function adjustTextSize()
    -- Start with a reasonable text size
    local targetSize = 14
    textLabel.TextSize = targetSize

    -- Continue decreasing the text size if the text overflows the label
    while textLabel.TextBounds.X > textLabel.AbsoluteSize.X and targetSize > 5 do
        targetSize = targetSize - 1
        textLabel.TextSize = targetSize
    end
end

-- Call adjustTextSize initially to make sure text fits on one line
adjustTextSize()

-- Create the copy button and center it
local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 100, 0, 50)
copyButton.Position = UDim2.new(0.5, -50, 0.75, 0)  -- Centered horizontally
copyButton.Text = "Copy"
copyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
copyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
copyButton.TextSize = 20
copyButton.BorderSizePixel = 0
copyButton.Parent = frame

-- Create the close button (X button) and move it to the bottom-right corner (flush)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -50, 1, -50)  -- Positioned flush to bottom-right corner
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 30
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

-- Function to close the GUI
local function closeGui()
    screenGui:Destroy()
end

-- Function to copy text to clipboard
local function copyToClipboard()
    local text = textLabel.Text
    -- For demonstration, we print the copied text to the console as Roblox doesn't support direct clipboard access
    setclipboard(game:GetService("RbxAnalyticsService"):GetClientId())
end

-- Connect the copy button to the function
copyButton.MouseButton1Click:Connect(copyToClipboard)

-- Connect the close button to the close function
closeButton.MouseButton1Click:Connect(closeGui)

-- Re-adjust text size if the text changes (optional)
textLabel:GetPropertyChangedSignal("Text"):Connect(function()
    adjustTextSize()
end)

-- Re-adjust text size if the window size changes (optional)
frame:GetPropertyChangedSignal("Size"):Connect(function()
    adjustTextSize()
end)

print("HWID is | " .. game:GetService("RbxAnalyticsService"):GetClientId())
