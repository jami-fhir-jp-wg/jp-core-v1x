// JP_Organization_Department Example
Instance: jp-organization-department-example-01
InstanceOf: JP_Organization_Department
Title: "JP Core Organization Department Example 内科診療科（ローカルコード使用）"
Description: "JP_Organization_Departmentリソースの例。内科診療科を表すOrganization例。医療機関固有の診療科コード（ローカルコード）を使用している。"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization_Department"
// ローカル診療科コード（医療機関コード1312345670の場合）
* identifier[0].system = "http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/11312345670"
* identifier[=].value = "DEPT-001"
* identifier[=].assigner = Reference(jp-organization-example-hospital)
* identifier[=].assigner.display = "健康第一病院"
* type[departmentType].coding[0] = http://terminology.hl7.org/CodeSystem/organization-type#dept "Hospital Department"
* type[departmentType].coding[+] = $JP_Department_SsMix_CS#01 "内科"
* name = "第一内科"
* telecom[0].system = #phone
* telecom[=].value = "03-1234-5678"
* telecom[=].use = #work
* partOf = Reference(jp-organization-example-hospital)
* partOf.display = "健康第一病院"

Instance: jp-organization-department-example-02
InstanceOf: JP_Organization_Department
Title: "JP Core Organization Department Example 整形外科診療科（SS-MIX2コード使用）"
Description: "JP_Organization_Departmentリソースの例。整形外科診療科を表すOrganization例。SS-MIX2標準診療科コードを使用している。"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization_Department"
// SS-MIX2標準診療科コード
* identifier[ssmixDepartmentCode].system = "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment"
* identifier[ssmixDepartmentCode].value = "07"
* type[departmentType].coding[0] = http://terminology.hl7.org/CodeSystem/organization-type#dept "Hospital Department"
* type[departmentType].coding[+] = $JP_Department_SsMix_CS#07 "整形外科"
* name = "整形外科"
* partOf = Reference(jp-organization-example-hospital)
* partOf.display = "健康第一病院"

Instance: jp-organization-department-example-03
InstanceOf: JP_Organization_Department
Title: "JP Core Organization Department Example 循環器内科（両方のコード使用）"
Description: "JP_Organization_Departmentリソースの例。循環器内科を表すOrganization例。ローカルコードとSS-MIX2コードの両方を使用している。"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization_Department"
// ローカル診療科コード
* identifier[0].system = "http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/11312345670"
* identifier[=].value = "CARD-001"
* identifier[=].assigner = Reference(jp-organization-example-hospital)
// SS-MIX2標準診療科コード
* identifier[ssmixDepartmentCode].system = "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment"
* identifier[ssmixDepartmentCode].value = "03"
* type[departmentType].coding[0] = http://terminology.hl7.org/CodeSystem/organization-type#dept "Hospital Department"
* type[departmentType].coding[+] = $JP_Department_SsMix_CS#03 "循環器内科"
* name = "循環器内科"
* telecom[0].system = #phone
* telecom[=].value = "03-1234-5680"
* telecom[=].use = #work
* partOf = Reference(jp-organization-example-hospital)
* partOf.display = "健康第一病院"
