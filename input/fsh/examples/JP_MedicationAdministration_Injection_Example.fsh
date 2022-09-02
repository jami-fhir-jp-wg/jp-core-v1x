Instance: jp-medicationadministration-injection-example-1
InstanceOf: JP_MedicationAdministration_Injection
Title: "JP Core MedicationAdministration Injection Example 注射実施 ワンショット静脈注射"
Description: "注射実施 ワンショット静脈注射"
Usage: #example
* contained[0] = jp-medicationadministration-injection-medication-example-1
* contained[+] = jp-medicationadministration-injection-bodystructure-example-1
* contained[+] = jp-medicationadministration-injection-device-example-1
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* extension[=].valueCodeableConcept = urn:oid:1.2.392.100495.20.2.51#01 "内科"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* extension[=].valueReference = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* extension[=].valueDateTime = "2016-07-01T00:00:00+09:00"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location"
* extension[=].valueReference = Reference(Location/jp-location-example-ward) "09A病棟 021病室 4ベッド"
* identifier[0].system = "http://www.example.com/fhir/order-number"
* identifier[=].value = "123456789012345.1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* medicationReference = Reference(Medication/jp-medicationadministration-injection-medication-example-1)
* subject = Reference(Patient/jp-patient-example-1)
* effectivePeriod.start = "2016-07-01T10:05:21+09:00"
* effectivePeriod.end = "2016-07-01T10:05:21+09:00"
* performer.function = http://terminology.hl7.org/CodeSystem/med-admin-perform-function#performer "Performer"
* performer.actor = Reference(Practitioner/jp-practitioner-example-male-1) "愛知 太郎"
* request = Reference(MedicationRequest/jp-medicationrequest-injection-example-1)
* device = Reference(Device/jp-medicationadministration-injection-device-example-1) "シリンジ"
* dosage.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment"
* dosage.extension.valueString = "痙攣が発生したため、主治医に確認の上実施しました"
* dosage.site.extension[0].url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosage.site.extension[=].valueReference = Reference(BodyStructure/jp-medicationadministration-injection-bodystructure-example-1) "右腕"
* dosage.site.extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageSite_SiteComment"
* dosage.site.extension[=].valueString = "左利きのため"
* dosage.route = http://terminology.hl7.org/CodeSystem/v2-0162#IV "Intravenous"
* dosage.method.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageMethod_MethodComment"
* dosage.method.extension.valueString = "１分ほどかけて緩徐に行いました"
* dosage.method = http://jpfhir.jp/medication/99ILL#101 "静注(末梢)"
* dosage.dose = 2 'mL' "mL"

Instance: jp-medicationadministration-injection-example-2
InstanceOf: JP_MedicationAdministration_Injection
Title: "JP Core MedicationAdministration Injection Example 注射実施 点滴注射"
Description: "注射実施 点滴注射"
Usage: #example
* contained[0] = jp-medicationadministration-injection-medication-example-2
* contained[+] = jp-medicationadministration-injection-bodystructure-example-2
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* extension[=].valueCodeableConcept = urn:oid:1.2.392.100495.20.2.51#01 "内科"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* extension[=].valueReference = Reference(Practitioner/jp-practitioner-example-female-1) "東京 春子"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* extension[=].valueDateTime = "2016-07-01T00:00:00+09:00"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location"
* extension[=].valueReference = Reference(Location/jp-location-example-ward) "09A病棟 021病室 4ベッド"
* identifier[0].system = "http://www.example.com/fhir/order-number"
* identifier[=].value = "123456789012345.2"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "2"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "2"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* medicationReference = Reference(Medication/jp-medicationadministration-injection-medication-example-2)
* subject = Reference(Patient/jp-patient-example-1)
* effectivePeriod.start = "2016-07-01T08:05:21+09:00"
* effectivePeriod.end = "2016-07-01T13:05:43+09:00"
* performer.function = http://terminology.hl7.org/CodeSystem/med-admin-perform-function#performer "Performer"
* performer.actor = Reference(Practitioner/jp-practitioner-example-female-1) "福岡 花子"
* request = Reference(MedicationRequest/jp-medicationrequest-injection-example-2)
* dosage.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line"
* dosage.extension.valueCodeableConcept = http://jpfhir.jp/medication/99ILL#01 "主管"
* dosage.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosage.site.extension.valueReference = Reference(BodyStructure/jp-medicationadministration-injection-bodystructure-example-2) "左腕"
* dosage.route = http://terminology.hl7.org/CodeSystem/v2-0162#IV "Intravenous"
* dosage.method = http://terminology.hl7.org/CodeSystem/v2-0165#IVP "IV Push"
* dosage.dose = 510 'mL' "mL"
* dosage.rateRatio.numerator = 102 'mL' "mL" 
* dosage.rateRatio.denominator = 1 'h' "h"

Instance: jp-medicationadministration-injection-medication-example-1
InstanceOf: JP_Medication
Title: "JP Medication 薬剤　ホリゾン注射液"
Description: "ホリゾン注射液"
Usage: #inline
* status = #active
* ingredient.itemCodeableConcept = urn:oid:1.2.392.200119.4.403.1#100558502 "ホリゾン注射液１０ｍｇ"
* ingredient.strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient.strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#TIME "回"

Instance: jp-medicationadministration-injection-medication-example-2
InstanceOf: JP_Medication
Title: "JP_Medication ソリタ－＋アドナ注"
Description: "ソリタ－＋アドナ注"
Usage: #inline
* status = #active
* ingredient[0].itemCodeableConcept = urn:oid:1.2.392.200119.4.403.1#107750602 "ソリタ－Ｔ３号輸液５００ｍＬ"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#HON "本"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#TIME "回"
* ingredient[+].itemCodeableConcept = urn:oid:1.2.392.200119.4.403.1#108010001 "アドナ注（静脈用）５０ｍｇ／１０ｍＬ"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#TIME "回"

Instance: jp-medicationadministration-injection-bodystructure-example-1
InstanceOf: BodyStructure
Title: "BodyStructure 右腕"
Description: "右腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#R "Right"
* patient = Reference(Patient/jp-patient-example-1)

Instance: jp-medicationadministration-injection-bodystructure-example-2
InstanceOf: BodyStructure
Title: "BodyStructure 左腕"
Description: "左腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#L "Left"
* patient = Reference(Patient/jp-patient-example-1)

Instance: jp-medicationadministration-injection-device-example-1
InstanceOf: Device
Usage: #inline
* type = http://jpfhir.jp/medication/99ILL#01 "シリンジ"