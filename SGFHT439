if not LPH_OBFUSCATED then 
    LPH_JIT = function(f) return f end
    LPH_NO_VIRTUALIZE = function(f) return f end
end

getgenv().ScriptSettings = [[
    {"AutoDigsite":false,"ClaimRankReward":true,"TapPerTime":6,"AutoRank":true,"MerchantTF":{"RegularMerchant":false,"GardenMerchant":false,"AdvancedMerchant":false},"AutoClaimFreeReward":true,"TNTRebirth":true,"TapTime":2,"AutoFruit":true,"AutoBuyUpdrage":true,"GocFarmDig":1,"FarmingMode":"All","AutoClaimMail":true,"AutoPotion":true,"IgnoreUpgrade":{"Magnet":true,"Drops":true,"LessGold":true,"Pet Speed":true,"Pet Damage":false,"LessRainbow":true,"Luck":true,"Walkspeed":true,"Coins":false,"Diamonds":true,"Tap Damage":false},"DigsiteHopp":false,"SpawnObby":false,"DigsiteZone":"Advanced Digsite","CauCa":false,"AutoMerchant":false,"Atlantis":false,"TungOTheoAcc":false,"Khongbietdaumahuhu":false,"SelectBest":true,"FarmCoin":true,"HiddenPresent":true,"OpenGiftBag":true,"AutoBuyPetSlot":true,"MaxMap":79,"AutoTap":true,"Minefield":false,"DigsiteLevel":3,"AutoRebirth":true,"AutoOpenMap":true,"RebirthTime":2}
]]

repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer
local plr = game.Players.LocalPlayer
repeat wait() until plr.Character
repeat wait() until plr.Character:FindFirstChild("HumanoidRootPart")
repeat wait() until plr.Character:FindFirstChild("Humanoid")
repeat wait() until workspace:FindFirstChild("__THINGS")

pcall(function() 
    local Lighting = game.Lighting
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.ShadowSoftness = 0
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    sethiddenproperty(Lighting, "Technology", 2)
    settings().Rendering.QualityLevel = 1
    settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
    for k,v in game:GetService("MaterialService"):GetChildren() do v:Destroy() end
    game:GetService("MaterialService").Use2022Materials = false
end)

local StopFarm = {"FarmCoin","CauCa","Digsite","AutoRank","Merchant","ClaimStuff","MiniGame"}

local StopFarmVK = {}
for k,v in StopFarm do 
    StopFarmVK[v] = k
end
local StopFarmList = {}
for k,vk in StopFarmVK do 
    StopFarmList[k] = false
end
function CheckFarm(name) 
    local index = StopFarmVK[name]
    if index then 
        for i=index+1,#StopFarm do 
            if StopFarmList[StopFarm[i]] then 
                return false
            end
        end
        return true
    end
    return false
end


-- function CreatePrioritzeFunctionWrapper(Name,func) 

--     return function() func() end
-- end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiet1308/CTE-PUBLIC/main/UILIB.lua"))()
local Settings = {}

local plr = game.Players.LocalPlayer
local SaveFileName = getgenv().SaveFileName or plr.Name.."_PET99.json"

function SaveSettings()
    local HttpService = game:GetService("HttpService")
    if not isfolder("CTE HUB") then
        makefolder("CTE HUB")
    end
    writefile("CTE HUB/" .. SaveFileName, HttpService:JSONEncode(Settings))
end

function ReadSetting(Settings) 
    if Settings then 
        local HttpService = game:GetService("HttpService")
        return HttpService:JSONDecode(Settings)
    else
        local s,e = pcall(function() 
            local HttpService = game:GetService("HttpService")
            if not isfolder("CTE HUB") then
                makefolder("CTE HUB")
            end
            return HttpService:JSONDecode(readfile("CTE HUB/" .. SaveFileName))
        end)
        if s then return e 
        else
            SaveSettings()
            return ReadSetting()
        end
    end
end
Settings = ReadSetting(getgenv().ScriptSettings)


local StoppedTp = false
getgenv().CauCa = true

if not getgenv().Tasks then 
    getgenv().Tasks = {}
    Tasks.__index = Tasks
    
    function Tasks.new(name,func,Settings)
        if not Settings then Settings = {} else print(name)  end
        local obj = {
            Name = name,
            Function = func,
            Settings = Settings or {}
        }
        setmetatable(obj, Tasks)
        return obj
    end
    
    function Tasks:Stop() 
        if not self:IsRunning() then return end
        if self.Thread then 
            task.cancel(self.Thread)
        end
        if self.ForceStoped then 
            task.spawn(self.ForceStoped)
        end
    end
    function Tasks:Start() 
        if self:IsRunning() then return end
        -- if self.Settings and self.Settings.AntiBug then
        --     self.Thread = task.spawn(function() 
        --         xpcall(self.Function,function(e)
        --             print(e) 
        --             self:Stop()
        --             self:Start()
        --         end)
        --     end)
        -- else
        --     self.Thread = task.spawn(self.Function)
        -- end

        self.Thread = task.spawn(self.Function)
        return self
    end
    
    function Tasks:IsRunning() 
        if not self.Thread then return false end
        return coroutine.status(self.Thread) ~= "dead"
    end
end

if not getgenv().ListTask then 
    getgenv().ListTask = {}
end

local TaskHandler = {}

function TaskHandler:AddTask(Name, func,Settings)
    ListTask[Name] = Tasks.new(name,func,Settings)
    return ListTask[Name]
end

function TaskHandler:StopTask(Name)
    if not ListTask[Name] then return end
    ListTask[Name]:Stop()
end

function TaskHandler:CancelAll()
    for k, v in pairs(ListTask) do
        v:Stop()
    end
end
TaskHandler:CancelAll()

table.clear(getgenv().ListTask)
getgenv().ListTask = {}

local ScriptRunning = true
TaskHandler:AddTask("AutoSave",function() 
    while wait(2) do 
        if not getgenv().ScriptSettings then 
            SaveSettings()
        end
    end
end):Start().ForceStoped = function() 
    ScriptRunning = false
end


local plr = game.Players.LocalPlayer



function Tap() 
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
    --game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
end 

-- for i = 1,150 do 
--     task.spawn(Tap)
-- end

local RandomX = math.random(-20,20)
local RandomY = math.random(-20,20)

function ThaCan(pos) 
    if not pos then 
        pos = Vector3.new(tonumber(tostring(1448 + RandomX).."."..plr.UserId), 61.625038146972656, tonumber(tostring(-4409 + RandomY).."."..plr.UserId))
    end
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Click"):FireServer(Ray.new(Vector3.new(1378.8731689453125, 75.38618469238281, -4397.716796875), Vector3.new(0.8105669021606445, -0.5571429133415222, -0.18048004806041718)))
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing","RequestReel")
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing","RequestCast",pos)
end
ThaCan()
function IsFishingGuiEnabled() 
    local s,e = pcall(function() 
        return game:GetService("Players").LocalPlayer.PlayerGui._INSTANCES.FishingGame
    end)
    if not s then return false end
    
    return e.Enabled
end

function IsPlayerFishing() 
    local s,e = pcall(function() 
        if plr.Character.Model.Rod:FindFirstChild("FishingLine") then 
            return plr.Character.Model.Rod:FindFirstChild("FishingLine")
        end
        return false
    end)
    if not s then return false end
    return e
end
getgenv().Time = 1.1
function CheckThaCan() 
    local Line = IsPlayerFishing()
    if not Line:FindFirstChild("Value") then 
        Instance.new("NumberValue",Line).Value = tick()
    else
        if Line then 
            for k,v in game.ReplicatedStorage.__DIRECTORY.FishingRods:GetChildren() do 
                if v:FindFirstChild("Model") and v:IsA("ModuleScript") and v.Model:FindFirstChild("Rod") then 
                    if Line.Parent.MeshId == v.Model.Rod.MeshId then
                        if tick() - Line.Value.Value > require(v).MinFishingTime * getgenv().Time then 
                            return true
                        else
                            return false
                        end
                        break
                    end
                end
            end
        end
    end
    
end


