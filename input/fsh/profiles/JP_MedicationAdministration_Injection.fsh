// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationAdministration_Injection
Parent: JP_MedicationAdministrationBase
Id: jp-medicationadministration-injection
Title: "JP Core MedicationAdministration Injection Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、注射薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "患者への注射薬剤投与記録"
* extension contains
    JP_MedicationAdministration_UncategorizedComment named uncategorizedComment ..*
* dosage.extension contains
    JP_MedicationRequest_DosageInstruction_Line named line ..* and
    JP_MedicationAdministration_Dosage_LineComment named lineComment ..* and
    JP_MedicationAdministration_Dosage_DosageComment named dosageComment ..*
* dosage.route.extension contains 
    JP_MedicationAdministration_DosageRoute_RouteComment named routeComment ..*
* dosage.method.extension contains 
    JP_MedicationAdministration_DosageMethod_MethodComment named methodComment ..*
* dosage.rateRatio.extension contains 
    JP_MedicationAdministration_DosageRate_RateComment named rateComment ..*
* dosage.rateQuantity ^short = "【JP Core仕様】未使用"

* medication[x] only Reference