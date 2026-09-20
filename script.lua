-- VlexWare Exploit

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function create(className, props, parent)
	local inst = Instance.new(className)
	for prop, value in pairs(props) do
		inst[prop] = value
	end
	inst.Parent = parent
	return inst

end

local function makeDraggable(handle, ...)
	local frames = {...}
	local dragging = false
	local dragStart
	local startPositions = {}
	local DRAG_THRESHOLD = 8
	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPositions = {}
			for i, frame in ipairs(frames) do
				startPositions[i] = frame.Position
			end
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			if delta.Magnitude < DRAG_THRESHOLD then return end
			for i, frame in ipairs(frames) do
				frame.Position = UDim2.new(
					startPositions[i].X.Scale, startPositions[i].X.Offset + delta.X,
					startPositions[i].Y.Scale, startPositions[i].Y.Offset + delta.Y
				)
			end
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

end

local vlexWare = create("ScreenGui", {
	Name = "VlexWare",
	ResetOnSpawn = false,
	IgnoreGuiInset = false,
	ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,

}, playerGui)

local sideBar = create("Frame", {
	Name = "SideBar",
	Size = UDim2.new(0, 68, 0, 390),
	Position = UDim2.new(0.496, 0, 0.447, 0),
	BackgroundColor3 = Color3.fromRGB(101, 109, 128),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,

}, vlexWare)

