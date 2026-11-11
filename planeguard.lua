
-- Rescue Helo object
local RescueHelo = RESCUEHELO:New(UNIT:FindByName("CVN-72"), "Planeguard")
RescueHelo:SetRespawnOn()
RescueHelo:SetTakeoffCold()

local RescueHeloActive = false
local InactiveTime = 0
local Timeout = 120 -- seconds

local CarrierZone = ZONE:New("CarrierOps")

-- Spawn the helo initially
RescueHelo:Start()
RescueHeloActive = true

-- Monitor every 10 seconds
SCHEDULER:New(nil,
  function()

    local ActivityDetected = false

    -- Check all blue aircraft
    local AirSet = SET_CLIENT:New():FilterCoalitions("blue"):FilterStart()

    AirSet:ForEachClient(
      function(client)

        local unit = client:GetUnit()

        if unit and unit:IsAlive() then

          local pos = unit:GetVec2()

          if CarrierZone:IsVec2InZone(pos) then

            -- altitude in feet
            local altft = unit:GetAltitude() * 3.28084

            -- deck movement threshold
            local speed = unit:GetVelocityKMH()

            if altft < 2000 then
              ActivityDetected = true
            end

            if speed > 15 then
              ActivityDetected = true
            end

          end
        end
      end
    )

    -- Timer handling
    if ActivityDetected then

      InactiveTime = 0

      -- Restart rescue helo if needed
      if not RescueHeloActive then
        env.info("RESCUEHELO: Restarting Planeguard")

        RescueHelo:Start()
        RescueHeloActive = true
      end

    else

      InactiveTime = InactiveTime + 10

      if InactiveTime >= Timeout and RescueHeloActive then

        env.info("RESCUEHELO: No carrier activity, RTB Planeguard")

        -- Stop the rescue helo system
        RescueHelo:RTB()

        RescueHeloActive = false
      end

    end

  end,
{}, 0, 10)