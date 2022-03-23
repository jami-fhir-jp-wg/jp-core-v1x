Instance: jp-coverage-insuredpersonnumber-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/core/SearchParameter/JP_Coverage_InsuredPersonNumber_SP"
* name = "JP_Coverage_InsuredPersonNumber_SP"
* status = #draft
* date = "2022-03-23"
* description = "CoverageリソースのInsuredPersonNumber(健康保険における被保険者証番号)に関する検索を定義します。"
* code = #insured-personnumber
* base = #Coverage
* type = #string
* expression = "Coverage.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonNumber').extension.value as string"
* xpath = "f:Coverage/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonNumber']/f:extension/f:valueString"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY


Instance: jp-coverage-insuredpersonsubnumber-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/core/SearchParameter/JP_Coverage_InsuredPersonSubNumber_SP"
* name = "JP_Coverage_InsuredPersonSubNumber_SP"
* status = #draft
* date = "2022-03-23"
* description = "CoverageリソースのInsuredPersonSubNumber(健康保険における被保険者証番号の枝番)に関する検索を定義します。"
* code = #insured-personsubnumber
* base = #Coverage
* type = #string
* expression = "Coverage.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSubNumber').extension.value as string"
* xpath = "f:Coverage/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSubNumber']/f:extension/f:valueString"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY


Instance: jp-coverage-insuredpersonsymbol-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/core/SearchParameter/JP_Coverage_InsuredPersonSymbol_SP"
* name = "JP_Coverage_InsuredPersonSymbol_SP"
* status = #draft
* date = "2022-03-23"
* description = "CoverageリソースのInsuredPersonSymbol(健康保険における被保険者証記号)に関する検索を定義します。"
* code = #insured-personsymbol
* base = #Coverage
* type = #string
* expression = "Coverage.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSymbol').extension.value as string"
* xpath = "f:Coverage/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSymbol']/f:extension/f:valueString"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
