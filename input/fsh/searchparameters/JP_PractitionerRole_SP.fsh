Instance: jp-practitionerrole-practitioner-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_PractitionerRole_Practitioner_SP"
* name = "JP_PractitionerRole_Practitioner_SP"
* status = #draft
* date = "2022-03-16"
* description = "practitionerroleリソースのpractitionerに関する検索を定義します。"
* code = #practitioner
* base = #PractitionerRole
* type = #reference
* expression = "PractitionerRole.practitioner"
* xpath = "f:PractitionerRole/f:practitioner"
* xpathUsage = #normal
* target = #Practitioner
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
* chain[0] = "identifier"
* chain[+] = "name"
* chain[0].extension.url = $capabilityStatement-expectation
* chain[=].extension.valueCode = #SHALL
* chain[+].extension.url = $capabilityStatement-expectation
* chain[=].extension.valueCode = #SHALL


Instance: jp-practitionerrole-specialty-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_PractitionerRole_Specialty_SP"
* name = "JP_PractitionerRole_Specialty_SP"
* status = #draft
* date = "2022-03-16"
* description = "practitionerroleリソースのspecialtyに関する検索を定義します。"
* code = #specialty
* base = #PractitionerRole
* type = #token
* expression = "PractitionerRole.specialty"
* xpath = "f:PractitionerRole/f:specialty"
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

