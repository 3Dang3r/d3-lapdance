local QBCore = exports['qb-core']:GetCoreObject()
local LapDanceActive = false
local NotEnoughMoney = "You do not have enough money. A lap dance costs 250$"
local StripperPause = "The stripper needs some rest!"
local StripperActive = "The stripper is already busy!"
local BoughtLapdance = "You just bought a lap dance for 100$"

RegisterServerEvent('d3-lapdance:buy')
AddEventHandler('d3-lapdance:buy', function()
    local src = source
    local Cost = 250 
    local TodayDate = os.date("%Y-%m-%d")

    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerMoney = Player and Player.PlayerData and Player.PlayerData.money and Player.PlayerData.money.cash

    if not Player or not PlayerMoney or PlayerMoney < Cost or LapDanceActive then
        local msg = LapDanceActive and StripperActive or NotEnoughMoney
        TriggerClientEvent('QBCore:Notify', src, msg, "error", 1700)
        return
    end

    Player.Functions.RemoveMoney("cash", Cost)
    TriggerClientEvent('QBCore:Notify', src, BoughtLapdance, "success", 1700)
    TriggerClientEvent('d3-lapdance:lapdance', src, PlayerMoney)
end)

RegisterServerEvent('d3-lapdance:active')
AddEventHandler('d3-lapdance:active', function()
    LapDanceActive = true
end)

RegisterServerEvent('d3-lapdance:idle')
AddEventHandler('d3-lapdance:idle', function()
    LapDanceActive = false
end)
