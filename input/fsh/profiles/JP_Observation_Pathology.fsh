// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Pathology
Parent: JP_Observation_Common
Id: jp-observation-pathology
Title: "JP Core Observation Pathology Profile"
Description: "このプロファイルはObservationリソースに対して、病理診断による観察結果（診断、所見など）の情報を送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Pathology"
* ^status = #active
* ^date = "2025-08-14"
* . ^short = "病理診断による観察結果（診断、所見など）の情報。【詳細参照】"
* . ^definition = "病理診断による観察結果（診断、所見など）の情報。"
* . ^comment = "病理診断に関するobservation（所見や診断結果など）の制約プロフィール。"
* identifier ^short = "病理診断に関する当該項目に対して、施設内で割り振られる一意の識別子。"
* identifier ^definition = "病理診断に関する当該項目に対して、施設内で割り振られる一意の識別子。"
* basedOn only Reference(ServiceRequest)
* basedOn ^short = "このObservationが実施されることになった依頼や計画、提案に関する情報。【詳細参照】"
* basedOn ^definition = "このObservationが実施されることになった依頼や計画、提案に関する情報。"
* basedOn ^comment = "【JP Core仕様】オーダ情報がある場合、このプロファイルでは ServiceRequest のリソースを参照。"
* partOf ^short = "このObservationが親イベントの一部を成す要素であるとき、その親イベントに関する情報。【詳細参照】"
* partOf ^definition = "このObservationが親イベントの一部を成す要素であるとき、その親イベントに関する情報。"
* partOf ^comment = "【JP Core仕様】実施した手技の背景情報（病理診断情報など）にあたる場合 Procedure のリソースを参照。"
* category MS
* category 2..*
* category contains
    second 1..1
* category ^short = "このObservationを分類するコード【詳細参照】"
* category ^comment = "病理診断の第1カテゴリはJP_SimpleObservationCategory_VSからprocedureを指定、第2カテゴリはLOINCのPartコードLP29708-2（病理）固定とする。"
* category[first] MS
* category[first] ^short = "病理診断の第1カテゴリはJP_SimpleObservationCategory_VSからprocedureを指定する。"
* category[first].coding.code = $JP_SimpleObservationCategory_CS#procedure (exactly)
* insert SetDefinition(category[second],第2カテゴリはLOINCのPartコードLP29708-2（病理）固定とする。ValueSetは指定しない)
* category[second] MS
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..
* category[second].coding.code = $Loinc_CS#LP29708-2 (exactly)
* code from JP_PathologyObservationCode_VS (preferred)
* code ^short = "このObservationの対象を特定するコード。【詳細参照】"
* code ^definition = "このObservationの対象を特定するコード。"
* code ^comment = "22634-0（病理診断最終診断）、22637-3（病理組織学的観察）、22636-5（肉眼的観察）などから選択する。"
* subject MS
* subject 1..1
* subject only Reference(JP_Patient)
* focus ^short = "配偶者、親、胎児、ドナーなど、このObservationのsubject要素が実際の対象でない場合、その実際の対象に関する情報。【詳細参照】"
* focus ^comment = "病理診断では通常省略してよい。"
* effective[x] MS
* effective[x] only dateTime or Period
* effective[x] ^comment = "【JP Core仕様】effectiveDateTime：診断、所見を記載した際の日時。effectivePeriod：診断、所見以外の観察結果を記載する際、必要に応じて使用。"
* value[x] MS
* value[x] from JP_PathologyDiagnosis_VS (example)
* value[x] only CodeableConcept or string
* value[x] ^short = "病理診断の観察結果（診断、所見など）の情報を格納する。【詳細参照】"
* value[x] ^definition = "病理診断の観察結果（診断、所見など）の情報を格納する。"
* value[x] ^comment = "【JP Core仕様】主に診断、所見情報記載時に使用。text記載は必須とし、必要に応じてcodingも使用する。"
* bodySite MS
* bodySite from JP_PathologyOrgan_VS (example)
* bodySite ^short = "検体採取部位や病変部位の解剖学的位置。【詳細参照】"
* bodySite ^definition = "検体採取部位や病変部位の解剖学的位置。"
* bodySite ^comment = "病理診断では部位の記載が重要な要素となる。"
* specimen MS
* specimen only Reference(JP_Specimen)
* specimen ^short = "観察対象となった検体の情報。【詳細参照】"
* specimen ^definition = "観察対象となった検体の情報。"
* specimen ^comment = "病理診断では検体情報が重要な要素となるため、JP Core Specimenリソースを参照する。"
* hasMember MS
* hasMember only Reference(JP_Observation_Common or JP_Observation_Pathology)
* hasMember ^short = "病理診断による観察結果を関連付ける際、診断と所見のobservationを関連付けるためにhasMemberエレメントを使用。"
* hasMember ^definition = "病理診断による観察結果を関連付ける際、診断と所見のobservationを関連付けるためにhasMemberエレメントを使用。"
* hasMember ^comment = "【JP Core仕様】JP_Observation_Common：診断、所見以外のobservationを関連付ける場合に使用。"
* method MS
* method from JP_PathologyStaining_VS (example)
* method ^short = "観察、測定、または評価の方法（例：染色方法）。【詳細参照】"
* method ^definition = "観察、測定、または評価の方法（例：染色方法）。"
* method ^comment = "HE染色、PAS染色、免疫組織化学染色などの方法を記載する。"
* component MS
* component ^short = "複数の項目を含む観察結果の構成要素。【詳細参照】"
* component ^definition = "複数の項目を含む観察結果の構成要素。"
* component ^comment = "複数の病理所見や測定値を個別に記載する場合に使用。"
* component.code from JP_PathologyObservationCode_VS (preferred)
* component.code ^short = "構成要素のコード。"
* component.code ^definition = "構成要素のコード。"
* component.value[x] from JP_PathologyDiagnosis_VS (example)
* component.value[x] ^short = "構成要素の観察結果。"
* component.value[x] ^definition = "構成要素の観察結果。"
