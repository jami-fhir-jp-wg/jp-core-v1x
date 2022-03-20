Instance: jp-location-address-city-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Location_AddressCity_SP"
* name = "JP_Location_AddressCity_SP"
* status = #draft
* date = "2022-03-16"
* description = "Locationリソースのaddress-cityに関する検索を定義します。"
* code = #address-city
* base = #Location
* type = #string
* expression = "Location.address.city"
* xpath = "f:Location/f:address/f:city"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-location-address-postalcode-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Location_AddressPostalcode_SP"
* name = "JP_Location_AddressPostalcode_SP"
* status = #draft
* date = "2022-03-16"
* description = "Locationリソースのaddress-postalcodeに関する検索を定義します。"
* code = #address-postalcode
* base = #Location
* type = #string
* expression = "Location.address.postalCode"
* xpath = "f:Location/f:address/f:postalCode"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-location-address-state-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Location_AddressState_SP"
* name = "JP_Location_AddressState_SP"
* status = #draft
* date = "2022-03-16"
* description = "Locationリソースのaddress-stateに関する検索を定義します。"
* code = #address-state
* base = #Location
* type = #string
* expression = "Location.address.state"
* xpath = "f:Location/f:address/f:state"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-location-address-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Location_Address_SP"
* name = "JP_Location_Address_SP"
* status = #draft
* date = "2022-03-16"
* description = "Locationリソースのaddressに関する検索を定義します。"
* code = #address
* base = #Location
* type = #string
* expression = "Location.address"
* xpath = "f:Location/f:address"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-location-name-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_Location_Name_SP"
* name = "JP_Location_Name_SP"
* status = #draft
* date = "2022-03-16"
* description = "Locationリソースのname(名称)に関する検索を定義します。"
* code = #name
* base = #Location
* type = #string
* expression = "Location.name"
* xpath = "f:Location/f:name"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