local plr = game.Players.LocalPlayer
function GetPlayerRobber() 
    local s,e = pcall(function() 
        for k,v in workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedFishing.Bobbers:GetChildren() do 
            if v:FindFirstChild("Bobber") then 
                -- if (#v.Bobber:GetJoints() >= 1 and v.Bobber:GetJoints()[1]:IsDescendantOf(plr.Character)) or (v.Bobber.Position - Pos).magnitude < 10 then 
                --     return v.Bobber
                -- end
                local Number = tonumber("1448."..plr.UserId)
                

                if math.abs(v.Bobber.Position.X - tonumber(tostring(1448 + RandomX).."."..plr.UserId)) < 0.001 or  math.abs(v.Bobber.Position.z - tonumber(tostring(-4409 + RandomY).."."..plr.UserId)) < 0.001 then 
                    return v.Bobber
                end
            end
        end
    end)
    if not s then return false end
    return e
end
function GetNearestTeleport() 
    local s,e = pcall(function() 
        local NearestTeleport
        for k,v in workspace.__THINGS.Instances:GetChildren() do 
            if v:FindFirstChild("Teleports") then 
                if v.Teleports:FindFirstChild("Leave") then 
                    if not NearestTeleport then 
                        NearestTeleport = v
                    end
                    if plr:DistanceFromCharacter(v.Teleports.Leave.Position) < plr:DistanceFromCharacter(NearestTeleport.Teleports.Leave.Position) then 
                        NearestTeleport = v
                    end
                end
            end
        end
        return NearestTeleport
    end)

    if not s then return nil end
    return e
end

function IsPlayerInMapCauCa() 
    if game.Workspace:FindFirstChild("Map") then return false end
    
    local s,e = pcall(function() 
        if workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("AdvancedFishing") then 
            if plr:DistanceFromCharacter(Vector3.new(1381.8416748046875, 64.95339965820312, -4451.9794921875)) < 500 then 
                return true
            end
        end
    end)

    if not s then return false end
    return e
end
function Noclip()
    for i, v in ipairs(plr.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
        end
    end
end
game:GetService("RunService").Stepped:Connect(function()
    if getgenv().noclip then
        if plr.Character ~= nil then
            Noclip()
        end
    end
end)
TaskHandler:AddTask("Noclip",function() 
    while wait() do
        pcall(function()
            if getgenv().noclip then 
                if not plr.Character.HumanoidRootPart:FindFirstChild("Noclip") then 
                    local BV = Instance.new('BodyVelocity')
                    BV.Parent = plr.Character.HumanoidRootPart
                    BV.Velocity = Vector3.new(0, 0, 0)
                    BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    BV.Name = "Noclip"
                end
                if not plr.Character.HumanoidRootPart:FindFirstChild("Noclip1") then 
                    local BG = Instance.new('BodyGyro')
                    BG.P = 9e4
                    BG.Parent = plr.Character.HumanoidRootPart
                    BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                    BG.Name = "Noclip1"
                end
                --plr.Character.HumanoidRootPart.Noclip1.CFrame = workspace.CurrentCamera.CoordinateFrame
                plr.Character.Humanoid.PlatformStand = true

            else
                if plr.Character.HumanoidRootPart:FindFirstChild("Noclip") then 
                    plr.Character.HumanoidRootPart:FindFirstChild("Noclip"):Destroy()
                end
                plr.Character.Humanoid.PlatformStand = false
                if plr.Character.HumanoidRootPart:FindFirstChild("Noclip1") then 
                    plr.Character.HumanoidRootPart:FindFirstChild("Noclip1"):Destroy()
                end
            end
            -- if noclip and not plr.Character.HumanoidRootPart:FindFirstChild("Noclip") then
            --     -- local BV = Instance.new("BodyVelocity", plr.Character.HumanoidRootPart)
            --     -- BV.Name = "coems"
            --     -- BV.Velocity = Vector3.new(0, 0, 0)
            --     -- BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)


            --     --local BG = Instance.new('BodyGyro')
                

            -- elseif not noclip then 
            --     if plr.Character.HumanoidRootPart:FindFirstChild("Noclip") then 
            --         plr.Character.HumanoidRootPart:FindFirstChild("Noclip"):Destroy()
            --     end
            -- end
        end)
    end
end):Start()

-- local s,e = pcall(function() 
--     print(game:GetService("RunService"):GetAllBoundInfo())
--     for k,v in game:GetService("RunService"):GetAllBoundInfo() do print(k,v) end
    
-- end)
-- print(s,e)
-- if game:GetService("ReplicatedFirst"):FindFirstChild("Blunder") then 
--     game:GetService("ReplicatedFirst"):FindFirstChild("Blunder"):Destroy()
--     print("Xoa r")
-- end

function BoostFps() 
    StopCheckPet = true
    task.spawn(function() 
        pcall(function() 
            if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Parallel Pet Actors") then 
                game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Parallel Pet Actors"):Destroy()
            end
            plr.PlayerScripts.Scripts:Destroy()
            -- plr.PlayerScripts.Scripts.Game["Breakable VFX (Enchants, etc.)"]:Destroy()
            game.Workspace.Map:Destroy()
            for k,v in game.Workspace:GetChildren() do 
                if v.Name ~= plr.Name then 
                    pcall(function() 
                        v:Destroy()
                    end)
                end
            end
            for k,v in plr.PlayerGui:GetChildren() do v:Destroy() end
        end)
        -- if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Scripts") then 
        --     for k,v in game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Scripts"):GetChildren() do 
        --         if v.Name ~= "Core" then
        --             if v.Name == "Game" then 
        --                 for k,v in v:GetChildren() do 
        --                     if v.Name ~= "Orbs Frontend" and v.Name ~= "Lootbags Frontend" then 
        --                         v:Destroy()
        --                     end
        --                 end
        --             else
        --                 v:Destroy()
        --             end
        --         end
                
        --     end
        --     --game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Scripts"):Destroy()
        -- end
        --game.ReplicatedStorage.Library:Destroy()
        -- for k,v in game:GetService("Players").LocalPlayer.PlayerScripts.Scripts:GetChildren() do 
        --     if v.Name ~= "Game" then 
        --         v:Destroy()
        --     end
        -- end
        -- for k,v in game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game:GetChildren() do 
        --     if not table.find({
        --         "Giftbags Frontend",
        --          "Lootbags Frontend",
        --         "Orbs Frontend",
        --      },v.Name) then 
        --         v:Destroy()
        --     end
        -- end
        -- for k,v in game.Workspace:GetChildren() do 
        --     if v.Name ~= plr.Name and v.Name ~= "__DEBRIS" and v.Name ~= "__THINGS" then 
        --         pcall(function() 
        --             v:Destroy()
        --         end)
        --     end
        -- end
        -- for k,v in game.Workspace["__DEBRIS"]:GetChildren() do 
        --     v:Destroy()
        -- end
        
        -- for k,v in game.Workspace["__DEBRIS"]:GetChildren() do 
        --     if v.Name ~= "Pets" and v.Name ~="Orbs" and v.Name ~="Lootbags" then 
        --         v:Destroy()
        --     end
        -- end

        
        -- pcall(function() 
        --     game.Players.LocalPlayer.PlayerScripts.Scripts.Game.Breakables["Breakables Frontend"]:Destroy()
        --     game.Workspace["__THINGS"].Breakables:Destroy()
        -- end)


        

        

        
    end)
end
function ListToOb(tabl, tf)
    local out = {}
    for k, v in pairs(tabl) do
        if tf then
            out[v] = true
        else
            out[v] = false
        end
    end
    return out
end

TaskHandler:AddTask("CollectOrb",function() 
    
end):Start()
function SetupTF(TF,Name) 
    local ListTF = ListToOb(TF)
    
    if not Settings[Name] then Settings[Name] = ListTF else  for k,v in pairs(Settings[Name]) do 
        ListTF[k]=v
    end Settings[Name] = ListTF end
    return ListTF
end

local Client = require(game.ReplicatedStorage.Library.Client)
local plr = game.Players.LocalPlayer
local SaveModule = require(game.ReplicatedStorage.Library.Client.Save)
local PlayerData = SaveModule:GetSaves()[plr]
function GetTableQuest() 
    -- for k,v in getgc() do 
    --     if type(v) == "function" then 
    --         if tostring(getfenv(v).script) == "Ranks" then 
    --             if #debug.getconstants(v) > 50 and #debug.getconstants(v) < 100 then 
    --                 for k,v in debug.getupvalues(v) do 
    --                     if type(v) == "table" then 
    --                         for k,v2 in v do 
    --                             if type(v2) == "table" and pcall(function() return v2.UID end) and v2.UID then
    --                                 getgenv().QuestTable = v
    --                                 break
    --                             end
    --                         end
    --                     end
    --                 end
    --                 break
    --             end
    --         end
    --     end
    --     if getgenv().QuestTable then break end
    -- end
    -- return getgenv().QuestTable
    return PlayerData.Goals
end
function GetGoalsTable() 
    local tvk = require(game:GetService("ReplicatedStorage").Library.Client.RankCmds)
    local Goals = getupvalues(tvk.MakeTitle)[2].Goals
    local ReturnedGoalTable = {}
    for k,v in Goals do 
        ReturnedGoalTable[v] = k
    end
    return Goals,ReturnedGoalTable
end
local huhu = require(game:GetService("ReplicatedStorage").Library.Client.RankCmds)
local QuestsList = require(game.ReplicatedStorage.__DIRECTORY.Ranks["1 | Noob"]) 
local GoalsTable,Returned = GetGoalsTable()
for k,v in QuestsList.Goals do
    warn(Returned[v.Type],huhu.MakeTitle(v))
    for k,v in v do print(k,v) end
end
--for k,v in GetGoalsTable() do print(k,v) end
function GetTablePlayerPet() 
    for k,v in getgc() do 
        if type(v) == "function" then 
            if tostring(getfenv(v).script) == "PlayerPet" then
                if debug.getinfo(v).name == "Get" then 
                    return getupvalue(v,1)
                end
                
            end
        end
    end
end
function InstantTpPet() 
    local List = {}
    for k,v in GetTablePlayerPet() do 
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_Unfavorite"):FireServer(k)
        List[k] = {
            ["targetValue"] = "3177473860",
            ["targetType"] = "Player"
        }
    end
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_ToggleFavoriteMode"):FireServer()

    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_SetTargetBulk"):FireServer(List)
end

function GetTablePlayerPet() 
    for k,v in getgc() do 
        if type(v) == "function" then 
            if tostring(getfenv(v).script) == "PlayerPet" then
                if debug.getinfo(v).name == "Get" then 
                    return getupvalue(v,1)
                end
            end
        end
    end
end
local old = require(game.ReplicatedStorage.Library.Client.PlayerPet).CalculateSpeedMultiplier
require(game.ReplicatedStorage.Library.Client.PlayerPet).CalculateSpeedMultiplier = function(...) 
    if ScriptRunning then 
        return math.huge
    end
    return old(...)
end
local old = require(game.ReplicatedStorage.Library.Client.UpgradeCmds).GetPower
require(game.ReplicatedStorage.Library.Client.UpgradeCmds).GetPower = function(...)
    local a = ... 
    if a == "Magnet" and ScriptRunning then 
        return 1000
    end
    return old(...)
end
local PlayerPetIndex = {}
local PlayerPet
local StopCheckPet = false
function SetupPet() 
    PlayerPet = GetTablePlayerPet()
    spawn(function() 
        while true and not StopCheckPet do 
            PlayerPetIndex = {}
            for k,v in PlayerPet do 
                table.insert(PlayerPetIndex,k)
            end
            wait(5)
        end
    end)
end



local ListFeature = {}

local StateTable = {}

function SetFeatureState(Name,State,Check) 
    local Task = ListTask[Name]
    if Task then
        if Check then 
            if Check == "Settings" then 
                Settings[Name] = State
            end
            if not StateTable[Name] then 
                StateTable[Name] = {}
            end
            if State then
                local AnyStateEnabled 
                for k,v in StateTable[Name] do 
                    if v == true then 
                        AnyStateEnabled = true
                        break;
                    end
                end
                StateTable[Name][Check] = State
                if AnyStateEnabled or not Task:IsRunning() then 
                    Task:Start()
                end
            else
                StateTable[Name][Check] = State
                local AnyStateEnabled 
                for k,v in StateTable[Name] do 
                    if v == true then 
                        AnyStateEnabled = true
                        break;
                    end
                end
                if not AnyStateEnabled then 
                    Task:Stop()
                end
            end
        else
            Settings[Name] = State
            if State then 
                if not Task:IsRunning() then 
                    Task:Start()
                end
            else
                Task:Stop()
            end
        end
    end
end
function SetFeatureFunction(Name,func,Setting) 
    local Default = Settings[Name]
    local Task = TaskHandler:AddTask(Name,function() func(StateTable[Name]) end,Setting)
    ListFeature[Name] = Task
    if Default then 
        Settings[Name] = Default
        Task:Start()
    end
    return Task
end

function TP(pos) 
    pcall(function() 
        if not game.Workspace:FindFirstChild("Map") then 
            local NearestTeleport = GetNearestTeleport()
            if NearestTeleport then 
                if plr:DistanceFromCharacter(NearestTeleport.Teleports.Leave.Position) < 1000 then 
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(NearestTeleport.Teleports.Leave.Position)
                    wait(3)
                end
            end
        end
        plr.Character.HumanoidRootPart.CFrame = pos
    end)
end

function TPNormal(pos) 
    pcall(function() 
        plr.Character.HumanoidRootPart.CFrame = pos
    end)
end
local LastCau = tick()
SetFeatureFunction("CauCa",function() 

    getgenv().CauCaConnections = plr.Character.Humanoid.AnimationPlayed:Connect(function(v)  
        if string.match(tostring(v.Animation.AnimationId),"15281472002") then 
            ThaCan()
            LastCau = tick()
            LastThaCanInLoop = tick()
        end
    end)
    

    local LastThaCanInLoop = 0
    while wait() do
        if CheckFarm("CauCa") then
            StopFarmList["CauCa"] = true
            if not IsPlayerInMapCauCa() or tick() - LastCau > 60 then 
                if not game.Workspace:FindFirstChild("Map") and tick() - LastCau > 60 then 
                    LastCau = tick()
                    LastThaCanInLoop = 0
                    local NearestTeleport = GetNearestTeleport()
                    if NearestTeleport then 
                        if plr:DistanceFromCharacter(NearestTeleport.Teleports.Leave.Position) < 1000 then 
                            TPNormal(CFrame.new(NearestTeleport.Teleports.Leave.Position))
                            wait(5)
                        end
                    end
                else
                    if workspace.__THINGS.Instances:FindFirstChild("AdvancedFishing") then 
                        if workspace.__THINGS.Instances.AdvancedFishing:FindFirstChild("Teleports") and workspace.__THINGS.Instances.AdvancedFishing.Teleports:FindFirstChild("Enter") then 
                            LastCau = tick()
                            LastThaCanInLoop = 0
                            TPNormal(CFrame.new(workspace.__THINGS.Instances.AdvancedFishing.Teleports.Enter.Position))
                            wait(5)
                        end
                    end
                end
            else
                TPNormal(CFrame.new(1452.3446044921875, 70.48225402832031, -4431.96142578125))
                if IsFishingGuiEnabled() then 
                    for i = 1,5 do 
                        task.spawn(Tap)
                    end
                else
                    if tick() - LastCau > 30 then 
                        ThaCan()
                    end
                    if not IsPlayerFishing() and tick() - LastThaCanInLoop > 60 then 
                        ThaCan()
                        LastCau = tick()
                        pcall(function() 
                            plr.Character.Model.Rod:WaitForChild("FishingLine",2)
                        end)
                        getgenv().Start = tick()
                        LastThaCanInLoop = tick()
                    else
                        local Robber = GetPlayerRobber()
                        if Robber then
                            if Robber:FindFirstChild("ReadyToCheck") then
                                if math.abs((Robber.CFrame.Y - math.floor(Robber.CFrame.Y)) - 0.625) > 0.1 then 
                                    ThaCan()
                                    for i = 1,5 do 
                                        task.spawn(Tap)
                                    end
                                    local StartDelay = tick()
                                    repeat wait() until IsFishingGuiEnabled() or tick() - StartDelay > 1
                                end
                            else
                                if math.abs((Robber.CFrame.Y - math.floor(Robber.CFrame.Y)) - 0.625) < 0.03 then 
                                    Instance.new("BoolValue",Robber).Name = "ReadyToCheck"
                                end
                            end
                        else
                            pcall(function() 
                                if not plr.Character.Model.Rod.FishingLine:FindFirstChild("Value") then 
                                    Instance.new("NumberValue",plr.Character.Model.Rod.FishingLine).Value = tick()
                                end
                                if tick() - plr.Character.Model.Rod.FishingLine.Value.Value > 4 then 
                                    ThaCan()
                                    local StartDelay = tick()
                                    for i = 1,5 do 
                                        task.spawn(Tap)
                                    end
                                    repeat wait() until IsFishingGuiEnabled() or tick() - StartDelay > 1
                                end
                            end)
                        end
                        -- if not plr.Character.Model.Rod:FindFirstChild("Sound") then 
                        --     ThaCan()
                        --     wait(1)
                        -- end
                        -- if CheckThaCan() then 
                        --     ThaCan()
                        --     wait(1)
                        -- end
                    end
                end
            end
        end
    end
end,{
    AntiBug = true
}).ForceStoped = function()
    StopFarmList["CauCa"] = false

    if getgenv().CauCaConnections then 
        getgenv().CauCaConnections:Disconnect()
        getgenv().CauCaConnections = nil
    end
end
-- -- Script generated by SimpleSpy - credits to exx#9394

--game:GetService("ReplicatedStorage").Network.TNT_Crate_Consume:InvokeServer()

-- for k,v in PlayerData.Goals do print(k,v) end
--local RedeemedRankRewards = PlayerData.RedeemedRankRewards
--for k,v in PlayerData do print(k,v) end

--for k,v in  SaveModule.GetSaves()[plr] do print(k,v) end
--print(SaveModule:GetSaves()[plr].RedeemedRankRewards)
 --
local StringMapData = [[
    {"42 | Fire and Ice":{"p":"818.2513427734375, 16.237354278564453, 1734.8533935546875"},"81 | Empyrean Dungeon":{"p":"1070,-36,4095"},"9 | Misty Falls":{"p":"376,14,29"},"63 | Frost Mountains":{"p":"1210,14,2689"},"56 | Fairytale Castle":{"p":"258,14,2471"},"13 | Dark Forest":{"p":"533,14,264"},"50 | Fire Dojo":{"p":"1093,14,2119"},"41 | Hot Springs":{"p":"663,14,1708"},"69 | Golden Road":{"p":"733,14,3219"},"28 | Shanty Town":{"p":"667,14,1019"},"87 | Toys and Blocks":{"p":"96,14,4291"},"77 | Haunted Mansion":{"p":"573,14,3740"},"40 | Ski Town":{"p":"663,14,1521"},"79 | Dungeon":{"p":"1070,-36,3764"},"74 | Witch Marsh":{"p":"259,14,3567"},"44 | Obsidian Cave":{"p":"1113,14,1734"},"78 | Dungeon Entrance":{"p":"909,-36,3740"},"64 | Ice Sculptures":{"p":"1210,14,2863"},"10 | Mine":{"p":"216,14,55"},"4 | Green Forest":{"p":"690,14,-204"},"37 | Snow Village":{"p":"1122,14,1470"},"90 | Clouds":{"p":"-64,114,4851"},"67 | Polar Express":{"p":"1050,14,3219"},"59 | Cozy Village":{"p":"576,14,2665"},"62 | Colorful Mountains":{"p":"1052,14,2665"},"1 | Spawn":{"p":"247,14,-205"},"58 | Fairy Castle":{"p":"416,14,2664"},"57 | Royal Kingdom":{"p":"258,14,2640"},"5 | Autumn":{"p":"848,14,-181"},"97 | Heaven Golden Castle":{"p":"-64,114,5962"},"72 | Runic Altar":{"p":"258,14,3245"},"47 | Underworld Bridge":{"p":"1418,14,1929"},"84 | Gummy Forest":{"p":"578,14,4291"},"83 | Cotton Candy Forest":{"p":"738,14,4291"},"46 | Underworld":{"p":"1417,14,1758"},"65 | Snowman Town":{"p":"1210,14,3021"},"43 | Volcano":{"p":"964,14,1734"},"34 | Grand Canyons":{"p":"812,14,1257"},"11 | Crystal Caverns":{"p":"216,14,238"},"70 | No Path Forest":{"p":"574,14,3219"},"12 | Dead Forest":{"p":"375,14,264"},"24 | Palm Beach":{"p":"811,14,785"},"14 | Mushroom Field":{"p":"693,14,265"},"15 | Enchanted Forest":{"p":"851,14,290"},"98 | Colorful Clouds":{"p":"-64,114,6120"},"17 | Jungle":{"p":"695,14,499"},"16 | Crimson Forest":{"p":"851,14,473"},"18 | Jungle Temple":{"p":"535,14,499"},"19 | Oasis":{"p":"373,14,499"},"80 | Treasure Dungeon":{"p":"1070,-36,3937"},"20 | Beach":{"p":"215,14,499"},"75 | Haunted Forest":{"p":"259,14,3731"},"55 | Fairytale Meadows":{"p":"258,14,2312"},"94 | Cloud Palace":{"p":"-64,114,5488"},"52 | Bamboo Forest":{"p":"575,14,2121"},"27 | Pirate Tavern":{"p":"825,14,1019"},"49 | Metal Dojo":{"p":"1259,14,2121"},"32 | Red Desert":{"p":"513,14,1257"},"3 | Castle":{"p":"534,14,-234"},"30 | Fossil Digsite":{"p":"362,14,1043"},"22 | Shipwreck":{"p":"374,-36,785"},"39 | Ice Rink":{"p":"820,14,1494"},"88 | Carnival":{"p":"-64,14,4316"},"23 | Atlantis":{"p":"535,-36,785"},"25 | Tiki":{"p":"971,14,810"},"26 | Pirate Cove":{"p":"971,14,994"},"68 | Firefly Cold Forest":{"p":"891,14,3219"},"29 | Desert Village":{"p":"513,14,1019"},"33 | Wild West":{"p":"663,14,1257"},"60 | Rainbow River":{"p":"735,14,2665"},"38 | Icy Peaks":{"p":"969,14,1494"},"86 | Sweets":{"p":"256,14,4291"},"48 | Underworld Castle":{"p":"1417,14,2095"},"99 | Rainbow Road":{"p":"-64,158,6432"},"36 | Mountains":{"p":"1122,14,1282"},"31 | Desert Pyramids":{"p":"362,14,1232"},"95 | Heaven Gates":{"p":"-64,114,5648"},"85 | Chocolate Waterfall":{"p":"417,14,4291"},"2 | Colorful Forest":{"p":"372,14,-204"},"61 | Colorful Mines":{"p":"893,14,2665"},"93 | Cloud Houses":{"p":"-64,114,5327"},"45 | Lava Forest":{"p":"1262,14,1734"},"35 | Safari":{"p":"965,14,1257"},"91 | Cloud Garden":{"p":"-64,114,5008"},"92 | Cloud Forest":{"p":"-64,114,5166"},"54 | Flower Field":{"p":"258,14,2146"},"66 | Ice Castle":{"p":"1210,14,3194"},"21 | Coral Reef":{"p":"215,-36,759"},"51 | Samurai Village":{"p":"735,14,2121"},"53 | Zen Garden":{"p":"417,14,2121"},"6 | Cherry Blossom":{"p":"848,14,3"},"82 | Mythic Dungeon":{"p":"1070,-36,4268"},"76 | Haunted Graveyard":{"p":"413,14,3740"},"8 | Backyard":{"p":"534,14,22"},"7 | Farm":{"p":"693,14,28"},"73 | Wizard Tower":{"p":"258,14,3412"},"96 | Heaven":{"p":"-64,114,5805"},"71 | Ancient Ruins":{"p":"416,14,3219"},"89 | Theme Park":{"p":"-64,14,4488"}}
]]

local MapPosition = game:GetService("HttpService"):JSONDecode(StringMapData)

local MapData = {}
local MapNames = {}
table.insert(MapNames,"VIP")
MapData["VIP"] = {
    Name = "VIP",
    Parent = "Spawn",
    CFrame = CFrame.new(214.229645, 27.7442703, -587.279358, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    Level = 0
}

local NameToLevel = {["VIP"] = 0}
local LevelToName = {[0] = "VIP"}
local MapToName = {}

local TotalMap = 0
-- local ZonePrices = {}
-- for k,v in game.ReplicatedStorage.__DIRECTORY.Zones:GetChildren() do 
--     for k,v in v:GetChildren() do 
--         local ZoneData = require(v)
--         ZonePrices[ZoneData.ZoneName] = ZoneData.Price
--     end
-- end

for k,v in MapPosition do
    local MapName = tostring(string.gsub(string.match(k, "%D+"), " | ", ""))
    local Level = tonumber(string.match(k, "%d+"))
    if Level and MapName and MapPosition[k] then 
        local cf = Vector3.new(unpack(string.split(MapPosition[k].p, ",")))
        MapData[k] = {
            Name = MapName,
            Level = Level,
            FolderName = k,
            CFrame = CFrame.new(cf) * CFrame.new(0,3,0),
            --TeleportPosition = v.PERSISTENT.Teleport.Position
        }
        NameToLevel[MapName] = Level
        LevelToName[Level] = MapName
        MapToName[MapName] = k
        table.insert(MapNames,k)
        TotalMap = TotalMap + 1
    end
end
table.sort(MapNames,function(a,b) 
    return NameToLevel[MapData[a].Name] < NameToLevel[MapData[b].Name]
end)
--for k,v in NameToLevel do print(k,v) end
function IsMapUnlocked(map) 
    if type(map) == "number" then map = MapToName[LevelToName[map]] end
    return SaveModule.GetSaves()[plr].UnlockedZones[MapData[map].Name]
end
local LastMap
function GetCurrentPlayerMap() 
    if not LastMap then 
        local Highest
        for k,v in SaveModule.GetSaves()[plr].UnlockedZones do 
            if v then 
                local Level = NameToLevel[k]
                if Level then 
                    if not Highest then Highest = Level end
                    if Level > Highest then 
                        Highest = Level
                    end
                end
            end
        end
        if Highest then
            LastMap =  LevelToName[Highest]
        end
        return LastMap
    else
        local LastMapIndex = NameToLevel[LastMap]
        if LastMapIndex then 
            for i = LastMapIndex,100 do 
                if not SaveModule.GetSaves()[plr].UnlockedZones[LevelToName[i]] then
                    LastMap = LevelToName[i-1]
                    break;
                end
            end
        end
        return LastMap
    end
end

function GetNextMap() 
    local CurrentMap = GetCurrentPlayerMap()
    --print(CurrentMap)
    return LevelToName[NameToLevel[CurrentMap] + 1]
end

if not getgenv().Breakables then 
    getgenv().Breakables = {}
    getgenv().BreakableIdList = {}
end


-- for k,v in getgenv().Breakables["VIP"] do
--     game.Workspace.__THINGS.Breakables:FindFirstChild(v):FindFirstChildOfClass("MeshPart").Transparency = 1
-- end

function SetupBreakable() 
    getgenv().BreakableFunction = function(...) 
        local v = ...
        if v.Breakables_Created then 
            for k,v in v.Breakables_Created do 
                for k,v in v do 
                    local ParentUid = v.parentID
                    local BreakabeId = v.id
                    if string.match(BreakabeId,"Diamond") and ParentUid == "Spawn" then ParentUid = "VIP" end
                    if not ParentUid then return end
                    if not Breakables[ParentUid] then 
                        Breakables[ParentUid] = {}
                    end
                    Breakables[ParentUid][v.uid] = v.uid
                    BreakableIdList[v.uid] = ParentUid
                    --print("Added")
                end
            end
        end
        if v.Breakables_Destroyed then 
            for k,v in v.Breakables_Destroyed do 
                local Id = v[2]
                local ParentId = BreakableIdList[Id]
                if ParentId then 
                    Breakables[ParentId][Id] = nil
                    BreakableIdList[Id] = nil
                end
            end
        end
    end
    -- if not getgenv().OnClient then 
    --     game.ReplicatedStorage.Network.Breakables_BulkUpdate.OnClientEvent:Connect(function(...) 
    --         getgenv().BreakableFunction(...)
    --     end)
    --     getgenv().OnClient = true
    -- end
    
    
    function BreakableAdded(Breakable) 
        pcall(function() 
            local ParentUid = Breakable:GetAttribute("ParentID")
            local BreakabeId = Breakable:GetAttribute("BreakableID")
            if string.match(BreakabeId,"Diamond") and ParentUid == "Spawn" then ParentUid = "VIP" end
            if not ParentUid then return end
            if not Breakables[ParentUid] then 
                Breakables[ParentUid] = {}
            end
            Breakables[ParentUid][Breakable.Name] = Breakable.Name
            --BreakableIdList[Breakable.Name] = ParentUid
            --Breakable:Destroy()
        end)
    end
    
    for k,v in workspace.__THINGS.Breakables:GetChildren() do 
        BreakableAdded(v)
    end

    workspace.__THINGS.Breakables.ChildAdded:Connect(BreakableAdded)
    workspace.__THINGS.Breakables.ChildRemoved:Connect(function(Breakable) 
        local id = Breakable:GetAttribute("ParentID")
        local BreakabeId = Breakable:GetAttribute("BreakableID")
        if string.match(BreakabeId,"Diamond") and id == "Spawn" then id = "VIP" end
        if Breakables[id] then 
            Breakables[id][Breakable.Name] = nil
        end
    end)
    
    
    
end

function GetHop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    local File =
        pcall(
        function()
            AllIDs = game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json"))
        end
    )
    if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
    end
    function TPReturner()
        local Site
        if foundAnything == "" then
            Site =
                game.HttpService:JSONDecode(
                game:HttpGet(
                    "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"
                )
            )
        else
            Site =
                game.HttpService:JSONDecode(
                game:HttpGet(
                    "https://games.roblox.com/v1/games/" ..
                        PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. foundAnything
                )
            )
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0
        for i, v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile =
                                pcall(
                                function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end
                            )
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(
                        function()
                            writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, plr)
                        end
                    )
                    wait(4)
                end
            end
        end
    end
    function Teleport()
        while wait() do
            pcall(
                function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end
            )
        end
    end
    return Teleport
end
local HopServer = GetHop()

local MapQuestFarm 

local TableQuest = GetTableQuest()
local _,GoalsTable = GetGoalsTable()
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']).PlayEggAnimation = function() return end
function GetPlayerCoin() 
    local SaveModule = require(game.ReplicatedStorage.Library.Client.Save)
    local plr = game.Players.LocalPlayer
    for k,v in PlayerData.Inventory.Currency do 
        if v.id == "Coins" then 
            return v._am
        end
    end
end
local EggCmds = require(game.ReplicatedStorage.Library.Client.EggCmds) 
local CalcEggPrice = require(game.ReplicatedStorage.Library.Balancing.CalcEggPrice)
local EggDirectory = require(game.ReplicatedStorage.Library.Directory.Eggs)
local EggNumberToData = {}
for k,v in EggDirectory do 
    if v.eggNumber then 
        EggNumberToData[v.eggNumber] = v
    end
end
local ForceMaxMap
local ForceOpenZone
local NOZONE
local ForceMap
local EnableMiniGame

local PiroTPCoin

local ForceAllMiniGame
SetFeatureFunction("AutoRank",function() 
    while wait(.4) do
        local NeedSetCoinState
        local CheckNoZone
        local AnyTp
        local SetMap
        local SetForceAllMiniGame
        local InLoopEnableMiniGame

        local GoalKey = {}
        for k,v in PlayerData.Goals do 
            local Type = GoalsTable[v.Type]
            GoalKey[Type] = v
        end
        if plr.leaderstats["\226\173\144 Rank"].Value < 4 then 
            for k,v in PlayerData.Goals do 
                local Type = GoalsTable[v.Type]
                if v.Progress ~= v.Amount then 
                    if Type == "BREAKABLE" or Type == "CURRENT_BREAKABLE" or Type == "DIAMOND_BREAKABLE" then
                        if Type == "CURRENT_BREAKABLE" then 
                            ForceMaxMap = true
                        else
                            if v.BreakableType == "Present" then 
                                if IsMapUnlocked(6) then ForceMap = 6 SetMap = true else ForceOpenZone = true ForceMaxMap = true end
                            elseif v.BreakableType == "Diamond" or Type == "DIAMOND_BREAKABLE" then 
                                if not Settings.AutoOpenMap then 
                                    if IsMapUnlocked(25) then MapQuestFarm = 25 else ForceOpenZone = true ForceMaxMap = true end
                                end
                            elseif v.BreakableType == "Safe" then
                                PiroTPCoin = "Safe"
                                if IsMapUnlocked(7) then 
                                    local ListMap = {4,5,7}
                                    local FarmMap = 7
                                    for k,map in ListMap do 
                                        local Break
                                        local BreakableFolder = Breakables[LevelToName[map]]
                                        if BreakableFolder then 
                                            for k,v in BreakableFolder do 
                                                if workspace.__THINGS.Breakables:FindFirstChild(k) then 
                                                    local Coin = workspace.__THINGS.Breakables[k]
                                                    if Coin:GetAttribute("BreakableID") and string.match(Coin:GetAttribute("BreakableID"),PiroTPCoin) then 
                                                        FarmMap = map
                                                        Break = true
                                                        break;
                                                    end
                                                end
                                            end
                                        end
                                        if Break then break end
                                    end
                                    ForceMap = FarmMap 
                                    SetMap = true
                                else ForceOpenZone = true ForceMaxMap = true end
                            end
                        end 
                        SetFeatureState("FarmCoin",true,"Rank")
                        NeedSetCoinState = true
                    elseif Type == "MINI_CHEST" then
                        MapQuestFarm = 1
                        SetFeatureState("FarmCoin",true,"Rank")
                        NeedSetCoinState = true
                    elseif Type == "COMET" or Type == "BEST_COMET" then
                        local CometId
                        for k,v in PlayerData.Inventory.Misc do 
                            if v.id == "Comet" then 
                                for k,v in v do print(k,v) end
                                CometId = k
                                break;
                            end
                        end
                        if CometId then 
                            PiroTPCoin = "Comet"
                            if GoalKey["BEST_COMET"] then  
                                ForceMaxMap = true   
                                local MapPos = MapData[MapToName[GetCurrentPlayerMap()]].CFrame.p
                                if plr:DistanceFromCharacter(MapPos) < 50 then 
                                    game:GetService("ReplicatedStorage").Network.Comet_Spawn:InvokeServer(CometId)
                                end
                            else
                                ForceMap = 1
                                local MapPos = MapData[MapToName[LevelToName[1]]].CFrame.p
                                if plr:DistanceFromCharacter(MapPos) < 50 then 
                                    game:GetService("ReplicatedStorage").Network.Comet_Spawn:InvokeServer(CometId)
                                end
                            end
                        else
                            ForceAllMiniGame = true
                            SetFeatureState("MiniGame",true,"ForceAll")
                            SetForceAllMiniGame = true
                        end
                        SetFeatureState("FarmCoin",true,"Rank")
                        NeedSetCoinState = true
                    elseif Type == "USE_FLAG" then
    
                    elseif Type == "CURRENCY" then
                        if v.CurrencyID == "Diamonds" then 
                            --if IsMapUnlocked(25) then MapQuestFarm = 25 else MapQuestFarm = 1 end
                            --ForceMaxMap = true
                        elseif v.CurrencyID == "Coins" then
                            ForceMaxMap = true
                        end
                        SetFeatureState("FarmCoin",true,"Rank")
                        NeedSetCoinState = true
                    elseif Type == "ZONE" then
                        ForceOpenZone = true
                        ForceMaxMap =  true
                        SetFeatureState("FarmCoin",true,"Rank")
                        NeedSetCoinState = true
                    elseif Type == "MINEFIELD" then
                        if not IsMapUnlocked(11) then 
                            ForceOpenZone = true ForceMaxMap = true
                            SetFeatureState("FarmCoin",true,"Rank")
                            NeedSetCoinState = true
                        else
                            EnableMiniGame = "Minefield"
                            InLoopEnableMiniGame = true
                            SetFeatureState("MiniGame",true,"Minefield")
                        end
                    elseif Type == "ATLANTIS" then
                        if not IsMapUnlocked(23) then 
                            ForceOpenZone = true ForceMaxMap = true
                            SetFeatureState("FarmCoin",true,"Rank")
                            NeedSetCoinState = true
                        else
                            EnableMiniGame = "Atlantis"
                            SetFeatureState("MiniGame",true,"Atlantis")
                            InLoopEnableMiniGame = true
                        end
                    elseif Type == "SPAWN_OBBY" then
                        if not IsMapUnlocked(5) then 
                            ForceOpenZone = true ForceMaxMap = true
                            SetFeatureState("FarmCoin",true,"Rank")
                            NeedSetCoinState = true
                        else
                            EnableMiniGame = "SpawnObby"
                            SetFeatureState("MiniGame",true,"SpawnObby")
                            InLoopEnableMiniGame = true
                        end
                    elseif Type == "USE_FRUIT" then
                        for k,v2 in PlayerData.Inventory.Fruit do 
                            if v2.id == "Apple" or v2.id == "Orange" or v2.id == "Banana" or v2.id == "Pineapple" then
                                local FeedAmount = 1
                                if v2._am then 
                                    FeedAmount = math.min(v2._am,v.Amount - v.Progress)
                                end
                                if v.Progress ~= v.Amount then 
                                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Fruits: Consume"):FireServer(k,FeedAmount)
                                    break;   
                                end
                            end
                        end
                    elseif Type == "USE_POTION" then
                        for k,v2 in PlayerData.Inventory.Potion do 
                            if v2.tn == v.PotionTier then 
                                game:GetService("ReplicatedStorage").Network:FindFirstChild("Potions: Consume"):FireServer(k)
                                break;
                            end
                        end
                    elseif Type == "BEST_EGG" then
                        -- if Settings.AutoOpenMap then 
                        
                        -- end
                        NOZONE = true
                        CheckNoZone = true
                        local NeededEgg = v.Amount - v.Progress
                        local HighestNumberEgg = EggCmds.GetHighestEggNumberAvailable()
                        local CurrentMap =  NameToLevel[GetCurrentPlayerMap()]
    
                        local EggPrice = (CalcEggPrice({zoneNumber = CurrentMap + 0.5})) --+ CalcEggPrice({zoneNumber = CurrentMap + 1})) / 2
    
                        local TotalEggPrice = EggPrice --* NeededEgg
                        
                        local PlayerCoin = GetPlayerCoin()
                        if PlayerCoin then 
                            print(PlayerCoin,TotalEggPrice)
                            if PlayerCoin >= TotalEggPrice then
                                print(2)
                                if CheckFarm("AutoRank") then 
                                    local EggData = EggNumberToData[HighestNumberEgg]
                                    if EggData and pcall(function() return workspace.__THINGS.Eggs.Main end) then 
                                        StopFarmList["AutoRank"] = true
                                        AnyTp = true
                                        local EggName = EggData.name
                                        TP(workspace.__THINGS.Eggs.Main[tostring(HighestNumberEgg).." - Egg Capsule"].PrimaryPart.CFrame)
                                        if not PlayerData.UnlockedEggs[HighestNumberEgg] then 
                                            game:GetService("ReplicatedStorage").Network.Eggs_RequestUnlock:InvokeServer(EggName)
                                        end
                                        local NeededEgg = v.Amount - v.Progress
                                        local CoinNeeded = TotalEggPrice
                                        local PlayerCoin = GetPlayerCoin()
                                        if PlayerCoin then 
                                            if PlayerCoin >= CoinNeeded then 
                                                if CheckFarm("AutoRank") and pcall(function() return workspace.__THINGS.Eggs.Main end) then 
                                                    StopFarmList["AutoRank"] = true
                                                    AnyTp = true
                                                    TP(workspace.__THINGS.Eggs.Main[tostring(HighestNumberEgg).." - Egg Capsule"].PrimaryPart.CFrame)
                                                    local NeedHatchAmount = ((PlayerData.EggHatchCount < NeededEgg) and PlayerData.EggHatchCount) or NeededEgg
                                                    game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(EggData.name,NeedHatchAmount)
                                                end
                                            end
                                        end
                                    end
                                end
                            else
                                SetFeatureState("FarmCoin",true,"Rank")
                                ForceMaxMap =  true
                                NeedSetCoinState = true
                            end
                        end
                    elseif Type == "EGG" then 
                        for i =1, v.Amount - v.Progress do 
                            local NeededEgg = v.Amount - v.Progress
                            local CoinNeeded = 90 * NeededEgg
                            local PlayerCoin = GetPlayerCoin()
                            if PlayerCoin then 
                                if PlayerCoin >= CoinNeeded then 
                                    if CheckFarm("AutoRank") then 
                                        StopFarmList["AutoRank"] = true
                                        AnyTp = true
                                        TP(CFrame.new(103.13834381103516, 17.445697784423828, -165.32086181640625))
                                        local NeedHatchAmount = ((PlayerData.EggHatchCount < NeededEgg) and PlayerData.EggHatchCount) or NeededEgg
                                        game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer("Cracked Egg",NeedHatchAmount)
                                    end
                                end
                            end
                            wait()
                        end
                    end
                end
            end
        end
        if not SetMap then 
            ForceMap = false
        end
        if not NeedSetCoinState then 
            SetFeatureState("FarmCoin",false,"Rank")
            MapQuestFarm = nil
            ForceMaxMap = nil
            ForceMap = nil
            PiroTPCoin = nil
        end
        if not CheckNoZone then 
            NOZONE = false
        end
        if not AnyTp then 
            StopFarmList["AutoRank"] = false
        end
        if not InLoopEnableMiniGame and EnableMiniGame then 
            SetFeatureState("MiniGame",Settings[EnableMiniGame],EnableMiniGame)
            EnableMiniGame = nil
        end
        if not SetForceAllMiniGame then 
            SetForceAllMiniGame = nil
            ForceAllMiniGame = nil
            SetFeatureState("MiniGame",false,"ForceAll")
        end
    end
end).ForceStoped = function() 
    SetFeatureState("FarmCoin",false,"Rank")
    MapQuestFarm = nil
    ForceMaxMap = nil
    NOZONE = false
    StopFarmList["AutoRank"] = false
    if EnableMiniGame then 
        SetFeatureState("MiniGame",Settings[EnableMiniGame],EnableMiniGame)
        EnableMiniGame = nil
    end
    PiroTPCoin = nil
    ForceAllMiniGame = nil
