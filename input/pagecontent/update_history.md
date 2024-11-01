***v1.2.0***

* 全般
  * v1.1.2により不具合の修正および追加プロファイルの対応を実施した
  * 不具合を除き下位互換性を保つことを重視している
  * 誤字・脱字等の見直しを行なった
  * JP CoreにMustSupportが定義されており、記述の矛盾について見直しを行った
  * Copyrightについて記述の見直しを行った
* プロファイル関連
  * Administration グループ
    * `JP_Coverage`にて被保険者識別子仕様を変更した
      * 被保険者識別子、非保険者識別子（CSV版）の２種類の識別子を定義した
      * 非保険者識別子（CSV版）の先頭に保険者番号を付加する体系に変更した
      * Identifier.assignerに保険者の情報をセットするように記述した
      * 被保険者番号の枝番について、全角⇒半角に仕様を変更した
  * Medication グループ
    * `JP_Medication`プロファイルのingredient.strength.denominatorを１回に固定した
    * `JP_MedicationStatement`プロファイルおよび `JP_MedicationStatement_Injection`プロファイルを追加した
    * `JP_MedicationRequest_Injection`プロファイル, `JP_MedicationDispense_Injection`プロファイル, `JP_MedicationAdministration_Injection`プロファイル, `JP_MedicationStatement_Injection`プロファイルに関するmedicationの参照に関する記述を付加した
    * 操作：$everythingが不要であるため記述を削除した
  * Diagnostic グループ
    * Observation
      * `JP_Observation_Radiology_Findings`プロファイルおよび`JP_Observation_Radiology_Impression`プロファイルを追加した
      * `JP_Observation_Electrocardiogram`プロファイルを追加した
      * `JP_Observation_Endoscopy`プロファイルを追加した
      * `JP_Observation_VitalSigns`プロファイルのcategoryに対する`JP_SimpleObservationCategory_CS`に対する多重度を1..*から0..*に変更した
      * `JP_Specimen_Common`プロファイルを追加、これにあわせ`JP_Specimen`プロファイルを削除した
      * `JP_Observation_DentalOral_ToothExistence`プロファイルを追加定義した
      * `JP_Observation_DentalOral_ToothTreatmentCondition`プロファイルを追加定義した
      * `JP_Observation_DentalOral_MissingToothCondition`プロファイルを追加定義した
    * ImagingStudy
      * `JP_ImagingStudy_Radiology`プロファイルのseries.modalityに対するバインド対象を`JP_DICOMModality_VS`に変更した
    * DiagnosticReport
      * `JP_DiagnosticReport_Radiology`プロファイルのcategoryに対するバインド対象を`JP_DICOMModality_VS`に変更した
      * `JP_DiagnosticReport_Radiology`プロファイルにて、`JP_Observation_Radiology_Findings`および`JP_Observation_Radiology_Impression`を要素に設定できる点について修正し、その関係性に関する記述を記載した。
      * `JP_DiagnosticReport_DentalOral`プロファイルを追加定義した
    * Media
      * `JP_Media_Endoscopy`プロファイルを追加定義した
  * Clinical グループ
    * `JP_Condition_Diagnosis`プロファイルを追加した
    * `JP_Condition_Diagnosis`にて以下の病名マスタを利用可能とした
      * MEDIS病名交換用コード`JP_ConditionDiseaseCodeMEDISExchange_CS`
      * MEDIS ICD10対応標準病名マスター(管理番号)`JP_ConditionDiseaseCodeMEDISRecordNo_CS`
      * レセプト電算用傷病名マスタ`JP_ConditionDiseaseCodeReceipt_CS`
  * Workflow グループ
    * `JP_ServiceRequest_Common`プロファイルを追加、これにあわせ`JP_ServiceRequest`を削除した
  * SearchParameterおよびOperation関連
    * SearchParameterの記述不具合（型指定やSearchParameterRegistryとの違い）について修正した
    * SearchParameterのexpressionのFHIRPath記述に対する指摘に対応した
    * `JP_ImagingStudy_Radiology`のIdentifierに関するConformanceをSHALLに変更した
  * Terminology関連
    * 以下のCodeSystemおよびValueSet追加した
      * `JP_ConditionDieaseCodeReceipt_CS`
      * `JP_ConditionDieaseModifierReceipt_CS`
      * `JP_ConditionDieaseOutcomeHL70241_CS`
      * `JP_ConditionDieaseOutcomeJHSD0006_CS`
      * `JP_ConditionDieaseOutcomeReceipt_CS`
      * `JP_ConditionDiseaseCodeICD10_CS`
      * `JP_ConditionDiseaseCodeICD10_VS`
      * `JP_ConditionDiseaseCodeMEDISExchange_CS`
      * `JP_ConditionDiseaseCodeMEDISExchange_VS`
      * `JP_ConditionDiseaseCodeMEDISRecordNo_CS`
      * `JP_ConditionDiseaseCodeMEDISRecordNo_VS`
      * `JP_ConditionDiseaseCodeReceipt_VS`
      * `JP_ConditionDiseaseModifierMEDISExchange_CS`
      * `JP_ConditionDiseaseModifierMEDISExchange_VS`
      * `JP_ConditionDiseaseModifierMEDISRecordNo_CS`
      * `JP_ConditionDiseaseModifierMEDISRecordNo_VS`
      * `JP_ConditionDiseaseModifierReceipt_VS`
      * `JP_ConditionDiseaseOutcomeHL70241_JHSD0006_VS`
      * `JP_ConditionDiseaseOutcomeHL70241_VS`
      * `JP_ConditionDiseaseOutcomeJHSD0006_VS`
      * `JP_ConditionDiseaseOutcomeReceipt_VS`
      * `JP_DentalBodySite_CS`
      * `JP_DentalBodySite_VS`
      * `JP_DentalBodySiteStatus_CS`
      * `JP_DentalBodySiteStatus_VS`
      * `JP_DentalBodyStructure_CS`
      * `JP_DentalBodyStructure_VS`
      * `JP_DentalFundamentalStatus_CS`
      * `JP_DentalFundamentalStatus_VS`
      * `JP_DentalMissingTeethObservation_CS`
      * `JP_DentalMissingTeethObservation_VS`
      * `JP_DentalPresentTeethObservation_CS`
      * `JP_DentalPresentTeethObservation_VS`
      * `JP_DentalSimpleMissingTeethObservation_CS`
      * `JP_DentalSimpleMissingTeethObservation_VS`
      * `JP_DentalSimplePresentTeethObservation_CS`
      * `JP_DentalSimplePresentTeethObservation_VS`
      * `JP_DICOMModality_VS`
      * `JP_ObservationCategory_Endoscopy_VS`
      * `JP_ObservationDentalCategory_CS`
      * `JP_ObservationDentalCategory_VS`
      * `JP_ObservationElectrocardiogramInterpretationCode_CS`
    * 以下のCodeSystem,ValueSetを削除した
      * `JP_ObservationBodySite_CS`
      * `JP_ObservationBodySite_VS`
    * `JP_ObservationBodyMeasurementCode_CS`の記述の不具合を修正した
    * 病名マスタ(MEDIS病名交換用コード`JP_ConditionDiseaseCodeMEDISExchange_CS`,MEDIS ICD10対応標準病名マスター(管理番号)`JP_ConditionDiseaseCodeMEDISRecordNo_CS`,レセプト電算用傷病名マスタ`JP_ConditionDiseaseCodeReceipt_CS`)を用語として追加した

  * Capability Statement関連
    * 単数パラメーターのConformanceの指定に対応した
    * 複数パラメータの指定の指定に対応した
    * Operation定義を追加した
  
