// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationRequest_Injection
Parent: JP_MedicationRequestBase
Id: jp-medicationrequest-injection
Title: "JP Core MedicationRequest Injection Profile"
Description: "このプロファイルはJP_MedicationRequestBaseリソースに対して、注射薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_Injection"
* ^status = #draft
* ^date = "2022-03-16"
* ^purpose = "このプロファイルはJP_MedicationRequestBaseリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* . ^short = "患者あるいはグループに対しての注射薬剤処方オーダ"
* . ^definition = "患者への薬の供給と注射や点滴の指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。JP_MedicationRequestBaseプロファイルからの派生プロファイルである。"
* medicationReference only Reference(JP_Medication)
* dosageInstruction.extension[PeriodOfUse] ..0
* dosageInstruction.extension[UsageDuration] ..0
* dosageInstruction.timing ^short = "投与タイミング"
* dosageInstruction.timing ^definition = "投与タイミングを記録する。"