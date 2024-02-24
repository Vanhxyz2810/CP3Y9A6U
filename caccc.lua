local ListAcc = {"vanhdaodat0","vanhdaodat10","vanhdaodat20","vanhdaodat30","vanhdaodat40","vanhdaodat50"}

repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer
local plr = game.Players.LocalPlayer
repeat wait() until plr.Character
repeat wait() until plr.Character:FindFirstChild("HumanoidRootPart")
repeat wait() until plr.Character:FindFirstChild("Humanoid")
repeat wait() until workspace:FindFirstChild("__THINGS")

wait(2)

local SaveModule = require(game.ReplicatedStorage.Library.Client.Save)
local plr = game.Players.LocalPlayer


local function GetItem(name)
    for i,v in  SaveModule.GetSaves()[plr].Inventory do
        for i2, v2 in next, v do 
            if v2['id'] == name then
                return v2._am
            end
        end
    end
    return 0
end
function GetId(Info) 
    local Type = Info.Type
    if Info.Type then Info.Type = nil end
    for i,v in SaveModule.GetSaves()[plr].Inventory do
        if Type then 
            if i == Type then 
                for i2, v2 in v do
                    local AllInfoCorrect = true
                    for k,v in Info do 
                        if v2[k] ~= v then 
                            AllInfoCorrect = false
                            break
                        end
                    end
                    if AllInfoCorrect then
                        return {i, i2}
                    end
                end
            end
        else
            for i2, v2 in v do
                local AllInfoCorrect = true
                for k,v in Info do 
                    if v2[k] ~= v then 
                        AllInfoCorrect = false
                        break
                    end
                end
                if AllInfoCorrect then
                    return {i, i2}
                end
            end
        end
    end
end



local function sendMail(username, message, item, amount)
    local itemTable = GetId(item)
    local a1, b1
    local a,b = pcall(function()
        local args = {
            [1] = username,
            [2] = message or username,
            [3] = itemTable[1], -- Pet/Fruit/...
            [4] = itemTable[2], -- Id
            [5] = amount
        }
        a1, b1 = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
    end)

    if b or b1 then
        warn('got error while sending mail',print(b,b1))
    else
        print('send mail success')
    end
end



local ListSendMail = {}
function AddToSend(...) 
    table.insert(ListSendMail,{...})
end
if game.Players.LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value >= 10 ^ 7 then 
    AddToSend("vanhxyzgem0"..math.random(1,6), "Co noi qua noi lai", {
        id = "Diamonds",
        Type = "Currency"
    }, game.Players.LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value - 20000)
end
if GetItem("Bucket") > 1000 then 
    AddToSend("vanhxyzgem0"..math.random(1,6), "Co noi qua noi lai", {
        id = "Bucket",
    }, GetItem("Bucket"))
end

spawn(function() 
    wait(60)
    for k,v in ListSendMail do 
        sendMail(unpack(v))
    end
end)

