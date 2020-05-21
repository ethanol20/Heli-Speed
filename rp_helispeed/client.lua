-- Code orginally from Vespura | Edited and fixed up by ethanol20#4434
-- https://forum.cfx.re/t/wip-helicopter-start-script/83319/25
-- Join my Discord for more awesome scripts and to submit your ideas so i can make them!
-- https://discord.gg/SQXvn5a

-- This is the thread that does it all!!

local upkey = 172 -- CHANGE THIS TO WHATEVER TO ACCELERATE 
local downkey = 173 -- CHANGE THIS TO WHATEVER TO ACCELERATE DOWN

Citizen.CreateThread(function()
    local speed = 0.05
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId(-1)
        local veh = GetVehiclePedIsIn(ped)
        if IsPedInAnyHeli(ped) and not IsEntityDead(ped) then
            SetHeliBladesSpeed(veh, speed)
            if IsControlJustPressed(0, upkey) then
                speed = speed + 0.05
            elseif IsControlJustPressed(0, downkey) then
                speed = speed - 0.05
            end
                if speed > 1.0 then speed = 1.0 end
                if speed < 0.0 then speed = 0.0 end
                    ShowText(tostring(speed), {255, 255, 255, 255}, 0.11, 0.8852, 0.43)
                    DrawRect(0.133, 0.9, 0.046, 0.03, 0, 0, 0, 150)
                end
                if IsEntityDead(ped) then speed = 0.05 end
        end
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
