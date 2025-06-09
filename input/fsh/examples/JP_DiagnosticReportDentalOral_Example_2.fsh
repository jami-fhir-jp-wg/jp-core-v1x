Instance: jp-diagnosticreport-dentaloral-example-ecs
InstanceOf: JP_DiagnosticReport_DentalOral
Title: "JP Core DiagnosticReport DentalOral Example 口腔診査レポート(eCS版)"
Description: "初診時口腔診査"
Usage: #example
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2><span title=\"Codes: {http://loinc.org LP31759-1}\">DiagnosticReport DentalOral </span> (<span title=\"Codes: {http://loinc.org 32453-3}\">Physical findings of Mouth</span>)</h2><table class=\"grid\"><tr><td>Subject</td><td><b>山田 太郎</b> male, DoB: 1970-01-01 ( id:000000010)</td></tr><tr><td>When For</td><td>2022-10-01</td></tr><tr><td>Reported</td><td>2022-10-24 17:30:00+09:00</td></tr><tr><td>Identifier:</td><td> id:0123456(use:USUAL)</td></tr></table><h3>Report Details</h3><p><b><big>【初診時口腔診査】</big></b></p></div>"
* identifier.use = #usual
* identifier.system = $JP_IdSystem_PrescriptionDocumentID
* identifier.value = "123456"
* status = #final
* category[first] = $Loinc_CS#LP31759-1 "DENTAL"
* code = $JP_DocumentCodes_CS#32453-3 "口腔診査報告書"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* resultsInterpreter = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* result[0] = Reference(Observation/jp-observation-dentaloral-toothexistence-example-ecs1) "検査7"
* result[+] = Reference(Observation/jp-observation-dentaloral-toothtreatment-example-ecs1) "検査8"
* conclusion = "歯冠破折(傷病名コード：5218009）"

Instance: jp-observation-dentaloral-toothexistence-example-ecs1
InstanceOf: JP_Observation_DentalOral_ToothExistence
Title: "JP Core Observation DentalOral Tooth Existence Example 口腔診査結果7（複数歯の有無）"
Description: "口腔診査結果7（複数歯の有無）"
Usage: #example
* status = #final
* category[first].coding.code = #exam
* category[first].coding.display = "exam"
* category[second].coding.code = #LP89803-8
* category[second].coding.display = "Dental"
* category[third].coding.code = #DO-1-01
* category[third].coding.display = "ToothExistence"
* category.text = "歯の有無"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* valueCodeableConcept = $JP_DentalFundamentalStatus_CS#TB-3-0 "現存歯"
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* hasMember = Reference(Observation/jp-observation-dentaloral-toothtreatmentcondition-example-ecs1)
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* extension[structure][0].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS"
* extension[structure][0].valueCodeableConcept.coding.code = #TB-2-1042
* extension[structure][0].valueCodeableConcept.coding.display = "右側下顎側切歯"
* extension[structure][+].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS"
* extension[structure][=].valueCodeableConcept.coding.code = #TB-2-1041
* extension[structure][=].valueCodeableConcept.coding.display = "右側下顎中切歯"


Instance: jp-observation-dentaloral-toothtreatmentcondition-example-ecs1
InstanceOf: JP_Observation_DentalOral_ToothTreatmentCondition
Title: "JP Core Observation DentalOral Tooth Treatment Condition Example 口腔診査結果8（現存複数歯の処置状態）"
Description: "口腔診査結果8（現存複数歯の処置状態）"
Usage: #example
* status = #final
* category[first].coding.code = #exam
* category[first].coding.display = "exam"
* category[second].coding.code = #LP89803-8
* category[second].coding.display = "Dental"
* category[third].coding.code = #DO-1-02
* category[third].coding.display = "ToothTreatmentCondition"
* category.text = "現存歯の処置状態"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* extension[structure][0].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS"
* extension[structure][=].valueCodeableConcept.coding.code = #TB-2-1042
* extension[structure][=].valueCodeableConcept.coding.display = "右側下顎側切歯"
* extension[structure][+].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS"
* extension[structure][=].valueCodeableConcept.coding.code = #TB-2-1041
* extension[structure][=].valueCodeableConcept.coding.display = "右側下顎中切歯"
* bodySite.extension[bodyStructure][+].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/ValueSet/JP_DentalBodyStructure_VS"
* bodySite.extension[bodyStructure][=].valueCodeableConcept.coding.code = "TP-18-01"
* bodySite.extension[bodyStructure][=].valueCodeableConcept.coding.display = "歯冠部"
* component[0].valueCodeableConcept.coding.system = $JP_DentalPresentTeethObservation_CS
* component[=].valueCodeableConcept.coding.code = #TP09-15
* component[=].valueCodeableConcept.coding.display = "歯の破折（ＦｒＴ）"
