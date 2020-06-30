-- Code orginally from Vespura | Edited and fixed up by ethanol20#4434
-- https://forum.cfx.re/t/wip-helicopter-start-script/83319/25
-- Join my Discord for more awesome scripts and to submit your ideas so i can make them!
-- https://discord.gg/SQXvn5a

local upkey = 172 -- CHANGE THIS TO WHATEVER TO ACCELERATE 
local downkey = 173 -- CHANGE THIS TO WHATEVER TO ACCELERATE DOWN
local id = nil
local speed = 0.05
-- This is the thread that does it all!!

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if IsPedInAnyHeli(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
		veh = GetVehiclePedIsIn(PlayerPedId())
		id = NetworkGetNetworkIdFromEntity(veh)
        if IsControlJustPressed(0, upkey) then
			speed = speed + 0.05
			TriggerServerEvent('SyncSpeed', id, speed)
        elseif IsControlJustPressed(0, downkey) then
			speed = speed - 0.05
			TriggerServerEvent('SyncSpeed', id, speed)
        end
            if speed > 1.0 then speed = 1.0 end
            if speed < 0.0 then speed = 0.0 end
                ShowText(tostring(speed), {255, 255, 255, 255}, 0.11, 0.8852, 0.43)
                DrawRect(0.133, 0.9, 0.046, 0.03, 0, 0, 0, 150)
            end
        if not IsPedInAnyHeli(PlayerPedId()) then 
			speed = 0.05 
		end
		SetHeliBladesSpeed(veh, speed)
		--print(speed)
    end
end)

RegisterNetEvent('SyncClient')
AddEventHandler('SyncClient', function(id, speed)
	speed = speed
	veh = NetworkGetEntityFromNetworkId(id)
	id = veh
	SetHeliBladesSpeed(veh, speed)
end)

-- Functions that shows the speed string

function ShowText(text, color, x, y, size)
    SetTextFont(4)
    SetTextScale(1.0, size)
    SetTextJustification(1)
    SetTextColour(table.unpack(color))
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName("BLADES: " .. text) 
    EndTextCommandDisplayText(x, y)
    DrawRect(0.133, 0.9, 0.046, 0.03, 0, 0, 0, 150)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		SetDispatchTimeBetweenSpawnAttempts(2, 0)
		SetDispatchTimeBetweenSpawnAttemptsMultiplier(2, 0)
		RemoveMultiplayerBankCash()
		RemoveMultiplayerHudCash()
		RemoveMultiplayerWalletCash()
		SetAmbientPedRangeMultiplierThisFrame(1.0)
		SetPedDensityMultiplierThisFrame(1.0, 1.0)
		SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
		SetAmbientVehicleRangeMultiplierThisFrame(1.0)
		SetParkedVehicleDensityMultiplierThisFrame(1.0)
		SetRandomVehicleDensityMultiplierThisFrame(1.0)
		SetVehicleDensityMultiplierThisFrame(1.0)
		
	end
end)
