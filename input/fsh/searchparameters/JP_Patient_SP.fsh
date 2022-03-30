Instance: jp-patient-race-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Patient_Race_SP"
* name = "JP_Patient_Race_SP"
* status = #draft
* date = "2022-03-23"
* description = "Patientリソースのrace(人種)に関する検索を定義します。"
* code = #race
* base = #Patient
* type = #token
* expression = "Patient.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race').value.as(code)"
* xpath = "f:Patient/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race']/f:valueCoding/f:code/@value"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
