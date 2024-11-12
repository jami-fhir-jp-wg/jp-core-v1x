Instance: jp-practitioner-example-female-1
InstanceOf: JP_Practitioner
Title: "JP Core Practitioner Example 医師女性１"
Description: "医師女性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "東京 春子"
* name[=].family = "東京"
* name[=].given = "春子"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "トウキョウ ハルコ"
* name[=].family = "トウキョウ"
* name[=].given = "ハルコ"
* gender = #female
* qualification[0].identifier.system = "urn:oid:1.2.392.100495.20.3.32.113"
* qualification[=].identifier.value  = "999-12345"
* qualification[=].code = $JP_MedicalLicenseCertificate_CS#narcotics-practitioner
* qualification[+].identifier.system = "urn:oid:1.2.392.100495.20.3.32.101"
* qualification[=].identifier.value  = "999-54321"
* qualification[=].code = $JP_MedicalLicenseCertificate_CS#narcotics-practitioner
* qualification[+].identifier.system = $JP_IdSystemMedicalRegistrationNumber
* qualification[=].identifier.value = "999999-00001"
* qualification[=].code = $JP_MedicalLicenseCertificate_CS#medical-registration

Instance: jp-practitioner-example-female-2
InstanceOf: JP_Practitioner
Title: "JP Core Practitioner Example 看護師女性１"
Description: "看護師女性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "福岡 花子"
* name[=].family = "福岡"
* name[=].given = "花子"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "フクオカ ハナコ"
* name[=].family = "フクオカ"
* name[=].given = "ハナコ"
* gender = #female


Instance: jp-practitioner-example-male-1
InstanceOf: JP_Practitioner
Title: "JP Core Practitioner Example 医師男性１"
Description: "医師男性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "大阪 一郎"
* name[=].family = "大阪"
* name[=].given = "一郎"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "オオサカ イチロウ"
* name[=].family = "オオサカ"
* name[=].given = "イチロウ"
* gender = #male
* qualification[0].identifier.system = $JP_IdSystemMedicalRegistrationNumber
* qualification[=].identifier.value = "999999-00001"
* qualification[=].code = $JP_MedicalLicenseCertificate_CS#medical-registration

Instance: jp-practitioner-example-male-2
InstanceOf: JP_Practitioner
Title: "JP Core Practitioner Example 看護師男性１"
Description: "看護師男性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "愛知 太郎"
* name[=].family = "愛知"
* name[=].given = "太郎"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "アイチ タロウ"
* name[=].family = "チバ"
* name[=].given = "タロウ"
* gender = #male
