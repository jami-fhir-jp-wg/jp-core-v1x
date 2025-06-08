このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのVer.1.2.0である。

### 概要
ガイダンス: JP Coreでの全体に関わる規則や注意事項を記載している。
* [総合ガイダンス](guide-general.html)
* [Must SupportとCardinality(多重度)のルール](guide-mustSupportCardinality.html)
* [欠損値の扱い](guide-handlingOfNonExistentData.html)
* [文字コード](guide-characterEncoding.html)
* [検索](guide-stringSearch.html)
* [OIDマッピング表](guide-urlmap.html)
* [利用上の注意事項](guide-precautions.html) 
* [更新履歴](update_history.html)

### JP Core FHIRコンテンツ
JP Core FHIRコンテンツ: JP Coreで利用するFHIRの詳細について記載をしている。

#### [Profiles （プロファイル）](artifacts.html#structures-resource-profiles)
* [Administrationグループ （運営管理）](group-administration.html)
  * [JP Core Patient （患者）プロファイル][JP_Patient]
  * [JP Core Coverage （保険・公費）プロファイル][JP_Coverage]
  * [JP Core Encounter （来院・入院）プロファイル][JP_Encounter]
  * [JP Core Location （所在場所）プロファイル][JP_Location]
  * [JP Core Organization （組織）プロファイル][JP_Organization]
  * [JP Core Practitioner （医療従事者）プロファイル][JP_Practitioner]
  * [JP Core PractitionerRole （医療従事者役割）プロファイル][JP_PractitionerRole]
* [Medicationグループ （薬剤リスト）](group-medication.html)
  * [JP Core Medication （薬剤）プロファイル][JP_Medication]
  * [JP Core MedicationRequest （内服・外用薬剤処方）プロファイル][JP_MedicationRequest]
  * [JP Core MedicationRequest Injection （注射薬剤処方）プロファイル][JP_MedicationRequest_Injection]
  * [JP Core MedicationDispense （内服・外用薬剤処方調剤・払い出し記録）プロファイル][JP_MedicationDispense]
  * [JP Core MedicationDispense Injection （注射薬剤処方調剤・払い出し記録）プロファイル][JP_MedicationDispense_Injection]
  * [JP Core MedicationAdministration （内服・外用薬剤投与実施情報）プロファイル][JP_MedicationAdministration]
  * [JP Core MedicationAdministration Injection （注射薬剤投与実施情報）プロファイル][JP_MedicationAdministration_Injection]
  * [JP Core MedicationStatement （内服・外用薬剤服薬情報）プロファイル][JP_MedicationStatement]
  * [JP Core MedicationStatement Injection （注射薬剤服薬情報）プロファイル][JP_MedicationStatement_Injection]
  * [JP Core Immunization （予防接種記録）プロファイル][JP_Immunization]
