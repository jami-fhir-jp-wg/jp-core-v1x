Instance: jp-diagnosticreport-category-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_DiagnosticReport_Category_SP"
* name = "JP_DiagnosticReport_Category_SP"
* status = #draft
* date = "2022-03-16"
* description = "DiagnosticReportリソースのCategory(カテゴリ)に関する検索を定義します。"
* code = #category
* base = #DiagnosticReport
* type = #token
* expression = "DiagnosticReport.category"
* xpath = "f:DiagnosticReport/f:category"
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


Instance: jp-diagnosticreport-code-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Diagnosticreport_Code_SP"
* name = "JP_Diagnosticreport_Code_SP"
* status = #draft
* date = "2022-03-16"
* description = "DiagnosticReportリソースのCode(レポート文書コード)に関する検索を定義します。"
* code = #code
* base = #DiagnosticReport
* type = #token
* expression = "DiagnosticReport.code"
* xpath = "f:DiagnosticReport/f:code"
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


Instance: jp-diagnosticreport-date-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Diagnosticreport_Date_SP"
* name = "JP_Diagnosticreport_Date_SP"
* status = #draft
* date = "2022-03-16"
* description = "DiagnosticReportリソースのDate(報告書の臨床的意義のある日時)に関する検索を定義します。"
* code = #date
* base = #DiagnosticReport
* type = #date
* expression = "DiagnosticReport.effective"
* xpath = "f:DiagnosticReport/f:effective"
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


Instance: jp-diagnosticreport-patient-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_DiagnosticReport_Patient_SP"
* name = "JP_DiagnosticReport_Patient_SP"
* status = #draft
* date = "2022-03-16"
* description = "DiagnosticReportリソースのPatient(患者)に関する検索を定義します。"
* code = #patient
* base = #Observation
* type = #reference
* expression = "DiagnosticReport.subject.where(resolve() is Patient)"
* xpath = "f:DiagnosticReport/f:subject"
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

Instance: jp-diagnosticreport-servicerequest-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_DiagnosticReport_ServiceRequest_SP"
* name = "JP_DiagnosticReport_ServiceRequest_SP"
* status = #draft
* date = "2022-03-16"
* description = "DiagnosticReportリソースのservicerequest(検査依頼診療科)に関する検索を定義します。"
* code = #servicerequest
* base = #DiagnosticReport
* type = #reference
* expression = "DiagnosticReport.based-on.where(resolve() is ServiceRequest)"
* xpath = "f:DiagnosticReport/f:based-on"
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


