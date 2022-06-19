Instance: jp-patient-example-1
InstanceOf: JP_Patient
Title: "JP Core Patient Basic Example"
Description: "JP_Patientリソースの1例"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient"
* identifier.system = "urn:oid:1.2.392.100495.20.3.51.11311234567"
* identifier.value = "00000010"
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].use = #official
* name[=].text = "山田 太郎"
* name[=].family = "山田"
* name[=].given = "太郎"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].use = #official
* name[=].text = "ヤマダ タロウ"
* name[=].family = "ヤマダ"
* name[=].given = "タロウ"
* telecom.system = #phone
* telecom.value = "0312345678"
* telecom.use = #home
* gender = #male
* birthDate = "1970-01-01"
* address.postalCode = "1600023"
* address.text = "東京都新宿区"
