Instance: jp-observation-category-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_Category_SP"
* name = "JP_Observation_Category_SP"
* status = #draft
* date = "2022-03-16"
* description = "ObservationリソースのCategory(カテゴリ)に関する検索を定義します。"
* code = #category
* base = #Observation
* type = #token
* expression = "Observation.category"
* xpath = "f:Observation/f:category"
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


Instance: jp-observation-code-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_Code_SP"
* name = "JP_Observation_Code_SP"
* status = #draft
* date = "2022-03-16"
* description = "ObservationリソースのCode(検査項目コード)に関する検索を定義します。"
* code = #code
* base = #Observation
* type = #token
* expression = "Observation.code"
* xpath = "f:Observation/f:code"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #SHOULD
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


Instance: jp-observation-date-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_Date_SP"
* name = "JP_Observation_Date_SP"
* status = #draft
* date = "2022-03-16"
* description = "Observationリソースの日付(検査（採取）日)に関する検索を定義します。"
* code = #date
* base = #Observation
* type = #date
* expression = "Observation.effective"
* xpath = "f:Observation/f:effective"
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


Instance: jp-observation-encounter-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_Encounter_SP"
* name = "JP_Observation_Encounter_SP"
* status = #draft
* date = "2022-03-16"
* description = "ObservationリソースのEncounter(来院・入院)に関する検索を定義します。"
* code = #encounter
* base = #Observation
* type = #reference
* expression = "Observation.encounter"
* xpath = "f:Observation/f:encounter"
* xpathUsage = #normal
* target = #Encounter
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


Instance: jp-observation-patient-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_Patient_SP"
* name = "JP_Observation_Patient_SP"
* status = #draft
* date = "2022-03-16"
* description = "ObservationリソースのPatient(患者)に関する検索を定義します。"
* code = #patient
* base = #Observation
* type = #reference
* expression = "Observation.subject.where(resolve() is Patient)"
* xpath = "f:Observation/f:subject"
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


Instance: jp-observation-servicerequest-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_ServiceRequest_SP"
* name = "JP_Observation_ServiceRequest_SP"
* status = #draft
* date = "2022-03-16"
* description = "Observationリソースのservicerequest(検査依頼診療科)に関する検索を定義します。"
* code = #servicerequest
* base = #Observation
* type = #reference
* expression = "Observation.based-on.where(resolve() is ServiceRequest)"
* xpath = "f:Observation/f:based-on"
* xpathUsage = #normal
* target[0] = #Patient
* target[+] = #Group
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


Instance: jp-observation-value-concept-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_ValueConcept_SP"
* name = "JP_Observation_ValueConcept_SP"
* status = #draft
* date = "2022-03-16"
* description = "Observationリソースのvalue-concept(検査項目コード)に関する検索を定義します。"
* code = #value-concept
* base = #Observation
* type = #token
* expression = "(Observation.​value as CodeableConcept)"
* xpath = "f:Observation/f:value"
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


Instance: jp-observation-value-quantity-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_ValueQuantity_SP"
* name = "JP_Observation_ValueQuantity_SP"
* status = #draft
* date = "2022-03-16"
* description = "Observationリソースの日付(検査（採取）日)に関する検索を定義します。"
* code = #value-quantity
* base = #Observation
* type = #quantity
* expression = "(Observation.​value as Quantity)|(Observation.​value as SampledData)"
* xpath = "f:Observation/f:value"
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