end

local vu = game:GetService("VirtualUser")
plr.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

function GetSizeOfCoin(coin) return coin.Size.X ^ 2 + coin.Size.Y ^2 + coin.Size.Z ^2 end
function Length(tabl) local c = 0 for k,v in tabl do c = c + 1 end return c end

local old 
old = hookmetamethod(game,"__namecall",LPH_NO_VIRTUALIZE(function(...) 
    local self,arg = ...
    if not checkcaller() then 
        -- if Settings.FarmCoin and getnamecallmethod() == "FireServer" and ScriptRunning then 
        --     if Settings.FarmingMethod ~= "Engine" then 
        --         if tostring(self) == "Breakables_JoinPet" or tostring(self) == "Pets_SetTargetBulk" then 
        --             return
        --         end
        --     end
        -- end
        if getnamecallmethod() == "FireServer" and tostring(self) == "__BLUNDER" or tostring(self) == "Idle Tracking: Update Timer" or tostring(self) == "Move Server" then return end
    end
    return old(...)
end))
game.ReplicatedStorage.Network["Idle Tracking: Stop Timer"]:FireServer()



SetFeatureFunction("AutoClaimFreeReward",function() 
    while true do
        for i = 1,12 do 
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Redeem Free Gift"):InvokeServer(i) 
        end
        wait(60)
    end
end)



