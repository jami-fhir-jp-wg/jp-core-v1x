Instance: jp-patient-kanjiname-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Patient_KanjiName_SP"
* name = "JP_Patient_KanjiName_SP"
* status = #draft
* date = "2022-03-23"
* description = "PatientリソースのKanjiName(漢字名称)に関する検索を定義します。"
* code = #jp-kanji-name
* base = #Patient
* type = #string
* expression = "Patient.name.where(extension.where(url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation').value.as(code)='IDE')"
* xpath = "f:Patient/f:name[extension/url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation' and extension/valueCode='IDE']"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY


Instance: jp-patient-kananame-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Patient_KanaName_SP"
* name = "JP_Patient_KanaName_SP"
* status = #draft
* date = "2022-03-23"
* description = "PatientリソースのKanaName(カナ名称)に関する検索を定義します。"
* code = #jp-kana-name
* base = #Patient
* type = #string
* expression = "Patient.name.where(extension.where(url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation').value.as(code)='SYL')"
* xpath = "f:Patient/f:name[extension/@url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation' and extension/valueCode='SYL']"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY



Instance: jp-patient-kanasort-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Patient_KanaSort_SP"
* name = "JP_Patient_KanaSort_SP"
* status = #draft
* date = "2022-06-23"
* description = "Patientリソースをカナ名称でソートするための検索を定義します。検索に_sort=jp-kana-sortを指定すると、name.use=usualかつカナと指定されているname.text（フルネーム）を使ったソートを行います。"
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

