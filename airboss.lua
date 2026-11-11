-- Airboss
local carrier = UNIT:FindByName("CVN-72")

if carrier then
  MESSAGE:New("Carrier Found",15):ToAll()
else
  MESSAGE:New("Carrier NOT Found",15):ToAll()
end

local airbossCVN=AIRBOSS:New("CVN-72")

airbossCVN:SetSoundfilesFolder("Airboss Soundfiles/")
airbossCVN:SetICLS(11, "CVN")
airbossCVN:SetTACAN(72, "X", "CVN")
airbossCVN:SetLSORadio(264)
airbossCVN:SetMarshalRadio(305)
airbossCVN:AddRecoveryWindow("00:00", "23:59", 1)
airbossCVN:SetAirbossNiceGuy(true)

local recoverytanker = MaulerTanker
if recoverytanker then
  MESSAGE:New("Recovery tanker assigned",15):ToBlue()
else
  MESSAGE:New("ERROR: Recovery tanker NOT Found",15):ToAll()
end
airbossCVN:SetRecoveryTanker(recoverytanker)

airbossCVN:Start()

MessageBLUE = MESSAGE:New( "Airboss Started // LSO: 264 Mhz // Marshall: 305 Mhz")
MessageBLUE:ToBlue()
