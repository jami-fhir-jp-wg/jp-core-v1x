Instance: jp-procedure-date-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Procedure_Date_SP"
* name = "JP_Procedure_Date_SP"
* status = #draft
* date = "2022-03-16"
* description = "Procedureリソースの​performed(実施日時)に関する検索を定義します。"
* code = #date
* base = #Procedure
* type = #date
* expression = "Procedure.​performed"
* xpath = "f:Procedure/f:​performed"
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


Instance: jp-procedure-patient-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Procedure_Patient_SP"
* name = "JP_Procedure_Patient_SP"
* status = #draft
* date = "2022-03-16"
* description = "ProcedureリソースのPatient(患者)に関する検索を定義します。"
* code = #patient
* base = #Procedure
* type = #reference
* expression = "Procedure.subject.where(resolve() is Patient)"
* xpath = "f:Procedure/f:subject"
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

