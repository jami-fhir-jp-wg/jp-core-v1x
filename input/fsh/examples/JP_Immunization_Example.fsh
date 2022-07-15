Instance: jp-immunization-example-1
InstanceOf: JP_Immunization
Title: "JP Core Immunization 新型コロナワクチン接種"
Description: "新型コロナワクチン接種"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Immunization"
* status = #completed
* vaccineCode = urn:oid:1.2.392.200119.4.403.1#182110901 "コミナティ筋注"
* patient = Reference(Patient/jp-patient-example-1)
* occurrenceDateTime = "2021-07-01T10:30:00+09:00"
* lotNumber = "12345678"
* site = urn:oid:1.2.392.200250.2.2.20.32#74L "左上腕"
* doseQuantity = 0.45 'mL' "mL"
* performer.function = http://terminology.hl7.org/CodeSystem/v2-0443#AP "Administering Provider"
* performer.actor = Reference(Practitioner/jp-practionner-example-male-1) "大阪 一郎"
* protocolApplied.targetDisease = urn:oid:1.2.392.200119.4.101.6#S9VN "ＣＯＶＩＤ－１９"
* protocolApplied.doseNumberPositiveInt = 1