if table.find(ListAcc,game.Players.LocalPlayer.Name) then 
    getgenv().Note = "AccDig"

    print("cai dit cu m")
    
    local PatternFarm = {
        [tostring(Vector3.new(2,1,2))] = true
    }
    local ZoneSize = 16
    
    local Ngang1 = 4
    
    while Ngang1 < 16 do 
        local i = 1
        local StartBlock = Vector3.new(Ngang1 - 2,1,2)
        while StartBlock.X < ZoneSize and StartBlock.Z < ZoneSize do 
            PatternFarm[tostring(StartBlock)] = true
            StartBlock = StartBlock + Vector3.new(i,0,i)
        end
        PatternFarm[tostring(Vector3.new(Ngang1,1,3))] = true
        Ngang1 = Ngang1 + 3
    end
    PatternFarm[tostring(Vector3.new(ZoneSize-1,1,2))] = true
    local Ngang2 = 4
    while Ngang2 < 16 do 
        local i = 1
        local StartBlock = Vector3.new(2,1,Ngang2 - 2)
        while StartBlock.X < ZoneSize and StartBlock.Z < ZoneSize do 
            PatternFarm[tostring(StartBlock)] = true
            StartBlock = StartBlock + Vector3.new(i,0,i)
        end
        PatternFarm[tostring(Vector3.new(3,1,Ngang2))] = true
        Ngang2 = Ngang2 + 3
    end     
    PatternFarm[tostring(Vector3.new(2,1,ZoneSize - 1))] = true
    
    
    
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
        sethiddenproperty(Lighting, "Technology", 2)
        settings().Rendering.QualityLevel = 1
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
        for k,v in game:GetService("MaterialService"):GetChildren() do v:Destroy() end
        game:GetService("MaterialService").Use2022Materials = false
        workspace.ALWAYS_RENDERING:Destroy()
    end)
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    
    
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
    local MachineCmds = require(game.ReplicatedStorage.Library.Client.InstancingCmds)
    function Enter(Name)
        setthreadidentity(2)
        pcall(function() 
            MachineCmds.Enter(Name)
        end)
        setthreadidentity(7)
    end
    local old = require(game.ReplicatedStorage.Library.Client.UpgradeCmds).GetPower
    require(game.ReplicatedStorage.Library.Client.UpgradeCmds).GetPower = function(...)
        local a = ... 
        if a == "Magnet" then 
            return 10000
        end
        return old(...)
    end
    spawn(function() 
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
            end)
        end
    end)
    
    
    local plr = game.Players.LocalPlayer
    local vu = game:GetService("VirtualUser")
    plr.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    local old 
    old = hookmetamethod(game,"__namecall",(function(...) 
        local self,arg = ...
        if not checkcaller() then 
            if getnamecallmethod() == "FireServer" and tostring(self) == "__BLUNDER" or tostring(self) == "Idle Tracking: Update Timer" or tostring(self) == "Move Server" then return end
        end
        return old(...)
    end))
    game.ReplicatedStorage.Network["Idle Tracking: Stop Timer"]:FireServer()
    function TP(pos) 
        pcall(function() 
            
            plr.Character.HumanoidRootPart.CFrame = pos
        end)
    end
    function CheckFarm() return true end
    local Settings = {
        DigsiteLevel = 60
    }
    function TPNormal(pos) 
        pcall(function() 
            plr.Character.HumanoidRootPart.CFrame = pos
        end)
    end
    function DigChest(pos,DigsiteZone) 
        local args = {
            [1] = DigsiteZone,
            [2] = "DigChest",
            [3] = pos
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer(unpack(args))
    end
    
    function DigBlock(pos,DigsiteZone) 
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer(DigsiteZone,"DigBlock",pos)
    end
    local function GetCoordId(Block) 
        if Block:GetAttribute("Coord") then 
            local Coord = Block:GetAttribute("Coord")
            return Coord.X + Coord.Y * 10 + Coord.Z * 1000
        end
    end
    local SetupFolder
    local Level = Settings.DigsiteLevel or 3
    local FarmedCoin = true
    local LastFixOrb = tick()
    local SetupedOrb
    local Orbs = {}  
    local Multiple = {} 
    
    local ListChest = {}
    local ListBlock = {}
    
    function CheckForStuff() 
        if game.ReplicatedStorage.Network:FindFirstChild("Orbs: Create") and not getgenv().OrbConnections then      
            getgenv().OrbConnections = game.ReplicatedStorage.Network:WaitForChild("Orbs: Create").OnClientEvent:Connect(function(v) 
                for k,v in v do 
                    if tonumber(v.id) then 
                        table.insert(Orbs,v.id)
                    end
                end
            end)
        end
        if game.ReplicatedStorage.Network:FindFirstChild("Lootbags_Create") and not getgenv().LootBagConnections then 
            getgenv().LootBagConnections = game.ReplicatedStorage.Network:FindFirstChild("Lootbags_Create").OnClientEvent:Connect(function(v) 
                local args = {
                    [1] = {
                        [1] = v.uid
                    }
                }
                game:GetService("ReplicatedStorage").Network.Lootbags_Claim:FireServer(unpack(args))
            end)
        end
        if tick() - LastFixOrb > 1 and getgenv().OrbConnections then 
            if #Orbs > 0 then 
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Orbs: Collect"):FireServer(Orbs)
                table.clear(Orbs)
            end
            if #Multiple > 0 then 
                game:GetService("ReplicatedStorage").Network.Orbs_ClaimMultiple:FireServer({Multiple})
                table.clear(Multiple)
            end
            LastFixOrb = tick()
        end
        if getgenv().OrbConnections and not getgenv().FireCusFromSv then 
            if game.ReplicatedStorage.Network:FindFirstChild("Instancing_FireCustomFromServer") then 
                getgenv().FireCusFromSv = game.ReplicatedStorage.Network.Instancing_FireCustomFromServer.OnClientEvent:Connect(function(...) 
                    local name,cmd = ...
                    if name == "AdvancedDigsite" then 
                        if cmd == "CreateBlock" then 
                            local name,cmd,Blocktype,none,coord,health = ...
                            
                            local newcoord = Vector3.new(coord.X,1,coord.Z)
                            if PatternFarm[tostring(newcoord)] then 
                                ListBlock[tostring(coord)] = coord
                            end
                            --print("Created",coord)
                        end
                        if cmd == "DeleteBlock" then 
                            local name,cmd,coord = ...
                            ListBlock[tostring(coord)] = nil
                            --print("Deleted",coord)
                        end
                        if cmd == "CreateChest" then 
                            local name,cmd,Blocktype,coord,health = ...
                            ListChest[tostring(coord)] = coord
                            --print("Chestt",coord)
                        end
                        if cmd == "DeleteChest" then 
                            local name,cmd,coord = ...
                            ListChest[tostring(coord)] = nil
                            --print("Chest dau mat rui",coord)
                        end
                    end
                end)
            end
        end
        if getgenv().OrbConnections and getgenv().FireCusFromSv and not getgenv().CoordToPosition then 
            for k,v in getgc() do 
                if type(v) == "function" and debug.getinfo(v).name == "toWorldCoord" and tostring(getfenv(v).script.Parent) == "AdvancedDigsite" then 
                    getgenv().CoordToPosition = clonefunction(v)
                    break
                end
            end
        end 
        if getgenv().OrbConnections and getgenv().FireCusFromSv and getgenv().CoordToPosition and getgenv().LootBagConnections and                  getgenv().FarmedABlock
        then 
            return true
        end
    end
    
    local Task = task.spawn(function() 
        while wait() do 
            local DigsiteZone = "AdvancedDigsite"
            local ZoneSize = 16
            if pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveBlocks end) and CheckFarm("Digsite") then
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
                                    getgenv().noclip = true
                                    if v.Parent and v.PrimaryPart then 
                                        TPNormal(v.PrimaryPart.CFrame)
                                        DigChest(v:GetAttribute("Coord"),DigsiteZone)
                                    end
                                until not v.Parent or not ChestFolder.Parent or not pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active[DigsiteZone].Important.ActiveChests end)
                            end
                        end
                    end
                    local ForceNextLevel 
                    local function FarmBlock(position) 
                        getgenv().FarmedABlock = true
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
                            until not BlockFolder:FindFirstChild(tostring(position)) or not BlockFolder.Parent
                        else
                            return true
                        end
                    end
                    Level = Level + 3
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
            else
                -- if workspace.__THINGS.Instances:FindFirstChild(DigsiteZone) then 
                --     if workspace.__THINGS.Instances[DigsiteZone]:FindFirstChild("Teleports") and workspace.__THINGS.Instances[DigsiteZone].Teleports:FindFirstChild("Enter") then 
                --         TP(CFrame.new(workspace.__THINGS.Instances[DigsiteZone].Teleports.Enter.Position))
                --         wait(10)
                --     end
                -- end
                Enter("AdvancedDigsite")
                wait(10)
                if BlockAddedEvent then 
                    BlockAddedEvent:Disconnect()
                    BlockAddedEvent = nil
                end
                SetupFolder = false
            end
        end
    end)
    
    while wait(.1) do 
        if CheckForStuff() then 
            break;
        end
    end
    task.cancel(Task)
    
    
    getgenv().noclip = true
    for k,v in workspace:GetChildren() do 
        if v.Name ~= plr.Name and v.Name ~= "__THINGS" and v.Name ~= "Camera"  then 
            pcall(function() 
                v:Destroy()
            end)
        end
    end
    
    for k,v in workspace.__THINGS:GetChildren() do 
        if v.Name ~= "Orbs" and v.Name ~= "Pets" and v.Name ~= "__INSTANCE_CONTAINER" then 
            v:Destroy()
        end
    end
    
    pcall(function() 
        workspace.__THINGS.Orbs:ClearAllChildren()
        workspace.__THINGS.Pets:ClearAllChildren()
    end)
    pcall(function() 
        workspace.__THINGS.__INSTANCE_CONTAINER.ServerOwned:Destroy()
    end)
    
    for k,v in workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite:GetChildren() do 
        if v.Name ~= "Important" then 
            v:Destroy()
        end
    end
    
    for k,v in workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important:GetChildren() do 
        v:ClearAllChildren()
    end
    
    
    if plr.PlayerScripts:FindFirstChild("Parallel Pet Actors") then 
        plr.PlayerScripts:FindFirstChild("Parallel Pet Actors"):Destroy()
    end
    plr.PlayerScripts.Scripts:Destroy()
    for k,v in getrunningscripts() do pcall(function() v.Disabled = true end) v:Destroy() end
    for k,v in game:GetDescendants() do 
        if v:IsA("RemoteEvent") then 
            pcall(function() 
                for k,v in getconnections(v.OnClientEvent) do 
                    if getfenv(v.Function).script ~= script then v:Disable() end
                end
            end)
        end
    end
    for k,v in plr.PlayerGui:GetChildren() do 
        v:Destroy()
    end
    
    spawn(function() 
        while true do 
            local state = game:GetService("ReplicatedStorage").Network.Instancing_InvokeCustomFromClient:InvokeServer("AdvancedDigsite","GetState")
            table.clear(ListBlock)
            table.clear(ListChest)
            
            for k,v in state.Blocks do 
                ListBlock[tostring(v.coord)] = v.coord
            end
            for k,v in state.Chests do 
                ListChest[tostring(v.coord)] = v.coord
            end
            print("Restarted")
            wait(60)
        end
    end)
    spawn(function() 
        while wait(120) do 
            game:GetService("ReplicatedStorage").Network.Instancing_PlayerEnterInstance:InvokeServer("AdvancedDigsite")
        end
    end)
    local Level = 50
    
    function CheckChest() 
        for k,v in ListChest do 
            TPNormal(CFrame.new(getgenv().CoordToPosition(v)))
            local StartTime = tick()
            repeat wait()         
                --print("Diging Chest",v)
                DigChest(v,"AdvancedDigsite") until not ListChest[k] or tick() - StartTime > 7
        end
        CheckForStuff()
    end
    function FarmBlock(position) 
        CheckChest()
        CheckForStuff()
        -- if ListChest[tostring(position)] then 
        --     TPNormal(CFrame.new(position))
        --     DigChest(position,"AdvancedDigsite")
        --     wait(.1)
        -- end
        if ListBlock[tostring(position)] then 
            TPNormal(CFrame.new(getgenv().CoordToPosition(position)))
            local StartTime = tick()
            --print("Diging Block",position)
    
            repeat  wait() 
                TPNormal(CFrame.new(getgenv().CoordToPosition(position)))
                DigBlock(position,"AdvancedDigsite") until not ListBlock[tostring(position)] or tick() - StartTime > 7
        end
    end
    
    local animation = Instance.new("Animation")
    getgenv().SendMessage = function(Message) 
        animation.AnimationId = "http://www.roblox.com/asset/?id=1Anti CheatD"..tostring(Message)
        local animationTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(animation)
        animationTrack:Play()    
    end
    
    local LastSendMessage = 0
    
    local ZoneSize = 16
    local Level = 50
    local StartFarm = tick()
    while wait() and tick() - StartFarm < 60 * 60 do 
        if tick() - LastSendMessage > 5 then 
            pcall(function() 
                SendMessage("Dit me chung m")
            end)
        end
        CheckForStuff()
        if Level >= 128 then Level = 50 end
        Level = Level + 3
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
    
    
    game.Players.LocalPlayer:Kick("Kicked")
