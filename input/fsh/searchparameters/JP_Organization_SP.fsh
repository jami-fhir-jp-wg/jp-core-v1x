Instance: jp-organization-insuranceorganizationcategory-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Organization_InsuranceOrganizationCategory_SP"
* name = "JP_Organization_InsuranceOrganizationCategory_SP"
* status = #active
* date = "2024-10-27"
* description = "OrganizationリソースのInsuranceOrganizationCategory(点数表コード)に関する検索を定義する。"
* code = #jp-insurance-organizationcategory
* base = #Organization
* type = #token
* expression = "Organization.extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory').value.ofType(Coding)"
* xpath = "f:Organization/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory']/f:valueCoding"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY

Instance: jp-organization-insuranceorganizationno-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Organization_InsuranceOrganizationNo_SP"
* name = "JP_Organization_InsuranceOrganizationNo_SP"
* status = #active
* date = "2024-10-27"
* description = "OrganizationリソースのInsuranceOrganizationNo(保険医療機関番号)に関する検索を定義する。"
* code = #jp-insurance-organizationno
* base = #Organization
* type = #token
* expression = "Organization.extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo').value.ofType(Identifier)"
* xpath = "f:Organization/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo']/f:valueIdentifier"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY


Instance: jp-organization-prefectureno-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Organization_PrefectureNo_SP"
* name = "JP_Organization_PrefectureNo_SP"
* status = #active
* date = "2024-10-27"
* description = "OrganizationリソースのPrefectureNo(都道府県番号)に関する検索を定義する。"
* code = #jp-prefectureno
* base = #Organization
* type = #token
* expression = "Organization.extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo').value.ofType(Coding)"
* xpath = "f:Organization/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo']/f:valueCoding"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
