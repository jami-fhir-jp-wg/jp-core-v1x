
***v1.1***

v1.0 → v1.1に変更するあたり、開発環境(Sushi & IG Publisher)を変更しているため、特に見た目や動作等が変更されている。<br/>
内容に関する主な変更については下記のとおりである。

* 全般
    * 開発環境をSushi & IG Publisherに変更した。
    * 全てのリソースに対して、idを割り振った。
    * name,title,url等は命名規則に合わせるように見直しを行なった。
    * 説明文書について、「である調」に合わせた。
    * Terminology BindingおよびConstraintsに関する記述はは、IG Publisherによる自動生成記述に変更した。
    * リソースの被参照、参照先の記載を削除した。
    * slice名称を先頭小文字に統一した。
    * FHIR Baseの説明に一部機械翻訳を用いた。
    * Referenceとして定義される参照先リソースについてJP Coreで定義しているリソースは、JP Coreリソースを参照先とするように付け直した。
    * サンプルファイル(Example)をリソースファイルとして定義をした。
    
* 概要
    * 文字検索等の説明を追加した。
    * JP Coreで定義してしていない用語の扱いについて説明を行なった。

* プロファイル
    * Administration関連
        * `JP_HumanName`にてtext欄の名前の区切り文字に、半角空白であることを明示した。
        * `JP_Patient` religionおよびbirthPlaceのExtensionを追加した。
        * `JP_Patient` nameをSlicingを利用せずに、参照先を`JP_HumanName`とすることのみにした。
        * `JP_Practitioner` nameをSlicingを利用せずに、参照先を`JP_HumanName`とすることのみにした。
        * `JP_Practitioner` qualification.codeに対するバインディング対象となる免許に関するValueSet(`JP_MedicalLicenceCertificate_VS`)およびCodeSystem(`JP_MedicalLicenceCertificate_CS`)を定義した。

    * Medication関連
        * `JP_Immunization`プロファイルを追加した。
        * `JP_MedicationAdministration` effective[x]にPeriod型を追加した。
        * `JP_MedicationAdministration_Requester` valueに対して`JP_Practitioner`を参照するように限定した。
        * `JP_MedicationAdministration_Location` valueに対して`JP_Location`を参照するように限定した。

    * Diagnostic関連

        
    * Clinical関連
        * 説明文書の全面的な見直し。
        * `JP_FamilyMemberHistory`プロファイルを追加した。
        * `JP_AllergyIntolerance` ValueSet `JP_AllergyIntoleranceCodes_VS`を定義し、３つのCodeSystem(`JP_JfagyFoodAllergenCodes_CS`,`JP_JfagyNonFoodNonMedicationAllergenCodes_CS`,`JP_JfagyMedicationAllergenCodes_CS`)を参照するように変更を行なった。
        
* OperationおよびSearch Parameter
    * JP Core派生の必要条件ではなく、派生先実装ガイドにて定義するものとして、特にJP CoreのExtension(拡張)にて検索パラメータとして利用頻度の高いと思われるものを定義するようにした。
    * [Search Parameter Registry](http://hl7.org/fhir/R4/searchparameter-registry.html)に記載されているSeach ParameterはJP Coreでは新たに定義する必用ないと判断し削除した。
    * `JP_Coverage`の被保険証関連Extension( `JP_Coverage_InsuredPersonNumber`, `JP_Coverage_InsuredPersonSubNumber`, `JP_Coverage_InsuredPersonSymbol` )に対する検索パラメータを追加した
    * `JP_Organization`の施設関連Extension( `JP_Organization_InsuranceOrganizationCategory`, `JP_Organization_InsuranceOrganizationNo`, `JP_Organization_PrefectureNo` )に対する検索パラメータの追加した。
    * `JP_Patient`のカナソート用の検索パラメータを追加した。

* Terminology
    * FHIR Baseで定義されるバインディングされた用語のライセンスに対する注意事項を記載した。

* Capability Statement
    * JP Core派生の必要条件ではなく、派生先実装ガイド作成ための参考例として記載をあらためた。

* Security
    * 医療情報システムの安全管理に関するガイドライン第5.2版の改版に合わせセキュリティの見直しを行なった。

***v1.0***

* 新規作成

{% include markdown-link-references.md %}