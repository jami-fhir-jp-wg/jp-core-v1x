Instance: jp-observation-physicalexam-example-1
InstanceOf: JP_Observation_PhysicalExam
Title: "JP Core Observation PhysicalExam Example 身体所見（腹痛）"
Description: "身体所見（腹痛）"
Usage: #example
* status = #final
* category[physicalExam] = $JP_SimpleObservationCategory_CS#exam "Exam"
* code = $JP_PhysicalExamCode_CS#physical-findings "Physical Findings"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2021-07-09T17:00:00+09:00"
* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v2-0532#Y "Yes"
//TODO: コーディング不明のためTextで回避
* bodySite.text = "下腹部"
//TODO: コーディング不明のためTextで回避
* method.text = "触診"
* component.code = $JP_PhysicalExamCode_CS#detailed-physical-findings "Detailed Physical Findings"
* component.valueString = "圧痛あり"