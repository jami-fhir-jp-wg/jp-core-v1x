Instance: jp-organization-insuranceorganizationcategory-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/core/SearchParameter/JP_Organization_InsuranceOrganizationCategory_SP"
* name = "JP_Organization_InsuranceOrganizationCategory_SP"
* status = #draft
* date = "2022-03-23"
* description = "OrganizationリソースのInsuranceOrganizationCategory(点数表コード)に関する検索を定義します。"
* code = #insurance-organizationcategory
* base = #Organization
* type = #token
* expression = "Organization.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory').extension.value.code"
* xpath = "f:Organization/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory']/f:extension/f:valueCoding/f:code/@value"
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
* url = "http://hl7.org/fhir/us/core/SearchParameter/JP_Organization_InsuranceOrganizationNo_SP"
* name = "JP_Organization_InsuranceOrganizationNo_SP"
* status = #draft
* date = "2022-03-23"
* description = "OrganizationリソースのInsuranceOrganizationNo(保険医療機関番号)に関する検索を定義します。"
* code = #insurance-organizationno
* base = #Organization
* type = #token
* expression = "Organization.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo').extension.value.code"
* xpath = "f:Organization/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo']/f:extension/f:valueCoding/f:code/@value"
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
* url = "http://hl7.org/fhir/us/core/SearchParameter/JP_Organization_PrefectureNo_SP"
* name = "JP_Organization_PrefectureNo_SP"
* status = #draft
* date = "2022-03-23"
* description = "OrganizationリソースのPrefectureNo(都道府県番号)に関する検索を定義します。"
* code = #prefectureno
* base = #Organization
* type = #token
* expression = "Organization.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo').extension.value.code"
* xpath = "f:Organization/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo']/f:extension/f:valueCoding/f:code/@value"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
