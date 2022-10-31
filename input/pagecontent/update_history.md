***v1.1.1***

１）JP_MedicationRequest , JP_MedicationRequest_injectionをJP_MedicationRequestBaseから派生する記述方法をやめ、それぞれにJP_MedicationRequestBaseの内容を展開した。FHIR Validatorの使用法によってはsnapshot展開時にエラーが発生することがあるため。
利用する側に影響はない。

２）JP_MedicationRequest , JP_MedicationRequest_injection中の説明文、サンプル中のoid記述に誤りがあった（標準用法、補足用法、外用部位など）のを修正した。同じく説明文中のidentifierの記述を追加した。


***v1.1.0***

v1.0.5 → v1.1.0に変更するあたり、開発環境(Sushi & IG Publisher)を変更しているため、特に見た目や動作等が変更されている。<br/>
内容に関する主な変更については下記のとおりである。

* 全般
    * 開発環境をSushi & IG Publisherに変更し、これに伴う警告等(Error,Waring,Info)への対応行なっている
    * 全てのリソースに対して、idを割り振った
    * name, title, url等は命名規則に合わせるように見直しを行なった
    * 説明文書について、「である調」に合わせた
    * Terminology BindingおよびConstraintsに関してIG Publisherによる自動生成記述に変更した
    * リソースの被参照、参照先の記載を削除した
    * slice名称を先頭小文字に統一した
    * FHIR Baseの説明に一部機械翻訳を用いた
    * Referenceとして定義される参照先リソースについてJP Coreで定義しているリソースは、JP Coreリソースを参照先とするように付け直した
    * サンプルファイル(Example)を説明文書だけななくリソースファイルとして定義をした
    * 各リソースのIdentifier項目については、検索パラメータSHALLとして加えるように統一した
    * Diagnostic Report,Imaging Study関連を除き、Must Supportの記述を削除した  
     DiagnosticReport, Imaging Studyはその領域での運用を想定した検討を行い、運用上フォローが必要な項目に対してMust Supportの定義を行なっている。
    * 実装ガイドの利用側に対し制限するような仕様の見直し
        * 必要のない、Cardinalityの1..や0..0等の定義削除
        * ローカルコードを利用できるようなコードの見直し
        * Slicing定義以外での固定値の利用
    
* 概要
    * 文字検索等の説明を追加した
    * JP Core利用する上での注意事項の項目を追加

