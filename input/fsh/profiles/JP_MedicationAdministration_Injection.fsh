// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationAdministration_Injection
Parent: JP_MedicationAdministration
Id: jp-medicationadministration-injection
Title: "JP Core MedicationAdministration Injection Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、注射薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
// extension 参照宣言
* extension contains JP_MedicationAdministration_UncategorizedComment named uncategorizedComment ..*
* dosage.extension contains
    JP_MedicationRequest_DosageInstruction_Line named line ..* and
    JP_MedicationAdministration_Dosage_LineComment named lineComment ..* and
    JP_MedicationAdministration_Dosage_DosageComment named dosageComment ..*
* dosage.site.extension contains JP_MedicationAdministration_DosageSite_SiteComment named siteComment ..*
* dosage.route.extension contains JP_MedicationAdministration_DosageRoute_RouteComment named routeComment ..*
* dosage.method.extension contains JP_MedicationAdministration_DosageMethod_MethodComment named methodComment ..*
* dosage.rateRatio.extension contains JP_MedicationAdministration_DosageRate_RateComment named rateComment ..*
// 
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection"
* ^status = #draft
* ^date = "2022-03-16"
* ^purpose = "このプロファイルはMedicationAdministrationリソースに対して、注射薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* . ^short = "患者への注射薬剤投与記録"
* extension[uncategorizedComment] ^definition = "未分類コメントを格納するための拡張"
* dosage.extension ^slicing.discriminator.type = #value
* dosage.extension ^slicing.discriminator.path = "url"
* dosage.extension ^slicing.rules = #open
* dosage.extension[lineComment] ^short = "ラインコメント"
* dosage.extension[lineComment] ^definition = "ラインコメントを格納するための拡張"
* dosage.extension[dosageComment] ^short = "用法コメント"
* dosage.extension[dosageComment] ^definition = "用法コメントを格納するための拡張"
* dosage.site.extension ^slicing.discriminator.type = #value
* dosage.site.extension ^slicing.discriminator.path = "url"
* dosage.site.extension ^slicing.rules = #open
* dosage.site.extension[siteComment] ^short = "投与部位コメント"
* dosage.site.extension[siteComment] ^definition = "投与部位コメントを格納するための拡張"
* dosage.route.extension ^slicing.discriminator.type = #value
* dosage.route.extension ^slicing.discriminator.path = "url"
* dosage.route.extension ^slicing.rules = #open
* dosage.route.extension[routeComment] ^short = "投与経路コメント"
* dosage.route.extension[routeComment] ^definition = "投与経路コメントを格納するための拡張"
* dosage.method.extension ^slicing.discriminator.type = #value
* dosage.method.extension ^slicing.discriminator.path = "url"
* dosage.method.extension ^slicing.rules = #open
* dosage.rateRatio.extension ^slicing.discriminator.type = #value
* dosage.rateRatio.extension ^slicing.discriminator.path = "url"
* dosage.rateRatio.extension ^slicing.rules = #open
* dosage.rateQuantity ^short = "JP Coreでは未使用"