***v1.1.2***

パブリックコメントやIssue等の指摘を中心に不具合やわかりにくい点について改善を行った。また内視鏡検査および微生物学的検査関連のプロファイルを新規に追加した。主な変更点は以下のとおりである。

* 全般
  * 実装ガイドの依存関係利用しているライセンス等の情報を総合ガイダンスのページに追加した
  * 誤字・脱字等の見直しを行なった
  * 参照先リンクに一部の間違いがあったためこれを訂正した
  * 「である」調に一部なっていないものがあったため訂正した
  * Exampleにある時間を日本時間ベースに修正
  * Slicing定義タイプがpatternからvalueへ変更可能なものはvalueを使うように変更した
  * Administration関連のSearchParameterの必須・推奨に関する記述を見直した
  * Binary,CarePlan,Consent,Device,DocumentReference,MedicationStatement,RelatedPerson,ResearchStudy,ResearchSubject,ServiceRequest,Specimen参照される可能性の高いリソースに対してからの定義を用意した  
  今後JP Coreに実装すべき要件が発生した際に影響を考慮したたため

* プロファイル関連
  * Observation
    * Observation派生プロファイルを区別出来るようにCategoryにプロファイル毎に固定値を必須でいれることとした  
    これにあわせて検索例やExample等を修正した  
    ※本件はv1.1.0, v1.1.1で作成したものと互換性が保たれないため注意のこと
    * 微生物学検査関連プロファイルの追加    
      * `JP_Observation_Microbiology`
    * `JP_Observation_Common`のshort, definition等のコメントをわかりやすいように修正した
  * DiagnosticReport
    * DiagnosticReport派生プロファイルを区別出来るように、Categoryにプロファイル毎に固定値を必須でいれることとした  
    これにあわせて検索例やExample等を修正した  
    ※本件はv1.1.0, v1.1.1で作成したものと互換性が保たれないため注意のこと
    * 内視鏡関連プロファイルの追加
      * `JP_DiagnosticReport_Endoscopy`
    * 微生物学検査関連プロファイルの追加    
      * `JP_DiagnosticReport_Microbiology`
    * `JP_DiagnosticReport_Common` の shortおよびdefinitionの記述を整理した
    * `JP_DiagnosticReport_Radiology`のcategoryおよびcodeエレメントの定義を更新した、また読影医・確定医の専門医資格情報に関する記述を追加した
  * ImagingStudy
    * 内視鏡関連プロファイルの追加
      * `JP_ImagingStudy_Endoscopy`  
    * `JP_ImagingStudy_Radiology`の説明を見直し、進捗に関する記述の追加やSearchParameterの要求レベル等を修正した、またExampleのテキストエリアの見直した
  * Medication
    * `JP_MedicationRequest`, `JP_MedicationRequest_Injection`に対し、`JP_MedicationDispense_Preparation`拡張定義が誤って定義されていたため、これを削除した

