local Library = {}

function Library:CreateLoginWindow(HubName, LoginList)
	local DesignNev = Instance.new("ScreenGui")
	local NevLogin = Instance.new("Frame")
	local Top = Instance.new("Frame")
	local Name = Instance.new("TextLabel")
	local CloseBtn = Instance.new("TextButton")
	local LoginField = Instance.new("Frame")
	local ULabel = Instance.new("TextLabel")
	local PLabel = Instance.new("TextLabel")
	local UsernameField = Instance.new("TextBox")
	local PasswordField = Instance.new("TextBox")
	local LoginBtn = Instance.new("TextButton")
	local Credits = Instance.new("TextLabel")

	--Properties:

	DesignNev.Name = "DesignNev"
	DesignNev.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	DesignNev.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	NevLogin.Name = "NevLogin"
	NevLogin.Parent = DesignNev
	NevLogin.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	NevLogin.BorderSizePixel = 0
	NevLogin.Position = UDim2.new(0.312375247, 0, 0.348643005, 0)
	NevLogin.Size = UDim2.new(0, 376, 0, 145)

	Top.Name = "Top"
	Top.Parent = NevLogin
	Top.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(1, 0, 0, 24)

	Name.Name = "Name"
	Name.Parent = Top
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.Size = UDim2.new(1, 0, 1, 0)
	Name.Font = Enum.Font.SourceSansLight
	Name.Text = HubName.." - Login"
	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name.TextScaled = true
	Name.TextSize = 14.000
	Name.TextWrapped = true

	CloseBtn.Name = "CloseBtn"
	CloseBtn.Parent = Top
	CloseBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
	CloseBtn.BackgroundTransparency = 1.000
	CloseBtn.BorderSizePixel = 0
	CloseBtn.Position = UDim2.new(0.937989891, 0, 0.0843594894, 0)
	CloseBtn.Size = UDim2.new(0, 20, 0, 21)
	CloseBtn.Font = Enum.Font.SourceSans
	CloseBtn.Text = "X"
	CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseBtn.TextScaled = true
	CloseBtn.TextSize = 14.000
	CloseBtn.TextWrapped = true

	LoginField.Name = "LoginField"
	LoginField.Parent = NevLogin
	LoginField.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
	LoginField.BorderSizePixel = 0
	LoginField.Position = UDim2.new(0.0239361692, 0, 0.220689654, 0)
	LoginField.Size = UDim2.new(0.949999988, 0, 0.699999988, 0)

	ULabel.Name = "ULabel"
	ULabel.Parent = LoginField
	ULabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ULabel.BackgroundTransparency = 1.000
	ULabel.BorderSizePixel = 0
	ULabel.Position = UDim2.new(0.0279955231, 0, 0.108374387, 0)
	ULabel.Size = UDim2.new(0, 65, 0, 19)
	ULabel.Font = Enum.Font.SourceSansLight
	ULabel.Text = "Username:"
	ULabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	ULabel.TextScaled = true
	ULabel.TextSize = 14.000
	ULabel.TextWrapped = true
	ULabel.TextXAlignment = Enum.TextXAlignment.Right

	PLabel.Name = "PLabel"
	PLabel.Parent = LoginField
	PLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PLabel.BackgroundTransparency = 1.000
	PLabel.BorderSizePixel = 0
	PLabel.Position = UDim2.new(0.0279955231, 0, 0.403940886, 0)
	PLabel.Size = UDim2.new(0, 65, 0, 19)
	PLabel.Font = Enum.Font.SourceSansLight
	PLabel.Text = "Password:"
	PLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	PLabel.TextScaled = true
	PLabel.TextSize = 14.000
	PLabel.TextWrapped = true
	PLabel.TextXAlignment = Enum.TextXAlignment.Right

	UsernameField.Name = "UsernameField"
	UsernameField.Parent = LoginField
	UsernameField.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	UsernameField.BorderColor3 = Color3.fromRGB(27, 42, 53)
	UsernameField.BorderSizePixel = 0
	UsernameField.Position = UDim2.new(0.240999997, 0, 0.0989999995, 0)
	UsernameField.Size = UDim2.new(0, 262, 0, 20)
	UsernameField.Font = Enum.Font.SourceSansLight
	UsernameField.Text = ""
	UsernameField.TextColor3 = Color3.fromRGB(255, 255, 255)
	UsernameField.TextScaled = true
	UsernameField.TextSize = 14.000
	UsernameField.TextWrapped = true

	PasswordField.Name = "PasswordField"
	PasswordField.Parent = LoginField
	PasswordField.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	PasswordField.BorderColor3 = Color3.fromRGB(27, 42, 53)
	PasswordField.BorderSizePixel = 0
	PasswordField.Position = UDim2.new(0.240999997, 0, 0.394566506, 0)
	PasswordField.Size = UDim2.new(0, 262, 0, 20)
	PasswordField.Font = Enum.Font.SourceSansLight
	PasswordField.Text = ""
	PasswordField.TextColor3 = Color3.fromRGB(255, 255, 255)
	PasswordField.TextScaled = true
	PasswordField.TextSize = 14.000
	PasswordField.TextWrapped = true

	LoginBtn.Name = "LoginBtn"
	LoginBtn.Parent = LoginField
	LoginBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
	LoginBtn.BorderSizePixel = 0
	LoginBtn.Position = UDim2.new(0.0363941789, 0, 0.709359586, 0)
	LoginBtn.Size = UDim2.new(0, 331, 0, 21)
	LoginBtn.Font = Enum.Font.SourceSans
	LoginBtn.Text = "Sign In"
	LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	LoginBtn.TextScaled = true
	LoginBtn.TextSize = 14.000
	LoginBtn.TextWrapped = true

	Credits.Name = "Credits"
	Credits.Parent = DesignNev
	Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Credits.BackgroundTransparency = 1.000
	Credits.Position = UDim2.new(0.316367269, 0, 0.651356995, 0)
	Credits.Size = UDim2.new(0, 368, 0, 25)
	Credits.Font = Enum.Font.SourceSans
	Credits.Text = "Nev Exploits - UI Library"
	Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
	Credits.TextScaled = true
	Credits.TextSize = 14.000
	Credits.TextWrapped = true

	-- Scripts:

	local function FVCVPMU_fake_script() -- CloseBtn.CloseManager 
		local script = Instance.new('LocalScript', CloseBtn)

		local MainUI = script.Parent.Parent.Parent.Parent
		local Button = script.Parent

		Button.MouseButton1Click:Connect(function()
			MainUI:Destroy()
		end)
	end
	coroutine.wrap(FVCVPMU_fake_script)()

end

return Library