function SimpleSpy() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
end



local FarmCoinTask = SetFeatureFunction("FarmCoin",function() 
    LPH_JIT(function() 
        local FarmCoinList = {
            Length = 0,
            Coins = {}
        }
        local PetJoinId = {}
        local PetPerCoin = nil
        local Map1 = MapToName[LevelToName[MapQuestFarm]] or Settings.FarmMap
        local Map = ((Settings.SelectBest or ForceMaxMap) and MapToName[GetCurrentPlayerMap()]) or Map1
        local SetCurrentPlayerMap = function() 
            local Map1 = MapToName[LevelToName[MapQuestFarm]] or Settings.FarmMap
            local Map = ((Settings.SelectBest or ForceMaxMap) and MapToName[GetCurrentPlayerMap()]) or Map1
            if ForceMap then 
                Map = MapToName[LevelToName[ForceMap]]
            end
            if FarmMap ~= Map then 
                table.clear(PetJoinId)
                table.clear(FarmCoinList.Coins)
                FarmCoinList.Length = 0
                FarmCoinList = {
                    Length = 0,
                    Coins = {}
                }
                PetJoinId = {}
                local List = {}
                for k,v in PlayerPetIndex do 
                    List[v] = {
                        ["targetValue"] = plr.UserId,
                        ["targetType"] = "Player"
                    }
                end
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_SetTargetBulk"):FireServer({List})
            end
            FarmMap = Map
        end
        while wait() do
            if CheckFarm("FarmCoin") then 
                if Settings.AutoRebirth then
                    pcall(function() 
                        local CurrentRebirth = PlayerData.Rebirths or 0
                        if CurrentRebirth < (Settings.RebirthTime or 1) then
                            if CurrentRebirth == 0 and IsMapUnlocked(MapToName[LevelToName[25]]) then 
                                -- game.Players.LocalPlayer.Character.HumanoidRootPart:Destroy()
                                -- game.Players.LocalPlayer.Character.Humanoid:Destroy()
                                game.ReplicatedStorage.Network.Rebirth_Request:InvokeServer("1")
                            elseif CurrentRebirth == 1 and IsMapUnlocked(MapToName[LevelToName[50]]) then 
                                game.ReplicatedStorage.Network.Rebirth_Request:InvokeServer("2")
                            elseif CurrentRebirth == 2 and IsMapUnlocked(MapToName[LevelToName[75]]) then 
                                game.ReplicatedStorage.Network.Rebirth_Request:InvokeServer("3")
                            end
                        end
                    end)
                end
                StopFarmList["FarmCoin"] = true
                SetCurrentPlayerMap()
                if FarmMap and MapData[FarmMap] and not StoppedTp
                then 
                    if (Settings.AutoOpenMap or ForceOpenZone) and not NOZONE then 
                        local CurrentRebirth = PlayerData.Rebirths or 0
                        local NO_NEXT_ZONE
                        if CurrentRebirth < (Settings.RebirthTime or 0) and Settings.AutoRebirth then 
                        else
                            if NameToLevel[GetCurrentPlayerMap()] > (Settings.MaxMap or TotalMap) then 
                                NO_NEXT_ZONE = true
                            end
                        end
                        if plr.PlayerGui.ProgressBars.Main.Progress.Bar:FindFirstChild("GreenGradient") and not NO_NEXT_ZONE then 
                            local NextMap = GetNextMap()
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Zones_RequestPurchase"):InvokeServer(NextMap)
                            SetCurrentPlayerMap()
                        end
                    end
                    if not getgenv().SetupBreakableComplete then 
                        getgenv().SetupBreakableComplete = true
                        SetupBreakable()
                        SetupPet()
                    end
                    --print(0)
                    local BreakableFolder = Breakables[MapData[FarmMap].Name]
                    --local PetPerCoin = BreakableFolder.Lenght
                    if BreakableFolder then 
                        local NumberOfPet = #PlayerPetIndex
                        local PetPerCoin = NumberOfPet
                        if not PetPerCoin then PetPerCoin = NumberOfPet end
                        -- if Settings.UltraBoost then 
                        --     if not getgenv().BoostedFps then 
                        --         BoostFps()
                        --         getgenv().BoostedFps = true
                        --     end
                        -- end
                        TP(MapData[FarmMap].CFrame)
                        getgenv().noclip = true
                        -- if Settings.FarmingMethod ~= "Engine" then 
                        --     if Settings.FarmingMethod == "Extreme" or FarmCoinList.Length < PetPerCoin then 
                        --         --print(2)
                        --         local Lowest
                        --         local AllCoinLenght
                        --         for k,v in BreakableFolder do 
                        --             --print(k,v)
                        --             if not FarmCoinList.Coins[k] then 
                        --                 local FarmingMode = Settings.FarmingMode
                        --                 if FarmingMode ~= "All" then 
                        --                     -- local MeshPart = v:FindFirstChildOfClass("MeshPart")
                        --                     -- if MeshPart then 
                        --                     --     if not Lowest then 
                        --                     --         Lowest = v
                        --                     --     end
                        --                     --     if FarmingMode == "Lowest Health" then 
                        --                     --         local Size = GetSizeOfCoin(MeshPart)
                        --                     --         if Size < GetSizeOfCoin(Lowest:FindFirstChildOfClass("MeshPart")) then 
                        --                     --             Lowest = v
                        --                     --         end
                        --                     --     elseif FarmingMode == "Highest Health" then
                        --                     --         local Size = GetSizeOfCoin(MeshPart)
                        --                     --         if Size > GetSizeOfCoin(Lowest:FindFirstChildOfClass("MeshPart")) then 
                        --                     --             Lowest = v
                        --                     --         end
                        --                     --     else
                        --                     --         Lowest = v
                        --                     --     end
                        --                     -- else
                                                
                        --                     -- end
                        --                 else
                        --                     if FarmCoinList.Length < PetPerCoin then 
                        --                         FarmCoinList.Coins[k] = v
                        --                         FarmCoinList.Length = FarmCoinList.Length + 1
                        --                         --plr.Character.HumanoidRootPart.CFrame = FarmCoinList.Coins[k]
                                                
                        --                     else 
                        --                         break
                        --                     end
                        --                 end
                        --             end
                        --             if Settings.FarmingMethod == "Extreme" then 
                        --                 game:GetService("ReplicatedStorage").Network.Breakables_JoinPet:FireServer(v.Name,PlayerPetIndex[math.random(1,#PlayerPetIndex)])
                        --                 game:GetService("ReplicatedStorage").Network.Breakables_PlayerDealDamage:FireServer(v.Name)
                        --             end
                        --         end 
                        --         if Lowest and Settings.FarmingMethod ~= "Extreme" and Settings.FarmingMethod ~= "All" then 
                        --             FarmCoinList.Coins[Lowest.Name] = Lowest
                        --             FarmCoinList.Length = FarmCoinList.Length + 1
                        --         end
                        --     end
                        --     if Settings.FarmingMethod ~= "Extreme" then 
                        --         local i = 1
                        --         local TargetBulk = {}
                        --         while i < #PlayerPetIndex do 
                        --             local ReachedPlusI = false
                        --             for k,v in FarmCoinList.Coins do 
                        --                 if not BreakableFolder[k] then 
                        --                     FarmCoinList.Coins[k] = nil
                        --                     FarmCoinList.Length = FarmCoinList.Length - 1
                        --                 else
                        --                     if i < #PlayerPetIndex then 
                        --                         if PetJoinId[PlayerPetIndex[i]] and FarmCoinList.Coins[PetJoinId[PlayerPetIndex[i]]] then 
                        --                             if Settings.AutoTap then 
                        --                                 game:GetService("ReplicatedStorage").Network.Breakables_PlayerDealDamage:FireServer(k)
                        --                                 --print(k)
                        --                             end
                        --                         else
                        --                             if Settings.AutoTap then 
                        --                                 game:GetService("ReplicatedStorage").Network.Breakables_PlayerDealDamage:FireServer(k)
                        --                             end
                        --                             game:GetService("ReplicatedStorage").Network.Breakables_JoinPet:FireServer(k,PlayerPetIndex[i])
                        --                             PetJoinId[PlayerPetIndex[i]] = k
                        --                             TargetBulk[PlayerPetIndex[i]] = {
                        --                                 ["targetValue"] = k,
                        --                                 ["targetType"] = "Breakable"
                        --                             }
                        --                             i = i + 1
                        --                             ReachedPlusI = true
                        --                         end
                        --                     end
                        --                 end 
                        --             end
                        --             if not ReachedPlusI then break end
                        --             game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_SetTargetBulk"):FireServer({TargetBulk})
                        --         end
                        --     end
                        -- end
                        if PiroTPCoin then 
                            for k,v in BreakableFolder do 
                                if workspace.__THINGS.Breakables:FindFirstChild(k) then 
                                    local Coin = workspace.__THINGS.Breakables[k]
                                    if Coin:GetAttribute("BreakableID") and string.match(Coin:GetAttribute("BreakableID"),PiroTPCoin) then 
                                        TP(Coin.PrimaryPart.CFrame)
                                        break;
                                    end
                                end
                            end
                        end
                        if Settings.AutoTap then 
                            local Counted = 0
                            local TapPerTime = Settings.TapPerTime or 1
                            local TapTime = Settings.TapTime or 1
    
                            for k,v in BreakableFolder do 
                                if Counted > TapPerTime then break end
                                Counted = Counted + 1
                                for i = 1,TapTime do 
                                    game:GetService("ReplicatedStorage").Network.Breakables_PlayerDealDamage:FireServer(k)
                                end
                            end
                        end
                    else
                        TP(MapData[FarmMap].CFrame)
                    end
                end
            end  
        end
    end)()
end,{
    AntiBug = true
})
FarmCoinTask.ForceStoped = function() 
    getgenv().noclip = false
    StopFarmList["FarmCoin"] = false
end


local BlockAddedEvent
function IsBlockNeedToMine(position) 
    local ListPosition = {
        position + Vector3.new(1,0,0),
        position + Vector3.new(-1,0,0),
        position + Vector3.new(0,0,1),
        position + Vector3.new(0,0,-1),

        position + Vector3.new(1,0,1),
        position + Vector3.new(-1,0,1),
        position + Vector3.new(1,0,-1),
        position + Vector3.new(-1,0,-1)
    }
end
function DigChest(pos,DigsiteZone) 
    local args = {
        [1] = DigsiteZone,
        [2] = "DigChest",
        [3] = pos
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer(unpack(args))
end
--DigChest(Vector3.new(9,4,6))

function DigBlock(pos,DigsiteZone) 
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer(DigsiteZone,"DigBlock",pos)
end
local function GetCoordId(Block) 
    if Block:GetAttribute("Coord") then 
        local Coord = Block:GetAttribute("Coord")
        return Coord.X + Coord.Y * 10 + Coord.Z * 1000
    end
end
local CurrentSquare = Vector3.new(2,1,2)

local PlayerSquareFarm = {}
while CurrentSquare.Z <= 16 do 
    for i = 1,10 do 
        if not PlayerSquareFarm[i] then PlayerSquareFarm[i] = {} end
        table.insert(PlayerSquareFarm[i],CurrentSquare)
        -- if workspace.__THINGS.__INSTANCE_CONTAINER.Active["AdvancedDigsite"].Important.ActiveBlocks:FindFirstChild(tostring(CurrentSquare)) then
        --     workspace.__THINGS.__INSTANCE_CONTAINER.Active["AdvancedDigsite"].Important.ActiveBlocks[tostring(CurrentSquare)].Color = Color3.fromRGB(unpack(colorMap[i]))
        -- end
        CurrentSquare = CurrentSquare + Vector3.new(3,0,0)
        if CurrentSquare.X == 17 then 
            CurrentSquare = CurrentSquare - Vector3.new(1,0,0)
        elseif CurrentSquare.X > 16 then
            CurrentSquare = Vector3.new(2,1,CurrentSquare.Z + 3)
        end
        if CurrentSquare.Z == 17 then 
            CurrentSquare = CurrentSquare - Vector3.new(0,0,1)
        end
    end
end
function GetAccountId() 
    local plrList = {}
    for k,v in game.Players:GetChildren() do table.insert(plrList,v) end
    table.sort(plrList,function(a,b) 
        return a.UserId < b.UserId
    end)
    return table.find(plrList,plr)
end
local AutoDig = SetFeatureFunction("AutoDigsite",function() 
    local SetupFolder
    local Level = Settings.DigsiteLevel or 3
    local FarmedCoin = true
    local LastFixOrb = tick()
    local SetupedOrb
    local Orbs = {}  
    local Multiple = {} 
    while wait() do 
        if game.ReplicatedStorage.Network:FindFirstChild("Orbs: Create") and not getgenv().OrbConnections then      
            getgenv().OrbConnections = game.ReplicatedStorage.Network:WaitForChild("Orbs: Create").OnClientEvent:Connect(function(v) 
                for k,v in v do 
                    if tonumber(v.id) then 
                        table.insert(Orbs,v.id)
                    else
                        table.insert(Multiple,{v.id})
                    end
                end
            end)
            game.Players.LocalPlayer.PlayerScripts.Scripts.Game["Orbs Frontend"].Disabled = true
            workspace.__THINGS.Orbs:ClearAllChildren()
        end
        
        if tick() - LastFixOrb > 1 and getgenv().OrbConnections then 
            if #Orbs > 0 then 
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Orbs: Collect"):FireServer({
                    Orbs
                })
                table.clear(Orbs)
            end
            if #Multiple > 0 then 
                game:GetService("ReplicatedStorage").Network.Orbs_ClaimMultiple:FireServer({Multiple})
                table.clear(Multiple)
            end
            LastFixOrb = tick()
        end
        local DigsiteZone = (Settings.DigsiteZone == "Advanced Digsite" and "AdvancedDigsite") or "Digsite"
        local ZoneSize = (DigsiteZone == "AdvancedDigsite" and 16) or 8
        if pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveBlocks end) and CheckFarm("Digsite") then 
            StopFarmList["Digsite"] = true
            if #workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveBlocks:GetChildren() == 0 then
                if workspace.__THINGS.Instances:FindFirstChild(DigsiteZone) then 
                    if workspace.__THINGS.Instances[DigsiteZone]:FindFirstChild("Teleports") and workspace.__THINGS.Instances[DigsiteZone].Teleports:FindFirstChild("Enter") then 
                        TP(CFrame.new(workspace.__THINGS.Instances[DigsiteZone].Teleports.Enter.Position) + Vector3.new(10,10,10))
                        getgenv().Noclip = true
                        wait(5)
                    end
                end
            else
                if Level > 128 then 
                    if not FarmedCoin then 
                        if Settings.DigsiteHopp then 
                            spawn(function() 
                                SendHookCT({
                                    name = "CTE Notify",
                                    value = "Hopped Server",
                                    inline = false
                                })
                            end)
                            wait(1)
                            HopServer()
                            return
                        end
                    end
                    Level =  Settings.DigsiteLevel or 3
                    FarmedCoin = false
                end
                if not StoppedTp then 
                    local BlockFolder = workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveBlocks
                    if not BlockAddedEvent then 
                        local BlockAdded = function(Bloc) 
                            if Bloc:GetAttribute("Coord") then 
                                local Coord = Bloc:GetAttribute("Coord")
                                if Settings.GocFarmDig then 
                                    if Settings.GocFarmDig == 1 then 
                                        Bloc.Name = tostring(Coord)
                                    elseif Settings.GocFarmDig == 2 then
                                        Coord = Vector3.new(17 - Coord.X,Coord.Y,17 - Coord.Z)
                                        Bloc.Name = tostring(Coord)
                                    end
                                else
                                    Bloc.Name = tostring(Coord)
                                end
                                Bloc.Material = Enum.Material.Plastic
                                Bloc.Reflectance = 0
                                Bloc.CastShadow = false
                                Bloc:ClearAllChildren()
                            end
                        end
                        for k,v in workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveBlocks:GetChildren() do 
                            BlockAdded(v)
                        end
                        BlockAddedEvent = workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveBlocks.ChildAdded:Connect(BlockAdded)
                    else
                        
                    end
                    if plr.Character:FindFirstChild("RightLowerArm") then 
                        plr.Character.RightLowerArm:Destroy()
                    end
                    local function CheckChest() 
                        if pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveChests end) then 
                            local ChestFolder = workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveChests
                            for k,v in ChestFolder:GetChildren() do 
                                repeat wait() 
                                    FarmedCoin = true
                                    getgenv().noclip = true
                                    if v.Parent and v.PrimaryPart then 
                                        if StoppedTp then return end
                                        TPNormal(v.PrimaryPart.CFrame)
                                        DigChest(v:GetAttribute("Coord"),DigsiteZone)
                                    end
                                until not v.Parent or not ChestFolder.Parent or not pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveChests end)
                            end
                        end
                    end
                    -- local function CheckChest() 
                    --     if pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveChests end) then 
                    --         local ChestFolder = workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveChests
                    --         local function GetMinChest() 
                    --             local MinChest
                    --             for k,v in ChestFolder:GetChildren() do
                    --                 local CoordId = GetCoordId(v)
                    --                 if CoordId then 
                    --                     if not MinChest then 
                    --                         MinChest = v
                    --                     end
                    --                     if GetCoordId(MinChest) < CoordId then 
                    --                         MinChest = v
                    --                     end
                    --                 end
                    --             end
                    --             return MinChest
                    --         end
                    --         FarmedCoin = true
                    --         local MinChest = GetMinChest()
                    --         if MinChest then 
                    --             repeat wait()
                    --                 local v = MinChest
                    --                 if v.Parent then 
                    --                     getgenv().noclip = true
                    --                     if StoppedTp then return end
                    --                     TPNormal(v.PrimaryPart.CFrame)
                    --                     local NOBREAK
                    --                     -- if Settings.Khongbietdaumahuhu then 
                    --                     --     for k,v in game.Players:GetChildren() do 
                    --                     --         if v.Character then 
                    --                     --             if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
                    --                     --                 if plr:DistanceFromCharacter(v.HumanoidRootPart.Position) > 15 then 
                    --                     --                     NOBREAK = true
                    --                     --                 end
                    --                     --             end
                    --                     --         end
                    --                     --     end
                    --                     -- end
                    --                     if not NOBREAK then 
                    --                         DigChest(v:GetAttribute("Coord"),DigsiteZone)
                    --                     end
                    --                     --print(v:GetAttribute("Coord"))
                    --                 end
                    --                 --print(v:GetAttribute("Coord"))

                    --                 MinChest = GetMinChest()
                    --             until not MinChest
                    --         end
                    --     end
                    -- end
                    local ForceNextLevel 
                    local function FarmBlock(position) 
                        CheckChest()
                        if BlockFolder:FindFirstChild(tostring(position)) then 
                            if BlockFolder[tostring(position)].BrickColor == BrickColor.new("Really black") then ForceNextLevel = true return end
                            getgenv().noclip = true
                            local StartTime = tick()
                            FarmedCoin = true
                            repeat wait()
                                if BlockFolder:FindFirstChild(tostring(position)) then 
                                    if StoppedTp then return end
                                    TPNormal(BlockFolder:FindFirstChild(tostring(position)).CFrame)
                                    DigBlock(BlockFolder[tostring(position)]:GetAttribute("Coord"),DigsiteZone)
                                end
                                if tick() - StartTime > 20 then 
                                    return
                                end
                            until not BlockFolder:FindFirstChild(tostring(position))
                        else
                            return true
                        end
                    end
                    
                    if Settings.TungOTheoAcc then
                        CheckChest()
                        local LastCheckId = tick()
                        local AccountId = GetAccountId()
                        if PlayerSquareFarm[AccountId] then 
                            for k,v in PlayerSquareFarm[AccountId] do 
                                local DFarmnua
                                for i = 1,Level do 
                                    FarmBlock(Vector3.new(v.X,i,v.Z))
                                    if tick() - LastCheckId > 10 then 
                                        if AccountId ~= GetAccountId() then DFarmnua = true break end
                                        LastCheckId = tick()
                                    end
                                end
                                if DFarmnua then break end
                            end
                        end
                    else 
                        Level = Level + 3
                        --print(Level)
                        CheckChest()
                        for i = 1,Level do 
                            FarmBlock(Vector3.new(2,i,2))
                        end
        
                        local Ngang1 = 4
                        while Ngang1 < ZoneSize do 
                            local i = 1
                            local StartBlock = Vector3.new(Ngang1 - 2,Level,2)
                            while StartBlock.X < ZoneSize and StartBlock.Z < ZoneSize do 
                                FarmBlock(StartBlock)
                                StartBlock = StartBlock + Vector3.new(i,0,i)
                            end
                            FarmBlock(Vector3.new(Ngang1,Level,3))
                            Ngang1 = Ngang1 + 3
                        end
                        FarmBlock(Vector3.new(ZoneSize-1,Level,2))
            
                        local Ngang2 = 4
                        while Ngang2 < 16 do 
                            local i = 1
                            local StartBlock = Vector3.new(2,Level,Ngang2 - 2)
                            while StartBlock.X < ZoneSize and StartBlock.Z < ZoneSize do 
                                if ForceNextLevel then break end
                                FarmBlock(StartBlock)
                                StartBlock = StartBlock + Vector3.new(i,0,i)
                            end
                            FarmBlock(Vector3.new(3,Level,Ngang2))
                            Ngang2 = Ngang2 + 3
                        end     
                        FarmBlock(Vector3.new(2,Level,ZoneSize - 1))               
                    end
                end
            end
        else
            if workspace.__THINGS.Instances:FindFirstChild(DigsiteZone) then 
                if workspace.__THINGS.Instances[DigsiteZone]:FindFirstChild("Teleports") and workspace.__THINGS.Instances[DigsiteZone].Teleports:FindFirstChild("Enter") then 
                    TP(CFrame.new(workspace.__THINGS.Instances[DigsiteZone].Teleports.Enter.Position))
                end
            end
            if BlockAddedEvent then 
                BlockAddedEvent:Disconnect()
                BlockAddedEvent = nil
            end
            SetupFolder = false
        end
    end
