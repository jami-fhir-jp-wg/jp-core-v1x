Profile: JP_Observation_DentalOral_ToothExistence
Parent: JP_Observation_Common
Id: jp-observation-dentaloral-toothexistence
Title: "JP Core Observation DentalOral Tooth Existence Profile"
Description: "このプロファイルはObservationリソースに対して、口腔診査結果（口腔内所見）の特定の歯の有無・状態データを送受信するための制約と拡張を定めたものである。"
// extension 参照宣言
* extension contains
    JP_Observation_DentalOral_BodySiteStatus named bodySiteStatus ..1

* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_ToothExistence"
* ^status = #active
* ^date = "2024-11-18"
* . ^short = "特定の歯の有無・状態のプロファイル"
* . ^definition = "口腔診査結果レポートの特定の歯の有無・状態のプロファイル"
* . ^comment = "本プロファイルと、現存歯の処置状態プロファイルや、欠損歯の処置状態プロファイルなどを組み合わせて利用する。"

* insert SetDefinition(identifier, 当該口腔診査（検査項目）に対して、施設内で割り振られる一意の識別子があればそれを使用する。例えば、実施日に連番を付加した番号など。)
* basedOn ^comment = "なお、本プロファイル（特定の歯の有無・状態）は口腔診査レポートに紐付く前提のため、本プロファイル特有の定義はしない。"
* insert SetDefinition(partOf, 未使用)

* category 3..
* category contains
    second 1..1 and
    third 1..1
* category ^comment = "3つのコードを設定する。
第1コード（first）は、simpleObservationコード体系を必須とし、procedureを設定する。
第2コード（second）は、歯科を表すコードLP89803-8を設定する。
第3コード（third）は、歯の有無や処置状態などを表すコードを設定する。なお、日本では適切なコード体系が存在しないため、独自のバリューセットを定義する。"

* insert SetDefinition(category[first], このObservationに関する分類（JP_SimpleObservationCategory_VS）、必須項目)
* category[first].coding.code = $JP_SimpleObservationCategory_CS#procedure (exactly)

* insert SetDefinition(category[second],第2カテゴリはLOINCのコードLP89803-8固定とする、ValueSetのバインディングを指定していないことに注意すること)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..1
* category[second].coding.code = $Loinc_CS#LP89803-8 (exactly)

* insert SetDefinition(category[third], このObservationに関する詳細分類、JP_ObservationDetailedDentalCategory_VSより選択する、必須項目)
* category[third] from $JP_ObservationDetailedDentalCategory_VS (required)
* category[third].coding.system = $JP_ObservationDentalCategory_CS (exactly)
* category[third].coding.code 1..1
* category[third].coding.code = $JP_ObservationDentalCategory_CS#DO-1-01 (exactly)

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
* insert SetDefinition(value[x], 特定の歯の有無（、未検査）)
* value[x] ^comment = "『有』、『無』、『未検査』以外が選択された場合の第二階層は将来の検討対象"
* value[x] from $JP_DentalFundamentalStatus_VS (required)

* insert SetDefinition(dataAbsentReason, 結果が存在しなかった場合、その理由)
* insert SetDefinition(interpretation, 未使用)
* insert SetDefinition(note, 未使用)

* bodySite ^comment = "優先順位は以下の番号を推奨する。
1.FDI
2.厚生労働省標準標準歯式マスタ、レセプト電算処理用コード"
* bodySite from JP_DentalBodySite_VS (preferred)
* insert SetDefinition(bodySite, 特定の歯（歯式）)

* insert SetDefinition(method, 検査方法（目視、読影など)
* insert SetDefinition(specimen, 未使用)
* insert SetDefinition(device, 例：口腔内スキャナなど)
* insert SetDefinition(referenceRange, 未使用)

//* hasMember only Reference(JP_Observation_DentalOral_ToothTreatmentCondition or JP_Observation_DentalOral_MissingToothCondition)
//* hasMember ^Invariants = "code.coding.where(code = '未検査コード').exists() implies hasMember.empty()"

* insert SetDefinition(derivedFrom, 未使用)
* insert SetDefinition(component, 未使用)

// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_Observation_DentalOral_BodySiteStatus
//-------------------------------
Extension: JP_Observation_DentalOral_BodySiteStatus
Id: jp-observation-dentaloral-bodysitestatus
Title: "JP Core Observation DentalOral Body Site Status Extension"
Description: "歯の状態を格納するための拡張"
* ^url = $JP_Observation_DentalOral_BodySiteStatus
* ^status = #active
* ^date = "2024-11-18"
* ^context.type = #element
* ^context.expression = "BodySite"
* . ^short = "歯の状態"
* . ^definition = "歯の状態を格納するための拡張。例：『インプラント』、『その他の生体構造体』"
* url = $JP_Observation_DentalOral_BodySiteStatus (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $JP_DentalBodySiteStatus_VS (preferred)
