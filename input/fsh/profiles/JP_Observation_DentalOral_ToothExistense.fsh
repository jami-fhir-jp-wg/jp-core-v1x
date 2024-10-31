Profile: JP_Observation_DentalOral_ToothExistense
Parent: JP_Observation_Common
Id: jp-observation-dentaloral-toothexistense
Title: "JP Core Observation DentalOral Tooth Existense Profile"
Description: "このプロファイルはObservationリソースに対して、口腔診査結果（口腔内所見）の特定の歯の有無・状態データを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_ToothExistense"
* ^status = #active
* ^date = "2024-10-31"
* . ^short = "特定の歯の有無・状態のプロファイル"
* . ^definition = "口腔診査結果レポートの特定の歯の有無・状態のプロファイル"
* . ^comment = "本プロファイルと、現存歯の処置状態プロファイルや、欠損歯の処置状態プロファイルなどを組み合わせて利用する。"

* insert SetDefinition(identifier, 当該口腔診査（検査項目）に対して、施設内で割り振られる一意の識別子があればそれを使用する。例えば、実施日に連番を付加した番号など。)
* basedOn ^comment = "なお、本プロファイル（特定の歯の有無・状態）は口腔診査レポートに紐付く前提のため、本プロファイル特有の定義はしない。"
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
* category[first].coding.system = $JP_SimpleObservationCategory_CS (exactly)
* category[first].coding.code 1..1
* category[first].coding.code = $JP_SimpleObservationCategory_CS#procedure (exactly)

* insert SetDefinition(category[second], このObservationに関するLOINC上の分類、必須項目)
* category[second] from $JP_XXXXXXX_VS (required)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..1
* category[second].coding.code = $Loinc_CS#LP89803-8 (exactly)
* category[second].coding.display = "Dental"
//★1：LOINCコードのVS指定、Display名が分からない

* insert SetDefinition(category[third], このObservationに関する詳細分類、JP_ObservationDentalCateory_VSより選択する、必須項目)
* category[third] from $JP_ObservationDentalCateory_VS (required)
* category[third].coding.system = $JP_ObservationDentalCateory_CS (exactly)
* category[third].coding.code 1..1
* category[second].coding.code = $JP_ObservationDentalCateory_CS#ToothExistence (exactly)
* category[second].coding.display = "ToothExistence"

* insert SetDefinition(code.coding, このObservationの対象を特定するコード。JP_XXXX_VSより歯の有無・状態を表すTB-3を選択する。)
//★2：TB-3 or 54570-7 どっち？　VS名、固定値の指定方法が分からない

* subject 1..
* subject only Reference(JP_Patient)
//★3：参照先はJP_Patient限定でOK？

* insert SetDefinition(focus, 未使用)
* insert SetDefinition(encounter, 例：診療、歯科健診（検診）、身元不明者調査)
* effective[x] only dateTime
* insert SetDefinition(effective[x], 実施日時)
* insert SetDefinition(issued, 所見確定日時)
* insert SetDefinition(performer, 例：歯科医師など)

* value[x] only CodeableConcept
* insert SetDefinition(value[x], 特定の歯の有無（、未検査）)
* value[x] ^comment = "『有』、『無』、『未検査』以外が選択された場合の第二階層は将来の検討対象"
* value[x] from $JP_ToothExistingCode_VS (required)
//★4：VS名合っている？

* insert SetDefinition(dataAbsentReason, 結果が存在しなかった場合、その理由)
* insert SetDefinition(interpretation, 未使用)
* insert SetDefinition(note, 未使用)

* bodySite ^comment = "優先順位は以下の番号を推奨する。
1.FDI
2.厚生労働省標準標準歯式マスタ、レセプト電算処理用コード"
* bodySite from JP_DentalBodySite_VS (preferred)
* insert SetDefinition(bodySite, 特定の歯（歯式）)

* bodySite ^extention.discriminator.type = #value
* bodySite ^extention.discriminator.path = "coding.system"
* bodySite ^extention.rules = #open
* bodySite contains
    bodySiteStatus 0..1
* bodySite.bodySiteStatus from $JP_DentalBodySiteStatus_VS (preferred)
* insert SetDefinition(bodySite.bodySiteStatus, bodySiteのextentionとしてbodySiteStatusを定義。例：『インプラント』、『その他の生体構造体』)
//★5：Extensionの書き方が分からない。bodyStructureは無くても良い？（確認）

* insert SetDefinition(method, 検査方法（目視、読影など)
//★6：ドラフトに「コードセットがあるか要確認（JP Core Observation PhisycaExamMethod VS）」とあるがクリア？

* insert SetDefinition(specimen, 未使用)
* insert SetDefinition(device, 例：口腔内スキャナなど)
* insert SetDefinition(referenceRange, 未使用)

* hasMember only Reference(JP_Observation_DentalOral_ToothTreatmentCondition or JP_Observation_DentalOral_MissingToothCondition)
* hasMember ^Invariants = "code.coding.where(code = '未検査コード').exists() implies hasMember.empty()"
//★7：制約式の書き方はこれでOK？

* insert SetDefinition(derivedFrom, 未使用)
* insert SetDefinition(component, 未使用)