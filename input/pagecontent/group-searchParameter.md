検索パラメータ(Search Parameter)は、機能定義の一部であり、各サイトごとにどのような検索方法を提供するかを決定するものである。派生先の各サイトはFHIR BaseもしくはJP Coreに定義されるSearch Parameterを利用可能であり、もし定義がない場合に独自に定義をすることも可能である。JP CoreではFHIR Baseで定義されていないもので、派生先サイトで利用する可能性の高いものを定義している。

### JP Core定義 Search Parameter一覧
* [JP_Coverage_InsuredPersonNumber_SP]
* [JP_Coverage_InsuredPersonSubNumber_SP]
* [JP_Coverage_InsuredPersonSymbol_SP]
* [JP_MedicationRequest_Start_SP]
* [JP_Organization_InsuranceOrganizationCategory_SP]
* [JP_Organization_InsuranceOrganizationNo_SP]
* [JP_Organization_PrefectureNo_SP]
* [JP_Patient_KanaSort_SP]

### FHIR Base 定義済み検索パラメーター
FHIR Baseにて定義済み検索パラメータ([Defined Search Parameters](https://fhir-ru.github.io/searchparameter-registry.html))が記載されており、相互運用性の高めるためにもこれを利用することを推奨する(**SHOULD**)。<br/>
定義済み検索パラメータは``` http://hl7.org/fhir/SearchParameter/[id] ```の命名規則の定義URLにて利用可能である。


{% include markdown-link-references.md %}