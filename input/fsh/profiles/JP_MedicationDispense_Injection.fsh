// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDispense_Injection
Parent: JP_MedicationDispenseBase
Id: jp-medicationdispense-injection
Title: "JP Core MedicationDispense Injection Profile"
Description: "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection"
* ^status = #draft
* ^date = "2022-03-16"
* ^purpose = "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* dosageInstruction.extension[UsageDuration] 0..0
* dosageInstruction.extension[PeriodOfUse] 0..0