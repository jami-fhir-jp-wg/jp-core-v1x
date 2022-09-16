// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDispense
Parent: JP_MedicationDispenseBase
Id: jp-medicationdispense
Title: "JP Core MedicationDispense Profile"
Description: "このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense"
* ^status = #active
* ^date = "2022-07-31"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダーに対して薬局システムが対応した結果となる。"
* medication[x] only CodeableConcept
* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^short = "コード集で定義された医薬品コード"
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
* dosageInstruction only JP_MedicationDosage
