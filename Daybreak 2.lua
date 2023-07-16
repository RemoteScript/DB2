local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RemoteScript/Library/main/Library.lua"))()

local Window = Library:AddWindow("Daybreak", {
		main_color = Color3.fromRGB(41, 74, 122),
		min_size = Vector2.new(230, 190),
		can_resize = false,
	})
	
local MainPage = Window:AddTab("Main")

MainPage:AddSwitch("Auto Skill Checks", function(Skill)
   Skills = Skill
    while Skills do wait()
    pcall(function()
    --Auto Perfect Skill Check
local VirtualInputManager = game:GetService('VirtualInputManager')
if game.Players.LocalPlayer.PlayerGui.HUD:FindFirstChild("Skillcheck").Visible == true and game.Players.LocalPlayer.PlayerGui.HUD:FindFirstChild("Skillcheck").Inner.Indicator.AbsolutePosition.Magnitude > game.Players.LocalPlayer.PlayerGui.HUD:FindFirstChild("Skillcheck").Inner.Safe.AbsolutePosition.Magnitude then
    VirtualInputManager:SendKeyEvent(true, "Space", false, game)
    VirtualInputManager:SendKeyEvent(false, "Space", false, game)
end
end)
    end
    end)
    
    MainPage:AddSwitch("ESP Generators", function(Gen)
   Gens = Gen
    while Gens do wait()
    pcall(function()
    for i, v in pairs(game.Workspace["Map_Holder"]["Game_Map"].Gens:GetChildren()) do
if v:FindFirstChild("GenAura") then
if v:FindFirstChild("GenAura").Enabled == false then
v:FindFirstChild("GenAura").Enabled = true
end
end
end
end)
end
end)
--[[
MainPage:AddSwitch("ESP Mist Hatch", function(Hatch)
   Hatchs = Hatch
    while Hatchs do wait()
    pcall(function()
    for i, v in pairs(game:GetService("Workspace").Map_Holder.Game_Map.Escapes:GetChildren()) do
    if v.Transparency == 0 and not v:FindFirstChild("BoxHandleAdornment") then
        local ESP = Instance.new("BoxHandleAdornment")--imposter esp
                    ESP.Parent = v
                    ESP.Adornee = v
                    ESP.AlwaysOnTop = true
                    ESP.Transparency = 0
                    ESP.ZIndex = 0
                    ESP.Size = v.size
                    ESP.Color3 = Color3.fromRGB(35, 71, 139)
    end
    end
end)
end
end)
--]]

    MainPage:AddSwitch("ESP Plrs & Killer", function(See)
   SeeYou = See
    while SeeYou do wait(3)
    pcall(function()
    --Killer ESP
    for i,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("Weapon") then
        for i, v in pairs(v.Character:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                if v:FindFirstChild("BoxHandleAdornment") then
                    --Do Nothing
                    else
                    local ESP = Instance.new("BoxHandleAdornment")--imposter esp
                    ESP.Parent = v
                    ESP.Adornee = v
                    ESP.AlwaysOnTop = true
                    ESP.Transparency = .7
                    ESP.ZIndex = 0
                    ESP.Size = v.size
                    ESP.Color3 = Color3.fromRGB(255, 0, 4)
                end
            end
    end
    v.Character.HumanoidRootPart:FindFirstChild("BoxHandleAdornment"):Destroy()
    end
    end

    --Survivor ESP
    for i,v in pairs(game.Players:GetPlayers()) do
if v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("Weapon") == nil and v.Character:FindFirstChild("survivorState") then
        for i, v in pairs(v.Character:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                if v:FindFirstChild("BoxHandleAdornment") then
                    --Nothing
                    else
                    local ESP = Instance.new("BoxHandleAdornment")--imposter esp
                    ESP.Parent = v
                    ESP.Adornee = v
                    ESP.AlwaysOnTop = true
                    ESP.Transparency = .7
                    ESP.ZIndex = 0
                    ESP.Size = v.size
                    ESP.Color3 = Color3.fromRGB(161, 196, 140)
                end
            end
    end
    v.Character.HumanoidRootPart:FindFirstChild("BoxHandleAdornment"):Destroy()
    end
    end
    end)
    end
    end)

local CreditsPage = Window:AddTab("CREDITS")

CreditsPage:AddLabel("UI Library Creator: 0xSingularity")
CreditsPage:AddLabel("Script Creators Discord: .terebi")

MainPage:Show()

MainPage:AddSwitch("Survivor Speed (LEGIT)", function(Boost)
   Boosting = Boost
    while Boosting do wait()
    pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("myCharString").Crystal and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed > 18 and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 21 then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22.25
end
end)
end
end)

MainPage:AddSwitch("Killer Speed (LEGIT)", function(Boost2)
   Boosting2 = Boost2
    while Boosting2 do wait()
    pcall(function()
if game.Players.LocalPlayer.Character:FindFirstChild("Weapon") and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed > 18 and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 21 then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
end
end)
end
end)

MainPage:AddSwitch("Daytime & No Fog", function(Light)
   Lighting = Light
    while Lighting do wait()
    pcall(function()
if game.Lighting.Atmosphere.Density ~= 0 then
game.Lighting.Atmosphere.Density = 0
end
if game.Lighting.Atmosphere.Glare ~= 0 then
game.Lighting.Atmosphere.Glare = 0
end
if game.Lighting.Atmosphere.Haze ~= 0 then
game.Lighting.Atmosphere.Haze = 0
end
if game.Lighting.Bloom.Enabled == true then
game.Lighting.Bloom.Enabled = false
end
if game.Lighting.GameDOF.Enabled == true then
game.Lighting.GameDOF.Enabled = false
end
if game.Lighting.ClockTime ~= 12 then
game.Lighting.TimeOfDay = "12:00:00:"
end
end)
end
end)

local BlockedRemotes = {
    "ReportGoogleAnalyticsEvent",
}

local Events = {
    Fire = true, 
    Invoke = true, 
    FireServer = true, 
    InvokeServer = true,
}

local gameMeta = getrawmetatable(game)
local psuedoEnv = {
    ["__index"] = gameMeta.__index,
    ["__namecall"] = gameMeta.__namecall;
}
setreadonly(gameMeta, false)
gameMeta.__index, gameMeta.__namecall = newcclosure(function(self, index, ...)
    if Events[index] then
        for i,v in pairs(BlockedRemotes) do
            if v == self.Name and not checkcaller() then return nil end
        end
    end
    return psuedoEnv.__index(self, index, ...)
end)
setreadonly(gameMeta, true)