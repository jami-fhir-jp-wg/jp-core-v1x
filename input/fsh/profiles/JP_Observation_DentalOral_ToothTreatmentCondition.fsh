Profile: JP_Observation_DentalOral_ToothTreatmentCondition
Parent: JP_Observation_Common
Id: jp-observation-dentaloral-toothtreatmentcondition
Title: "JP Core Observation DentalOral Tooth Treatment Condition Profile"
Description: "このプロファイルはObservationリソースに対して、口腔診査結果（口腔内所見）の特定の現存歯の処置データを送受信するための制約と拡張を定めたものである。"
//extension 参照宣言

* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_ToothTreatmentCondition"
* ^status = #active
* ^date = "2024-06-24"
* . ^short = "特定の現存歯の処置状態のプロファイル"
* . ^definition = "口腔診査結果レポートの特定の現存歯の処置状態のプロファイル"

* identifier 0..
* insert SetDefinition(identifier, Observationのためのビジネス識別子  
【JP Core仕様】当該口腔診査（検査項目）に対して、施設内で割り振られる一意の識別子。)
* identifier ^comment = "例：実施日に連番を付加した番号"

* basedOn 0..
* insert SetDefinition(basedOn, 実施されるプラン、提案、依頼  
【JP Core仕様】未使用)
* basedOn ^comment = "本プロファイル（特定の歯の有無・状態）は口腔診査レポートに紐付く前提のため、本プロファイル特有の定義はしない。"

* partOf 0..
* insert SetDefinition(partOf, 参照されるイベントの一部分  
【JP Core仕様】未使用)

* status 1..1
* insert SetDefinition(status, 結果の状態  
【JP Core仕様】ステータス)

* category 3..
* insert SetDefinition(category, Observationの種類（タイプ）の分類  
【JP Core仕様】以下を指定する。
第1コード：exam
第2コード：LP89803-8 （Dental）
第3コード：DO-1-02 （ToothTreatmentCondition）)
* category contains
    second 1..1 and
    third 1..1

* insert SetDefinition(category[first], このObservationに関する分類（JP_SimpleObservationCategory_VS）、必須項目)
* category[first].coding.code = #exam (exactly)
* category[first].coding.display = "exam"

* insert SetDefinition(category[second],第2カテゴリはLOINCのコードLP89803-8固定で必須とする、ValueSetは指定しない)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..1
* category[second].coding.code = $Loinc_CS#LP89803-8 (exactly)

* insert SetDefinition(category[third], このObservationに関する詳細分類、JP_ObservationDetailedDentalCategory_VSより選択する、必須項目)
* category[third] from $JP_ObservationDetailedDentalCategory_VS (required)
* category[third].coding.system = $JP_ObservationDentalCategory_CS (exactly)
* category[third].coding.code 1..1
* category[third].coding.code = #DO-1-02 (exactly)

* code 1..1
* insert SetDefinition(code.coding, observation のタイプ（コードまたはタイプ）
【JP Core仕様】54570-7（Oral/dental status）を指定する)
* code.coding.system = $Loinc_CS (exactly)
* code.coding.code 1..1
* code.coding.code = $Loinc_CS#54570-7 (exactly)
* code.coding.display = "Oral/Dental Status"

* subject only Reference(JP_Patient)
* insert SetDefinition(subject, 観察対象者  
【JP Core仕様】患者情報)

* insert SetDefinition(focus, subject 要素が実際のobservationの対象でない場合に、observation の対象物。  
【JP Core仕様】未使用)

* insert SetDefinition(encounter, このobservationが行われるヘルスケアイベント)
* encounter ^comment = "例：診療、歯科健診（検診）、身元不明者調査"

* effective[x] only dateTime
* insert SetDefinition(effective[x], 臨床的に関連する時刻または時間  
【JP Core仕様】実施日時)

* insert SetDefinition(issued, このバージョンが利用可能となった日時  
【JP Core仕様】所見確定日時)

* insert SetDefinition(performer, observationに責任をもつ者)
* performer ^comment = "例：歯科医師など"

* value[x] only CodeableConcept
* insert SetDefinition(value[x], 実際の結果値 【JP Core仕様】component要素を利用して複数の結果を表現することを考慮しているため、本要素は使用しない)

* insert SetDefinition(dataAbsentReason, 結結果が欠損値である理由  
【JP Core仕様】結果が存在しなかった場合、その理由)

* insert SetDefinition(interpretation, 高、低、正常等の結果のカテゴリ分けした評価
【JP Core仕様】未使用)

* insert SetDefinition(note, 結果に対するコメント  
【JP Core仕様】未使用)

* insert SetDefinition(bodySite, 観察された身体部位 【JP Core仕様】特定の歯（歯式）を指定)
* bodySite from JP_DentalBodySite_VS (preferred)

* extension contains
    JP_Observation_DentalOral_ToothRoot named toothRoot 0..1 and
    JP_Observation_DentalOral_BodyStructure named bodyStructure ..*
* insert SetDefinition(extension[toothRoot], 【JP Core仕様】特定の歯の歯根を指定)
* insert SetDefinition(extension[bodyStructure], 【JP Core仕様】特定の歯の歯面を指定)
* insert SetDefinition(method, 検査方法（目視、読影など)
* insert SetDefinition(specimen, 観察（観測、検査）に使われた検体材料 【JP Core仕様】未使用)

* device ^comment = "例：口腔内スキャナなど"

//* insert SetDefinition(referenceRange, 未使用)
//* hasMember only Reference(JP_Observation_Common)
//* hasMember ^Invariants = "implies hasMember.empty()"

* insert SetDefinition(derivedFrom, observationの発生源に関連する測定 【JP Core仕様】未使用)

// Todo:　要確認
* insert SetDefinition(component, 複合的な結果 【JP Core仕様】特定の現存歯の処置状態)
* component.code.coding.code 1..
* component.code.coding ^slicing.discriminator.type = #value
* component.code.coding ^slicing.discriminator.path = "system"
* component.code.coding ^slicing.rules = #open
* component.code.coding contains
   primary ..1 and
   sub ..1
* component.code ^comment = "2つのいずれかのコードを設定する。
主コード（primary）は、細かい粒度の現存歯の処置状態
副コード（sub）は、粗い粒度の現存歯の処置状態"

* insert SetDefinition(component.code.coding[primary], 細かい粒度の現存歯の処置状態)
* component.code.coding[primary] from JP_DentalPresentTeethObservation_VS (preferred)
* component.code.coding[primary].system = $JP_DentalPresentTeethObservation_CS (exactly)
* component.code.coding[primary].code ..1

* insert SetDefinition(component.code.coding[sub], 粗い粒度の現存歯の処置状態)
* component.code.coding[sub] from JP_DentalSimplePresentTeethObservation_VS (preferred)
* component.code.coding[sub].system = $JP_DentalSimplePresentTeethObservation_CS (exactly)
* component.code.coding[sub].code ..1