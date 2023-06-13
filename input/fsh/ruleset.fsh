// ==============================
//  Profile関連
// ==============================
// short , definitionを同時に出力する
RuleSet: SetDefinition(name, definition)
* {name} ^short = "{definition}"
* {name} ^definition = "{definition}"

// short , definitionを同時に出力する
// shortの最後に【詳細参照】コメントを付与する
RuleSet: SetDefinitionRef(name, definition)
* {name} ^short = "{definition}【詳細参照】"
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


// 定義済み検索パラメーターの追加
RuleSet: PutDefinedSearchParam(name, param-name, type)
* insert PutSearchParam({name}, http://hl7.org/fhir/SearchParameter/{param-name}, {type})

// 検索パラメーターの追加
RuleSet: PutSearchParam(name, definition, type)
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = "{definition}"
* rest.resource[=].searchParam[=].type = #{type}

