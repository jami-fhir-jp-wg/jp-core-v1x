CodeSystem: JP_ProcedureNotPerformedReason_CS
Id: jp-procedure-not-performed-reason-cs
Title: "JP Core Procedure Not Performed Reason CodeSystem"
Description:  "処置が実施されなかった理由、または開始された処置が完了しなかった理由を示すコード"
* ^url = $JP_ProcedureNotPerformedReason_CS
* ^status = #draft
* ^caseSensitive = true
* ^valueSet = $JP_ProcedureNotPerformedReason_VS
* ^content = #complete
// TODO: コードとより適切な用語への見直し
* #JPPNPR001 "処置が禁忌"
* #JPPNPR002 "処置が適応外"
* #JPPNPR003 "処置を拒否、または望まず"
* #JPPNPR004 "処置が継続困難"
* #JPPNPR005 "処置が実施困難"
