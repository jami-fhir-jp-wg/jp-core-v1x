Instance: jp-medicationstatement-example-1
InstanceOf: JP_MedicationStatement
Title: "JP Core MedicationStatement Example 服薬情報 ムコダイン錠２５０ｍｇ"
Description: "服薬情報 ムコダイン錠２５０ｍｇ"
Usage: #example
* status = #completed
* medicationCodeableConcept = $JP_MedicationCodeHOT9_CS#103835401 "ムコダイン錠２５０ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* effectivePeriod.start = "2020-04-01T00:00:00+09:00"
* effectivePeriod.end = "2020-04-14T00:00:00+09:00"
* dateAsserted = "2020-05-01T12:28:17+09:00"
* informationSource = Reference(Patient/jp-patient-example-1)
* derivedFrom = Reference(Patient/jp-medicationrequest-example-1)
* reasonCode = urn:oid:1.2.392.200119.4.101.6#TQ7A "急性気管支炎"
* dosage.text = "内服・経口・１日３回朝昼夕食後"
* dosage.timing.code = $JP_MedicationUsageJAMI_CS#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosage.route = $JP_MedicationRouteHL70162_CS#PO "口"
* dosage.method = $JP_MedicationMethodJAMIDetailUsage_CS#10 "経口"
* dosage.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosage.doseAndRate.doseQuantity = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosage.doseAndRate.rateRatio.numerator = 3 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dosage.doseAndRate.rateRatio.denominator = 1 http://unitsofmeasure.org#d "日"