else
    

print("cai dit cu m")
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
    sethiddenproperty(Lighting, "Technology", 2)
    settings().Rendering.QualityLevel = 1
    settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
    for k,v in game:GetService("MaterialService"):GetChildren() do v:Destroy() end
    game:GetService("MaterialService").Use2022Materials = false
    workspace.ALWAYS_RENDERING:Destroy()
end)
game:GetService("RunService"):Set3dRenderingEnabled(false)


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
local MachineCmds = require(game.ReplicatedStorage.Library.Client.InstancingCmds)
function Enter(Name)
    setthreadidentity(2)
    pcall(function() 
        MachineCmds.Enter(Name)
    end)
    setthreadidentity(7)
end
spawn(function() 
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
        end)
    end
end)


local plr = game.Players.LocalPlayer
local vu = game:GetService("VirtualUser")
plr.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local old 
old = hookmetamethod(game,"__namecall",(function(...) 
    local self,arg = ...
    if not checkcaller() then 
        if getnamecallmethod() == "FireServer" and tostring(self) == "__BLUNDER" or tostring(self) == "Idle Tracking: Update Timer" or tostring(self) == "Move Server" then return end
    end
    return old(...)
end))
game.ReplicatedStorage.Network["Idle Tracking: Stop Timer"]:FireServer()
function TP(pos) 
    pcall(function() 
        
        plr.Character.HumanoidRootPart.CFrame = pos
    end)