* [Diagnosticグループ （診断）](group-diagnostic.html)
  * Observation （検査）
    * [JP Core Observation Common （共通）プロファイル][JP_Observation_Common]
      * [JP Core Observation LabResult （検体検査）プロファイル][JP_Observation_LabResult]
      * [JP Core Observation Microbiology （微生物学検査結果）プロファイル][JP_Observation_Microbiology]
      * [JP Core Observation VitalSigns （バイタルサイン）プロファイル][JP_Observation_VitalSigns]
      * [JP Core Observation BodyMeasurement （身体計測）プロファイル][JP_Observation_BodyMeasurement]
      * [JP Core Observation PhysicalExam （身体所見）プロファイル][JP_Observation_PhysicalExam]
      * [JP Core Observation SocialHistory （生活背景）プロファイル][JP_Observation_SocialHistory]
      * [JP Core Observation Electrocardiogram （心電図検査結果）プロファイル][JP_Observation_Electrocardiogram]
      * JP Core Observation Radiology (放射線画像検査)
        * [JP Core Observation Radiology Findings (放射線画像検査所見）プロファイル)][JP_Observation_Radiology_Findings]
        * [JP Core Observation Radiology Impression (放射線画像検査インプレッション)プロファイル][JP_Observation_Radiology_Impression]
      * [JP Core Observation Endoscopy （内視鏡検査）プロファイル][JP_Observation_Endoscopy]
      * [JP Core Observation DentalOral Tooth Existence Profile （口腔診査）プロファイル][JP_Observation_DentalOral_ToothExistence]
      * [JP Core Observation DentalOral Tooth Treatment Condition Profile （口腔診査）プロファイル][JP_Observation_DentalOral_ToothTreatmentCondition]
      * [JP Core Observation DentalOral Missing Tooth Condition Profile （口腔診査）プロファイル][JP_Observation_DentalOral_MissingToothCondition]
  * Specimen （検体）
    * [JP Core Specimen Common （共通）プロファイル][JP_Specimen_Common]
  * Media （メディア）
    * [JP Core Media Endoscopy（内視鏡検査）プロファイル][JP_Media_Endoscopy]
  * ImagingStudy （画像検査）
    * [JP Core ImagingStudy Radiology（放射線検査）プロファイル][JP_ImagingStudy_Radiology]
    * [JP Core ImagingStudy Endoscopy（内視鏡検査）プロファイル][JP_ImagingStudy_Endoscopy]
  * DiagnosticReport （診断レポート）
    * [JP Core DiagnosticReport Common （共通）プロファイル][JP_DiagnosticReport_Common]
      * [JP Core DiagnosticReport LabResult （検体検査レポート）プロファイル][JP_DiagnosticReport_LabResult]
      * [JP Core DiagnosticReport Microbiology （微生物学検査レポート）プロファイル][JP_DiagnosticReport_Microbiology]
      * [JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル][JP_DiagnosticReport_Radiology]
      * [JP Core DiagnosticReport Endoscopy （内視鏡レポート）プロファイル][JP_DiagnosticReport_Endoscopy]
      * [JP Core DiagnosticReport DentalOral （口腔診査レポート）プロファイル][JP_DiagnosticReport_DentalOral]
* [Clinicalグループ（診療）](group-clinical.html)
  * [JP Core AllergyIntolerance （アレルギー不耐症）プロファイル][JP_AllergyIntolerance]
  * [JP Core Condition （状態）プロファイル][JP_Condition]
    * [JP Core Condition Diagnosis (診断) プロファイル][JP_Condition_Diagnosis]
  * [JP Core Procedure （処置）プロファイル][JP_Procedure]
  * [JP Core FamilyMemberHistory（家族歴）プロファイル][JP_FamilyMemberHistory]
* [Workflowグループ](group-workflow.html)
  * ServiceRequest (サービスリクエスト)
    * [JP Core ServiceRequest Common (共通) プロファイル][JP_ServiceRequest_Common]

