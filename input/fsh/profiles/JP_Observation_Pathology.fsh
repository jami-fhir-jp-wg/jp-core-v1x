// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Pathology
Parent: JP_Observation_Common
Id: jp-observation-pathology
Title: "JP Core Observation Pathology Profile"
Description: "このプロファイルはObservationリソースに対して、病理検査における観察結果（診断、所見など）の情報を送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Pathology"
* ^status = #active
* ^date = "2025-01-15"
* . ^short = "病理検査による観察結果（診断、所見など）の情報。【詳細参照】"
* . ^definition = "病理検査による観察結果（診断、所見など）の情報。"
* . ^comment = "病理検査に関するobservation（肉眼所見、顕微鏡所見、診断結果など）の制約プロファイル。"
* identifier ^short = "病理検査に関する当該項目に対して、施設内で割り振られる一意の識別子。"
* identifier ^definition = "病理検査に関する当該項目に対して、施設内で割り振られる一意の識別子。"
* basedOn only Reference(ServiceRequest)
* basedOn ^short = "このObservationが実施されることになった依頼情報。【詳細参照】"
* basedOn ^definition = "このObservationが実施されることになった依頼情報。"
* basedOn ^comment = "【JP Core仕様】オーダ情報がある場合、ServiceRequestのリソースを参照。"
* partOf only Reference(JP_Procedure)
* partOf ^short = "このObservationが関連する手技の情報。【詳細参照】"
* partOf ^definition = "このObservationが関連する手技の情報。"
* partOf ^comment = "【JP Core仕様】生検や手術等の手技情報がある場合、JP Core Procedureのリソースを参照。"
* category MS
* category 2..*
* category contains
    pathology 1..1
* category ^short = "このObservationを分類するコード【詳細参照】"
* category ^comment = "病理検査の第1カテゴリはJP_SimpleObservationCategory_VSからlaboratoryを指定、第2カテゴリはpathology固定とする。"
* category[first] MS
* category[first] ^short = "病理検査の第1カテゴリはJP_SimpleObservationCategory_VSからlaboratoryを指定する。"
* category[first].coding.code = $JP_SimpleObservationCategory_CS#laboratory (exactly)
* category[pathology] MS
* category[pathology] ^short = "第2カテゴリはpathology固定とする。"
* category[pathology] ^definition = "第2カテゴリはpathology固定とする。"
* category[pathology].coding.system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ObservationCategory_CS" (exactly)
* category[pathology].coding.code 1..
* category[pathology].coding.code = #pathology (exactly)
* code MS
* code from JP_ObservationPathologyCode_VS (preferred)
* code ^short = "このObservationの対象を特定するコード。【詳細参照】"
* code ^definition = "このObservationの対象を特定するコード。"
* code ^comment = "22634-0（肉眼所見）、22635-7（顕微鏡所見）、22637-3（病理診断）等のLOINCコードから選択する。"
* subject MS
* subject 1..1
* subject only Reference(JP_Patient)
* subject ^short = "このObservationの対象患者。"
* subject ^definition = "このObservationの対象患者。"
* focus ^short = "実際の観察対象（検体等）に関する情報。【詳細参照】"
* focus ^definition = "実際の観察対象（検体等）に関する情報。"
* focus ^comment = "必要に応じて検体情報を参照する場合に使用。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "このObservationが実施された受診情報。"
* encounter ^definition = "このObservationが実施された受診情報。"
* effective[x] MS
* effective[x] only dateTime or Period
* effective[x] ^short = "診断・所見を記載した日時。【詳細参照】"
* effective[x] ^definition = "診断・所見を記載した日時。"
* effective[x] ^comment = "【JP Core仕様】effectiveDateTime：診断、所見を記載した際の日時。"
* issued MS
* issued ^short = "このObservationが利用可能となった日時。"
* issued ^definition = "このObservationが利用可能となった日時。"
* performer MS
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* performer ^short = "病理診断を行った病理医。【詳細参照】"
* performer ^definition = "病理診断を行った病理医。"
* performer ^comment = "通常、JP Core Practitionerリソースを参照する。"
* value[x] MS
* value[x] only string or CodeableConcept
* value[x] ^short = "病理検査の観察結果（診断、所見など）の情報を格納する。【詳細参照】"
* value[x] ^definition = "病理検査の観察結果（診断、所見など）の情報を格納する。"
* value[x] ^comment = "【JP Core仕様】肉眼所見、顕微鏡所見はstring、診断結果はCodeableConceptを推奨。"
* dataAbsentReason ^short = "観察結果が存在しない理由。"
* dataAbsentReason ^definition = "観察結果が存在しない理由。"
* interpretation MS
* interpretation ^short = "観察結果の解釈（悪性度等）。【詳細参照】"
* interpretation ^definition = "観察結果の解釈（悪性度等）。"
* interpretation ^comment = "悪性、良性、境界病変等の判定を示す場合に使用。"
* note ^short = "追加的なコメント。"
* note ^definition = "追加的なコメント。"
* bodySite MS
* bodySite ^short = "検体採取部位。【詳細参照】"
* bodySite ^definition = "検体採取部位。"
* bodySite ^comment = "解剖学的部位を示すコードを使用。"
* method MS
* method ^short = "観察方法（染色法等）。【詳細参照】"
* method ^definition = "観察方法（染色法等）。"
* method ^comment = "HE染色、免疫染色等の方法を示す。"
* specimen MS
* specimen only Reference(JP_Specimen_Pathology)
* specimen ^short = "この観察に使用された検体。【詳細参照】"
* specimen ^definition = "この観察に使用された検体。"
* specimen ^comment = "JP Core Specimen Pathologyリソースを参照する。"
* device ^short = "観察に使用した機器。"
* device ^definition = "観察に使用した機器。"
* referenceRange ^short = "結果解釈のためのガイド。"
* referenceRange ^definition = "結果解釈のためのガイド。"
* hasMember MS
* hasMember only Reference(JP_Observation_Common or JP_Observation_Pathology)
* hasMember ^short = "関連する観察結果。【詳細参照】"
* hasMember ^definition = "関連する観察結果。"
* hasMember ^comment = "【JP Core仕様】免疫染色の各マーカー結果等、関連する観察結果を参照する場合に使用。"
* derivedFrom ^short = "関連する画像やレポート。"
* derivedFrom ^definition = "関連する画像やレポート。"
* component MS
* component ^short = "観察結果の構成要素。【詳細参照】"
* component ^definition = "観察結果の構成要素。"
* component ^comment = "免疫染色の場合、各マーカーの結果を構成要素として記録可能。"
* component.code MS
* component.code ^short = "構成要素を特定するコード。"
* component.code ^definition = "構成要素を特定するコード。"
* component.value[x] MS
* component.value[x] ^short = "構成要素の実際の結果。"
* component.value[x] ^definition = "構成要素の実際の結果。"
* component.dataAbsentReason ^short = "構成要素の結果が存在しない理由。"
* component.dataAbsentReason ^definition = "構成要素の結果が存在しない理由。"
* component.interpretation ^short = "構成要素の結果の解釈。"
* component.interpretation ^definition = "構成要素の結果の解釈。"
* component.referenceRange ^short = "構成要素の結果解釈のためのガイド。"
* component.referenceRange ^definition = "構成要素の結果解釈のためのガイド。"