// JP_Organization_Department Example
Instance: jp-organization-department-example-01
InstanceOf: JP_Organization_Department
Title: "JP Core Organization Department Example 内科診療科"
Description: "JP_Organization_Departmentリソースの例。内科診療科を表すOrganization例"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization_Department"
* identifier[0].system = "http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no"
* identifier[=].value = "1234567890"
* type[0] = http://terminology.hl7.org/CodeSystem/organization-type#dept "Hospital Department"
* type[+] = $JP_Department_SsMix_CS#01 "内科"
* name = "第一内科"
* telecom[0].system = #phone
* telecom[=].value = "03-1234-5678"
* telecom[=].use = #work
* partOf = Reference(jp-organization-example-clinic-01)
* partOf.display = "健康第一病院"

Instance: jp-organization-department-example-02
InstanceOf: JP_Organization_Department
Title: "JP Core Organization Department Example 整形外科診療科"
Description: "JP_Organization_Departmentリソースの例。整形外科診療科を表すOrganization例"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization_Department"
* type[0] = http://terminology.hl7.org/CodeSystem/organization-type#dept "Hospital Department"
* type[+] = $JP_Department_SsMix_CS#16 "整形外科"
* name = "整形外科"
* partOf = Reference(jp-organization-example-clinic-01)
* partOf.display = "健康第一病院"