* Terminology関連
  * 定義追加  
  プロファイル追加、ObservationおよびDiagnosticReportのCategory再定義により下記のTerminology関連プロファイルの追加を行なった
    * JP Core Endoscopy JED CodeSystem
    * JP Core DiagnosticReport Category ValueSet
    * JP Core DiagnosticReport Endoscopy Conclusion Codes JED ValueSet
    * JP Core Document Codes Endoscopy ValueSet
    * JP Core Simple Observation Category CodeSystem
    * JP Core Simple Observation Category ValueSet
    * JP Core ImagingStudy Endoscopy Reason Code JED ValueSet
    * JP Core Microbiology AntiMicrobial Drug CodeSystem
    * JP Core Microbiology AntiMicrobial Drug ValueSet
    * JP Core Microbiology InfectiousAgent CodeSystem
    * JP Core Microbiology InfectiousAgent ValueSet
    * JP Core Microbiology Category CodeSystem
    * JP Core Microbiology Category ValueSet
  * 定義修正  
  コードや表記について誤りがあったため修正した
    * JP Core Medication JAMI Additional Usage CodeSystem
  * 定義削除  
  下記の利用されていないCodeSystemについて削除を行なった
    * JP_ProcedureCodesICHI_CS
    * JP_ProcedureCondition_CS
    * JP_ProcedureAction_CS
    * JP_ProcedureKingAction_CS
    * JP_ProcedureFollowup_CS
    * JP_ProcedureReason_CS
* セキュリティ関連  
医療情報システムの安全管理に関するガイドラインが第6.0版に公開にあわせ見直しを行った

***v1.1.1***

* Medication関連
    * JP_MedicationRequest , JP_MedicationRequest_injectionをJP_MedicationRequestBaseから派生する記述方法をやめ、それぞれにJP_MedicationRequestBaseの内容を展開した。FHIR Validatorの使用法によってはsnapshot展開時にエラーが発生することがあるため。利用する側に影響はない
    * JP_MedicationRequest , JP_MedicationRequest_injection中の説明文、サンプル中のoid記述に誤りがあった（標準用法、補足用法、外用部位など）のを修正した。同じく説明文中のidentifierの記述を追加した


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