#### JP Coreで定義しないProfile(プロファイル)
次のProfileはJP Coreでは定義を行なわず、FHIR Baseをそのまま利用する。
* [Resource](https://www.hl7.org/fhir/R4/resource.html)
* [DomainResource](https://www.hl7.org/fhir/R4/domainresource.html)
* [Binary](https://www.hl7.org/fhir/R4/binary.html)
* [Bundle](https://www.hl7.org/fhir/R4/bundle.html)

#### Extensions （拡張）
JP Coreにて利用されるExtensionの一覧。
- [Extensions （拡張）一覧](artifacts.html#structures-extension-definitions)

#### Operations and Search Parameters （操作および検索パラメータ）
JP Coreにて利用されるSearch Parameter および Operationの一覧。
- [Search Parameters（検索パラメータ）一覧](group-searchParameter.html)

#### Terminology （用語集）
JP Coreにて利用されるCodeSystem および ValueSetの一覧。
- [CodeSystems （コードシステム）一覧](artifacts.html#terminology-code-systems)
- [ValueSets （値セット）一覧](artifacts.html#terminology-value-sets)
- [NamingSystems 一覧](artifacts.html#terminology-naming-systems)

### Capability Statement （機能宣言）
JP Coreを参考に定義したCapabilityStatementの一例。
- [Capability Statement（機能宣言）](group-capabilityStatement.html)

### Security （セキュリティ）
JP Core利用にあたり、考慮すべきセキュリティに関する要件を記載する。
 - [Security （セキュリティ）](security.html)

---
### Contributors：
JP Coreは以下の方々、および各サーブワーキンググループのここに記載されていない多くのメンバの献身的な活動や協力により作成されている。<br>
* <a href="https://jpfhir.jp/">日本医療情報学会NeXEHRS研究会FHIR日本実装検討WG</a>
  * NeXEHRS研究会代表幹事・FHIR日本実装検討WG座長　大江和彦（東京大学）
  * Infrastructure : インフラ基盤SWG
    * リーダ：㈱ファインデックス　宮川 力
    * サブリーダ：㈱ケーアイエス　小西 由貴範、日本総合システム㈱　松本 聖
    * メンバ：京都大学　須藤 英隼、東京大学　三谷 知宏、日本総合システム㈱　安達 隆佳、岡安 想、中川 雅三、藤野 孝彦、ファインデックス　小倉 卓義、（一社）保健医療福祉情報安全管理適合性評価協会　喜多 紘一

  * Diagnostics and Observations : 診断・検査SWG
    * リーダ：キヤノンメディカルシステムズ㈱　塩川 康成
    * サブリーダ：㈱ケーアイエス　平山 照幸
    * メンバ：千葉大学　横田 慎一郎、富士通㈱　石原 正樹、日本インターシステムズ株式会社㈱　上中 進太郎、㈱エイアンドティー　千葉 信行、深川 一成、㈱日立ハイテク　川田 剛、H.U.グループホールディングス㈱　和田 征剛、岩手医科大学　田中 良一、見附市立病院　西野 克彦、大船中央病院　青木 陽介、北海道科学大学　谷川 琢海、谷川原 綾子、旭川医科大学　谷 祐児、京都大学　山口 泉、東京大学　三谷 知広、今井 健、井田 有亮、岐阜大学　小林 慎治、オリンパスメディカルシステムズ㈱　尾崎 孝史、富士フイルムホールディングス㈱　龍田 岳一、藤田医科大学　苅谷 敬士、キヤノンITSメディカル㈱　瀧上 悟、川部 鉄士、大阪大学　野崎 一徳、東北大学　中山 雅晴、日本IBM㈱　木村 雅彦
    * 協力者：オリンパスメディカルシステムズ㈱　大森 真一、富士フイルム㈱　三浦 悟朗、日本光電工業㈱　越後 洋一、竹田 敦、フクダ電子㈱　山田 剛、嶋井 洋介

  * Administration : アドミニストレーションSWG
    * リーダ：日本HL7協会　檀原 一之
    * サブリーダ：千葉大学　土井 俊祐、㈱セールスフォース・ジャパン　上中 進太郎
    * メンバ：東京大学　岡本 潤、千葉大学　木村 倫人、㈱シーエスアイ　黒澤 亮、中平 顕士、高津 宏徳、日本電気㈱　矢原 潤一、㈱ケーアイエス　小西 由貴範、ＴＩＳ㈱　比留間 健

  * Clinical Module : 臨床・薬剤SWG
    * リーダ：岐阜大学　小林 慎治、東京大学　河添 悦昌
    * サブリーダ：日本アイ・ビー・エム㈱　木村 雅彦、㈱メドレー　児玉 義憲
    * メンバ：見附市立病院　西野 克彦、九州大学　高田 敦史、東大病院　永島 里美、慶應義塾大学 横山 諒一、シンクタンク勤務　河﨑 泰子

  * Terminology : ターミノロジーSWG
    * リーダ：東京大学　今井 健
    * サブリーダ：愛媛大学　木村映善

{% include markdown-link-references.md %}
