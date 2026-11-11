-- ATIS_PG.lua
atisAl_Dhafra_AFB = ATIS:New("Al Dhafra AFB", 144.0)
atisAl_Dhafra_AFB:SetTACAN(96)
atisAl_Dhafra_AFB:SetRadioRelayUnitName("Radio_Relay_Al_Dhafra")
atisAl_Dhafra_AFB:SetActiveRunway("31R")
atisAl_Dhafra_AFB:SetTowerFrequencies({251.100, 126.500})
atisAl_Dhafra_AFB:AddILS(109.7, "31R")
atisAl_Dhafra_AFB:Start()

MessageBLUE = MESSAGE:New( "ATIS Started on Al Dhafra AFB on 144 Mhz")
MessageBLUE:ToBlue()