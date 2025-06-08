Profile: JP_Observation_DentalOral_MissingToothCondition
Parent: JP_Observation_Common
Id: jp-observation-dentaloral-missingtoothcondition
Title: "JP Core Observation DentalOral Missing Tooth Condition Profile"
Description: "このプロファイルはObservationリソースに対して、口腔診査結果（口腔所見）の特定の欠損歯の処置データを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_MissingToothCondition"
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "特定の欠損歯の処置状態のプロファイル"
* . ^definition = "口腔審査結果レポートの特定の欠損歯の処置状態のプロファイル"

* insert SetDefinition(identifier, 当該口腔診査（検査項目）に対して、施設内で割り振られる一意の識別子。例えば、実施日に連番を付加した番号など。)
* insert SetDefinition(basedOn, 未使用)
* insert SetDefinition(partOf, 未使用)

* category 3..
* category contains
    second 1..1 and
    third 1..1
* category ^comment = "3つのコードを設定する。
第1コード（first）は、simpleObservationコード体系を必須とし、examを設定する。
第2コード（second）は、歯科を表すコードLP89803-8を設定する。
第3コード（third）は、歯の有無や処置状態などを表すコードを設定する。なお、日本では適切なコード体系が存在しないため、独自のバリューセットを定義する。"

* insert SetDefinition(category[first], このObservationに関する分類（JP_SimpleObservationCategory_VS）、必須項目)
* category[first].coding.code = #exam (exactly)

* insert SetDefinition(category[second],第2カテゴリはLOINCのコードLP89803-8固定で必須とする、ValueSetは指定しない)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..1
* category[second].coding.code = #LP89803-8 (exactly)

* insert SetDefinition(category[third], このObservationに関する詳細分類、JP_ObservationDetailedDentalCategory_VSより選択する、必須項目)
* category[third] from $JP_ObservationDetailedDentalCategory_VS (required)
* category[third].coding.system = $JP_ObservationDentalCategory_CS (exactly)
* category[third].coding.code 1..1
* category[third].coding.code = #DO-1-03 (exactly)

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
//* bodySite from JP_DentalBodySite_VS (preferred)
* insert SetDefinition(bodySite, 特定の歯（歯式）)

* insert SetDefinition(method, 検査方法（目視、読影など)
* insert SetDefinition(specimen, 未使用)
* insert SetDefinition(device, 例：口腔内スキャナなど)
* insert SetDefinition(referenceRange, 未使用)

* hasMember only Reference(JP_Observation_Common)

* insert SetDefinition(derivedFrom, 未使用)
* insert SetDefinition(component, 欠損歯の処置状態)

* component.code.coding.code 1..
* component.code.coding ^slicing.discriminator.type = #value
* component.code.coding ^slicing.discriminator.path = "system"
* component.code.coding ^slicing.rules = #open
* component.code.coding contains
   primary ..1 and
   sub ..1
* component.code ^comment = "2つのいずれかのコードを設定する。
主コード（primary）は、細かい粒度の欠損歯の処置状態
副コード（sub）は、粗い粒度の欠損歯の処置状態"

* insert SetDefinition(component.code.coding[primary], 細かい粒度の欠損歯の処置状態)
* component.code.coding[primary] from JP_DentalMissingTeethObservation_VS (preferred)
* component.code.coding[primary].system = $JP_DentalMissingTeethObservation_CS (exactly)
* component.code.coding[primary].code ..1

* insert SetDefinition(component.code.coding[sub], 粗い粒度の欠損歯の処置状態)
* component.code.coding[sub] from $JP_DentalSimpleMissingTeethObservation_VS (preferred)
* component.code.coding[sub].system = $JP_DentalSimpleMissingTeethObservation_CS (exactly)
* component.code.coding[sub].code ..1