local ndsButton = create("TextButton", {
	Name = "NDS",
	Size = UDim2.new(0, 67, 0, 50),
	Position = UDim2.new(-0.00375, 0, 0.721, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.6,
	BorderSizePixel = 0,
	Text = "NDS",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,

}, sideBar)

local thirdpButton = create("TextButton", {
	Name = "3rdp",
	Size = UDim2.new(0, 67, 0, 50),
	Position = UDim2.new(-0.00375, 0, 0.871, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.6,
	BorderSizePixel = 0,
	Text = "3RD PARTY",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,

}, sideBar)

local feAnimsButton = create("TextButton", {
	Name = "FE anims",
	Size = UDim2.new(0, 67, 0, 50),
	Position = UDim2.new(-0.00297, 0, 0.0172, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.6,
	BorderSizePixel = 0,
	Text = "Animation.",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,

}, sideBar)

local espButton = create("TextButton", {
	Name = "Esp",
	Size = UDim2.new(0, 67, 0, 50),
	Position = UDim2.new(0.0117, 0, 0.171, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.6,
	BorderSizePixel = 0,
	Text = "ESP",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,

}, sideBar)

local utilButton = create("TextButton", {
	Name = "Util",
	Size = UDim2.new(0, 67, 0, 50),
	Position = UDim2.new(-0.00375, 0, 0.451, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.6,
	BorderSizePixel = 0,
	Text = "Utility",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,

}, sideBar)

local lockOnButton = create("TextButton", {
	Name = "LockOn",
	Size = UDim2.new(0, 67, 0, 50),
	Position = UDim2.new(-0.00375, 0, 0.601, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.6,
	BorderSizePixel = 0,
	Text = "Lock-On",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,

}, sideBar)

local thirdGUI = create("ScrollingFrame", {
	Name = "3rdGUI",
	Size = UDim2.new(0, 285, 0, 425),
	Position = UDim2.new(0.0665, 0, 0.221, 0),
	BackgroundColor3 = Color3.fromRGB(86, 97, 119),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(0, 0, 2, 0),
	ScrollBarThickness = 9,
	ScrollingDirection = Enum.ScrollingDirection.XY,
	ClipsDescendants = true,
	Visible = false,

}, vlexWare)

makeDraggable(thirdGUI, thirdGUI)

create("TextLabel", {
	Name = "MainTitle",
	Size = UDim2.new(0, 209, 0, 57),
	Position = UDim2.new(0.133, 0, 0, 0),
	BackgroundColor3 = Color3.fromRGB(86, 97, 119),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "3RD PARTY SCRIPTS",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 28,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextLabel", {
	Name = "Footer",
	Size = UDim2.new(0, 285, 0, 83),
	Position = UDim2.new(-0.000208, 0, 0.966, 0),
	BackgroundColor3 = Color3.fromRGB(86, 97, 119),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "3RD PARTY SCRIPTS",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 28,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

local closeButton = create("TextButton", {
	Name = "Close",
	Size = UDim2.new(0, 34, 0, 38),
	Position = UDim2.new(-0.000208, 0, 0, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "X",
	TextColor3 = Color3.fromRGB(170, 0, 0),
	TextSize = 30,
	Font = Enum.Font.FredokaOne,

}, thirdGUI)

create("TextButton", {
	Name = "Spy",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0489, 0, 0.0428, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "Remote Spy",
	TextColor3 = Color3.new(1, 1, 1),
	TextStrokeColor3 = Color3.fromRGB(85, 0, 0),
	TextSize = 30,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextButton", {
	Name = "DexPlus",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0524, 0, 0.0803, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "Dex++",
	TextColor3 = Color3.new(1, 1, 1),
	TextStrokeColor3 = Color3.fromRGB(85, 0, 0),
	TextSize = 30,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextButton", {
	Name = "MM",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0489, 0, 0.163, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "MM2",
	TextColor3 = Color3.new(1, 1, 1),
	TextStrokeColor3 = Color3.fromRGB(85, 0, 0),
	TextSize = 30,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextLabel", {
	Name = "Game",
	Size = UDim2.new(0, 122, 0, 41),
	Position = UDim2.new(0.284, 0, 0.130, 0),
	BackgroundColor3 = Color3.fromRGB(86, 97, 119),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "Game Cheat Scripts",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 28,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextButton", {
	Name = "ARSEN",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0524, 0, 0.185, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "ARSENAL",
	TextColor3 = Color3.new(1, 1, 1),
	TextStrokeColor3 = Color3.fromRGB(85, 0, 0),
	TextSize = 30,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextButton", {
	Name = "Legends",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0524, 0, 0.225, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "Legends of Speed",
	TextColor3 = Color3.new(1, 1, 1),
	TextStrokeColor3 = Color3.fromRGB(85, 0, 0),
	TextSize = 30,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextButton", {
	Name = "Ninja",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0524, 0, 0.255, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "Ninja Legends",
	TextColor3 = Color3.new(1, 1, 1),
	TextStrokeColor3 = Color3.fromRGB(85, 0, 0),
	TextSize = 30,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

create("TextButton", {
	Name = "moresoon",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0489, 0, 0.286, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "More to be added :)",
	TextColor3 = Color3.new(0, 0, 0),
	TextStrokeColor3 = Color3.fromRGB(85, 0, 0),
	TextSize = 30,
	Font = Enum.Font.SourceSansBold,

}, thirdGUI)

local utilGUI = create("ScrollingFrame", {
	Name = "UtilGUI",
	Size = UDim2.new(0, 285, 0, 300),
	Position = UDim2.new(0.0665, 0, 0.221, 0),
	BackgroundColor3 = Color3.fromRGB(86, 97, 119),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(0, 0, 0.5, 0),
	ScrollBarThickness = 9,
	ScrollingDirection = Enum.ScrollingDirection.XY,
	ClipsDescendants = true,
	Visible = false,

}, vlexWare)

makeDraggable(utilGUI, utilGUI)

local aimbotGui = create("ScreenGui", {
	Name = "aimbot ui",
	ResetOnSpawn = false,
	IgnoreGuiInset = false,
	ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
	ZIndexBehavior = Enum.ZIndexBehavior.Global,

}, playerGui)

local lockOnGUI = create("Frame", {
	Name = "Frame",
	Size = UDim2.new(0, 250, 0, 200),
	Position = UDim2.new(0.3, 0, 0.3, 0),
	BackgroundColor3 = Color3.fromRGB(40, 40, 50),
	BackgroundTransparency = 0.1,
	BorderSizePixel = 0,
	Visible = false,

}, aimbotGui)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, lockOnGUI)

local lockOnHeader = create("TextLabel", {
	Name = "TextLabel",
	Size = UDim2.new(1, 0, 0, 40),
	Position = UDim2.new(0, 0, 0, 0),
	BackgroundColor3 = Color3.fromRGB(30, 30, 40),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	Text = "LOCK-ON SYSTEM",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 18,
	Font = Enum.Font.SourceSansBold,

}, lockOnGUI)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, lockOnHeader)

local lockOnClose = create("TextButton", {
	Name = "close",
	Size = UDim2.new(0, 30, 0, 30),
	Position = UDim2.new(1, -35, 0, 5),
	BackgroundColor3 = Color3.fromRGB(170, 0, 0),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	Text = "X",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 18,
	Font = Enum.Font.SourceSansBold,

}, lockOnGUI)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, lockOnClose)

local lockOnToggleBtn = create("TextButton", {
	Name = "aimbot",
	Size = UDim2.new(0, 200, 0, 45),
	Position = UDim2.new(0.5, -100, 0.5, -10),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 1,
	Text = "Lock-On: OFF",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 18,
	Font = Enum.Font.SourceSansBold,

}, lockOnGUI)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, lockOnToggleBtn)

local lockOnStatusLabel = create("TextLabel", {
	Name = "on or off",
	Size = UDim2.new(0, 200, 0, 30),
	Position = UDim2.new(0.5, -100, 0.5, 40),
	BackgroundColor3 = Color3.fromRGB(30, 30, 40),
	BackgroundTransparency = 0.5,
	BorderSizePixel = 0,
	Text = "Status: Inactive",
	TextColor3 = Color3.fromRGB(200, 200, 200),
	TextSize = 16,
	Font = Enum.Font.SourceSans,

}, lockOnGUI)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, lockOnStatusLabel)

makeDraggable(lockOnGUI, lockOnGUI)

local reticle = create("Frame", {
	Name = "Reticle",
	Size = UDim2.new(0, 60, 0, 60),
	Position = UDim2.new(0.5, -30, 0.5, -30),
	BackgroundColor3 = Color3.new(0, 0, 0),
	BackgroundTransparency = 1,
	Visible = false,

}, vlexWare)

local function createBracket(name, pos, size, color)
	create("Frame", {
		Name = name,
		Size = size,
		Position = pos,
		BackgroundColor3 = color,
		BorderSizePixel = 0,
	}, reticle)

end

local reticleColor = Color3.fromRGB(255, 60, 60)

createBracket("TL", UDim2.new(0, 0, 0, 0), UDim2.new(0, 8, 0, 3), reticleColor)

createBracket("TL2", UDim2.new(0, 0, 0, 0), UDim2.new(0, 3, 0, 8), reticleColor)

createBracket("TR", UDim2.new(1, -8, 0, 0), UDim2.new(0, 8, 0, 3), reticleColor)

createBracket("TR2", UDim2.new(1, -3, 0, 0), UDim2.new(0, 3, 0, 8), reticleColor)

createBracket("BL", UDim2.new(0, 0, 1, -3), UDim2.new(0, 8, 0, 3), reticleColor)

createBracket("BL2", UDim2.new(0, 0, 1, -8), UDim2.new(0, 3, 0, 8), reticleColor)

createBracket("BR", UDim2.new(1, -8, 1, -3), UDim2.new(0, 8, 0, 3), reticleColor)

createBracket("BR2", UDim2.new(1, -3, 1, -8), UDim2.new(0, 3, 0, 8), reticleColor)

local centerDot = create("Frame", {
	Name = "CenterDot",
	Size = UDim2.new(0, 4, 0, 4),
	Position = UDim2.new(0.5, -2, 0.5, -2),
	BackgroundColor3 = reticleColor,
	BorderSizePixel = 0,

}, reticle)

create("UICorner", {
	CornerRadius = UDim.new(1, 0),

}, centerDot)

local ndsGui = create("ScreenGui", {
	Name = "nds",
	ResetOnSpawn = false,
	IgnoreGuiInset = false,
	ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
	ZIndexBehavior = Enum.ZIndexBehavior.Global,

}, playerGui)

local ndsFrame = create("Frame", {
	Name = "Frame",
	Size = UDim2.new(0, 285, 0, 150),
	Position = UDim2.new(0.3, 0, 0.25, 0),
	BackgroundColor3 = Color3.fromRGB(40, 40, 50),
	BackgroundTransparency = 0.1,
	BorderSizePixel = 0,
	Visible = false,

}, ndsGui)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, ndsFrame)

local ndsHeader = create("TextLabel", {
	Name = "Header",
	Size = UDim2.new(1, 0, 0, 40),
	Position = UDim2.new(0, 0, 0, 0),
	BackgroundColor3 = Color3.fromRGB(30, 30, 40),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	Text = "NATURAL DISASTER SURVIVAL",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 16,
	Font = Enum.Font.SourceSansBold,

}, ndsFrame)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, ndsHeader)

local ndsClose = create("TextButton", {
	Name = "Close",
	Size = UDim2.new(0, 30, 0, 30),
	Position = UDim2.new(1, -35, 0, 5),
	BackgroundColor3 = Color3.fromRGB(170, 0, 0),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	Text = "X",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 18,
	Font = Enum.Font.SourceSansBold,

}, ndsFrame)

create("UICorner", { CornerRadius = UDim.new(0, 6) }, ndsClose)

makeDraggable(ndsFrame, ndsFrame)

local ndsToggleButton = create("TextButton", {
	Name = "ToggleNDS",
	Size = UDim2.new(0, 253, 0, 45),
	Position = UDim2.new(0.06, 0, 0.4, 0),
	BackgroundColor3 = Color3.fromRGB(85, 0, 0),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 1,
	Text = "Part Ring",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 18,
	Font = Enum.Font.SourceSansBold,

}, ndsFrame)

create("UICorner", { CornerRadius = UDim.new(0, 4) }, ndsToggleButton)

ndsClose.MouseButton1Click:Connect(function()
	ndsFrame.Visible = false

end)

local ringPartsEnabled = false

if type(getgenv) == "function" and not getgenv().Network then
	getgenv().Network = {
		BaseParts = {},
		Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
	}
	getgenv().Network.RetainPart = function(Part)
		if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(workspace) then
			table.insert(getgenv().Network.BaseParts, Part)
			Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
			Part.CanCollide = false
		end
	end
	local function EnablePartControl()
		localPlayer.ReplicationFocus = workspace
		RunService.Heartbeat:Connect(function()
			if getgenv().Network then
				sethiddenproperty(localPlayer, "SimulationRadius", math.huge)
			end
			for _, Part in pairs(getgenv().Network.BaseParts) do
				if Part:IsDescendantOf(workspace) then
					Part.Velocity = getgenv().Network.Velocity
				end
			end
		end)
	end
	EnablePartControl()

end

local ringRadius = 50

local ringHeight = 100

local ringRotationSpeed = 10

local ringAttractionStrength = 1000

local function ringRetainPart(Part)
	if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
		if Part.Parent == localPlayer.Character or (localPlayer.Character and Part:IsDescendantOf(localPlayer.Character)) then
			return false
		end
		Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		Part.CanCollide = false
		return true
	end
	return false

end

local ringParts = {}

local function addRingPart(part)
	if ringRetainPart(part) then
		if not table.find(ringParts, part) then
			table.insert(ringParts, part)
		end
	end

end

local function removeRingPart(part)
	local index = table.find(ringParts, part)
	if index then
		table.remove(ringParts, index)
	end

end

for _, part in pairs(workspace:GetDescendants()) do
	addRingPart(part)

end

workspace.DescendantAdded:Connect(addRingPart)

workspace.DescendantRemoving:Connect(removeRingPart)

RunService.Heartbeat:Connect(function()
	if not ringPartsEnabled then return end
	local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart then
		humanoidRootPart.Anchored = true
		local tornadoCenter = humanoidRootPart.Position
		for _, part in pairs(ringParts) do
			if part.Parent and not part.Anchored then
				local pos = part.Position
				local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
				local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
				local newAngle = angle + math.rad(ringRotationSpeed)
				local targetPos = Vector3.new(
					tornadoCenter.X + math.cos(newAngle) * math.min(ringRadius, distance),
					tornadoCenter.Y + (ringHeight * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / ringHeight)))),
					tornadoCenter.Z + math.sin(newAngle) * math.min(ringRadius, distance)
				)
				local directionToTarget = (targetPos - part.Position).unit
				part.Velocity = directionToTarget * ringAttractionStrength
			end
		end
	end

end)

ndsToggleButton.MouseButton1Click:Connect(function()
	ringPartsEnabled = not ringPartsEnabled
	if ringPartsEnabled then
		ndsToggleButton.Text = "Stop Ring"
		ndsToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
		local character = localPlayer.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = true end
		end
	else
		ndsToggleButton.Text = "Part Ring"
		ndsToggleButton.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
		local character = localPlayer.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = false end
		end
	end

end)

create("TextLabel", {
	Name = "UtilTitle",
	Size = UDim2.new(0, 209, 0, 40),
	Position = UDim2.new(0.133, 0, 0, 0),
	BackgroundColor3 = Color3.fromRGB(86, 97, 119),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "UTILITY",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 24,
	Font = Enum.Font.SourceSansBold,

}, utilGUI)

local utilClose = create("TextButton", {
	Name = "Close",
	Size = UDim2.new(0, 34, 0, 38),
	Position = UDim2.new(-0.000208, 0, 0, 0),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "X",
	TextColor3 = Color3.fromRGB(170, 0, 0),
	TextSize = 30,
	Font = Enum.Font.FredokaOne,

}, utilGUI)

local antiAfkButton = create("TextButton", {
	Name = "AntiAfk",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0524, 0, 0.08, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 1,
	Text = "Anti AFK: OFF",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 20,
	Font = Enum.Font.SourceSansBold,

}, utilGUI)

local hitboxButton = create("TextButton", {
	Name = "Hitbox",
	Size = UDim2.new(0, 253, 0, 38),
	Position = UDim2.new(0.0524, 0, 0.16, 0),
	BackgroundColor3 = Color3.fromRGB(81, 81, 81),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 1,
	Text = "Hitbox Expander: OFF",
	TextColor3 = Color3.new(1, 1, 1),
	TextSize = 20,
	Font = Enum.Font.SourceSansBold,

}, utilGUI)

local hitboxSizeBox = create("TextBox", {
	Name = "HitboxSize",
	Size = UDim2.new(0, 100, 0, 32),
	Position = UDim2.new(0.0524, 0, 0.24, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 0,
	BorderSizePixel = 2,
	PlaceholderText = "Hitbox Size",
	PlaceholderColor3 = Color3.fromRGB(47, 47, 47),
	Text = "10",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,
	ClearTextOnFocus = true,

}, utilGUI)

local antiAfkActive = false

task.spawn(function()
	while true do
		if not antiAfkActive then
			task.wait(1)
			continue
		end
		pcall(function()
			local vu = game:GetService("VirtualUserManager")
			vu:CaptureController()
			vu:ClickButton(2, Vector2.new())
		end)
		task.wait(180)
	end

end)

antiAfkButton.MouseButton1Click:Connect(function()
	antiAfkActive = not antiAfkActive
	if antiAfkActive then
		antiAfkButton.Text = "Anti AFK: ON"
		antiAfkButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		antiAfkButton.Text = "Anti AFK: OFF"
		antiAfkButton.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
	end

end)

local hitboxActive = false

local hitboxSize = 10

hitboxSizeBox.FocusLost:Connect(function()
	local num = tonumber(string.trim(hitboxSizeBox.Text))
	if num and num > 0 then
		hitboxSize = num
	else
		hitboxSizeBox.Text = tostring(hitboxSize)
	end

end)

task.spawn(function()
	while true do
		if not hitboxActive then
			task.wait(0.5)
			continue
		end
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer and player.Character then
				local hrp = player.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
					hrp.Transparency = 1
					hrp.CanCollide = false
				end
				end
			end
		task.wait(1)
	end

end)

hitboxButton.MouseButton1Click:Connect(function()
	hitboxActive = not hitboxActive
	if hitboxActive then
		hitboxButton.Text = "Hitbox Expander: ON"
		hitboxButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		hitboxButton.Text = "Hitbox Expander: OFF"
		hitboxButton.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer and player.Character then
				local hrp = player.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.Size = Vector3.new(2, 2, 1)
					hrp.Transparency = 1
					hrp.CanCollide = false
				end
				end
				end
			end

end)

utilClose.MouseButton1Click:Connect(function()
	utilGUI.Visible = false

end)

local toggles = create("Frame", {
	Name = "Toggles",
	Size = UDim2.new(0, 455, 0, 418),
	Position = UDim2.new(0.497, 68, 0.446, 0),
	BackgroundColor3 = Color3.fromRGB(51, 53, 56),
	BackgroundTransparency = 0,
	BorderSizePixel = 0,

}, vlexWare)

makeDraggable(toggles, toggles, sideBar)

makeDraggable(sideBar, toggles, sideBar)

local uiGradient = create("UIGradient", {
	Name = "UIGradient",
	Rotation = 28,
	Offset = Vector2.new(10, 5),
	Color = ColorSequence.new(Color3.fromRGB(90, 99, 121)),
	Transparency = NumberSequence.new(0.2),

}, toggles)

create("UIScale", {
	Name = "UIScale",
	Scale = 1,

}, toggles)

create("TextLabel", {
	Name = "Name",
	Size = UDim2.new(0, 455, 0, 93),
	Position = UDim2.new(-0.000222, 0, -0.223, 0),
	BackgroundColor3 = Color3.fromRGB(86, 96, 118),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	Text = "VLEXWARE",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 28,
	Font = Enum.Font.SourceSansBold,

}, toggles)

local playButton = create("TextButton", {
	Name = "Play",
	Size = UDim2.new(0, 91, 0, 31),
	Position = UDim2.new(0.319, 0, 0.175, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 0,
	BorderSizePixel = 2,
	Text = "Play",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 20,
	Font = Enum.Font.SourceSansBold,
	Visible = false,

}, toggles)

local idsScrollingFrame = create("ScrollingFrame", {
	Name = "IDS",
	Size = UDim2.new(0, 261, 0, 200),
	Position = UDim2.new(0.424, 0, 0.604, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 1,
	BorderSizePixel = 2,
	CanvasSize = UDim2.new(0, 0, 0, 6120),
	ScrollBarThickness = 14,
	ScrollingDirection = Enum.ScrollingDirection.XY,
	ClipsDescendants = true,
	Visible = false,

}, toggles)

local animCategories = {
	{title = "=== R15 DEFAULT ANIMATIONS ===", items = {
		{"Run", "10921148209"}, {"Walk", "10921152678"}, {"Jump", "10921308158"},
		{"Idle 1", "10921301576"}, {"Idle 2", "10921302207"}, {"Fall", "10921307241"},
		{"Swim", "10921150788"}, {"Swim Idle", "10921151661"}, {"Climb", "10921300839"},
		{"Sit", "2506281703"}, {"Toy Pose", "10921303913"}, {"Mood", "14618196485"},
	}},
	{title = "=== R15 EMOTES ===", items = {
		{"Cheer", "507770677"}, {"Wave", "507770239"}, {"Point", "507770453"},
		{"Laugh", "507770818"}, {"Dance 1", "507771019"}, {"Dance 2", "507776043"},
		{"Dance 3", "507777268"},
	}},
	{title = "=== R15 GEAR/TOOL ANIMATIONS ===", items = {
		{"Tool None", "507768375"}, {"Tool Slash", "522635514"}, {"Tool Lunge", "522638767"},
	}},
	{title = "=== R6 DEFAULT ANIMATIONS ===", items = {
		{"Walk/Run", "180426354"}, {"Jump", "125750702"}, {"Idle 1", "180435571"},
		{"Idle 2", "180435791"}, {"Fall", "180436148"}, {"Climb", "180436334"},
		{"Sit", "178130076"},
	}},
	{title = "=== R6 GEAR/TOOL ANIMATIONS ===", items = {
		{"Tool None", "182393478"}, {"Tool Slash", "182393833"}, {"Tool Lunge", "182393893"},
	}},
	{title = "=== CATALOG EMOTES ===", items = {
		{"Hello", "3576686446"}, {"Stadium", "3360686498"}, {"Tilt", "3360692915"},
		{"Shrug", "3576968026"}, {"Salute", "3360689775"}, {"Point", "3576823880"},
	}},
	{title = "=== ASTRONAUT BUNDLE ===", items = {
		{"Run", "891636393"}, {"Walk", "891636393"}, {"Jump", "891627522"},
		{"Idle 1", "891621366"}, {"Idle 2", "891633237"}, {"Idle 3", "1047759695"},
		{"Fall", "891617961"}, {"Swim", "891639666"}, {"Swim Idle", "891663592"}, {"Climb", "891609353"},
	}},
	{title = "=== BUBBLY BUNDLE ===", items = {
		{"Run", "910025107"}, {"Walk", "910034870"}, {"Jump", "910016857"},
		{"Idle 1", "910004836"}, {"Idle 2", "910009958"}, {"Idle 3", "1018536639"},
		{"Fall", "910001910"}, {"Swim", "910028158"}, {"Swim Idle", "910030921"}, {"Climb", "909997997"},
	}},
	{title = "=== CARTOONY BUNDLE ===", items = {
		{"Run", "742638842"}, {"Walk", "742640026"}, {"Jump", "742637942"},
		{"Idle 1", "742637544"}, {"Idle 2", "742638445"}, {"Idle 3", "885477856"},
		{"Fall", "742637151"}, {"Swim", "742639220"}, {"Swim Idle", "742639812"}, {"Climb", "742636889"},
	}},
	{title = "=== ELDER BUNDLE ===", items = {
		{"Run", "845386501"}, {"Walk", "845403856"}, {"Jump", "845398858"},
		{"Idle 1", "845397899"}, {"Idle 2", "845400520"}, {"Idle 3", "901160519"},
		{"Fall", "845396048"}, {"Swim", "845401742"}, {"Swim Idle", "845403127"}, {"Climb", "845392038"},
	}},
	{title = "=== KNIGHT BUNDLE ===", items = {
		{"Run", "657564596"}, {"Walk", "657552124"}, {"Jump", "658409194"},
		{"Idle 1", "657595757"}, {"Idle 2", "657568135"}, {"Idle 3", "885499184"},
		{"Fall", "657600338"}, {"Swim", "657560551"}, {"Swim Idle", "657557095"}, {"Climb", "658360781"},
	}},
	{title = "=== LEVITATION BUNDLE ===", items = {
		{"Run", "616010382"}, {"Walk", "616013216"}, {"Jump", "616008936"},
		{"Idle 1", "616006778"}, {"Idle 2", "616008087"}, {"Idle 3", "886862142"},
		{"Fall", "616005863"}, {"Swim", "616011509"}, {"Swim Idle", "616012453"}, {"Climb", "616003713"},
	}},
	{title = "=== MAGE BUNDLE ===", items = {
		{"Run", "707861613"}, {"Walk", "707897309"}, {"Jump", "707853694"},
		{"Idle 1", "707742142"}, {"Idle 2", "707855907"}, {"Idle 3", "885508740"},
		{"Fall", "707829716"}, {"Swim", "707876443"}, {"Swim Idle", "707894699"}, {"Climb", "707826056"},
	}},
	{title = "=== NINJA BUNDLE ===", items = {
		{"Run", "656118852"}, {"Walk", "656121766"}, {"Jump", "656117878"},
		{"Idle 1", "656117400"}, {"Idle 2", "656118341"}, {"Idle 3", "886742569"},
		{"Fall", "656115606"}, {"Swim", "656119721"}, {"Swim Idle", "656121397"}, {"Climb", "656114359"},
	}},
	{title = "=== PIRATE BUNDLE ===", items = {
		{"Run", "750783738"}, {"Walk", "750785693"}, {"Jump", "750782230"},
		{"Idle 1", "750781874"}, {"Idle 2", "750782770"}, {"Idle 3", "885515365"},
		{"Fall", "750780242"}, {"Swim", "750784579"}, {"Swim Idle", "750785176"}, {"Climb", "750779899"},
	}},
	{title = "=== ROBOT BUNDLE ===", items = {
		{"Run", "616091570"}, {"Walk", "616095330"}, {"Jump", "616090535"},
		{"Idle 1", "616088211"}, {"Idle 2", "616089559"}, {"Idle 3", "885531463"},
		{"Fall", "616087089"}, {"Swim", "616092998"}, {"Swim Idle", "616094091"}, {"Climb", "616086039"},
	}},
	{title = "=== RTHRO BUNDLE ===", items = {
		{"Run", "2510198475"}, {"Walk", "2510202577"}, {"Jump", "2510197830"},
		{"Idle 1", "2510197257"}, {"Idle 2", "2510196951"}, {"Idle 3", "3711062489"},
		{"Fall", "2510195892"}, {"Swim", "2510199791"}, {"Swim Idle", "2510201162"}, {"Climb", "2510192778"},
	}},
	{title = "=== STYLISH BUNDLE ===", items = {
		{"Run", "616140816"}, {"Walk", "616146177"}, {"Jump", "616139451"},
		{"Idle 1", "616136790"}, {"Idle 2", "616138447"}, {"Idle 3", "886888594"},
		{"Fall", "616134815"}, {"Swim", "616143378"}, {"Swim Idle", "616144772"}, {"Climb", "616133594"},
	}},
	{title = "=== SUPERHERO BUNDLE ===", items = {
		{"Run", "616117076"}, {"Walk", "616122287"}, {"Jump", "616115533"},
		{"Idle 1", "616111295"}, {"Idle 2", "616113536"}, {"Idle 3", "885535855"},
		{"Fall", "616108001"}, {"Swim", "616119360"}, {"Swim Idle", "616120861"}, {"Climb", "616104706"},
	}},
	{title = "=== TOY BUNDLE ===", items = {
		{"Run", "782842708"}, {"Walk", "782843345"}, {"Jump", "782847020"},
		{"Idle 1", "782841498"}, {"Idle 2", "782845736"}, {"Idle 3", "980952228"},
		{"Fall", "782846423"}, {"Swim", "782844582"}, {"Swim Idle", "782845186"}, {"Climb", "782843869"},
	}},
	{title = "=== VAMPIRE BUNDLE ===", items = {
		{"Run", "1083462077"}, {"Walk", "1083473930"}, {"Jump", "1083455352"},
		{"Idle 1", "1083445855"}, {"Idle 2", "1083450166"}, {"Idle 3", "1088037547"},
		{"Fall", "1083443587"}, {"Swim", "1083464683"}, {"Swim Idle", "1083467779"}, {"Climb", "1083439238"},
	}},
	{title = "=== WEREWOLF BUNDLE ===", items = {
		{"Run", "1083216690"}, {"Walk", "1083178339"}, {"Jump", "1083218792"},
		{"Idle 1", "1083195517"}, {"Idle 2", "1083214717"}, {"Idle 3", "1099492820"},
		{"Fall", "1083189019"}, {"Swim", "1083222527"}, {"Swim Idle", "1083225406"}, {"Climb", "1083182000"},
	}},
	{title = "=== ZOMBIE BUNDLE ===", items = {
		{"Run", "616163682"}, {"Walk", "616168032"}, {"Jump", "616161997"},
		{"Idle 1", "616158929"}, {"Idle 2", "616160636"}, {"Idle 3", "885545458"},
		{"Fall", "616157476"}, {"Swim", "616165109"}, {"Swim Idle", "616166655"}, {"Climb", "616156119"},
	}},
	{title = "=== R6 EMOTES ===", items = {
		{"Cheer", "108380305"}, {"Wave", "128779823"}, {"Point", "128778871"},
		{"Laugh", "107226824"}, {"Dance", "128781914"}, {"Dance 2", "128785067"},
		{"Dance 3", "128787024"},
	}},
	{title = "=== CATALOG EMOTES (EXTENDED) ===", items = {
		{"Air Guitar", "3360686515"}, {"Headbanger", "3360686588"}, {"Tumble", "3360686775"},
		{"Strut", "3360686883"}, {"Belly Flop", "3360687853"}, {"Floss", "3360687778"},
		{"Gallop", "3360688181"}, {"Robot", "3360688134"}, {"Pop Lock", "3360688445"},
		{"Breakdance", "3360688866"}, {"Kicks", "3360689133"}, {"Knee Spin", "3360689035"},
		{"Bow", "3360689196"}, {"Accordion", "3360689401"}, {"Spin", "3360689585"},
		{"Hips", "3360689843"}, {"Sleep", "3360690295"}, {"Hop", "3360690414"},
		{"Sad", "3360690466"}, {"Potion", "3360690500"}, {"Sword", "3360690602"},
		{"Confetti", "3360690636"}, {"Lunge", "3360690683"}, {"Parkour", "3360690880"},
		{"Cower", "3360690915"}, {"Surf", "3360690782"}, {"Tiptoe", "3360691113"},
		{"Sit", "3360691232"}, {"Flair", "3360691255"}, {"Slump", "3360691332"},
		{"Shiver", "3360691373"},
	}},
	{title = "=== SWORD OF LIGHT (R15) ===", items = {
		{"Charge", "2410315272"}, {"Slash", "2410679501"}, {"Stab", "3027801142"},
		{"Summon", "3027289605"},
	}},
	{title = "=== SWORD OF LIGHT (R6) ===", items = {
		{"Charge", "77320917"}, {"Slash", "54584713"}, {"Stab", "2954124238"},
		{"Summon", "3027285080"},
	}},
	{title = "=== MISC / DOCS EXAMPLE ANIMATIONS ===", items = {
		{"Kick (Docs)", "2515090838"}, {"Fall Backwards (Tutorial)", "3716468774"},
	}},
	{title = "=== ADDITIONAL CATALOG EMOTES ===", items = {
		{"Zombie Walk", "3360691417"}, {"Tornado", "3360691465"}, {"Prat Fall", "3360691515"},
		{"Penguin", "452131105"}, {"Floor", "452131078"}, {"Handstand", "452131160"},
		{"Russian Dance", "3343684698"}, {"Cha Cha", "3343683420"},
	}},

}

local yOff = 0

for _, cat in ipairs(animCategories) do
	local header = create("TextLabel", {
		Name = "CategoryHeader",
		Size = UDim2.new(0, 244, 0, 22),
		Position = UDim2.new(0, 0, 0, yOff),
		BackgroundColor3 = Color3.fromRGB(60, 60, 80),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Text = cat.title,
		TextColor3 = Color3.fromRGB(255, 255, 100),
		TextSize = 14,
		Font = Enum.Font.SourceSansBold,
		TextXAlignment = Enum.TextXAlignment.Center,
	}, idsScrollingFrame)
	yOff += 24
	for _, item in ipairs(cat.items) do
		local label = create("TextLabel", {
			Name = "AnimID",
			Size = UDim2.new(0, 244, 0, 18),
			Position = UDim2.new(0, 0, 0, yOff),
			BackgroundColor3 = Color3.fromRGB(40, 40, 50),
			BackgroundTransparency = 0.5,
			BorderSizePixel = 0,
			Text = item[1] .. ": " .. item[2],
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = 14,
			Font = Enum.Font.SourceSans,
		}, idsScrollingFrame)
		label:SetAttribute("animId", item[2])
		yOff += 20
	end
	yOff += 4

end

local idTextBox = create("TextBox", {
	Name = "ID",
	Size = UDim2.new(0, 200, 0, 50),
	Position = UDim2.new(0.200, 0, 0.0416, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 0,
	BorderSizePixel = 2,
	PlaceholderText = "Animation id",
	PlaceholderColor3 = Color3.fromRGB(20, 20, 20),
	Text = "",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 20,
	Font = Enum.Font.SourceSansBold,
	ClearTextOnFocus = true,
	Visible = false,

}, toggles)

local playerNameTextBox = create("TextBox", {
	Name = "PlayerName",
	Size = UDim2.new(0, 200, 0, 50),
	Position = UDim2.new(0.194, 0, 0.0463, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 0,
	BorderSizePixel = 2,
	PlaceholderText = "Player Name",
	PlaceholderColor3 = Color3.fromRGB(47, 47, 47),
	Text = "",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,
	ClearTextOnFocus = true,
	Visible = false,

}, toggles)

local hexcolorTextBox = create("TextBox", {
	Name = "Hexcolor",
	Size = UDim2.new(0, 83, 0, 50),
	Position = UDim2.new(0.194, 0, 0.214, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 0,
	BorderSizePixel = 2,
	PlaceholderText = "HEX Color",
	PlaceholderColor3 = Color3.fromRGB(47, 47, 47),
	Text = "",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,
	ClearTextOnFocus = true,
	Visible = false,

}, toggles)

local setPlayerButton = create("TextButton", {
	Name = "SETPLAYER",
	Size = UDim2.new(0, 54, 0, 25),
	Position = UDim2.new(0.676, 0, 0.0774, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 0,
	BorderSizePixel = 2,
	Text = "ESP All",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,
	Visible = false,

}, toggles)

local colorsetButton = create("TextButton", {
	Name = "Colorset",
	Size = UDim2.new(0, 74, 0, 25),
	Position = UDim2.new(0.418, 0, 0.243, 0),
	BackgroundColor3 = Color3.fromRGB(109, 109, 109),
	BackgroundTransparency = 0,
	BorderSizePixel = 2,
	Text = "Set Color",
	TextColor3 = Color3.new(0, 0, 0),
	TextSize = 14,
	Font = Enum.Font.SourceSans,
	Visible = false,

}, toggles)

local espElements = {colorsetButton, hexcolorTextBox, setPlayerButton}

local animElements = {idTextBox, playButton, idsScrollingFrame}

local function hideElements(elements)
	for _, element in elements do
		element.Visible = false
	end

end

local function showElements(elements)
	for _, element in elements do
		element.Visible = true
	end

end

local function getNdsFrame()
	local ndsGui = playerGui:FindFirstChild("nds")
	if ndsGui then
		return ndsGui:FindFirstChild("Frame")
	end
	return nil

end

local function hideNdsFrame()
	local ndsFrame = getNdsFrame()
	if ndsFrame then
		ndsFrame.Visible = false
	end

end

local function switchTo3rdParty()
	hideElements(espElements)
	hideElements(animElements)
	hideNdsFrame()
	utilGUI.Visible = false
	lockOnGUI.Visible = false
	thirdGUI.Visible = true

end

local function switchToAnimation()
	hideElements(espElements)
	hideNdsFrame()
	utilGUI.Visible = false
	thirdGUI.Visible = false
	lockOnGUI.Visible = false
	showElements(animElements)

end

local function switchToESP()
	hideElements(animElements)
	hideNdsFrame()
	utilGUI.Visible = false
	thirdGUI.Visible = false
	lockOnGUI.Visible = false
	showElements(espElements)

end

local function switchToNDS()
	hideElements(espElements)
	hideElements(animElements)
	utilGUI.Visible = false
	thirdGUI.Visible = false
	lockOnGUI.Visible = false
	local ndsFrame = getNdsFrame()
	if ndsFrame then
		ndsFrame.Visible = true
	end

end

local function switchToUtility()
	hideElements(espElements)
	hideElements(animElements)
	hideNdsFrame()
	thirdGUI.Visible = false
	lockOnGUI.Visible = false
	utilGUI.Visible = true

end

local function switchToLockOn()
	hideElements(espElements)
	hideElements(animElements)
	hideNdsFrame()
	utilGUI.Visible = false
	thirdGUI.Visible = false
	lockOnGUI.Visible = true

end

thirdpButton.MouseButton1Click:Connect(switchTo3rdParty)

feAnimsButton.MouseButton1Click:Connect(switchToAnimation)

espButton.MouseButton1Click:Connect(switchToESP)

ndsButton.MouseButton1Click:Connect(switchToNDS)

utilButton.MouseButton1Click:Connect(switchToUtility)

lockOnButton.MouseButton1Click:Connect(switchToLockOn)

closeButton.MouseButton1Click:Connect(function()
	thirdGUI.Visible = false

end)

for _, child in ipairs(idsScrollingFrame:GetChildren()) do
	if child:IsA("TextLabel") and child:GetAttribute("animId") then
		child.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				idTextBox.Text = child:GetAttribute("animId")
			end
		end)
	end

end

playButton.MouseButton1Click:Connect(function()
	local character = localPlayer.Character
	if not character then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then return end
	local animId = idTextBox.Text
	if animId == "" or tonumber(animId) == nil then return end
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://" .. animId
	local success, track = pcall(function()
		return animator:LoadAnimation(animation)
	end)
	if success and track then
		track.Priority = Enum.AnimationPriority.Action
		track.Looped = true
		track:Play()
	end

end)

local notify  

local espActive = false

local espColor = Color3.fromRGB(255, 255, 0)

local espHighlights = {}

local espConnections = {}

local function parseHexColor(hex)
	hex = string.gsub(hex, "#", "")
	hex = string.gsub(hex, "%s", "")
	if #hex == 6 then
		local r = tonumber(string.sub(hex, 1, 2), 16)
		local g = tonumber(string.sub(hex, 3, 4), 16)
		local b = tonumber(string.sub(hex, 5, 6), 16)
		if r and g and b then
			return Color3.fromRGB(r, g, b)
		end
	end
	return nil

end

local function removeESP(player)
	if espHighlights[player] then
		if espHighlights[player].highlight then
			espHighlights[player].highlight:Destroy()
		end
		if espHighlights[player].billboard then
			espHighlights[player].billboard:Destroy()
		end
		espHighlights[player] = nil
	end
	if espConnections[player] then
		espConnections[player]:Disconnect()
		espConnections[player] = nil
	end

end

local function applyESPToCharacter(player, character)
	if not character then return end
	removeESP(player)
	local highlight = Instance.new("Highlight")
	highlight.Name = "VlexESP"
	highlight.FillColor = espColor
	highlight.FillTransparency = 0.5
	highlight.OutlineColor = espColor
	highlight.OutlineTransparency = 0
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	highlight.Adornee = character
	highlight.Parent = character
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "VlexESPLabel"
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.LightInfluence = 0
	billboard.Adornee = character
	billboard.Parent = character
	local nameLabel = Instance.new("TextLabel")
	nameLabel.Size = UDim2.new(1, 0, 1, 0)
	nameLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	nameLabel.BackgroundTransparency = 0.3
	nameLabel.TextColor3 = espColor
	nameLabel.Font = Enum.Font.SourceSansBold
	nameLabel.TextSize = 18
	nameLabel.Text = player.Name
	nameLabel.Parent = billboard
	espHighlights[player] = {highlight = highlight, billboard = billboard}

end

local function refreshESPForPlayer(player)
	if not espActive then return end
	if player == localPlayer then return end
	if player.Character then
		applyESPToCharacter(player, player.Character)
	end
	espConnections[player] = player.CharacterAdded:Connect(function(character)
		task.wait(0.5)
		if espActive then
			applyESPToCharacter(player, character)
		end
	end)

end

local function startESP()
	espActive = true
	for _, player in Players:GetPlayers() do
		refreshESPForPlayer(player)
	end

end

local function stopESP()
	espActive = false
	for player, _ in pairs(espHighlights) do
		removeESP(player)
	end
	for player, conn in pairs(espConnections) do
		conn:Disconnect()
		espConnections[player] = nil
	end

end

setPlayerButton.MouseButton1Click:Connect(function()
	if espActive then
		stopESP()
		setPlayerButton.Text = "ESP All"
		setPlayerButton.BackgroundColor3 = Color3.fromRGB(109, 109, 109)
		notify("ESP", "ESP disabled")
	else
		startESP()
		setPlayerButton.Text = "ESP On"
		setPlayerButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
		notify("ESP", "ESP enabled for all players")
	end

end)

colorsetButton.MouseButton1Click:Connect(function()
	local hex = hexcolorTextBox.Text
	local color = parseHexColor(hex)
	if color then
		espColor = color
		for player, data in pairs(espHighlights) do
			if data.highlight then
				data.highlight.FillColor = color
				data.highlight.OutlineColor = color
			end
			if data.billboard then
				local label = data.billboard:FindFirstChildOfClass("TextLabel")
				if label then
					label.TextColor3 = color
				end
			end
		end
		notify("ESP", "Color updated")
	else
		notify("ESP", "Invalid hex color")
	end

end)

Players.PlayerAdded:Connect(function(player)
	if espActive then
		refreshESPForPlayer(player)
	end

end)

Players.PlayerRemoving:Connect(function(player)
	removeESP(player)

end)

function notify(title, message)

end

local spyButton = thirdGUI:FindFirstChild("Spy")

local dexPlusButton = thirdGUI:FindFirstChild("DexPlus")

local mmButton = thirdGUI:FindFirstChild("MM")

local arsenButton = thirdGUI:FindFirstChild("ARSEN")

local moresoonButton = thirdGUI:FindFirstChild("moresoon")

if spyButton then
	spyButton.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau"))()
		end)
		if not success then
			notify("Remote Spy", "Failed: " .. tostring(err))
		end
	end)

end

if dexPlusButton then
	dexPlusButton.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
		end)
		if not success then
			notify("Dex++", "Failed: " .. tostring(err))
		end
	end)

end

local mm2Gui = nil

local mm2Title = nil

local mm2CoinFarming = true

local coinTween = nil

local coinHighlight = nil

local mm2Keybind = nil

local mm2CoinSpeed = 110

local mm2GunFarming = false

local mm2AlwaysEvadeKnife = false

local mm2CoinDelay = 0.5

local gunTween = nil

local gunHighlight = nil

local stopGunFarm 

local function createMM2Gui()
	mm2Title = create("TextLabel", {
		Name = "mm2title",
		Size = UDim2.new(0, 283, 0, 50),
		Position = UDim2.new(0.169663802, 0, 0.195005938, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 255),
		BackgroundTransparency = 0,
		BorderSizePixel = 2,
		Text = "VlexWare MM2",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 20,
		Font = Enum.Font.SourceSansBold,
		Active = true,
		Visible = false,
	}, vlexWare)
	create("UICorner", {
		CornerRadius = UDim.new(0, 8),
	}, mm2Title)
	mm2Gui = create("ScrollingFrame", {
		Name = "mm2",
		Size = UDim2.new(0, 283, 0, 230),
		Position = UDim2.new(0.169663802, 0, 0.254458964, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 255),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 1, 0),
		ScrollBarThickness = 12,
		ScrollingDirection = Enum.ScrollingDirection.XY,
		ClipsDescendants = true,
		Visible = false,
	}, vlexWare)
	create("UICorner", {
		CornerRadius = UDim.new(0, 8),
	}, mm2Gui)
	makeDraggable(mm2Title, mm2Title, mm2Gui)
	makeDraggable(mm2Gui, mm2Title, mm2Gui)
	local mm2Close = create("TextButton", {
		Name = "Close",
		Size = UDim2.new(0, 25, 0, 20),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 1,
		Text = "X",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 20,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	local coinFButton = create("TextButton", {
		Name = "CoinF",
		Size = UDim2.new(0, 272, 0, 50),
		Position = UDim2.new(0, 0, 0.0755053535, 0),
		BackgroundColor3 = Color3.fromRGB(0, 170, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 1,
		Text = "Stop Coin Farm",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 20,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	local getGButton = create("TextButton", {
		Name = "GetG",
		Size = UDim2.new(0, 272, 0, 50),
		Position = UDim2.new(0, 0, 0.252080858, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 1,
		Text = "Get Gun",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 20,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	local gunEspButton = create("TextButton", {
		Name = "GunESP",
		Size = UDim2.new(0, 272, 0, 50),
		Position = UDim2.new(0, 0, 0.38, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 1,
		Text = "Role ESP: OFF",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 20,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	local keybindBox = create("TextBox", {
		Name = "Keybind",
		Size = UDim2.new(0, 46, 0, 32),
		Position = UDim2.new(0, 0, 0.49, 0),
		BackgroundColor3 = Color3.fromRGB(255, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		PlaceholderText = "Keybind",
		PlaceholderColor3 = Color3.new(0, 0, 0),
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		Font = Enum.Font.SourceSans,
		ClearTextOnFocus = true,
	}, mm2Gui)
	local keybindSetButton = create("TextButton", {
		Name = "keybindSet",
		Size = UDim2.new(0, 52, 0, 32),
		Position = UDim2.new(0.183745578, 0, 0.49, 0),
		BackgroundColor3 = Color3.fromRGB(255, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Text = "SET",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	local speedLabel = create("TextLabel", {
		Name = "SpeedLabel",
		Size = UDim2.new(0, 100, 0, 32),
		Position = UDim2.new(0, 0, 0.61, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 255),
		BackgroundTransparency = 0,
		BorderSizePixel = 1,
		Text = "Speed:",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 16,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	local speedBox = create("TextBox", {
		Name = "SpeedBox",
		Size = UDim2.new(0, 80, 0, 32),
		Position = UDim2.new(0.38, 0, 0.61, 0),
		BackgroundColor3 = Color3.fromRGB(255, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 1,
		PlaceholderText = "30",
		PlaceholderColor3 = Color3.new(0, 0, 0),
		Text = "30",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		Font = Enum.Font.SourceSans,
		ClearTextOnFocus = false,
	}, mm2Gui)
	speedBox.FocusLost:Connect(function()
		local num = tonumber(string.trim(speedBox.Text))
		if num and num > 0 then
			mm2CoinSpeed = num
			notify("MM2", "Coin speed set to " .. num)
		else
			speedBox.Text = tostring(mm2CoinSpeed)
			notify("MM2", "Invalid speed value")
		end
	end)
	local delayLabel = create("TextLabel", {
		Name = "DelayLabel",
		Size = UDim2.new(0, 100, 0, 32),
		Position = UDim2.new(0, 0, 0.665, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 255),
		BackgroundTransparency = 0,
		BorderSizePixel = 1,
		Text = "Delay:",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 16,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	local delayBox = create("TextBox", {
		Name = "DelayBox",
		Size = UDim2.new(0, 80, 0, 32),
		Position = UDim2.new(0.38, 0, 0.665, 0),
		BackgroundColor3 = Color3.fromRGB(255, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 1,
		PlaceholderText = "0.05",
		PlaceholderColor3 = Color3.new(0, 0, 0),
		Text = "0.05",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		Font = Enum.Font.SourceSans,
		ClearTextOnFocus = false,
	}, mm2Gui)
	delayBox.FocusLost:Connect(function()
		local num = tonumber(string.trim(delayBox.Text))
		if num and num >= 0 then
			mm2CoinDelay = num
			notify("MM2", "Pickup delay set to " .. num)
		else
			delayBox.Text = tostring(mm2CoinDelay)
			notify("MM2", "Invalid delay value")
		end
	end)
	local alwaysEvadeButton = create("TextButton", {
		Name = "AlwaysEvade",
		Size = UDim2.new(0, 272, 0, 50),
		Position = UDim2.new(0, 0, 0.72, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 0),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 1,
		Text = "Always Evade Knife: OFF",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 20,
		Font = Enum.Font.SourceSansBold,
	}, mm2Gui)
	alwaysEvadeButton.MouseButton1Click:Connect(function()
		mm2AlwaysEvadeKnife = not mm2AlwaysEvadeKnife
		if mm2AlwaysEvadeKnife then
			alwaysEvadeButton.Text = "Always Evade Knife: ON"
			alwaysEvadeButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			notify("MM2", "Always evading knife")
		else
			alwaysEvadeButton.Text = "Always Evade Knife: OFF"
			alwaysEvadeButton.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
			notify("MM2", "Role-aware evasion")
		end
	end)
	create("TextLabel", {
		Name = "Footer",
		Size = UDim2.new(0, 272, 0, 34),
		Position = UDim2.new(0, 0, 0.900118887, 0),
		BackgroundColor3 = Color3.fromRGB(85, 0, 255),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Text = "Thanks for using vlexware :)",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
		Font = Enum.Font.SourceSans,
	}, mm2Gui)
	mm2Close.MouseButton1Click:Connect(function()
		mm2Gui.Visible = false
		mm2Title.Visible = false
	end)
	local coinFarmPlatform = nil
	local platformHeartbeat = nil
	local platformFloorY = nil
	local function stopCoinFarm()
		mm2CoinFarming = false
		if coinTween then
			coinTween:Cancel()
			coinTween = nil
		end
		if coinHighlight then
			coinHighlight:Destroy()
			coinHighlight = nil
		end
		local character = localPlayer.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = false end
		end
		if platformHeartbeat then
			platformHeartbeat:Disconnect()
			platformHeartbeat = nil
		end
		if coinFarmPlatform and coinFarmPlatform.Parent then
			coinFarmPlatform:Destroy()
		end
		coinFarmPlatform = nil
		coinFButton.Text = "Auto Coin Farm"
		coinFButton.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
	end
	local visitedCoins = {}
	localPlayer.CharacterAdded:Connect(function()
		if coinTween then
			coinTween:Cancel()
			coinTween = nil
		end
		if coinHighlight then
			coinHighlight:Destroy()
			coinHighlight = nil
		end
		visitedCoins = {}
		platformFloorY = nil
		if coinFarmPlatform and coinFarmPlatform.Parent then
			coinFarmPlatform:Destroy()
		end
		coinFarmPlatform = nil
		if platformHeartbeat then
			platformHeartbeat:Disconnect()
			platformHeartbeat = nil
		end
	end)
	local function playerHasWeapon(player, weaponName)
		local char = player.Character
		if char and char:FindFirstChild(weaponName) then
			return true
		end
		local backpack = player:FindFirstChild("Backpack")
		if backpack and backpack:FindFirstChild(weaponName) then
			return true
		end
		return false
	end
	local function getThreatPosition()
		-- If "always evade knife" is on, always avoid the knife holder (murderer)
		local threatWeapon = "Knife"
		if not mm2AlwaysEvadeKnife then
			local localHasKnife = playerHasWeapon(localPlayer, "Knife")
			threatWeapon = localHasKnife and "Gun" or "Knife"
		end
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				local char = player.Character
				if char then
					local humanoid = char:FindFirstChildOfClass("Humanoid")
					if humanoid and humanoid.Health > 0 then
						if playerHasWeapon(player, threatWeapon) then
							local mHrp = char:FindFirstChild("HumanoidRootPart")
							if mHrp then
								return mHrp.Position
							end
						end
					end
				end
			end
		end
		return nil
	end
	local safeDistance = 50
	task.spawn(function()
		while true do
			local character = localPlayer.Character
			if not character then
				task.wait(0.5)
				continue
			end
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if not hrp then
				task.wait(0.5)
				continue
			end
			if mm2CoinFarming then
				if not coinFarmPlatform or not coinFarmPlatform.Parent then
					coinFarmPlatform = Instance.new("Part")
					coinFarmPlatform.Name = "VlexCoinFarmPlatform"
					coinFarmPlatform.Size = Vector3.new(8, 1, 8)
					coinFarmPlatform.Transparency = 1
					coinFarmPlatform.CanCollide = true
					coinFarmPlatform.CanTouch = false
					coinFarmPlatform.CanQuery = false
					coinFarmPlatform.Anchored = true
					coinFarmPlatform.Massless = true
					coinFarmPlatform.Parent = Workspace
					if platformHeartbeat then
						platformHeartbeat:Disconnect()
					end
					local initChar = localPlayer.Character
					local initHrp = initChar and initChar:FindFirstChild("HumanoidRootPart")
					platformFloorY = initHrp and (initHrp.Position.Y - 3.5) or 0
					platformHeartbeat = RunService.Heartbeat:Connect(function()
						if not mm2CoinFarming or not coinFarmPlatform or not coinFarmPlatform.Parent then
							return
						end
						local char = localPlayer.Character
						if char then
							local h = char:FindFirstChild("HumanoidRootPart")
							if h then
								if h.Anchored then
									platformFloorY = h.Position.Y - 3.5
								else
									local targetY = h.Position.Y - 3.5
									if targetY > platformFloorY then
										platformFloorY = targetY
									end
								end
								coinFarmPlatform.CFrame = CFrame.new(h.Position.X, platformFloorY, h.Position.Z)
							end
						end
					end)
				end
			else
				if coinFarmPlatform and coinFarmPlatform.Parent then
					coinFarmPlatform:Destroy()
				end
				coinFarmPlatform = nil
				if platformHeartbeat then
					platformHeartbeat:Disconnect()
					platformHeartbeat = nil
				end
			end
			local allCoins = {}
			for _, descendant in ipairs(Workspace:GetDescendants()) do
				if descendant.Name == "CoinVisual" and (descendant:IsA("BasePart") or descendant:IsA("Model")) then
					table.insert(allCoins, descendant)
				end
			end
			if #allCoins == 0 then
				visitedCoins = {}
				if coinHighlight then
					coinHighlight:Destroy()
					coinHighlight = nil
				end
				task.wait(0.1)
				continue
			end
			for coin in pairs(visitedCoins) do
				if not coin.Parent then
					visitedCoins[coin] = nil
				end
			end
			if not mm2CoinFarming then
				task.wait(0.2)
				continue
			end
			local murdererPos = getThreatPosition()
			local targetCoin = nil
			local nearestDist = math.huge
			for _, coin in ipairs(allCoins) do
				if not visitedCoins[coin] and coin.Parent then
					local coinPos
					if coin:IsA("BasePart") then
						coinPos = coin.Position
					elseif coin:IsA("Model") then
						coinPos = coin:GetPivot().Position
					end
					if coinPos then
						local isSafe = true
						if murdererPos then
							isSafe = (coinPos - murdererPos).Magnitude > safeDistance
						end
						if isSafe then
							local dist = (coinPos - hrp.Position).Magnitude
							if dist < nearestDist then
								nearestDist = dist
								targetCoin = coin
							end
						end
					end
				end
			end
			if not targetCoin then
				visitedCoins = {}
				for _, coin in ipairs(allCoins) do
					if coin.Parent then
						local coinPos
						if coin:IsA("BasePart") then
							coinPos = coin.Position
						elseif coin:IsA("Model") then
							coinPos = coin:GetPivot().Position
						end
						if coinPos then
							local isSafe = true
							if murdererPos then
								isSafe = (coinPos - murdererPos).Magnitude > safeDistance
							end
							if isSafe then
								local dist = (coinPos - hrp.Position).Magnitude
								if dist < nearestDist then
									nearestDist = dist
									targetCoin = coin
								end
							end
						end
					end
				end
				if not targetCoin then
					task.wait(0.1)
					continue
				end
			end
			if not targetCoin.Parent then
				visitedCoins[targetCoin] = nil
				task.wait()
				continue
			end
			if coinHighlight then
				coinHighlight:Destroy()
			end
			coinHighlight = Instance.new("Highlight")
			coinHighlight.Name = "VlexCoinHighlight"
			coinHighlight.FillColor = Color3.fromRGB(255, 215, 0)
			coinHighlight.FillTransparency = 0.3
			coinHighlight.OutlineColor = Color3.fromRGB(255, 255, 0)
			coinHighlight.OutlineTransparency = 0
			coinHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			coinHighlight.Adornee = targetCoin
			coinHighlight.Parent = targetCoin
			local coinCFrame
			if targetCoin:IsA("BasePart") then
				coinCFrame = targetCoin.CFrame
			elseif targetCoin:IsA("Model") then
				coinCFrame = targetCoin:GetPivot()
			else
				if coinHighlight then
					coinHighlight:Destroy()
					coinHighlight = nil
				end
				task.wait(0.5)
				continue
			end
			local targetPos = coinCFrame.Position - Vector3.new(0, 2, 0)
			local _, currentYaw = hrp.CFrame:ToEulerAnglesYXZ()
			local finalCFrame = CFrame.new(targetPos) * CFrame.Angles(0, currentYaw, 0)
			local distance = (hrp.CFrame.Position - targetPos).Magnitude
			if not targetCoin.Parent then
				-- Coin vanished between the scan and the move - skip it
				visitedCoins[targetCoin] = true
				if coinHighlight then
					coinHighlight:Destroy()
					coinHighlight = nil
				end
				task.wait()
				continue
			end
			hrp.Anchored = true
			if distance > 1000 then
				-- Coin is over 1000 studs away: teleport directly to it
				hrp.CFrame = finalCFrame
			else
				local tweenDuration = math.max(0.1, distance / mm2CoinSpeed)
				if coinTween then
					coinTween:Cancel()
				end
				coinTween = TweenService:Create(hrp, TweenInfo.new(tweenDuration, Enum.EasingStyle.Linear), {CFrame = finalCFrame})
				coinTween:Play()
				local tweenCompleted = false
				local tweenConn = coinTween.Completed:Connect(function()
					tweenCompleted = true
				end)
				local tweenTimeout = 0
				local tweenMaxWait = tweenDuration + 2
				while not tweenCompleted and mm2CoinFarming and tweenTimeout < tweenMaxWait do
					if not targetCoin.Parent then
						-- Coin disappeared (round ended) - stop tweening to nothing
						if coinTween then
							coinTween:Cancel()
						end
						break
					end
					task.wait()
					tweenTimeout += 0.016
				end
				tweenConn:Disconnect()
			end
			local currentChar = localPlayer.Character
			local currentHrp = currentChar and currentChar:FindFirstChild("HumanoidRootPart")
			if not currentChar or not currentHrp or currentHrp ~= hrp then
				if coinHighlight then
					coinHighlight:Destroy()
					coinHighlight = nil
				end
				task.wait(0.3)
				continue
			end
			if not mm2CoinFarming then
				if coinHighlight then
					coinHighlight:Destroy()
					coinHighlight = nil
				end
				continue
			end
			local mPos = getThreatPosition()
			if mPos and (hrp.Position - mPos).Magnitude < safeDistance then
				visitedCoins[targetCoin] = true
				if coinHighlight then
					coinHighlight:Destroy()
					coinHighlight = nil
				end
				if mm2CoinFarming then
					task.wait()
				end
				continue
			end
			hrp.Anchored = false
			local pickupTimeout = 5
			local elapsed = 0
			local movedUp = false
			while targetCoin.Parent and mm2CoinFarming and elapsed < pickupTimeout do
				local mPos2 = getThreatPosition()
				if mPos2 and (hrp.Position - mPos2).Magnitude < safeDistance then
					break
				end
				task.wait()
				elapsed += 0.016
					if elapsed >= 1.5 and not movedUp then
						movedUp = true
						local nudgeHrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
						if nudgeHrp and nudgeHrp.Parent then
							nudgeHrp.CFrame = nudgeHrp.CFrame + Vector3.new(0, 3, 0)
						end
					end
			end
			visitedCoins[targetCoin] = true
			if coinHighlight then
				coinHighlight:Destroy()
				coinHighlight = nil
			end
			if mm2CoinFarming then
				local freezeHrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
				if freezeHrp and freezeHrp.Parent then
					freezeHrp.Anchored = true
					task.wait(mm2CoinDelay)
					freezeHrp.Anchored = false
				end
			end
		end
	end)
	coinFButton.MouseButton1Click:Connect(function()
		if mm2CoinFarming then
			stopCoinFarm()
			notify("MM2", "Coin Farm stopped")
		else
			local character = localPlayer.Character
			if not character then return end
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			if stopGunFarm then stopGunFarm() end
			mm2CoinFarming = true
			coinFButton.Text = "Stop Coin Farm"
			coinFButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			notify("MM2", "Coin Farm started")
		end
	end)
	local gunEspActive = false
	local gunHighlights = {}
	local function stopGunEsp()
		gunEspActive = false
		for player, data in pairs(gunHighlights) do
			if data.highlight then data.highlight:Destroy() end
			if data.billboard then data.billboard:Destroy() end
		end
		gunHighlights = {}
		gunEspButton.Text = "Role ESP: OFF"
		gunEspButton.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
	end
	task.spawn(function()
		while true do
			if not gunEspActive then
				task.wait(0.5)
				continue
			end
			local foundPlayers = {}
			for _, player in ipairs(Players:GetPlayers()) do
				local character = player.Character
				if character then
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					if humanoid and humanoid.Health > 0 then
						local hasGun = character:FindFirstChild("Gun")
						local hasKnife = character:FindFirstChild("Knife")
						if not hasGun and not hasKnife then
							local backpack = player:FindFirstChild("Backpack")
							if backpack then
								hasGun = backpack:FindFirstChild("Gun")
								hasKnife = backpack:FindFirstChild("Knife")
							end
						end
						local hasWeapon = hasGun or hasKnife
						if hasWeapon then
							local isGun = hasGun ~= nil
							local espColor = isGun and Color3.fromRGB(0, 0, 255) or Color3.fromRGB(255, 0, 0)
							local labelText = isGun and (player.Name .. " [GUN]") or (player.Name .. " [KNIFE]")
							foundPlayers[player] = true
							local adornPart = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart or character:FindFirstChildWhichIsA("BasePart")
							if not gunHighlights[player] then
								local highlight = Instance.new("Highlight")
								highlight.Name = "VlexGunESP"
								highlight.FillColor = espColor
								highlight.FillTransparency = 0.5
								highlight.OutlineColor = espColor
								highlight.OutlineTransparency = 0
								highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
								highlight.Adornee = character
								highlight.Parent = character
								local billboard = Instance.new("BillboardGui")
								billboard.Name = "VlexGunESPName"
								billboard.Size = UDim2.new(0, 200, 0, 30)
								billboard.StudsOffset = Vector3.new(0, 3, 0)
								billboard.AlwaysOnTop = true
								billboard.Adornee = adornPart
								billboard.Parent = character
								local nameLabel = Instance.new("TextLabel")
								nameLabel.Size = UDim2.new(1, 0, 1, 0)
								nameLabel.BackgroundTransparency = 1
								nameLabel.Text = labelText
								nameLabel.TextColor3 = espColor
								nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
								nameLabel.TextStrokeTransparency = 0
								nameLabel.TextScaled = true
								nameLabel.Font = Enum.Font.SourceSansBold
								nameLabel.Parent = billboard
								gunHighlights[player] = {highlight = highlight, billboard = billboard}
							else
								local data = gunHighlights[player]
								data.highlight.Adornee = character
								data.highlight.FillColor = espColor
								data.highlight.OutlineColor = espColor
								if data.billboard then
									data.billboard.Adornee = adornPart
									local label = data.billboard:FindFirstChildOfClass("TextLabel")
									if label then
										label.Text = labelText
										label.TextColor3 = espColor
									end
								end
							end
						end
					end
				end
			end
			for player, data in pairs(gunHighlights) do
				if not foundPlayers[player] then
					if data.highlight then data.highlight:Destroy() end
					if data.billboard then data.billboard:Destroy() end
					gunHighlights[player] = nil
				end
			end
			task.wait(0.5)
		end
	end)
	local function toggleGunEsp()
		if gunEspActive then
			stopGunEsp()
			notify("MM2", "Role ESP stopped")
		else
			gunEspActive = true
			gunEspButton.Text = "Role ESP: ON"
			gunEspButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			notify("MM2", "Role ESP started - showing names and roles")
		end
	end
	gunEspButton.MouseButton1Click:Connect(toggleGunEsp)
	function stopGunFarm()
		mm2GunFarming = false
		if gunTween then
			gunTween:Cancel()
			gunTween = nil
		end
		if gunHighlight then
			gunHighlight:Destroy()
			gunHighlight = nil
		end
		local character = localPlayer.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = false end
		end
		getGButton.Text = "Get Gun"
		getGButton.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
	end
	task.spawn(function()
		while true do
			local character = localPlayer.Character
			if not character then
				task.wait(0.5)
				continue
			end
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if not hrp then
				task.wait(0.5)
				continue
			end
			if not mm2GunFarming then
				task.wait(0.2)
				continue
			end
			local hasGun = character:FindFirstChild("Gun")
			if not hasGun then
				local backpack = localPlayer:FindFirstChild("Backpack")
				if backpack then
					hasGun = backpack:FindFirstChild("Gun")
				end
			end
			if hasGun then
				stopGunFarm()
				notify("MM2", "Gun obtained!")
				continue
			end
			local targetObject = Workspace:FindFirstChild("GunDrop", true)
			if not targetObject or not targetObject.Parent then
				task.wait(0.5)
				continue
			end
			local targetCFrame
			if targetObject:IsA("BasePart") then
				targetCFrame = targetObject.CFrame
			elseif targetObject:IsA("Model") then
				targetCFrame = targetObject:GetPivot()
			else
				task.wait(0.5)
				continue
			end
			if gunHighlight then
				gunHighlight:Destroy()
			end
			gunHighlight = Instance.new("Highlight")
			gunHighlight.Name = "VlexGunHighlight"
			gunHighlight.FillColor = Color3.fromRGB(0, 0, 255)
			gunHighlight.FillTransparency = 0.3
			gunHighlight.OutlineColor = Color3.fromRGB(0, 100, 255)
			gunHighlight.OutlineTransparency = 0
			gunHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			gunHighlight.Adornee = targetObject
			gunHighlight.Parent = targetObject
			local targetPos = targetCFrame.Position - Vector3.new(0, 2, 0)
			local _, currentYaw = hrp.CFrame:ToEulerAnglesYXZ()
			local finalCFrame = CFrame.new(targetPos) * CFrame.Angles(0, currentYaw, 0)
			local distance = (hrp.CFrame.Position - targetPos).Magnitude
			local tweenDuration = math.max(0.1, distance / mm2CoinSpeed)
			hrp.Anchored = true
			if gunTween then
				gunTween:Cancel()
			end
			gunTween = TweenService:Create(hrp, TweenInfo.new(tweenDuration, Enum.EasingStyle.Linear), {CFrame = finalCFrame})
			gunTween:Play()
			gunTween.Completed:Wait()
			if not mm2GunFarming then
				if gunHighlight then
					gunHighlight:Destroy()
					gunHighlight = nil
				end
				continue
			end
			hrp.Anchored = false
			local pickupTimeout = 5
			local elapsed = 0
			local movedUp = false
			while targetObject.Parent and mm2GunFarming and elapsed < pickupTimeout do
				task.wait(0.1)
				elapsed += 0.1
				if elapsed >= 1.5 and not movedUp then
					movedUp = true
					hrp.CFrame = hrp.CFrame + Vector3.new(0, 3, 0)
				end
			end
			if gunHighlight then
				gunHighlight:Destroy()
				gunHighlight = nil
			end
			if mm2GunFarming then
				hrp.Anchored = true
				task.wait(0.4)
				hrp.Anchored = false
			end
		end
	end)
	local function toggleGunFarm()
		if mm2GunFarming then
			stopGunFarm()
			notify("MM2", "Gun Farm stopped")
		else
			if mm2CoinFarming then
				stopCoinFarm()
			end
			local character = localPlayer.Character
			if not character then return end
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			mm2GunFarming = true
			getGButton.Text = "Stop Gun Farm"
			getGButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			notify("MM2", "Gun Farm started")
		end
	end
	getGButton.MouseButton1Click:Connect(toggleGunFarm)
	keybindSetButton.MouseButton1Click:Connect(function()
		local keyText = string.upper(string.trim(keybindBox.Text))
		if keyText == "" then
			notify("MM2", "Enter a key name first!")
			return
		end
		local keyCode = nil
		for _, key in ipairs(Enum.KeyCode:GetEnumItems()) do
			if string.upper(key.Name) == keyText then
				keyCode = key
				break
			end
		end
		if keyCode then
			mm2Keybind = keyCode
			notify("MM2", "Keybind set to: " .. keyCode.Name)
		else
			notify("MM2", "Invalid key: " .. keyText)
		end
	end)
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if mm2Keybind and input.KeyCode == mm2Keybind then
			toggleGunFarm()
		end
	end)

end

if mmButton then
	mmButton.MouseButton1Click:Connect(function()
		if not mm2Gui then
			createMM2Gui()
		end
		mm2Gui.Visible = not mm2Gui.Visible
		mm2Title.Visible = mm2Gui.Visible
	end)

end

if arsenButton then
	arsenButton.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet("http://dmonmods.xyz/loader.txt"))()
		end)
		if not success then
			notify("Arsenal", "Failed: " .. tostring(err))
		end
	end)

end

local legendsButton = thirdGUI:FindFirstChild("Legends")

local ninjaButton = thirdGUI:FindFirstChild("Ninja")

if legendsButton then
	legendsButton.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet("http://dmonmods.xyz/loader.txt"))()
		end)
		if not success then
			notify("Legends of Speed", "Failed: " .. tostring(err))
		end
	end)

end

if ninjaButton then
	ninjaButton.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet("http://dmonmods.xyz/loader.txt"))()
		end)
		if not success then
			notify("Ninja Legends", "Failed: " .. tostring(err))
		end
	end)

end

if moresoonButton then
	moresoonButton.MouseButton1Click:Connect(function()
		notify("Coming Soon", "More features coming soon!")
	end)

end

local LOCK_RANGE = 100

local LOCK_RELEASE_RANGE = 300

local LOCK_CAMERA_OFFSET = 0

local CAMERA_SMOOTHNESS = 0.15

local lockOnEnabled = false

local isLocked = false

local currentTarget = nil

local targetList = {}

local targetIndex = 1

local renderConnection = nil

local camera = Workspace.CurrentCamera

local function getValidTargets()
	local targets = {}
	for _, descendant in ipairs(Workspace:GetDescendants()) do
		if descendant:IsA("Model") then
			local humanoid = descendant:FindFirstChildOfClass("Humanoid")
			local hrp = descendant:FindFirstChild("HumanoidRootPart")
			if humanoid and hrp and humanoid.Health > 0 and descendant ~= localPlayer.Character then
				table.insert(targets, descendant)
			end
		end
	end
	return targets

end

local function distanceTo(target)
	local char = localPlayer.Character
	if not char then return math.huge end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return math.huge end
	local targetHrp = target:FindFirstChild("HumanoidRootPart")
	if not targetHrp then return math.huge end
	return (hrp.Position - targetHrp.Position).Magnitude

end

local function updateLockOnUI()
	if isLocked and currentTarget then
		lockOnStatusLabel.Text = "Status: LOCKED ON"
		lockOnStatusLabel.TextColor3 = Color3.fromRGB(50, 255, 100)
		lockOnHeader.Text = "Target: " .. (currentTarget.Name or "Unknown")
		lockOnToggleBtn.Text = "Lock-On: ON"
		lockOnToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
		reticle.Visible = true
	elseif lockOnEnabled then
		lockOnStatusLabel.Text = "Status: Ready (press Q)"
		lockOnStatusLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
		lockOnHeader.Text = "LOCK-ON SYSTEM"
		lockOnToggleBtn.Text = "Lock-On: ON"
		lockOnToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
		reticle.Visible = false
	else
		lockOnStatusLabel.Text = "Status: Inactive"
		lockOnStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		lockOnHeader.Text = "LOCK-ON SYSTEM"
		lockOnToggleBtn.Text = "Lock-On: OFF"
		lockOnToggleBtn.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
		reticle.Visible = false
	end

end

local function isTargetValid(target)
	if not target or not target.Parent then return false end
	local humanoid = target:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return false end
	local hrp = target:FindFirstChild("HumanoidRootPart")
	if not hrp then return false end
	if distanceTo(target) > LOCK_RELEASE_RANGE then return false end
	return true

end

local function releaseLock()
	isLocked = false
	currentTarget = nil
	if renderConnection then
		renderConnection:Disconnect()
		renderConnection = nil
	end
	updateLockOnUI()

end

local function lockOnNearest()
	if not lockOnEnabled then return end
	local allTargets = getValidTargets()
	targetList = {}
	for _, target in ipairs(allTargets) do
		if distanceTo(target) <= LOCK_RANGE then
			table.insert(targetList, target)
		end
	end
	if #targetList == 0 then
		releaseLock()
		return
	end
	table.sort(targetList, function(a, b)
		return distanceTo(a) < distanceTo(b)
	end)
	targetIndex = 1
	currentTarget = targetList[1]
	isLocked = true
	if not renderConnection then
		renderConnection = RunService.RenderStepped:Connect(function()
			if not isLocked or not currentTarget then return end
			if not isTargetValid(currentTarget) then
				releaseLock()
				return
			end
			local char = localPlayer.Character
			if not char then return end
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			local targetHrp = currentTarget:FindFirstChild("HumanoidRootPart")
			if not targetHrp then return end
			local targetPos = targetHrp.Position + Vector3.new(0, LOCK_CAMERA_OFFSET, 0)
			local currentLook = camera.CFrame.LookVector
			local desiredLook = (targetPos - camera.CFrame.Position).Unit
			local newLook = currentLook:Lerp(desiredLook, 1 - CAMERA_SMOOTHNESS)
			camera.CFrame = CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + newLook)
			local screenPos, onScreen = camera:WorldToViewportPoint(targetHrp.Position)
			if onScreen then
				reticle.Visible = true
				reticle.Position = UDim2.new(0, screenPos.X - 30, 0, screenPos.Y - 30)
			else
				reticle.Visible = false
			end
		end)
	end
	updateLockOnUI()

end

local function cycleTarget()
	if not isLocked or #targetList == 0 then
		lockOnNearest()
		return
	end
	targetIndex = targetIndex + 1
	if targetIndex > #targetList then
		targetIndex = 1
	end
	currentTarget = targetList[targetIndex]
	updateLockOnUI()

end

local function toggleLockOnSystem()
	if lockOnEnabled then
		lockOnEnabled = false
		releaseLock()
	else
		lockOnEnabled = true
		lockOnNearest()
	end

end

lockOnToggleBtn.MouseButton1Click:Connect(toggleLockOnSystem)

lockOnClose.MouseButton1Click:Connect(function()
	lockOnGUI.Visible = false

end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if not lockOnEnabled then return end
	if input.KeyCode == Enum.KeyCode.Q then
		if isLocked then
			releaseLock()
		else
			lockOnNearest()
		end
	elseif input.KeyCode == Enum.KeyCode.E then
		if isLocked then
			cycleTarget()
		end
	end

end)

localPlayer.CharacterAdded:Connect(function()
	releaseLock()

end)

vlexWare.AncestryChanged:Connect(function()
	if not vlexWare:IsDescendantOf(game) then
		stopESP()
	end

end)
