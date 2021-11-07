local Nev = {}

local Tween = game:GetService('TweenService')
local Tweeninfo = TweenInfo.new
local Input = game:GetService('UserInputService')
local Run = game:GetService('RunService')

local Object = {}
local Utility = {}

function Nev:DraggingEnabled(Frame, Parent)
	
	Parent = Parent or Frame
	
	local Dragging = false
	local DragInput, MousePos, FramePos
	
	Frame.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = true
			MousePos = Input.Position
			FramePos = Parent.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)
	
	Frame.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			DragInput = Input
		end
	end)
	
	Input.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - MousePos
			Parent.Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
		end
	end)
end

function Utility:TweenObject(obj, properties, duration, ...)
	Tween:Create(obj, Tweeninfo(duration, ...), properties):Play()
end

local DefaultTheme = {
	Background = Color3.new(0.141176, 0.145098, 0.168627),
	Header = Color3.new(0.109804, 0.113725, 0.133333),
	TextColor = Color3.new(255, 255, 255),
	Tab = Color3.new(0.419608, 0, 0.00392157)
}

local Themes = {
	ThemeName = {
		
	}
}

local OldTheme = ''

local SettingsT = {
	
}

local Name = 'NevConfig.JSON'

pcall(function()
	if not pcall(function() readfile(Name) end) then
		writefile(Name, game:service'HttpService':JSONEncode(SettingsT))
	end
	
	Settings = game:service'HttpService':JSONEncode(readfile(Name))
end)

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

function Nev:ToggleUI()
	if game.CoreGui[LibName].Enabled then
		game.CoreGui[LibName].Enabled = false
	else
		game.CoreGui[LibName].Enabled = true
	end
end

function Nev:CreateWindow(NevName, ThemeList)
	
	if not ThemeList then
		ThemeList = DefaultTheme
	end
	
	if ThemeList == "ThemeName" then
		
	else
		if ThemeList.Background == nil then
			ThemeList.Background = Color3.new(0.141176, 0.145098, 0.168627)
		elseif ThemeList.Header == nil then
			ThemeList.Header = Color3.new(0.109804, 0.113725, 0.133333)
		elseif ThemeList.TextColor == nil then
			ThemeList.TextColor = Color3.new(255, 255, 255)
		elseif ThemeList.Tab == nil then
			ThemeList.Tab = Color3.new(0.419608, 0, 0.00392157)
		end
	end
	
	ThemeList = ThemeList or {}
	
	local SelectedTab
	
	NevName = NevName or 'Library'
	
	table.insert(Nev, NevName)
	
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA('ScreenGui') and v.Name == NevName then
			v:Destroy()
		end
	end
	
	local ScreenGui = Instance.new('ScreenGui')
	local Main = Instance.new("Frame")
	local MainCorner = Instance.new("UICorner")
	local AspectRatio = Instance.new("UIAspectRatioConstraint")
	local MainHeader = Instance.new("Frame")
	local HeaderCorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local CloseBtn = Instance.new("TextButton")
	local TabsSection = Instance.new("Frame")
	local HeaderCorner_2 = Instance.new("UICorner")
	local UIListLayout = Instance.new("UIListLayout")
	local MainSection = Instance.new("ScrollingFrame")
	
	Nev:DraggingEnabled(MainHeader, Main)
	
	ScreenGui.Parnet = game.Players.LocalPlayer:WaitForChild('PlayerGui')
	ScreenGui.Name = LibName
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn = false
	
	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = ThemeList.Background
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.237596914, 0, 0.166009739, 0)
	Main.Size = UDim2.new(0.524999976, 0, 0.658292174, 0)
	
	MainCorner.CornerRadius = UDim.new(0, 4)
	MainCorner.Name = "MainCorner"
	MainCorner.Parent = Main
	
	AspectRatio.Name = "AspectRatio"
	AspectRatio.Parent = Main
	AspectRatio.AspectRatio = 1.668
	
	MainHeader.Name = "MainHeader"
	MainHeader.Parent = Main
	MainHeader.BackgroundColor3 = ThemeList.Header
	MainHeader.Size = UDim2.new(1, 0, 0.100000001, 0)
	
	HeaderCorner.CornerRadius = UDim.new(0, 4)
	HeaderCorner.Name = "HeaderCorner"
	HeaderCorner.Parent = MainHeader
	
	Title.Name = "Title"
	Title.Parent = MainHeader
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0.899999976, 0, 1, 0)
	Title.Font = Enum.Font.SourceSansLight
	Title.Text = NevName..' | Nev UI Library'
	Title.TextColor3 = ThemeList.TextColor
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	CloseBtn.Name = "CloseBtn"
	CloseBtn.Parent = MainHeader
	CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseBtn.BackgroundTransparency = 1.000
	CloseBtn.Position = UDim2.new(0.899154067, 0, 0, 0)
	CloseBtn.Size = UDim2.new(0.100000001, 0, 1, 0)
	CloseBtn.Font = Enum.Font.SourceSans
	CloseBtn.Text = "-"
	CloseBtn.TextColor3 = ThemeList.TextColor
	CloseBtn.TextScaled = true
	CloseBtn.TextSize = 14.000
	CloseBtn.TextWrapped = true
	
	TabsSection.Name = "TabsSection"
	TabsSection.Parent = Main
	TabsSection.BackgroundColor3 = ThemeList.Header
	TabsSection.Position = UDim2.new(0, 0, 0.098312214, 0)
	TabsSection.Size = UDim2.new(0.230111107, 0, 0.901687801, 0)
	
	HeaderCorner_2.CornerRadius = UDim.new(0, 4)
	HeaderCorner_2.Name = "HeaderCorner"
	HeaderCorner_2.Parent = TabsSection
	
	UIListLayout.Parent = TabsSection
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0.00999999978, 0)
	
	MainSection.Name = "MainSection"
	MainSection.Parent = Main
	MainSection.Active = true
	MainSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainSection.BackgroundTransparency = 1.000
	MainSection.Position = UDim2.new(0.24522379, 0, 0.130025789, 0)
	MainSection.Size = UDim2.new(0.741469562, 0, 0.847774625, 0)
	
	coroutine.wrap(function()
		while wait() do
			Main.BackgroundColor3 = ThemeList.Background
			MainHeader.BackgroundColor3 = ThemeList.Header
			TabsSection.BackgroundColor3 = ThemeList.Header
		end
	end)
	
	local Tabs = {}
	
	local First = true
	
	function Nev:CreateTab(TabName)
		TabName = TabName or 'Tab'
		local Tab = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		
		Tab.Name = TabName
		Tab.Parent = TabsSection
		Tab.BackgroundColor3 = ThemeList.Tab
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.0495663173, 0, 0.0351713933, 0)
		Tab.Size = UDim2.new(0.899999976, 0, 0.100000001, 0)
		Tab.Font = Enum.Font.Gotham
		Tab.Text = "TabName"
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextScaled = true
		Tab.TextSize = 14.000
		Tab.TextWrapped = true
		
		UICorner.Parent = Tab
	end
end

return Nev
