-- lua activation script
-- by Blue Storm 2024
-- to be used for the Cyprus Situation campaign
redIADS = SkynetIADS:create('RED')
redIADS:addSAMSitesByPrefix('R_SAM')
redIADS:addEarlyWarningRadarsByPrefix('R_EW')

local local_goLiveRange = 95
redIADS:getSAMSitesByNatoName('SA-10'):setGoLiveRangeInPercent(local_goLiveRange):setCanEngageHARM(false):setCanEngageAirWeapons(false)
redIADS:getSAMSitesByNatoName('SA-15'):setGoLiveRangeInPercent(local_goLiveRange):setCanEngageHARM(false):setCanEngageAirWeapons(false)
redIADS:getSAMSitesByNatoName('SA-6'):setGoLiveRangeInPercent(local_goLiveRange)
redIADS:getSAMSitesByNatoName('SA-8'):setGoLiveRangeInPercent(local_goLiveRange)
local redCommandCenter = StaticObject.getByName("Red Command Center")
redIADS:addCommandCenter(redCommandCenter)

redIADS:activate()

-- local iadsDebug = redIADS:getDebugSettings()  
-- iadsDebug.IADSStatus = true
-- iadsDebug.contacts = true
-- iadsDebug.jammerProbability = true

blueIADS = SkynetIADS:create('BLUE')
blueIADS:addSAMSitesByPrefix('B_SAM')
blueIADS:addEarlyWarningRadarsByPrefix('B_EW')
blueIADS:activate()
