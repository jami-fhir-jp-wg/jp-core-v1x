Profile: JP_Observation_DentalOral_ToothTreatmentCondition
Parent: JP_Observation_Common
Id: jp-observation-dentaloral-toothtreatmentcondition
Title: "JP Core Observation DentalOral Tooth Treatment Condition Profile"
Description: "このプロファイルはObservationリソースに対して、口腔診査結果（口腔内所見）の特定の現存歯の処置データを送受信するための制約と拡張を定めたものである。"
// extension 参照宣言
//* extension contains
//    JP_Obsercation_DentalOral_BodyStructure named bodyStructure ..1

* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_ToothTreatmentCondition"
* ^status = #active
* ^date = "2024-10-31"
* . ^short = "特定の現存歯の処置状態のプロファイル"
* . ^definition = "口腔診査結果レポートの特定の現存歯の処置状態のプロファイル"

* insert SetDefinition(identifier, 当該口腔診査（検査項目）に対して、施設内で割り振られる一意の識別子。例えば、実施日に連番を付加した番号など。)
* insert SetDefinition(basedOn, 未使用)
* insert SetDefinition(partOf, 未使用)

* category 3..
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains
    first 1..1 and
    second 1..1 and
    third 1..1
* category ^comment = "3つのコードを設定する。
第1コード（first）は、simpleObservationコード体系を必須とし、procedureを設定する。
第2コード（second）は、歯科を表すコードLP89803-8を設定する。
第3コード（third）は、歯の有無や処置状態などを表すコードを設定する。なお、日本では適切なコード体系が存在しないため、独自のバリューセットを定義する。"

* insert SetDefinition(category[first], このObservationに関する分類（JP_SimpleObservationCategory_VS）、必須項目)
* category[first] from JP_SimpleObservationCategory_VS (required)
//* category[first].coding.system = $JP_SimpleObservationCategory_CS (exactly)
* category[first].coding.code 1..1
//* category[first].coding.code = $JP_SimpleObservationCategory_CS#procedure (exactly)

* insert SetDefinition(category[second], このObservationに関するLOINC上の分類、必須項目)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..1
* category[second].coding.code = $Loinc_CS#LP89803-8 (exactly)
* category[second].coding.display = "Dental"

* insert SetDefinition(category[third], このObservationに関する詳細分類、JP_ObservationDentalCategory_VSより選択する、必須項目)
//* category[third] from $JP_ObservationDentalCategory_VS (required)
//* category[third].coding.system = $JP_ObservationDentalCategory_CS (exactly)
* category[third].coding.code 1..1
//* category[third].coding.code = $JP_ObservationDentalCategory_CS#ToothTreatmentCondition (exactly)
* category[third].coding.display = "Tooth Treatment Condition"

* insert SetDefinition(code.coding, このObservationの対象を特定するコード。LOINCより歯の有無・状態を表す54570-7を選択する。)
* code.coding.system = $Loinc_CS (exactly)
* code.coding.code 1..1
* code.coding.code = $Loinc_CS#54570-7 (exactly)
* code.coding.display = "Oral/Dental Status"

* subject 1..
* subject only Reference(JP_Patient)
* insert SetDefinition(subject, 患者情報)

* insert SetDefinition(focus, 未使用)
* insert SetDefinition(encounter, 例：診療、歯科健診（検診）、身元不明者調査)
* effective[x] only dateTime
* insert SetDefinition(effective[x], 実施日時)
* insert SetDefinition(issued, 所見確定日時)
* insert SetDefinition(performer, 例：歯科医師など)

* value[x] only CodeableConcept
* insert SetDefinition(value[x], 使用しない)
* value[x] ^comment = "日本仕様ではComponent要素を利用して複数の結果を表現することを考慮しているため、本要素は使用しない。"

* insert SetDefinition(dataAbsentReason, 結果が存在しなかった場合、その理由)
* insert SetDefinition(interpretation, 未使用)
* insert SetDefinition(note, 未使用)

* bodySite ^comment = "優先順位は以下の番号を推奨する。
1.FDI
2.厚生労働省標準標準歯式マスタ、レセプト電算処理用コード"
// bodySite from JP_DentalBodySite_VS (preferred)
* insert SetDefinition(bodySite, 特定の歯（歯式）)

* insert SetDefinition(method, 検査方法（目視、読影など)
* insert SetDefinition(specimen, 未使用)
* insert SetDefinition(device, 例：口腔内スキャナなど)
* insert SetDefinition(referenceRange, 未使用)

* hasMember only Reference(JP_Observation_Common)
//* hasMember ^Invariants = "implies hasMember.empty()"

* insert SetDefinition(derivedFrom, 未使用)
* insert SetDefinition(component, 特定の現存歯の処置状態)

//* component.code ^slicing.discriminator.type = #value
//* component.code ^slicing.discriminator.path = "coding.system"
//* component.code ^slicing.rules = #open
//* component.code contains
//    primary 1..1 and
//    sub 1..1
* component.code ^comment = "2つのいずれかのコードを設定する。
主コード（primary）は、細かい粒度の現存歯の処置状態
副コード（sub）は、粗い粒度の現存歯の処置状態"

//* insert SetDefinition(component.code[primary], 細かい粒度の現存歯の処置状態)
//* component.code[primary] from JP_DentalPresentTeethObservation_VS (preferred)
//* component.code[primary].coding.system = $JP_DentalPresentTeethObservation_CS (exactly)
//* component.code[primary].coding.code 1..1
//* component.code[primary].coding.code = $JP_DentalPresentTeethObservation_CS (exactly)

//* insert SetDefinition(component.code[sub], 粗い粒度の現存歯の処置状態)
//* component.code[sub] from JP_DentalSimplePresentTeethObservation_VS (preferred)
//* component.code[sub].coding.system = $JP_DentalSimplePresentTeethObservation_CS (exactly)
//* component.code[sub].coding.code 1..1
//* component.code[sub].coding.code = $JP_DentalSimplePresentTeethObservation_CS (exactly)


// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_Observation_DentalOral_BodyStructure
//-------------------------------
Extension: JP_Observation_DentalOral_BodyStructure
Id: jp-observation-dentaloral-bodystructure
Title: "JP Core Observation DentalOral BodyStructure Extension"
Description: "特定の歯の歯面を格納するための拡張"
* ^url = $JP_Observation_DentalOral_BodyStructure
* ^status = #active
* ^date = "2024-10-31"
* ^context.type = #element
* ^context.expression = "BodySite"
* . ^short = "特定の歯の歯面"
* . ^definition = "特定の歯の歯面を格納するための拡張"
* url = $JP_Observation_DentalOral_BodyStructure (exactly)
* value[x] only CodeableConcept
//* valueCodeableConcept from $JP_DentalBodyStructure_VS (preferred)