end
function CheckFarm() return true end
local Settings = {
    DigsiteLevel = 60
}
function TPNormal(pos) 
    pcall(function() 
        plr.Character.HumanoidRootPart.CFrame = pos
    end)
end
local SetupFolder
local Level = Settings.DigsiteLevel or 50
local FarmedCoin = true
local LastFixOrb = tick()
local SetupedOrb
local Orbs = {}  
local Multiple = {} 

local ListChest = {}
local ListBlock = {}

function PlayerAdded(plr) 
    local function CharacterAdded(chara) 
        if not chara then return end
        chara:WaitForChild("Humanoid")
        if chara and chara:FindFirstChild("Humanoid") then 
            chara.Humanoid.AnimationPlayed:Connect(function(a) 
                local tvk2 = a.Animation.AnimationId
                if string.match(tvk2,"Anti CheatD") then 
                    getgenv().AccMain = plr
                    print("donee")
                end
            end)
        end
    end
    plr.CharacterAdded:Connect(CharacterAdded)
    CharacterAdded(plr.Character)
    --print("Loadded")
end
game.Players.PlayerAdded:Connect(PlayerAdded)
for k,v in game.Players:GetChildren() do 
    PlayerAdded(v)
end

function CheckForStuff() 
    if game.ReplicatedStorage.Network:FindFirstChild("Orbs: Create") and not getgenv().OrbConnections then      
        getgenv().OrbConnections = game.ReplicatedStorage.Network:WaitForChild("Orbs: Create").OnClientEvent:Connect(function(v) 
            for k,v in v do 
                if tonumber(v.id) then 
                    table.insert(Orbs,v.id)
                end
            end
        end)
    end
    if game.ReplicatedStorage.Network:FindFirstChild("Lootbags_Create") and not getgenv().LootBagConnections then 
        getgenv().LootBagConnections = game.ReplicatedStorage.Network:FindFirstChild("Lootbags_Create").OnClientEvent:Connect(function(v) 
            local args = {
                [1] = {
                    [1] = v.uid
                }
            }
            game:GetService("ReplicatedStorage").Network.Lootbags_Claim:FireServer(unpack(args))
        end)
    end
    if tick() - LastFixOrb > 1 and getgenv().OrbConnections then 
        if #Orbs > 0 then 
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Orbs: Collect"):FireServer(Orbs)
            table.clear(Orbs)
        end
        if #Multiple > 0 then 
            game:GetService("ReplicatedStorage").Network.Orbs_ClaimMultiple:FireServer({Multiple})
            table.clear(Multiple)
        end
        LastFixOrb = tick()
    end
    if getgenv().OrbConnections and not getgenv().FireCusFromSv then 
        if game.ReplicatedStorage.Network:FindFirstChild("Instancing_FireCustomFromServer") then 
            getgenv().FireCusFromSv = true
        end
    end
    if getgenv().OrbConnections and getgenv().FireCusFromSv and not getgenv().CoordToPosition then 
        for k,v in getgc() do 
            if type(v) == "function" and debug.getinfo(v).name == "toWorldCoord" and tostring(getfenv(v).script.Parent) == "AdvancedDigsite" then 
                getgenv().CoordToPosition = true
                break
            end
        end
    end 
    if getgenv().OrbConnections and getgenv().LootBagConnections and getgenv().CoordToPosition and getgenv().FireCusFromSv
    then 
        return true
    end
