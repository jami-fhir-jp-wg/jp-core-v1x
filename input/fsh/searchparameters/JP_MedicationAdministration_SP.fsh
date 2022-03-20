Instance: jp-medicationadministration-code-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationAdministration_Code_SP"
* name = "JP_MedicationAdministration_Code_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationAdministrationリソースのCode(薬品コード)に関する検索を定義します。"
* code = #code
* base = #MedicationAdministration
* type = #token
* expression = "(MedicationAdministration.​medication as CodeableConcept)"
* xpath = "f:MedicationAdministration/f:medication"
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


Instance: jp-medicationadministration-effectivedatetime-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationAdministration_EffectiveDatetime_SP"
* name = "JP_MedicationAdministration_EffectiveDatetime_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationAdministrationのEffectiveDatetime(投与実施日時)に関する検索を定義します。"
* code = #EffectiveDatetime
* base = #MedicationAdministration
* type = #date
* expression = "MedicationAdministration.effective.EffectiveDatetime"
* xpath = "f:MedicationAdministration/f:effective/f:EffectiveDatetime"
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


Instance: jp-medicationadministration-identifier-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationAdministration_Identifier_SP"
* name = "JP_MedicationAdministration_Identifier_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationAdministrationリソースのIdentifierに関する検索を定義します。"
* code = #identifier
* base = #MedicationAdministration
* type = #token
* expression = "MedicationAdministration.identifier"
* xpath = "f:MedicationAdministration/f:identifier"
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


Instance: jp-medicationadministration-patient-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationAdministration_Patient_SP"
* name = "JP_MedicationAdministration_Patient_SP"
* status = #draft
* date = "2022-03-16"
* description = "MedicationAdministrationリソースのpatient(患者)に関する検索を定義します。"
* code = #patient
* base = #MedicationAdministration
* type = #reference
* expression = "MedicationAdministration.subject.where(resolve() is Patient)"
* xpath = "f:MedicationAdministration/f:subject"
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