end,{
    AntiBug = true
})
AutoDig.ForceStoped = function() 
    StopFarmList["Digsite"] = false
    if getgenv().OrbConnections then 
        getgenv().OrbConnections:Disconnect()
        getgenv().OrbConnections = nil
        game.Players.LocalPlayer.PlayerScripts.Scripts.Game["Orbs Frontend"].Disabled = false
    end
    local DigsiteZone = (Settings.DigsiteZone == "Advanced Digsite" and "AdvancedDigsite") or "Digsite"
    if BlockAddedEvent then 
        BlockAddedEvent:Disconnect()
        BlockAddedEvent = nil
    end
    TP(CFrame.new(workspace.__THINGS.Instances[DigsiteZone].Teleports.Enter.Position))
    getgenv().noclip = false
end

-- for k,v in getgc(true) do 
--     if type(v) == "table" then 
--         if pcall(function() return v.RegularMerchant.Seeds end) and v.RegularMerchant and type(v.RegularMerchant) == "table" and v.RegularMerchant.Seeds then 
--             getgenv().Table = v
--             print("Done")
--             break
--         end
--     end
-- end

--setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))



local Main = Library.CreateMain({Title = 'Pet Simulator 99', Desc = ''})
print("Created Main?")
local Page1 = Main.CreatePage({Page_Name = 'Main', Page_Title = 'Main Tab'})
if not LPH_OBFUSCATED then
    SetFeatureFunction("AutoUseItem",function(Settings) 
        while wait(1) do 
            if Settings then 
                if Settings.AutoFruit then 
                    for k,v2 in PlayerData.Inventory.Fruit do 
                        if v2.id == "Apple" or v2.id == "Orange" or v2.id == "Banana" or v2.id == "Pineapple" or v2.id == "Banana" then
                            --game:GetService("ReplicatedStorage").Network:FindFirstChild("Fruits: Consume"):FireServer(k,1)
                            game:GetService("ReplicatedStorage").Network:FindFirstChild("Fruits: Consume"):FireServer(k,2)
                            wait(.5)
                        end
                    end
                end
                if Settings.AutoPotion then 
                    for k,v2 in PlayerData.Inventory.Potion do 
                        if v2.tn == 3 then 
                            game:GetService("ReplicatedStorage").Network:FindFirstChild("Potions: Consume"):FireServer(k)
                            wait(.5)
                        end
                    end
                end
            end
        end
    end)
    SetFeatureFunction("AutoClaimMail",function() 
        while wait(2) do 
            local mb = game.ReplicatedStorage.Network["Mailbox: Get"]:InvokeServer()
            if mb then 
                local AllId = {}
                for k,v in mb.Inbox do
                    table.insert(AllId,v.uuid) 
                end
                if #AllId > 0 then 
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Claim"):InvokeServer(AllId)
                end
            end
        end
    end)
    local Section11 = Page1.CreateSection('MailBox')
    Section11.CreateToggle({Title = 'Auto Claim Mail Box', Default = Settings.AutoClaimMail}, function(v)
        SetFeatureState("AutoClaimMail",v)
    end)
    
    local Section11 = Page1.CreateSection('Auto Use Item')
    Section11.CreateToggle({Title = 'Auto Fruit', Default = Settings.AutoFruit}, function(v)
        SetFeatureState("AutoUseItem",v,"AutoFruit")
        Settings.AutoFruit = v
    end)
    Section11.CreateToggle({Title = 'Auto Potion', Default = Settings.AutoPotion}, function(v)
        SetFeatureState("AutoUseItem",v,"AutoPotion")
        Settings.AutoPotion = v
    end)