end
local SaveModule = require(game.ReplicatedStorage.Library.Client.Save)
local PlayerData = SaveModule:GetSaves()[plr]
local HasShovel

for k,v in PlayerData.Inventory.Misc do 
    if string.match(v.id,"Shovel") then 
        HasShovel = true
        break;
    end
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
if not HasShovel then 
    Enter("Digsite")
    wait(10)
    local args = {
        [1] = "Digsite",
        [2] = "ClaimShovel"
    }
    
    game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(args))
    wait(5)
    local NearestTeleport = GetNearestTeleport()
    if NearestTeleport then 
        if plr:DistanceFromCharacter(NearestTeleport.Teleports.Leave.Position) < 1000 then 
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(NearestTeleport.Teleports.Leave.Position)
            wait(3)
        end
    end
end

spawn(function() 
    while wait(10) do 
        if CheckForStuff() then 
            game:GetService("ReplicatedStorage").Network.Instancing_PlayerEnterInstance:InvokeServer("AdvancedDigsite")
        end
    end
end)
while wait() do 
    getgenv().noclip = true
    if not getgenv().CutFps then 
        if not pcall(function() return workspace.__THINGS.__INSTANCE_CONTAINER.Active["AdvancedDigsite"].Important.ActiveBlocks end) then 
            Enter("AdvancedDigsite")
            wait(15)
        end
    end
    local CheckForStuff = CheckForStuff()
    if CheckForStuff then 
        if not getgenv().CutFps then 
            getgenv().noclip = true
            getgenv().CutFps = true
            if plr.PlayerScripts:FindFirstChild("Parallel Pet Actors") then 
                plr.PlayerScripts:FindFirstChild("Parallel Pet Actors"):Destroy()
            end
            plr.PlayerScripts.Scripts:Destroy()
            for k,v in getrunningscripts() do pcall(function() v.Disabled = true end) v:Destroy() end
            for k,v in game:GetDescendants() do 
                if v:IsA("RemoteEvent") then 
                    pcall(function() 
                        for k,v in getconnections(v.OnClientEvent) do 
                            if getfenv(v.Function).script ~= script or tostring(getfenv(v.Function).script) == "LocalScript" then v:Disable() end
                        end
                    end)
                end
            end
            for k,v in plr.PlayerGui:GetChildren() do 
                v:Destroy()
            end
            for k,v in workspace:GetChildren() do 
                if v.Name ~= plr.Name and v.Name ~= "__THINGS" and v.Name ~= "Camera" and not game.Players:FindFirstChild(v.Name)  then 
                    pcall(function() 
                        v:Destroy()
                    end)
                end
            end
            
            pcall(function() 
                for k,v in workspace.__THINGS:GetChildren() do 
                    if v.Name ~= "Orbs" and v.Name ~= "Pets" and v.Name ~= "__INSTANCE_CONTAINER" then 
                        v:Destroy()
                    end
                end
            end)
            
            pcall(function() 
                workspace.__THINGS.Orbs:ClearAllChildren()
                workspace.__THINGS.Pets:ClearAllChildren()
            end)

            pcall(function() 
                workspace.__THINGS.__INSTANCE_CONTAINER.ServerOwned:Destroy()
            end)

            pcall(function() 
                for k,v in workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite:GetChildren() do 
                    if v.Name ~= "Important" then 
                        v:Destroy()
                    end
                end
            end)

            pcall(function() 
                for k,v in workspace.__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important:GetChildren() do 
                    v:ClearAllChildren()
                end
            end)
        end
    end
    if getgenv().AccMain then 
        if not AccMain.Parent then 
            game.Players.LocalPlayer:Kick() 
        else
            pcall(function() 
                TPNormal(AccMain.Character.HumanoidRootPart.CFrame)
            end)
        end
    end
end

end
