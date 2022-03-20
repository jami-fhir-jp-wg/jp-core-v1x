Instance: jp-medicationrequest-authoredon-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Medicationrequest_AuthoredOn_SP"
* name = "JP_Medicationrequest_AuthoredOn_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationRequestリソースのAuthoredOn(処方指示日時)に関する検索を定義します。"
* code = #authoredon
* base = #MedicationRequest
* type = #date
* expression = "MedicationRequest.authoredOn"
* xpath = "f:MedicationRequest/f:authoredOn"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #SHOULD
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap
* comparator[0].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* modifier = #missing
* modifier.extension.url = $capabilityStatement-expectation
* modifier.extension.valueCode = #MAY


Instance: jp-medicationrequest-category-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Category_SP"
* name = "JP_MedicationRequest_Category_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationRequestリソースのCategoryに関する検索を定義します。"
* code = #type
* base = #MedicationRequest
* type = #token
* expression = "MedicationRequest.category"
* xpath = "f:MedicationRequest/f:category"
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


Instance: jp-medicationrequest-code-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Code_SP"
* name = "JP_MedicationRequest_Code_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationRequestリソースのCode(薬品コード)に関する検索を定義します。"
* code = #code
* base = #MedicationRequest
* type = #token
* expression = "(MedicationRequest.​medication as CodeableConcept)"
* xpath = "f:MedicationRequest/f:medication"
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


Instance: jp-medicationrequest-date-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Date_SP"
* name = "JP_MedicationRequest_Date_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationRequestリソースのDate(服用開始日)に関する検索を定義します。"
* code = #date
* base = #MedicationRequest
* type = #date
* expression = "MedicationRequest.dosageInstruction.timing.event"
* xpath = "f:MedicationRequest/f:dosageInstruction/f:timing/f:event"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #SHOULD
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap
* comparator[0].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* modifier = #missing
* modifier.extension.url = $capabilityStatement-expectation
* modifier.extension.valueCode = #MAY


Instance: jp-medicationrequest-identifier-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Identifier_SP"
* name = "JP_MedicationRequest_Identifier_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationRequestリソースのidentifierに関する検索を定義します。"
* code = #identifier
* base = #MedicationRequest
* type = #token
* expression = "MedicationRequest.identifier"
* xpath = "f:MedicationRequest/f:identifier"
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


Instance: jp-medicationrequest-patient-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Patient_SP"
* name = "JP_MedicationRequest_Patient_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationRequestリソースのpatient(患者)に関する検索を定義します。"
* code = #patient
* base = #MedicationRequest
* type = #reference
* expression = "MedicationRequest.subject.where(resolve() is Patient)"
* xpath = "f:MedicationRequest/f:subject"
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


Instance: jp-medicationrequest-requester-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequestr_Requester_SP"
* name = "JP_MedicationRequestr_Requester_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationRequestリソースのrequesterに関する検索を定義します。"
* code = #requester
* base = #MedicationRequest
* type = #reference
* expression = "MedicationRequest.requester"
* xpath = "f:MedicationRequest/f:requester"
* xpathUsage = #normal
* target[0] = #Practitioner
* target[+] = #PractitionerRole
* target[+] = #Organization
* target[+] = #Patient
* target[+] = #RelatedPerson
* target[+] = #Device
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

