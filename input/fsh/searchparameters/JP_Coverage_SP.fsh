Instance: jp-coverage-beneficiary-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Coverage_Beneficiary_SP"
* name = "JP_Coverage_Beneficiary_SP"
* status = #draft
* date = "2022-03-16"
* description = "Coverageリソースのbeneficiaryに関する検索を定義します。"
* code = #beneficiary
* base = #Coverage
* type = #reference
* expression = "Coverage.beneficiary"
* xpath = "f:Coverage/f:beneficiary"
* xpathUsage = #normal
* target = #Patient
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-coverage-identifier-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Coverage_Identifier_SP"
* name = "JP_Coverage_Identifier_SP"
* status = #draft
* date = "2022-03-16"
* description = "Coverageリソースのidentifierに関する検索を定義します。"
* code = #identifier
* base = #Coverage
* type = #token
* expression = "Coverage.identifier"
* xpath = "f:Coverage/f:identifier"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #below
* modifier[+] = #above
* modifier[+] = #ofType
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY