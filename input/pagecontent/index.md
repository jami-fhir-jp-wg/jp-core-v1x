このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのドラフトVer.1.1である。このバージョンは日本HL7協会による承認を受けていない。今後、予告なく内容に変更がある。また実装や利用は全て自己責任で行なうこと。 <br/>


### 概要
ガイダンス: JP Coreでの全体に関わる規則や注意事項を記載している。
* [総合ガイダンス](guide-general.html)
* [Must SupportとCardinality(多重度)のルール](guide-mustSupportCardinality.html)
* [欠損値の扱い](guide-handlingOfNonExistentData.html)
* [文字コード](guide-characterEncoding.html)
* [検索](guide-stringSearch.html)

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
  * [JP Core Immunization （予防接種記録）プロファイル][JP_Immunization]
* [Diagnosticグループ （診断）](group-diagnostic.html)
  * Observation （検査）
    * [JP Core Observation Common （共通）プロファイル][JP_Observation_Common]
    * [JP Core Observation LabResult （検体検査結果）プロファイル][JP_Observation_LabResult]
    * [JP Core Observation VitalSigns （バイタルサイン）プロファイル][JP_Observation_VitalSigns]
    * [JP Core Observation BodyMeasurement （身体計測）プロファイル][JP_Observation_BodyMeasurement]
    * [JP Core Observation PhysicalExam （身体所見）プロファイル][JP_Observation_PhysicalExam]
    * [JP Core Observation SocialHistory （生活背景）プロファイル][JP_Observation_SocialHistory]
  * ImagingStudy （画像検査）
    * [JP Core ImagingStudy Radiology（放射線検査）プロファイル][JP_ImagingStudy_Radiology]
  * DiagnosticReport （診断レポート)
    * [JP Core DiagnosticReport Common （共通）プロファイル][JP_DiagnosticReport_Common]
    * [JP Core DiagnosticReport LabResult （検体検査レポート）プロファイル][JP_DiagnosticReport_LabResult]
    * [JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル][JP_DiagnosticReport_Radiology]
* [Clinicalグループ（診療）](group-clinical.html)
  * [JP Core AllergyIntolerance （アレルギー不耐症）プロファイル][JP_AllergyIntolerance]
  * [JP Core Condition （状態）プロファイル][JP_Condition]
  * [JP Core Procedure （処置）プロファイル][JP_Procedure]
  * [JP Core FamilyMemberHistory（家族歴）プロファイル][JP_FamilyMemberHistory]

#### JP Coreで定義しないProfile(プロファイル)
次のProfileはJP Coreでは定義を行なわず、FHIR Baseをそのまま利用する。
* [Resource](https://www.hl7.org/fhir/resource.html)
* [DomainResource](https://www.hl7.org/fhir/domainresource.html)
* [Binary](https://www.hl7.org/fhir/binary.html)
* [Bundle](https://www.hl7.org/fhir/bundle.html)

#### Extensions （拡張）
JP Coreにて利用されるExtensionの一覧。
- [Extensions （拡張）一覧](artifacts.html#structures-extension-definitions)

#### Operations and Search Parameters （操作および検索パラメータ）
JP Coreにて利用されるSearch Parameter および Operationの一覧。
- [Search Parameters（検索パラメータ）一覧](group-searchParameter.html)

#### Terminology （用語集）
JP Coreにて利用されるCodeSytem および ValueSetの一覧。
- [CodeSystems （コードシステム）一覧](artifacts.html#terminology-code-systems)
- [ValueSets （値セット）一覧](artifacts.html#terminology-value-sets)

### Capability Statement （機能宣言）
JP Coreを参考に定義したCapabiltyStetamentの一例。
- [Capablity Statement（機能宣言）](group-capabilityStatement.html)

### Security （セキュリティ）
JP Core利用にあたり、考慮すべきセキュリティに関する要件を記載する。
 - [Security （セキュリティ）](security.html)

### 変更履歴
- [変更履歴](update_history.html)

---
### Contributers：
JP Coreは以下の方々、および各サーブワーキンググループのここに記載されていない多くのメンバーの献身的な活動や協力により作成されている。
* SWG1：FHIR Infrastructure
  * リーダー：㈱ファインデックス　宮川 力
  * サブリーダー：東京大学　三谷 知宏、㈱ケーアイエス　小西 由貴範
  * メンバ：（一社）保健医療福祉情報安全管理適合性評価協会　喜多 紘一、日本総合システム㈱　松本 聖、中川 雅三、安達 隆佳

* SWG2：Diagnostics and Observations
  * リーダ：キヤノンメディカルシステムズ㈱　塩川 康成
  * サブリーダ：㈱ケーアイエス　平山 照幸
  * メンバ：東京大学　横田慎一郎、富士通㈱　石原 正樹、(株)セールスフォース・ジャパン　上中進太郎、㈱エイアンドティー　千葉 信行、㈱NTTデータ　川田 剛、H.U.グループホールディングス㈱　和田 征剛、岩手医科大学　田中 良一、大船中央病院　青木 陽介、北海道科学大学　谷川 琢海、旭川医科大学　谷 祐児

* SWG3： Patient Administration
  * リーダ：日本HL7協会 檀原 一之
  * サブリーダ：東京大学　土井 俊祐、(株)セールスフォース・ジャパン　上中 進太郎
  * メンバ：東京大学　岡本 潤、㈱シーエスアイ　黒澤 亮、中平 顕士、高津 宏徳、日本電気㈱　矢原 潤一、㈱ケーアイエス　小西 由貴範、ＴＩＳ㈱　比留間 健

* SWG4：Clinical Module
  * リーダ：東京大学　河添 悦昌
  * サブリーダー：山口大学　石井 博、東大病院　関 倫久
  * メンバ：㈱富士通　小山内 尚、西山 喜樹、能崎 克行、東大病院　永島 里美

* SWG5：Pharmacy and Medication
  * リーダ：国立保健医療科学院　小林 慎治
  * サブリーダ：日本アイ・ビー・エム㈱　木村 雅彦、㈱メドレー　児玉 義憲
  * メンバ：九州大学　高田 敦史、東大病院　永島 里美、日本調剤㈱　栗原 邦彦、シンクタンク勤務　河﨑 泰子

{% include markdown-link-references.md %}
