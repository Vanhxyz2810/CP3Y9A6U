local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local PlayerControl = require(game:GetService("ReplicatedFirst").Classes.PlayerControl)
local request = http_request or request or syn.request or false

if not request then
    return game.Players.LocalPlayer:Kick("Exploit not support!")
end

local function url_encode(str)
    if (str) then
        str = string.gsub(str, " ", "%%20") 
    end
    return str
end

local function GetData()
    return PlayerControl.AllPlayerControls[game.Players.LocalPlayer].Inventory
end

function GetUnitData()
    local Data = game:GetService("ReplicatedStorage").Remotes.GetInventory:InvokeServer()
    return Data.Units, Data.EquippedUnits
end

local function parseData(data)
    local Units, EquippedUnits = GetUnitData()

    -- Initialize an empty table to store the types of equipped units
    local equippedUnitTypes = {}

    -- Loop through each UUID in EquippedUnits and add the corresponding unit's type to the table
    for _, uuid in ipairs(EquippedUnits) do
        local unit = Units[uuid]
        if unit then
            table.insert(equippedUnitTypes, unit.Type)
        end
    end

    -- Concatenate the unit types into a single string separated by ", "
    local equippedUnitsString = table.concat(equippedUnitTypes, ", ")

    return {
        ["Key"] = getgenv().Key or scriptkey,
        ["Username"] = Players.LocalPlayer.Name,
        ["Level"] = data["Level"],
        ["Gem"] = data["Currencies"]["Gems"],
        ["Gold"] = data["Currencies"]["Gold"],
        ["Risky Dice"] = data["Items"]["Risky Dice"] or 0,
        ["Trait Crystal"] = data["Items"]["Trait Crystal"] or 0,
        ["Frost Bind"] = data["Items"]["Frost Bind"] or 0,
        ["Unit"] = url_encode(equippedUnitsString),
        ["Timestamp"] = tick()
    }
end

local function mqs(data)
    local qs = ""
    for k, v in pairs(data) do
        qs = qs .. string.lower(tostring(string.gsub(k, " ", ""))) .. "=" .. v .. "&"
    end

    return qs:sub(1, #qs - 1)
end

local function sendRequest(data)
    local qs = mqs(data)
    local url = "https://dvctool.xyz/api/upload_trackstat.php?" .. qs
    print(url)
    local response = request({
        Url = url,
        Method = "GET",
        headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded",
        }
    })
end

while true do
    local data = parseData(GetData())
    sendRequest(data)

    task.wait(120)
end
