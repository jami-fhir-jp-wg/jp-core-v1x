// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDispense
Parent: JP_MedicationDispenseBase
Id: jp-medicationdispense
Title: "JP Core MedicationDispense Profile"
Description: "このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダーに対して薬局システムが対応した結果となる。"
* medication[x] only CodeableConcept
* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
* medicationCodeableConcept.coding 1..
* medicationCodeableConcept.coding ^short = "Code defined by a terminology system コード集で定義された医薬品コード"
* medicationCodeableConcept.coding ^definition = "A reference to a code defined by a terminology system.\r\n\r\nコード集で定義された医薬品コードへの情報"
* medicationCodeableConcept.coding ^comment = "Codes may be defined very casually in enumerations, or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.  Ordering of codings is undefined and SHALL NOT be used to infer meaning. Generally, at most only one of the coding values will be labeled as UserSelected = true.\r\n"
* medicationCodeableConcept.coding.system 1..
* medicationCodeableConcept.coding.code 1..
* dosageInstruction only JP_MedicationDosage
