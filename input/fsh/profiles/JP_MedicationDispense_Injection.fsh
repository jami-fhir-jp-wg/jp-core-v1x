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
* . ^short = "指定された患者への注射薬剤の払い出し"
* . ^definition = "指定された患者・個人へ注射薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や注射薬剤の服用に関する指示も含まれる。薬剤払い出しは注射オーダーに対して薬局システムが対応した結果となる。"
* dosageInstruction.extension[UsageDuration] ..0
* dosageInstruction.extension[PeriodOfUse] ..0
