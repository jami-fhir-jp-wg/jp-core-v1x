Instance: jp-practitioner-identifier-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Practitioner_Identifier_SP"
* name = "JP_Practitioner_Identifier_SP"
* status = #draft
* date = "2022-03-16"
* description = "practitionerリソースのidentifierに関する検索を定義します。"
* code = #identifier
* base = #Practitioner
* type = #token
* expression = "Practitioner.identifier"
* xpath = "f:Practitioner/f:identifier"
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


Instance: jp-practitioner-name-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Practitioner_Name_SP"
* name = "JP_Practitioner_Name_SP"
* status = #draft
* date = "2022-03-16"
* description = "practitionerリソースのnameに関する検索を定義します。"
* code = #name
* base = #Practitioner
* type = #string
* expression = "Practitioner.name"
* xpath = "f:Practitioner/f:name"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY

