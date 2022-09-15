// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationAdministration
Parent: JP_MedicationAdministrationBase
Id: jp-medicationadministration
Title: "JP Core MedicationAdministration Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、内服・外用薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration"
* ^status = #draft
* ^date = "2022-03-16"
* medication[x] only CodeableConcept
* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
* medicationCodeableConcept.coding 1..
* medicationCodeableConcept.coding ^short = "Code defined by a terminology system コード集で定義された医薬品コード"
* medicationCodeableConcept.coding ^definition = "A reference to a code defined by a terminology system.\r\n\r\nコード集で定義された医薬品コードへの情報"
* medicationCodeableConcept.coding ^comment = "Codes may be defined very casually in enumerations, or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.  Ordering of codings is undefined and SHALL NOT be used to infer meaning. Generally, at most only one of the coding values will be labeled as UserSelected = true.\r\n"
* medicationCodeableConcept.coding.system 1..
* medicationCodeableConcept.coding.code 1..

* dosage.rateRatio only JP_MedicationRatio_DosePerPeriod
* dosage.rateQuantity only JP_MedicationSimpleQuantity
