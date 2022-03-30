Instance: jp-observation-bodysiteposition-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Observation_BodySitePosition_SP"
* name = "JP_Observation_BodySite_BodySitePosition_SP"
* status = #draft
* date = "2022-03-23"
* description = "ObservationリソースのBodySitePosition(部位左右区別)に関する検索を定義します。"
* code = #bodysite-position
* base = #Observation
* type = #token
* expression = "Observation.extension.where(url = 'http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_BodySite_BodySitePosition').valuvalue.as(code)"
* xpath = "f:Observation/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_BodySite_BodySitePosition']/f:valueCoding/f:code/@value"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
