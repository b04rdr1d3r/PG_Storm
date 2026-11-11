-- RecoveryTanker.lua
MaulerTanker=RECOVERYTANKER:New(UNIT:FindByName("CVN-72"), "recoverytanker")
MaulerTanker:SetTakeoffHot()
MaulerTanker:SetTACAN(22, "TKR")
MaulerTanker:SetRadio(322)

MaulerTanker:Start()

MessageBLUE = MESSAGE:New( "Recovery Tanker started on CVN-72 on 322 Mhz")
MessageBLUE:ToBlue()