end
local Section11 = Page1.CreateSection('Auto Merchant')
local MerchantInfo = {
    RegularMerchant = {
        Position = CFrame.new(372.11248779296875, 16.306806564331055, 551.4596557617188)
    },
    AdvancedMerchant = {
        Position = CFrame.new(808.6577758789062, 16.58210563659668, 1548.416748046875)
    },
    GardenMerchant = {
        Position = CFrame.new(258.5284729003906, 16.566850662231445, 2067.40087890625)
    }
}
local ListMerchant = {}

for k,v in MerchantInfo do 
    table.insert(ListMerchant,k)
end

ListMerchant = SetupTF(ListMerchant,"MerchantTF")


local MerchantsTable = getgenv().MerchantsTable



game:GetService("ReplicatedStorage"):WaitForChild("Network").Merchant_Updated.OnClientEvent:Connect(function(...)
    MerchantsTable = ...
end)
local plr = game.Players.LocalPlayer
local MerchantUtil = require(game.ReplicatedStorage.Library.Util.MerchantUtil)

SetFeatureFunction("AutoMerchant",function() 
    while wait(1) do --AdvancedMerchant.Offers["1"].PriceData.data
        if MerchantsTable and type(MerchantsTable) == "table" then 
            for k,v in ListMerchant do
                local MerchantName = k
                if v and MerchantsTable[k] and MerchantsTable[k].Offers then 
                    for k,v in MerchantsTable[k].Offers do 
                        if v.Stock and v.Stock > 0 then 
                            pcall(function() 
                                local PlayerExp = SaveModule.GetSaves()[plr].MerchantExperience[MerchantName] or 1
                                local PlayerRespect = MerchantUtil.RespectLevelFromExperience(PlayerExp)
                                if PlayerRespect >= v.Respect then 
                                    if plr.leaderstats["\240\159\146\142 Diamonds"].Value >= v.PriceData.data._am then 
                                        if CheckFarm("Merchant") then 
                                            if plr:DistanceFromCharacter(MerchantInfo[MerchantName].Position.p) > 100 then 
                                                StoppedTp = true
                                                StopFarmList["Merchant"] = true
                                                TP(MerchantInfo[MerchantName].Position)
                                                wait(1)
                                            end
                                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Merchant_RequestPurchase"):InvokeServer(MerchantName,tonumber(k))
                                        end    
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        elseif MerchantsTable == nil then
            for k,v in ListMerchant do
                local MerchantName = k
                if v then 
                    if plr:DistanceFromCharacter(MerchantInfo[MerchantName].Position.p) > 100 then 
                        StoppedTp = true
                        TP(MerchantInfo[MerchantName].Position)
                        wait(1)
                    end
                    local Break 
                    for i = 1,6 do 
                        if game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Merchant_RequestPurchase"):InvokeServer(MerchantName,i) then Break = true break end
                    end
                    if Break then break end
                end
            end
        else
        end
        StoppedTp = false
        StopFarmList["Merchant"] = false
    end
    StoppedTp = false
end,{
    AntiBug = true
}).ForceStoped = function() 
    StoppedTp = false
    StopFarmList["Merchant"] = false
end
Section11.CreateToggle({Title = 'Auto Merchant', Default = Settings.AutoMerchant}, function(v)
    SetFeatureState("AutoMerchant",v)
end)
Section11.CreateDropdown({Title = 'Select Merchant', List = ListMerchant, Selected = true}, function(i, v)
    if i and v then 
        ListMerchant[i]=v
    end
end)
local Section11 = Page1.CreateSection('Claim Reward')

Section11.CreateToggle({Title = 'Auto Claim Free Reward', Default = Settings.ClaimFree}, function(v)
    SetFeatureState("AutoClaimFreeReward",v)
end)
local AllRank = require(game.ReplicatedStorage.Library.Directory.Ranks)

TaskHandler:AddTask("ClaimStuff",function() 
    while wait(2) do 
        if Settings.HiddenPresent then 
            local SaveModule = require(game.ReplicatedStorage.Library.Client.Save)
            local plr = game.Players.LocalPlayer
            for k,v in SaveModule.GetSaves()[plr].HiddenPresents do 
                if not v.Found then 
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Hidden Presents: Found"):InvokeServer(v.ID)
                end
            end
        end
        if Settings.OpenGiftBag then 
            for k,v in PlayerData.Inventory.Misc do 
                if v.id == "Gift Bag" then 
                    game:GetService("ReplicatedStorage").Network.GiftBag_Open:InvokeServer("Gift Bag")
                end
             end
        end
        local PlayerData = SaveModule:GetSaves()[plr]

        local RedeemedRankRewards = PlayerData.RedeemedRankRewards
        local CurrentStar = PlayerData.RankStars
        local CurrentTitleRank = Client.RankCmds.GetTitle()
        --print(#AllRank[CurrentTitleRank].Rewards)
        if Settings.ClaimRankReward and CurrentTitleRank and RedeemedRankRewards then 
            local CurrentStarRequired = 0
            for k,v in AllRank[CurrentTitleRank].Rewards do 
                CurrentStarRequired = CurrentStarRequired + v.StarsRequired
                if not RedeemedRankRewards[tostring(k)] and CurrentStar >= CurrentStarRequired then 
                    --print(CurrentStar,v.StarsRequired,k)
                    game:GetService("ReplicatedStorage").Network.Ranks_ClaimReward:FireServer(k)
                    wait(.3)
                end
            end
            -- for i = 1,15 do
                
            --     for k,v in require(game.ReplicatedStorage.Library.Directory.Ranks).Noob.Rewards[1] do print(k,v) end
            -- end
        end
        if getgenv().AutoBuyFunction then 
            getgenv().AutoBuyFunction()
        end
        StopFarmList["ClaimStuff"] = false
    end
end):Start()

Section11.CreateToggle({Title = 'Auto Claim Hidden Present', Default = Settings.HiddenPresent}, function(v)
    Settings.HiddenPresent = v
end)
Section11.CreateToggle({Title = 'Auto Claim Rank Reward', Default = Settings.ClaimRankReward}, function(v)
    Settings.ClaimRankReward = v
end)
Section11.CreateToggle({Title = 'Auto Open Gift Bag (Inventory)', Default = Settings.OpenGiftBag}, function(v)
    Settings.OpenGiftBag = v
end)
-- Script generated by SimpleSpy - credits to exx#9394

-- local args = {
--     [1] = "Gift Bag"
-- }

-- game:GetService("ReplicatedStorage").Network.GiftBag_Open:InvokeServer(unpack(args))


local Section11 = Page1.CreateSection('Web Hook')


Section11.CreateBox({Title = 'Webhook Url', Placeholder = 'Type here', Number_Only = false, Default = Settings.WebHookUrl}, function(v)
    if not v then
        return
    end
    Settings.WebHookUrl = v
end)

Section11.CreateBox({Title = 'Webhook Timer', Placeholder = 'Put Timer here (min)', Number_Only = true, Default = Settings.WebHookTime}, function(v)
    if not v then
        return
    end
    Settings.WebHookTime = tonumber(v)
end)

Section11.CreateToggle({Title = 'Webhook', Default = Settings.Webhook}, function(v)
    SetFeatureState("Webhook",v)
end)
Section11.CreateButton({Title = 'Test Web Hook'}, function()
    msg = {
		["embeds"] = {{
			["title"] = "Pet Simulator 99",
			["type"] = "rich",
			["color"] = tonumber(0xffb4b4),
			["fields"] = {
				{
					["name"] = "Test webhook",
					["value"] = "tvk1308 was here :eyes:",
					["inline"] = false
				},
			},
			["footer"] = {
				["icon_url"] = "https://media.discordapp.net/attachments/821058004178305044/1200079352667320401/roses.png",
				["text"] = "CTE Hub (" .. os.date("%X") .. ")"
			}
		}}
	}
   request({
		Url = Settings.WebHookUrl,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game:GetService("HttpService"):JSONEncode(msg)
	})
end)
function SendHookCT(ct,content)
    local HttpService = game:GetService("HttpService")
    local tb = {
        ["content"] = content or "",
        ["embeds"] = {{
            ["title"] = "Pet Simulator 99",
            ["description"] = "",
            ["type"] = "rich",
            ["color"] = tonumber(0xffb4b4),
            ["fields"] = ct,
            ["footer"] = {
                ["icon_url"] = "https://media.discordapp.net/attachments/821058004178305044/1200079352667320401/roses.png",
                ["text"] = "CTE Hub (" .. os.date("%X") .. ")"
            }
        }}
    }
    
    local a =
        request(
        {
            Url = Settings.WebHookUrl,
            Method = "POST",
            Body = HttpService:JSONEncode(tb),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        }
    )
    return a.Body
end

SetFeatureFunction("Webhook",function() 
    while true do 
        SendHookCT({
            {
                name = "Gems",
                value = plr.leaderstats["\240\159\146\142 Diamonds"].Value,
                inline = false
            }
        })
        local tic = tick()
        repeat wait()
        until (tick() - tic) > Settings.WebHookTime * 60
    end
end)


 
local Page1 = Main.CreatePage({Page_Name = 'Mini Game', Page_Title = 'Mini Game Tab'})
local Section11 = Page1.CreateSection('Auto Fishing')


Section11.CreateToggle({Title = 'Auto Fishing', Default = Settings.CauCa}, function(v)
    SetFeatureState("CauCa",v)
end)


-- Section11.CreateToggle({Title = 'Legendary Loot', Default = Settings.LegendaryLoot}, function(v)
--     Settings.LegendaryLoot = v
-- end)

local Section11 = Page1.CreateSection('Auto Digsite')

Section11.CreateToggle({Title = 'Auto Digsite', Default = Settings.AutoDigsite,Desc = "Harness the power of unparalleled efficiency with our auto digsite feature, meticulously optimized to revolutionize your mining operations and maximize productivity"}, function(v)
    SetFeatureState("AutoDigsite",v)
end)
Section11.CreateDropdown({Title = 'Select Zone', List = {"Advanced Digsite","Digsite"},Default =  Settings.DigsiteZone or "Advanced Digsite", Selected = false}, function(v)
    Settings.DigsiteZone = v
end)
Section11.CreateSlider({Title = "Digsite Start Level", Min = 3, Max = 128, Default = Settings.DigsiteLevel or 3, Precise = false}, function(v)
    Settings.DigsiteLevel = v
end)
if not LPH_OBFUSCATED then 
    Section11.CreateSlider({Title = "Farm ở góc nào v huhuhuhu mà hic", Min = 1, Max = 4, Default = Settings.GocFarmDig or 1, Precise = false}, function(v)
        Settings.GocFarmDig = v
    end)
    Section11.CreateToggle({Title ='Chestt giii do a k biet hic', Default = Settings.Khongbietdaumahuhu,Desc = "chacc chann laaa khongggg biettttt"}, function(v)
        Settings.Khongbietdaumahuhu = v
    end)
    Section11.CreateToggle({Title ='Tung O Theo acc', Default = Settings.TungOTheoAcc,Desc = "k biet ghi gi cho nay luonn"}, function(v)
        Settings.TungOTheoAcc = v
    end)
end
Section11.CreateToggle({Title = 'Hop Server when there is nothing to farm', Default = Settings.DigsiteHopp,Desc = "Hop server chu co cai d gi de ghi mieu ta? Doc tieu de chac la hieu me r deo can doc cai nay dau ma dit me cx deo can bat dau"}, function(v)
    Settings.DigsiteHopp = v
end)
local MachineCmds = require(game.ReplicatedStorage.Library.Client.InstancingCmds)
--MachineCmds.DoesMeetRequirement = function() return true end 
function IsInMiniGame(game) 
    local s,e = pcall(function() 
        return workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild(game) and #workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild(game):GetChildren() > 0
    end)
    if s then return e else return nil end
end

function Enter(Name)
    if not game.Workspace:FindFirstChild("Map") and not IsInMiniGame(Name) then 
        local NearestTeleport = GetNearestTeleport()
        if NearestTeleport then 
            if plr:DistanceFromCharacter(NearestTeleport.Teleports.Leave.Position) < 1000 then 
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(NearestTeleport.Teleports.Leave.Position)
                wait(3)
            end
        end
    end
    setthreadidentity(2)
    pcall(function() 
        MachineCmds.Enter(Name)
    end)
    setthreadidentity(7)
end
function convertTimeToSeconds(timeFormat)
    local minutes, seconds, milliseconds = string.match(timeFormat, "(%d+):(%d+).(%d+)")
    
    if minutes and seconds and milliseconds then
        local totalSeconds = tonumber(minutes) * 60 + tonumber(seconds) + tonumber(milliseconds) / 100
        return totalSeconds
    else
        return nil  -- Invalid time format
    end
end

local MiniGameFunction = {}

MiniGameFunction.Minefield = function() 
    local plr = game.Players.LocalPlayer
    local FirstStandPos = CFrame.new(-253.623, 3.8298, -3349.47)
    local EndStandPos = CFrame.new(54.5735, 11.0989, -3357.37)
    local MinePath
    for k,v in pairs(game.Workspace.__THINGS.__INSTANCE_CONTAINER.Active:GetChildren()) do 
        if v:FindFirstChild("Mines") then 
            MinePath = v.Mines
            break;
        end
    end
    if MinePath then 
        plr.Character.HumanoidRootPart.CFrame = FirstStandPos
        wait(.5)
        while true and CheckFarm("MiniGame") and IsInMiniGame("Minefield") do 
            StopFarmList["MiniGame"] = true
            local PartToTp = {}
            local GreenPart = {}
            for k,v in MinePath:GetChildren() do 
                if v.Pad.BrickColor ~= BrickColor.new("Really red") then 
                    if v.Pad.BrickColor == BrickColor.new("Lime green") then 
                        table.insert(GreenPart,v.Pad)
                    end
                end
            end
            local NearestGreen
            for k,v in GreenPart do 
                if not NearestGreen then NearestGreen = v end 
                if (NearestGreen.Position - EndStandPos.p).magnitude > (v.Position - EndStandPos.p).magnitude then 
                    NearestGreen = v
                end
            end
            if not NearestGreen then 
                
                plr.Character.HumanoidRootPart.CFrame = FirstStandPos
                wait()
                NearestGreen = plr.Character.HumanoidRootPart
            end 
            for k,v in MinePath:GetChildren() do 
                if v.Pad.BrickColor ~= BrickColor.new("Really red") then 
                    if v.Pad.BrickColor == BrickColor.new("Lime green") then 
                    else
                        if (v.Pad.Position - NearestGreen.Position).magnitude < 15 then 
                            table.insert(PartToTp,v.Pad) 
                        end
                    end
                end
            end
            if #PartToTp == 0 then 
                if #GreenPart == 0 then 
                    plr.Character.HumanoidRootPart.CFrame = FirstStandPos
                else
                    local Nearest
                    for k,v in GreenPart do 
                        if not Nearest then Nearest = v end 
                        if (Nearest.Position - EndStandPos.p).magnitude > (v.Position - EndStandPos.p).magnitude then 
                            Nearest = v
                        end
                    end
                    if CheckFarm("MiniGame") and IsInMiniGame("Minefield") then 
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(Nearest.Position)
                    end
                end
                --wait(.5)
            else
                local Nearest
                for k,v in PartToTp do 
                    if not Nearest then Nearest = v end 
                    if (Nearest.Position - EndStandPos.p).magnitude > (v.Position - EndStandPos.p).magnitude then 
                        Nearest = v
                    end
                end
                if CheckFarm("MiniGame") and IsInMiniGame("Minefield") then 
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(Nearest.Position)
                end
                --wait(.5)
            end
            local NeedOut
            for k,v in MinePath:GetChildren() do 
                if v.Pad.BrickColor == BrickColor.new("Lime green") then 
                    if math.abs(v.Pad.Position.X - 44.326) < 1 then 
                        NeedOut = true
                        break;
                    end
                end
            end
            if NeedOut then
                break;
            end
            wait()
        end
        if CheckFarm("MiniGame") and IsInMiniGame("Minefield") then 
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(56.504669189453125, 3.419732570648193, -3309.156494140625)
        end
        wait(2)
    end
end

MiniGameFunction.Atlantis = function(NeedOut) 
    local plr = game.Players.LocalPlayer
    local _,Path = pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active.Atlantis.Rings end)
    if not _ or not Path then return end
    while wait() do 
        local HasAny = false
        for k,v in Path:GetChildren() do 
            if v:FindFirstChild("Ring") and CheckFarm("MiniGame") and IsInMiniGame("Atlantis") then 
                plr.Character.HumanoidRootPart.CFrame = v.Ring.CFrame
                wait(1)
            end
            if not CheckFarm("MiniGame") then return end
            if not IsInMiniGame("Atlantis") then return end
        end
        if not Path.Parent then return end
        if not CheckFarm("MiniGame") then return end
        if not IsInMiniGame("Atlantis") then return end
        if not pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active.Atlantis.Rings end) then return end
    end
