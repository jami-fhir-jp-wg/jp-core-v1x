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
* type = #token
* expression = "Patient.name.where(extension/url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation' and extension/value.as(code)='IDE')"
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
* type = #token
* expression = "Patient.name.where(extension/url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation' and extension/value.as(code)='SYL')"
* xpath = "f:Patient/f:name[extension/@url='http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation' and extension/valueCode='SYL']"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY

