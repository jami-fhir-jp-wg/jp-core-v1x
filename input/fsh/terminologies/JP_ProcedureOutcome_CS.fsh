CodeSystem: JP_ProcedureOutcome_CS
Id: jp-procedure-outcome-cs
Title: "JP Core Procedure Outcome CodeSystem"
Description: "処置が実施されたアウトカムを示すコードシステム"
* ^url = $JP_ProcedureOutcome_CS
* ^status = #draft
* ^caseSensitive = true
* ^valueSet = $JP_ProcedureOutcome_VS
* ^content = #complete
// TODO: より適切なコードと用語に見直し
* #JPPOC001 "成功"
* #JPPOC002 "不成功"
* #JPPOC003 "一部成功"
