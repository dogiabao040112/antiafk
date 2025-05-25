local GUI = Instance.new("ScreenGui")
GUI.Name = "Anti-Afk GUI"
GUI.Enabled = true
GUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Active = true
Frame.Visible = true
Frame.BackgroundTransparency = 1
Frame.Name = "Holder"
Frame.Parent = GUI

local TextButton = Instance.new("TextButton")
TextButton.Active = true
TextButton.Visible = true
TextButton.BorderSizePixel = 0
TextButton.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
TextButton.Position = UDim2.new(0.643, 364,0.489, 229)
TextButton.Size = UDim2.new(0, 250,0, 63)
TextButton.Font = Enum.Font.ArialBold
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextWrapped = true
TextButton.TextSize = 15
TextButton.Text = "Anti-Afk: Script Inactive"
TextButton.Name = "Anti-Afk"
TextButton.Parent = Frame

local creditBox = Instance.new("TextLabel")
creditBox.Active = true
creditBox.Visible = true
creditBox.BorderSizePixel = 0
creditBox.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
creditBox.Size = UDim2.new(0, 138,0, 24)
creditBox.Text = "Made by DesiredOpal"
creditBox.TextColor3 = Color3.new(0.333333, 0.666667, 1)
creditBox.Font = Enum.Font.ArialBold
creditBox.TextWrapped = true
creditBox.TextScaled = true
creditBox.Position = UDim2.new(0, 57,0, 50)
creditBox.Parent = TextButton

local Debounce = false

TextButton.MouseButton1Click:Connect(function()
 if Debounce then return end
 Debounce = true
 local VirtualUser = game:GetService("VirtualUser")
 
 game:GetService("Players").LocalPlayer.Idled:Connect(function()
  VirtualUser:Button2Down(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
  wait(0.4)
  VirtualUser:Button2Up(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
  VirtualUser:CaptureController()VirtualUser:ClickButton2(Vector2.new())
 end)

 game.StarterGui:SetCore("SendNotification", {
  Title = "Anti-AFK Active",
  Text = "Anti-AFK is now actived. You wont be kicked for going idle.",
  Duration = 15,
  Button1 = "Close",
 })
 game.StarterGui:SetCore("SendNotification", {
  Title = "Made by mcbroamszc",
  Text = "You can now AFK for as long as you want.",
  Duration = 5,
  Button1 = "",
 })
 
 TextButton.Text = "Anti-AFK Active: Script Started"
 print("Credits to DesiredOpal for making the Anti-AFK script")
 wait(5)
 Debounce = false
end)

local UIS = game:GetService("UserInputService")
local frame = TextButton
local dragToggle = nil
local dragSpeed = .10
local dragStart = nil
local startPos = nil

local function updateInput(input)
 local delta = input.Position - dragStart
 local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
 game:GetService("TweenService"):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
 if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
  dragToggle = true
  dragStart = input.Position
  startPos = frame.Position
  input.Changed:Connect(function()
   if input.UserInputState == Enum.UserInputState.End then
    dragToggle = false
   end
  end)
 end
end)

UIS.InputChanged:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
  if dragToggle then
   updateInput(input)
  end
 end
end)
