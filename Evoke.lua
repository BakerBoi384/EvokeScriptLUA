local isUIVisible = false

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenSize = game:GetService("GuiService"):GetScreenResolution()

local function createTab(name, frame)
    local tab = Instance.new("Frame")
    tab.Size = UDim2.new(0, 200, 1, 0)
    tab.Position = UDim2.new(0, 0, 0, 0)
    tab.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Dark gray
    tab.Name = name
    tab.Parent = frame

    local title = Instance.new("TextLabel")
    title.Text = name
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18
    title.Parent = tab

    -- Additional UI elements for this tab can be added here
end

local function toggleUI()
    isUIVisible = not isUIVisible
    local frame = playerGui:FindFirstChild("MyUIFrame")
    if frame then
        if isUIVisible then
            -- Show the UI with a fade-in animation
            frame.Visible = true
            frame.BackgroundTransparency = 1
            frame.Position = UDim2.new(0, 10, 0, screenSize.Y)

            frame:TweenPosition(UDim2.new(0, 10, 0, screenSize.Y - 310), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
            frame:TweenSize(UDim2.new(0, 400, 0, 300), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
            frame:TweenBackgroundTransparency(0, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
        else
            -- Hide the UI with a fade-out animation
            frame:TweenPosition(UDim2.new(0, 10, 0, screenSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
            frame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true, function()
                frame.Visible = false
            })
        end
    end
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 1, 0)
frame.Position = UDim2.new(0, 0, 0, 0)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Name = "MyUIFrame"
frame.Parent = playerGui

createTab("Main", frame)
createTab("Toggles", frame)
createTab("Target", frame)
createTab("Extra", frame)
createTab("About", frame)

local button = Instance.new("TextButton")
button.Text = "Toggle UI"
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0, 10, 0, screenSize.Y - 60)
button.BackgroundColor3 = Color3.new(1, 0, 0)
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = playerGui

button.MouseButton1Click:Connect(toggleUI)

local isMainTabVisible = false

local mainTab = frame:FindFirstChild("Main")

local function toggleMainTab()
    isMainTabVisible = not isMainTabVisible
    if mainTab then
        mainTab.Visible = isMainTabVisible
    end
end

button.MouseButton1Click:Connect(toggleMainTab)
-- Your existing code goes here...