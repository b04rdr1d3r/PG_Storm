-- Set up a basic system for the red side, we'll reside on Sayqal, and use GROUP objects with "R_EW" in the name as EW Radar Systems.
local Redwing = EASYGCICAP:New("Red CAP Operations",AIRBASE.PersianGulf.Lar,"red","R_EW")

-- Add a CAP patrol point belonging to our airbase, we'll be at 20k ft doing 400 kn, initial direction 9180 degrees (East), leg 20NM
Redwing:AddPatrolPointCAP(AIRBASE.PersianGulf.Lar,ZONE:FindByName("R_CAP1"):GetCoordinate(),20000,400,180,20)
-- Add a Squadron with template "SQ-MiG-21-1", 12 airframes, skill average, Modex starting with 11 and skin "Syria (1)"
Redwing:AddSquadron("R_MiG-29_CAP","RCAP1-1",AIRBASE.PersianGulf.Lar,2,AI.Skill.AVERAGE)
-- Redwing:AddSquadron("R_F-5_CAP","RCAP1-2",AIRBASE.PersianGulf.Lar,2,AI.Skill.AVERAGE)

-- CENTRAL
Redwing:AddAirwing(AIRBASE.PersianGulf.Kerman,"RCAP2")
-- Add a CAP patrol point belonging to our airbase, we'll be at 20k ft doing 400 kn, initial direction 9180 degrees (East), leg 20NM
Redwing:AddPatrolPointCAP(AIRBASE.PersianGulf.Kerman,ZONE:FindByName("R_CAP2"):GetCoordinate(),20000,400,180,20)
-- Add a Squadron with template "SQ-MiG-21-1", 12 airframes, skill average, Modex starting with 11 and skin "Syria (1)"
Redwing:AddSquadron("R_F-4_CAP","RCAP2-1",AIRBASE.PersianGulf.Kerman,6,AI.Skill.AVERAGE)
Redwing:AddSquadron("R_MiG-29_CAP","RCAP2-2",AIRBASE.PersianGulf.Kerman,6,AI.Skill.AVERAGE)
Redwing:AddSquadron("R_F-14_CAP","RCAP2-3",AIRBASE.PersianGulf.Kerman,2,AI.Skill.AVERAGE)



-- Add a couple of zones
-- We'll defend our own border
Redwing:AddAcceptZone(ZONE:FindByName( "RedBorder" ))
Redwing:AddAcceptZone(ZONE:FindByName( "RedBorderEast" ))
-- We'll attack intruders also here - conflictzones can overlap borders(!) - limited zone of engagement
Redwing:AddConflictZone(ZONE:FindByName( "ConflictZone" ))
-- We'll leave the reds alone on their turf
Redwing:AddRejectZone(ZONE:FindByName( "BlueBorder" ))