* プロファイル
    * Administration関連
        * `JP_HumanName`にてtext欄の名前の区切り文字に、半角空白であることを明示した
        * `JP_HumanName`の説明のためのSlicingを廃止した。漢字、カナ、ローマ字の氏名の利用についての説明をJP_HumanNameの説明文書にあらためて記載した
        * `JP_Patient` religionおよびbirthPlaceのExtensionを追加した
        * `JP_Patient` nameをSlicingを利用せずに、参照先を`JP_HumanName`とすることのみにした
        * `JP_Practitioner` nameをSlicingを利用せずに、参照先を`JP_HumanName`とすることのみにした
        * `JP_Coverage` Identifierに格納する被保険者情報の格納ルール"{被保険者記号：全角}","{被保険者番号：全角}","{枝番：全角}"を記載した
        * `JP_Coverage` Identifierに格納する被保険者情報の格納ルールを記載した
        * `JP_Coverage` subscriberIdおよびdependentの格納形式を明示的に記載した
        * `JP_Encounter` に対し「Associated Encounter」の拡張定義を行なった
        * `JP_Organization`にてPrefectureNoの都道府県番号をCoding型に変更し対応するCodeSystemを作成および割り当てた
        * `JP_Organization`にてorganizationCategoryの点数表コードをCoding型に変更し対応するCodeSystemを作成および割り当てた
        * `JP_Organization`にて医療機関コードの説明を記載し、各リソースに記載されていた説明を集約した
        * `JP_Practitioner` qualification.codeに対するバインディング対象となる免許に関するValueSet(`JP_MedicalLicenseCertificate_VS`)を定義した
        * `JP_Practitioner` qualificationに対するSlicing対象をcodeに変更し、４７都道府県のsystemの指定方法を説明文にて行なうようにした
        * `JP_PractitionerRole` codeにJP Coreで定義したProcedure Performer RoleのCodeSystemを割り当てた

    * Medication関連
        * 日本国内での電子処方箋はFHIR形式ではないため、電子処方箋に関する記述を削除した
        * リフィル処方に関する定義および説明を追加した
        * `JP_Immunization`プロファイル（予防接種記録）を追加した
        * Medication関連項目に割り当てられている用語に対して不足しているバインディング定義を行なった
        * MedicationRequest関連のIdentifier定義をMedicationDispense, MedicationAdministration関連にも定義した
        * Dosage, Timingに対する派生のDataTypeを定義し、MedicationRequestとMedicationDispenseにて参照されるDosageを統一した
        * `JP_MedicationDosage_Injection`に対し、`JP_MedicationAdministration`にてバインドされた各種コメント等の拡張を同様に定義した
        * Quantity, Range, Ratioに対する派生のDataTypeを定義し、単位等の用語の定義を行なった
        * ExtensionにあるCodeableConcept型に定義に対してバインド定義を行なった
        * Extensionに型指定されていないReference型について、適切な型定義を行なった（Period, JP_Location, JP_Practitioner等）

    * Diagnostic関連
        * 各プロファイルにて強制力の強いCardinalityの定義の見直しを行った
        * 各プロフィールにて、定義と一致しない説明やわりにくい説明等の見直しを行った
        * 他のプロファイルに合わせ、SearchParameterのpatientでの検索に対応した
        * 検討の終わった用語の項目対するバインディング定義を行った

    * Clinical関連
        * 説明文書の全面的な見直し
        * `JP_FamilyMemberHistory`プロファイルを追加した
        * `JP_AllergyIntolerance` ValueSet `JP_AllergyIntolerance_VS`を定義し、３つのCodeSystem(`JP_JfagyFoodAllergen_CS`,`JP_JfagyNonFoodNonMedicationAllergen_CS`,`JP_JfagyMedicationAllergen_CS`)を参照するように変更を行なった
        
* OperationおよびSearch Parameter
    * JP Core派生の必要条件ではなく、派生先実装ガイドにて定義するものとして、特にJP CoreのExtension(拡張)にて検索パラメータとして利用頻度の高いと思われるものを定義するようにした
    * [Search Parameter Registry](https://hl7.org/fhir/R4/searchparameter-registry.html)に記載されているSeach ParameterはJP Coreでは新たに定義する必要ないと判断し削除した
    * `JP_Coverage`の被保険証関連Extension( `JP_Coverage_InsuredPersonNumber`, `JP_Coverage_InsuredPersonSubNumber`, `JP_Coverage_InsuredPersonSymbol` )に対する検索パラメータを追加した
    * `JP_Organization`の施設関連Extension( `JP_Organization_InsuranceOrganizationCategory`, `JP_Organization_InsuranceOrganizationNo`, `JP_Organization_PrefectureNo` )に対する検索パラメータの追加した
    * `JP_Patient`のカナソート用の検索パラメータを追加した
    * `JP_MedicationRequest`に対して、服用開始日の検索パラメータを追加した
    
* Terminology
    * 本バージョンよりJP Coreにて多くのValueSet,CodeSystemをリソースとして定義した
    * 日本国内のTerminology Serverにも対応している
    * FHIR Baseで定義されるバインディングされた用語のライセンスに対する注意事項を記載した
    * OID定義とJP Core命名規則によるURLとのマッピング情報をNamingSystemのリソースとして定義した
    * 用語定義が難しいCodeSystemについても、Medication関連中心に参考例としてのCodeSystemも作成している  
      参考例として提示した用語はexperimental=trueのフラグを見ることで区別できる

* Capability Statement
    * JP Core派生の必要条件ではなく、派生先実装ガイド作成ための参考例として記載をあらためた
    * 拡張定義にある要求度については本バージョンでは削除した

* Security
    * 医療情報システムの安全管理に関するガイドライン第5.2版の改版に合わせセキュリティの見直しを行なった

***v1.0.5***

* 新規作成

{% include markdown-link-references.md %}