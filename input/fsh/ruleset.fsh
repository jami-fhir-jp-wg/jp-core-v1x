// ==============================
//  Profile関連
// ==============================
// short , definitionを同時に出力する
RuleSet: SetDefinition(name, definition)
* {name} ^short = "{definition}"
* {name} ^definition = "{definition}"

// exampleの記述
RuleSet: SetExampleString(name, valueString)
* {name} ^example.label = "Jp"
* {name} ^example.valueString = "{valueString}"

// ==============================
//  CapabilityStatement関連
// ==============================
//リソースに対するSearchParameterの生成
RuleSet: SetSearchParameterResource(name, url)
* insert SetSearchParameterType({name})
* insert SetSearchParameterSupportedProfile({url})
* insert SetSearchParameterInteraction

//リソースに対するSearchParameterの生成
RuleSet: SetSearchParameterResourceTwo(name, url1, url2)
* insert SetSearchParameterType({name})
* insert SetSearchParameterSupportedProfile({url1})
* insert SetSearchParameterSupportedProfile({url2})
* insert SetSearchParameterInteraction

//SupportedProfileの生成
RuleSet: SetSearchParameterType(name)
* rest.resource[+].type = #{name}

//SupportedProfileの生成
RuleSet: SetSearchParameterSupportedProfile(url)
* rest.resource[=].supportedProfile[+] = "http://jpfhir.jp/fhir/core/StructureDefinition/{url}"

//Interactionの生成
RuleSet: SetSearchParameterInteraction
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #vread
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].interaction[+].code = #delete
* rest.resource[=].interaction[+].code = #history-instance
* rest.resource[=].interaction[+].code = #history-type
* rest.resource[=].referencePolicy = #resolves
* rest.resource[=].searchRevInclude = "Provenance:target"

// ------------------------------------------------------
// 検索パラメータ関連定義
// ------------------------------------------------------
// 定義済み検索パラメーターの追加
RuleSet: PutDefinedSearchParam(expectation, name, param-name, type)
* insert PutSearchParam({expectation}, {name}, http://hl7.org/fhir/SearchParameter/{param-name}, {type})

// 検索パラメーターの追加
RuleSet: PutSearchParam(expectation,name, definition, type)
* rest.resource[=].searchParam[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #{expectation}
* rest.resource[=].searchParam[=].name = "{name}"
* rest.resource[=].searchParam[=].definition = "{definition}"
* rest.resource[=].searchParam[=].type = #{type}

// 検索パラメーターの結合
RuleSet: InitializeCombination(expectation)
* rest.resource[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension.valueCode = #{expectation}

//　複数検索パラメータ定義(6個)
RuleSet: PutCombination6(expectation, param1, param2 ,param3, param4, param5, param6)
* insert PutCombination5({expectation}, {param1}, {param2} , {param3}, {param4}, {param5})
* insert PutCombinationParameter({param6})

//　複数検索パラメータ定義(5個)
RuleSet: PutCombination5(expectation, param1, param2 ,param3, param4, param5)
* insert PutCombination4({expectation}, {param1}, {param2} , {param3}, {param4})
* insert PutCombinationParameter({param5})

//　複数検索パラメータ定義(4個)
RuleSet: PutCombination4(expectation, param1, param2 ,param3, param4)
* insert PutCombination3({expectation}, {param1}, {param2} , {param3} )
* insert PutCombinationParameter({param4})

//　複数検索パラメータ定義(3個)
RuleSet: PutCombination3(expectation, param1, param2, param3)
* insert PutCombination2({expectation}, {param1}, {param2})
* insert PutCombinationParameter({param3})

//　複数検索パラメータ定義(2個)
RuleSet: PutCombination2(expectation, param1, param2)
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #{expectation}
* insert PutCombinationParameter({param1})
* insert PutCombinationParameter({param2})

//　パラメータ追加
RuleSet: PutCombinationParameter(param1)
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "{param1}"