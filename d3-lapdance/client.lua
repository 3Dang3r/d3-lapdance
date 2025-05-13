local QWHub = exports['qw-players']:GetCoreObject()
local InLapdance = false
local InCooldown = false
local NearText = false
local NearMarker = false



RegisterNetEvent('d3-lapdamce:paybitch', function(data)
	TriggerServerEvent('d3-lapdance:buy')
end) 
-- for qb-target use


RegisterNetEvent('d3-lapdance:lapdance')
AddEventHandler('d3-lapdance:lapdance', function(PlayerMoney, PlayerBirthdate, TodayDate)
	local Player = PlayerPedId()
	Birthdate = {}
	Date = {}

		
	RequestModel(1846523796)
	InCooldown = true
	TriggerServerEvent('d3-lapdance:active')
	while not HasModelLoaded(1846523796) do
		Wait(20)
	end

	SetEntityHeading(Player, 120.18)
	local SpawnObject = CreatePed(4, 1846523796, 116.59, -1301.04, 28.05)
	SetPedComponentVariation(SpawnObject, 1, 0) -- Head
	SetPedComponentVariation(SpawnObject, 2, 0) -- Hair
	SetPedComponentVariation(SpawnObject, 3, 0) -- Torso
	SetPedComponentVariation(SpawnObject, 4, 1) -- Shooes
	SetPedComponentVariation(SpawnObject, 6, 0) -- Underwear
	SetPedComponentVariation(SpawnObject, 10, 0) -- Decals ??
	SetPedComponentVariation(SpawnObject, 11, 0) -- Auxiliary parts for torso
    SetPedComponentVariation(SpawnObject, 8, 1) -- Topless
	SetPedComponentVariation(SpawnObject, 9, 0)


	RequestAnimDict("mini@strip_club@idles@stripper")
	while not HasAnimDictLoaded("mini@strip_club@idles@stripper") do
		Citizen.Wait(20)
	end
	TaskPlayAnim(SpawnObject, "mini@strip_club@idles@stripper", "stripper_idle_02", 8.0, -8.0, -1, 0, 0, false, false, false)

	InLapdance = true

	SetEntityCoords(Player, 116.88, -1295.04, 28.42)
	SetEntityHeading(SpawnObject, 303.19)
	FreezeEntityPosition(SpawnObject, true)
	TaskGoToCoordAnyMeans(Player, 118.29, -1301.43, 28.42, 1.0, 0, 0, 786603, 1.0)
	Citizen.Wait(4900)

	FreezeEntityPosition(SpawnObject, false)
	TaskGoToCoordAnyMeans(SpawnObject, 118.0, -1300.3, 28.17, 174.93, 0, 0, 0, 0xbf800000)
	Citizen.Wait(2000)

	TaskGoToCoordAnyMeans(SpawnObject, 118.74, -1301.91, 29.27, 174.93, 0, 0, 0, 0xbf800000)
	Citizen.Wait(2100)

	FreezeEntityPosition(SpawnObject, true)
	SetEntityHeading(SpawnObject, 216.6)
	RequestAnimDict("mini@strip_club@private_dance@part2")
	while not HasAnimDictLoaded("mini@strip_club@private_dance@part2") do
		Citizen.Wait(20)
	end
	TaskPlayAnim(SpawnObject, "mini@strip_club@private_dance@part2", "priv_dance_p2", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(30000)

	RequestAnimDict("mini@strip_club@backroom@")
	while not HasAnimDictLoaded("mini@strip_club@backroom@") do
		Citizen.Wait(20)
	end
	TaskPlayAnim(SpawnObject, "mini@strip_club@backroom@", "stripper_b_backroom_idle_b", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(5000)

	FreezeEntityPosition(SpawnObject, false)
	TaskGoToCoordAnyMeans(SpawnObject, 116.59, -1301.04, 28.17, 174.93, 0, 0, 0, 0xbf800000)
	Citizen.Wait(2000)

	RequestAnimDict("mini@strip_club@idles@stripper")
	while not HasAnimDictLoaded("mini@strip_club@idles@stripper") do
		Citizen.Wait(20)
	end
	TaskPlayAnim(SpawnObject, "mini@strip_club@idles@stripper", "stripper_idle_02", 8.0, -8.0, -1, 0, 0, false, false, false)
	SetEntityHeading(SpawnObject, 308.6)

	InLapdance = false

	Citizen.Wait(10000)

	InCooldown = false
	TriggerServerEvent('d3-lapdance:idle')

	DeleteEntity(SpawnObject)
end)

Citizen.CreateThread(function()

	while true do

		if not InLapdance then
			Citizen.Wait(1000)
		else
			Citizen.Wait(0)
		end

		if InLapdance then
			SetFollowPedCamViewMode(4)
			DisableControlAction(2, 24, true)
			DisableControlAction(2, 257, true)
			DisableControlAction(2, 25, true)
			DisableControlAction(2, 263, true)
			DisableControlAction(2, 32, true)
			DisableControlAction(2, 34, true)
			DisableControlAction(2, 8, true)
			DisableControlAction(2, 9, true)
		end
	end
end)

Citizen.CreateThread(function()

	while true do

		if not InLapdance then
			Citizen.Wait(1000)
		else
			Citizen.Wait(0)
		end
	
		local Player = PlayerPedId()
		local coords = GetEntityCoords(Player)
		local sitdist = #(coords - vector3(118.75, -1301.97, 28.42))
		if sitdist < 1.5 and InLapdance then
		
			local dict = "mini@strip_club@lap_dance_2g@ld_2g_reach"
			RequestAnimDict(dict)
				while not HasAnimDictLoaded(dict) do
					Citizen.Wait(20)
				end
			SetEntityCoords(Player, 119.06, -1302.66, 27.78)
			FreezeEntityPosition(Player, true)
			SetEntityHeading(Player, 40.0)
			TaskPlayAnim(Player, dict, "ld_2g_sit_idle", 8.0, -8.0, -1, 0, 0, false, false, false)
			repeat
			TaskPlayAnim(Player, dict, "ld_2g_sit_idle", 8.0, -8.0, -1, 0, 0, false, false, false)
			Citizen.Wait(550)
			until(InLapdance == false)
			FreezeEntityPosition(Player, false)
			SetEntityCoords(Player, 118.75, -1301.99, 28.42)
			Citizen.Wait(200)
			TaskGoToCoordAnyMeans(Player, 117.48, -1294.82, 28.43, 1.0, 0, 0, 786603, 1.0)
			Citizen.Wait(5800)
		end
	end
end)