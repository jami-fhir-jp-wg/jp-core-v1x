// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Endoscopy
Parent: JP_Observation_Common
Id: jp-observation-endoscopy
Title: "JP Core Observation Endoscopy Profile"
Description: "このプロファイルはObservationリソースに対して、内視鏡を使用して実施された検査、治療による観察結果（診断、所見など）の情報を送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Endoscopy"
* ^status = #active
* ^date = "2024-11-18"
* . ^short = "内視鏡検査、治療による観察結果（診断、所見など）の情報。【詳細参照】"
* . ^definition = "内視鏡検査、治療による観察結果（診断、所見など）の情報。"
* . ^comment = "内視鏡検査、治療に関するobservation（所見や診断結果など）の制約プロフィール。"
* identifier ^short = "内視鏡に関する当該項目に対して、施設内で割り振られる一意の識別子。"
* identifier ^definition = "内視鏡に関する当該項目に対して、施設内で割り振られる一意の識別子。"
* basedOn only Reference(ServiceRequest)
* basedOn ^short = "このObservationが実施されることになった依頼や計画、提案に関する情報。【詳細参照】"
* basedOn ^definition = "このObservationが実施されることになった依頼や計画、提案に関する情報。"
* basedOn ^comment = "【JP Core仕様】オーダ情報がある場合、このプロファイルでは ServiceRequest のリソースを参照。"
* partOf ^short = "このObservationが親イベントの一部を成す要素であるとき、その親イベントに関する情報。【詳細参照】"
* partOf ^definition = "このObservationが親イベントの一部を成す要素であるとき、その親イベントに関する情報。"
* partOf ^comment = "【JP Core仕様】実施した手技の背景情報（質的診断情報など）にあたる場合 Procedure のリソースを参照。"
* category MS
* category 2..*
* category contains
    second 1..1
* category ^short = "このObservationを分類するコード【詳細参照】"
* category ^comment = "内視鏡検査の第1カテゴリはJP_SimpleObservationCategory_VSからprocedureを指定、第2カテゴリはLOINCのPartコードLP7796-8（内視鏡）固定とする。"
* category[first] ^short = "内視鏡検査の第1カテゴリはJP_SimpleObservationCategory_VSからprocedureを指定する。"
* category[first].coding.code = $JP_SimpleObservationCategory_CS#procedure (exactly)
* insert SetDefinition(category[second],第2カテゴリはLOINCのPartコードLP7796-8（内視鏡）固定とする。ValueSetは指定しない)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..
* category[second].coding.code = $Loinc_CS#LP7796-8 (exactly)
* code from JP_ObservationEndoscopyCode_VS (preferred)
* code ^short = "このObservationの対象を特定するコード。【詳細参照】"
* code ^definition = "このObservationの対象を特定するコード。"
* code ^comment = "19778-0（Indications description Narrative Endoscopy（所見））、19811-9（Diagnosis Endoscopy Procedure Narrative（診断））、およびLOINC申請中のJED用語の臓器毎のFindings、Diagnosis（Characterization）から選択する。JED用語のLOINCコードが取得できたらCodableConceptとして拡張予定。"
* subject MS
* subject 1..1
* subject only Reference(JP_Patient)
* focus ^short = "配偶者、親、胎児、ドナーなど、このObservationのsubject要素が実際の対象でない場合、その実際の対象に関する情報。【詳細参照】"
* focus ^comment = "内視鏡では省略してよい。"
* effective[x] MS
* effective[x] only dateTime or Period
* effective[x] ^comment = "【JP Core仕様】effectiveDateTime：診断、所見を記載した際の日時。effectivePeriod：診断、所見以外の観察結果を記載する際、必要に応じて使用。"
* value[x] MS
* value[x] only CodeableConcept or string
* value[x] ^short = "内視鏡検査、治療の観察結果（診断、所見など）の情報を格納する。診断、所見の場合、病変単位で記載することが望ましい。【詳細参照】"
* value[x] ^definition = "内視鏡検査、治療の観察結果（診断、所見など）の情報を格納する。診断、所見の場合、病変単位で記載することが望ましい。"
* value[x] ^comment = "【JP Core仕様】CodeableConcept：診断、所見情報記載時に使用。text記載は必須とし、必要に応じてcodingも使用する。string：診断、所見以外の情報を記載する際、必要に応じて使用。"
* insert SetDefinition(valueCodeableConcept,【JP Core仕様】診断、所見情報記載時に使用。text記載は必須とし、必要に応じてcodingも使用する) 
* valueCodeableConcept from JP_ObservationEndoscopyValueJed_VS (example)
* valueCodeableConcept ^comment = "【診断、所見情報記載時に使用。text記載は必須とし、必要に応じてcodingも使用する。"
* insert SetDefinition(valueString,【JP Core仕様】診断、所見以外の情報を記載する際、必要に応じて使用) 
* valueString ^comment = "診断、所見以外の情報を記載する際、必要に応じて使用する。"
* hasMember MS
* hasMember only Reference(JP_Observation_Common or JP_Observation_Endoscopy)
* hasMember ^short = "内視鏡による観察結果を病変単位で表現する際、診断と所見のobservationを関連付けるためにhasMemberエレメントを使用。"
* hasMember ^definition = "内視鏡による観察結果を病変単位で表現する際、診断と所見のobservationを関連付けるためにhasMemberエレメントを使用。"
* hasMember ^comment = "【JP Core仕様】JP_Observation_Common：診断、所見以外のobservationを関連付ける場合に使用。"
* referenceRange.type ^short = "参照範囲修飾子。"
* referenceRange.type ^definition = "参照範囲修飾子。"
* referenceRange.age ^short = "該当する場合、適用年齢。"
* referenceRange.age ^definition = "該当する場合、適用年齢。"
* component.referenceRange ^short = "コンポーネント結果の解釈のためのガイドの提供。"
* component.referenceRange ^definition = "コンポーネント結果の解釈のためのガイドの提供。"