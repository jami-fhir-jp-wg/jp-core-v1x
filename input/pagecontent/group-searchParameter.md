## SearchParameter

### 方針
1. JP Coreを派生して作成したサイトは、JP Core定義された以外のSearch Parameterを定義することは可能である。各サイトはどのSearch Parameterを採用するかを、CapabilityStatementにて宣言を行なうこととする。
1. FHIR Baseの[defined search parameter](https://fhir-ru.github.io/searchparameter-registry.html)では各Profile毎に想定されるSearch Parameterが既に定義されており、互換性よりこれ利用することを推奨する。(**SHOULD**)
1. JP Coreでは、日本固有のルールやExtension等の新しい定義に関して利便性のためSearch Parameterを定義する。

### 一覧
* [JP_Coverage_InsuredPersonNumber_SP]
* [JP_Coverage_InsuredPersonSubNumber_SP]
* [JP_Coverage_InsuredPersonSymbol_SP]
* [JP_Observation_BodySite_BodySitePosition_SP]
* [JP_Organization_InsuranceOrganizationCategory_SP]
* [JP_Organization_InsuranceOrganizationNo_SP]
* [JP_Organization_PrefectureNo_SP]
* [JP_Patient_Race_SP]

{% include markdown-link-references.md %}