firesignal(game:GetService("ReplicatedStorage").EntityInfo.Caption.OnClientEvent, 'YOU get tacos by coolchipsa',true,3)
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

  Achievements.Get({
        Title = "i love tacos",
        Desc = "tacosssssss!",
        Reason = "get tacos",
        Image = "rbxassetid://13614252381",
    })
local Players = game:GetService("Players")
local Equipped = false
local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/MateiDaBest/Utilities/main/Doors/Custom%20Shop%20Items/Main.lua"))()
local Whopper = game:GetObjects("rbxassetid://13614252050")[1]
local Equip = "rbxassetid://142376088"
local Eat = "rbxassetid://142376088"
local Sound = Instance.new("Sound") 
local Sound2 = Instance.new("Sound")

Sound.SoundId = LoadCustomAsset(Equip)
Sound.Volume = 2.5
Sound.Parent = workspace

Sound2.SoundId = LoadCustomAsset(Eat)
Sound2.Volume = 2.5
Sound2.Parent = workspace

CustomShop.CreateItem({
	Title = "Tacos",
	Desc = "Tacos",
	Image = "rbxassetid://13614252381",
	Price = 100,
	Stack = 1,
})

Whopper.Parent = game.Players.LocalPlayer.Backpack

local function setupHands(tool)
	tool.Equipped:Connect(function()
		Equipped = true
		Char:SetAttribute("Hiding", true)
		for _, v in next, Hum:GetPlayingAnimationTracks() do
			v:Stop()
		end

		Sound:Play()

		RightArm.Name = "R_Arm"
		LeftArm.Name = "L_Arm"

		RightArm.RightShoulder.C1 = RightC1
			* CFrame.Angles(math.rad(-90), math.rad(-10), 0)
		LeftArm.LeftShoulder.C1 = LeftC1
			* CFrame.new(-0.2, -0.1, -0.5)
			* CFrame.Angles(math.rad(-100), math.rad(30), math.rad(0))
	end)

	tool.Unequipped:Connect(function()
		Equipped = false
		Char:SetAttribute("Hiding", nil)
		RightArm.Name = "RightUpperArm"
		LeftArm.Name = "LeftUpperArm"

		tool.GripPos = Vector3.new(0.5, -0.2, 0.3)

		Sound:Stop()
		Sound2:Stop()

		RightArm.RightShoulder.C1 = RightC1
		LeftArm.LeftShoulder.C1 = LeftC1
	end)

	tool.Activated:Connect(function()
		Sound2:Play()		task.wait(2)
		tool.GripPos = Vector3.new(0.5, -0.2, 0.3)
	end)
end

setupHands(Whopper)
