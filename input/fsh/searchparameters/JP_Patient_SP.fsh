Instance: jp-patient-kanasort-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Patient_KanaSort_SP"
* name = "JP_Patient_KanaSort_SP"
* status = #active
* date = "2022-10-24"
* description = "Patientリソースをカナ名称でソートするための検索を定義する。検索に_sort=jp-kana-sortを指定すると、name.use=usualかつカナと指定されているname.text（フルネーム）を使ったソートを行う。"
* code = #jp-kana-sort
* base = #Patient
* type = #string
* expression = "Patient.name.where(extension('http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation').value.as(code)='SYL' and use='usual').text"
* xpath = "f:Patient/f:name[f:extension/@url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation' and f:extension/f:valueCode/@value='SYL' and f:use/@value='usual']/f:text"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