end

MiniGameFunction.SpawnObby = function() 
    local plr = game.Players.LocalPlayer
    local _,Path = pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active.SpawnObby.Goal.Pad end)
    if not _ or not Path then return end

    repeat     
        if CheckFarm("MiniGame") and IsInMiniGame("SpawnObby") then 
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-111.77913665771484, 133.7024383544922, -2892.6142578125)
        end
        wait(1) 
    until game:GetService("Players").LocalPlayer.PlayerGui._INSTANCES:FindFirstChild("ObbyTimer") and game:GetService("Players").LocalPlayer.PlayerGui._INSTANCES.ObbyTimer.Enabled and CheckFarm("MiniGame")
    while wait() and CheckFarm("MiniGame") and IsInMiniGame("SpawnObby") do 
        local Time = convertTimeToSeconds(plr.PlayerGui._INSTANCES.ObbyTimer.Main.Timer.Text)
        if Time > 30 then 
            plr.Character.HumanoidRootPart.CFrame = Path.CFrame + Vector3.new(0,4,0)
        end
    end
end

SetFeatureFunction("MiniGame",function(Settings) 
    while wait(1) do 
        if Settings then
            if CheckFarm("MiniGame") then 
                for k,v in MiniGameFunction do 
                    if Settings[k] or ForceAllMiniGame then 
                        if MachineCmds.DoesMeetRequirement(k) then 
                            StopFarmList["MiniGame"] = true
                            wait(1)
                            if not IsInMiniGame(k) then 
                                Enter(k)
                                local Start = tick()
                                repeat wait() until IsInMiniGame(k) or tick() - Start > 20
                                wait(1)
                            end
                            if IsInMiniGame(k) and CheckFarm("MiniGame") then
                                wait(.1)
                                v(function() 
                                    return not (Settings[k] or ForceAllMiniGame)
                                end)
                            end
                        end
                    end
                end
            end
        end
        StopFarmList["MiniGame"] = false
    end
end).ForceStoped = function() 
    setthreadidentity(7)
    StopFarmList["MiniGame"] = false
end

local Section11 = Page1.CreateSection('Misc')

Section11.CreateToggle({Title = 'Auto Mine Field', Default = Settings.Minefield,Desc = nil}, function(v)
    Settings.Minefield = v
    SetFeatureState("MiniGame",v,"Minefield")
end)

Section11.CreateToggle({Title = 'Auto Atlantis', Default = Settings.Atlantis,Desc = nil}, function(v)
    Settings.Atlantis = v
    SetFeatureState("MiniGame",v,"Atlantis")
end)

Section11.CreateToggle({Title = 'Auto Classic Obby', Default = Settings.SpawnObby,Desc = nil}, function(v)
    Settings.SpawnObby = v
    SetFeatureState("MiniGame",v,"SpawnObby")
end)



--setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))

local Page1 = Main.CreatePage({Page_Name = 'Buy Item', Page_Title = 'Main Tab'})
local Section11 = Page1.CreateSection('Main')

-- SetFeatureFunction("BuyNewMap",function() 
--     while wait(1) do 
--         for k,v in SaveModule.GetSaves()[plr].UnlockedZones do
--             if v then 
--                 local FolderName = MapToName[k]
--                 if game.Workspace:FindFirstChild("Map") then 
--                     if game.Workspace.Map:FindFirstChild(FolderName) and game.Workspace.Map[FolderName]:FindFirstChild("INTERACT") then 
--                         local MapFolder = game.Workspace.Map[FolderName]
--                         if MapFolder.INTERACT:FindFirstChild("Upgrades") then
--                             for k,v in MapFolder.INTERACT.Upgrades:GetChildren() do 
--                                 if not v.PriceHUD.PriceHUD:FindFirstChild("Owned") then 
--                                     if v.PriceHUD.PriceHUD:FindFirstChild("Diamonds") then 
                                    
--                                     end
--                                 end
--                             end
--                         end
--                     end
--                 end     
--             end 
--         end
--         -- local tvk = require(game.ReplicatedStorage.__DIRECTORY.Upgrades["Upgrade | Tap Damage"])
--         -- for k,v in tvk.TierCurrencies do print(k,v) end
--     end
-- end)

local Client = require(game.ReplicatedStorage.Library.Client)
--print(Client.RankCmds.GetMaxPurchasableEquipSlots())
-- for k,v in Client.RankCmds do print(k,v) end
-- print(Client.RankCmd.GetTitle(3))
-- require(game.ReplicatedStorage.Library.Balancing.CalcPetDamage)
local UpdrageDirectory = require(game.ReplicatedStorage.Library.Directory.Upgrades)
-- for k,v in UpdrageDirectory do print(k,v) end
-- for k,v in Client.UpgradeCmds.All() do
--     -- for k,v in v do print(k,v) end
--     print(v.Model.Parent.Parent.Parent)
--     --for k,v in UpdrageDirectory[v.UpgradeID].TierCosts do print(k,v) end
-- end
-- for k,v in  SaveModule.GetSaves()[plr].UpgradesOwned["Pet Speed"] do print(k,v) end
local PlayerData = SaveModule.GetSaves()[plr]
local CalcSlotPrice = require(game.ReplicatedStorage.Library.Balancing.CalcPetSlotPrice)
function IsPlayerOwnUpdrage(id,tier) 
    if not PlayerData.UpgradesOwned[id] then 
        return false
    end
    if table.find(PlayerData.UpgradesOwned[id],tier) then 
        return true
    end
    return false
end
local ListIgnoreMap = {}
for k,v in UpdrageDirectory do table.insert(ListIgnoreMap,tostring(k)) end
ListIgnoreMap = SetupTF(ListIgnoreMap,"IgnoreUpgrade")


getgenv().AutoBuyFunction = function() 
    if Settings.AutoBuyPetSlot then 
        if IsMapUnlocked(4) then 
            local CurrentMaxPurchase = Client.RankCmds.GetMaxPurchasableEquipSlots()
            local CurrentSlot = SaveModule:GetSaves()[plr].PetSlotsPurchased
            if CurrentSlot and CurrentMaxPurchase then
                for i = CurrentSlot + 1,CurrentMaxPurchase do 
                    local SlotPrice = CalcSlotPrice(i)
                    if plr.leaderstats["\240\159\146\142 Diamonds"].Value > SlotPrice and CheckFarm("ClaimStuff") then 
                        StopFarmList["ClaimStuff"] = true 
                        wait(.1)
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(704.2413940429688, 19.302692413330078, -272.87420654296875)
                        wait(.1)
                        game.ReplicatedStorage.Network.EquipSlotsMachine_RequestPurchase:InvokeServer(i)
                    end
                end
            end
        end
    end
    if Settings.AutoBuyUpdrage then 
        for k,v in Client.UpgradeCmds.All() do
            if IsMapUnlocked(MapToName[v.ZoneID]) and not ListIgnoreMap[v.UpgradeID] then 
                if not IsPlayerOwnUpdrage(v.UpgradeID,v.UpgradeTier) then 
                    local Cost = UpdrageDirectory[v.UpgradeID].TierCosts[v.UpgradeTier]
                    if plr.leaderstats["\240\159\146\142 Diamonds"].Value >= Cost and v.Model and v.Model.PrimaryPart then 
                        if CheckFarm("ClaimStuff") then 
                            StopFarmList["ClaimStuff"] = true 
                            wait(.1)
                            TP(v.Model.PrimaryPart.CFrame)
                            wait(.4)
                            game:GetService("ReplicatedStorage").Network.Upgrades_Purchase:InvokeServer(v.UpgradeID,v.ZoneID)
                            wait(.4)
                        end
                    end
                end
            end
        end
    end
    StopFarmList["ClaimStuff"] = false
end

Section11.CreateToggle({Title = 'Auto Buy Pet Slot', Default = Settings.AutoBuyPetSlot}, function(v)
    Settings.AutoBuyPetSlot = v
end)
-- Section11.CreateToggle({Title = 'Auto Buy Pet Slot', Default = Settings.AutoBuyEggSlot}, function(v)
--     Settings.AutoBuyEggSlot = v
-- end)
Section11.CreateToggle({Title = 'Auto Buy New Map Upgrade', Default = Settings.AutoBuyUpdrage}, function(v)
    Settings.AutoBuyUpdrage = v
end)
Section11.CreateDropdown({Title = 'Ignore Upgrade', List = ListIgnoreMap, Selected = true}, function(i, v)
    if i and v then 
        ListIgnoreMap[i]=v
    end
end)


local Page1 = Main.CreatePage({Page_Name = 'Auto Farm', Page_Title = 'Main Tab'})
local Section11 = Page1.CreateSection('Main')

Section11.CreateToggle({Title = 'Auto Farm',Desc="Will auto farm in your selected map", Default = Settings.FarmCoin}, function(v)
    SetFeatureState("FarmCoin",v,"Settings")
 end)
 Section11.CreateToggle({Title = 'Auto Tap',Desc="Will auto tap coin in radius", Default = Settings.AutoTap}, function(v)
    Settings.AutoTap = v
 end)
 Section11.CreateSlider({Title = "How many coin per time", Min = 1, Max = 10, Default = Settings.TapPerTime or 3, Precise = false}, function(v)
    Settings.TapPerTime = v
end)
Section11.CreateSlider({Title = "Tap Per Time", Min = 1, Max = 5, Default = Settings.TapTime or 1, Precise = false}, function(v)
    Settings.TapTime = v
end)




--  Section11.CreateToggle({Title = 'Tap All Coin',Desc="Will auto tap all coin in field", Default = Settings.TapAll}, function(v)
--     Settings.TapAll = v
--  end)
 Section11.CreateToggle({Title = 'Auto Select Best Map',Desc="Will Auto Select Best Map To Farm", Default = Settings.SelectBest}, function(v)
    Settings.SelectBest = v
 end)
 Section11.CreateToggle({Title = 'Auto Open Map',Desc="Will Auto ppen New map when you have enough coin", Default = Settings.AutoOpenMap}, function(v)
    Settings.AutoOpenMap = v
 end)
 Section11.CreateSlider({Title = "Max Map Open", Min = 1, Max = TotalMap, Default = Settings.MaxMap or TotalMap, Precise = false}, function(v)
    Settings.MaxMap = v
end)
Section11.CreateToggle({Title = 'Auto Rebirth',Desc=nil, Default = Settings.AutoRebirth}, function(v)
    Settings.AutoRebirth = v
 end)
 Section11.CreateToggle({Title = 'Use TNT When Rebirth',Desc="Have a chance to keep your coin when rebirth (fast farm)", Default = Settings.TNTRebirth}, function(v)
    Settings.TNTRebirth = v
 end)
 Section11.CreateSlider({Title = "Rebirh time", Min = 1, Max = 3, Default = Settings.RebirthTime or 1, Precise = false}, function(v)
    Settings.RebirthTime = v
end)

-- Section11.CreateToggle({Title = 'Ultra Boost FPS',Desc="Will boost your fps (Only For Field Farm, Cannot disable, not work in engine method)", Default = Settings.UltraBoost}, function(v)
--     Settings.UltraBoost = v
-- end)


Section11.CreateDropdown({Title = 'Select Map', List = MapNames, Selected = false,Default = Settings.FarmMap}, function(v)
    Settings.FarmMap = v
end)

Section11.CreateDropdown({Title = 'Farming Mode', List = {"All"}, Selected = false, Default = Settings.FarmingMode or "All"}, function(v)
    Settings.FarmingMode = v
end)
-- Section11.CreateDropdown({Title = 'Farming Method', List = {"Script","Engine"},Default = Settings.FarmingMethod or "Script" , Selected = false}, function(v)
--     Settings.FarmingMethod = v
-- end)
-- Section11.CreateLabel({Title = "Method Script: Use CTE HUB implemented farm function (recommended in low level farm like vip area) \nMethod Engine: Use game built in Farm Method with pet instant tp (Not work with Ultra Boost FPS)"})

local Page1 = Main.CreatePage({Page_Name = 'Auto Rank', Page_Title = 'Main Tab'})
local Section11 = Page1.CreateSection('Main')

Section11.CreateToggle({Title = 'Auto Rank',Desc = "Auto farm rank", Default = Settings.AutoRank}, function(v)
   SetFeatureState("AutoRank",v)
end)

-- 2 ^ 10 = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2
-- = (2 * 2 * 2 * 2 * 2 ) ^ 2
-- = ((2*2)^2 * 2)^2

workspace.ALWAYS_RENDERING:Destroy()
