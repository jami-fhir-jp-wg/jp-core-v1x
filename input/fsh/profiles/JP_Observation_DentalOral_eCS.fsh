Profile: JP_Observation_DentalOral_eCS
Parent: JP_Observation_Common
Id: jp-observation-dentaloral-ecs
Title: "JP Core Observation DentalOral eCS Profile"
Description: "このプロファイルはObservationリソースに対して、診療情報提供書用のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_eCS"
* ^status = #active
* ^date = "2025-06-24"
* . ^short = "診療情報提供書用のプロファイル"
* . ^definition = "歯科臨床においては、複数の部位が同一の疾患を有していたり、複数部位からなる疾患が存在するため、複数の部位を表現することのできるプロファイルが必要である"

* insert SetDefinition(identifier, 当該口腔診査（検査項目）に対して、施設内で割り振られる一意の識別子があればそれを使用する。例えば、実施日に連番を付加した番号など。)
* identifier 0..

* insert SetDefinition(basedOn, 実施されるプラン、提案、依頼  
【JP Core仕様】未使用)
* basedOn ^comment = "本プロファイル（複数の部位が同一の疾患を有していたり、複数部位からなる疾患が存在した際に、複数の部位を表現することのできるプロファイル）は診療情報提供書に紐付く前提のため、本プロファイル特有の定義はしない。"

* insert SetDefinition(partOf, 参照されるイベントの一部分
【JP Core仕様】未使用)

* insert SetDefinition(status, 結果の状態  
【JP Core仕様】ステータス)

* category 3..
* category contains
    second 1..1 and
    third 1..1
* category ^comment = "3つのコードを設定する。
第1コード（first）は、simpleObservationコード体系を必須とし、exam を設定する。
第2コード（second）は、歯科を表すコード LP89803-8 を設定する。
第3コード（third）は、診療情報提供書を表すコード DO-1-04 を設定する。なお、日本では適切なコード体系が存在しないため、独自のバリューセットを定義する。"

* insert SetDefinition(category[first], このObservationに関する分類（JP_SimpleObservationCategory_VS）、必須項目)
* category[first].coding.code = $JP_SimpleObservationCategory_CS#exam (exactly)

* insert SetDefinition(category[second],第2カテゴリはLOINCのコードLP89803-8固定で必須とする、ValueSetは指定しない)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..1
* category[second].coding.code = #LP89803-8 (exactly)

* insert SetDefinition(category[third], このObservationに関する詳細分類、JP_ObservationDetailedDentalCategory_VSより選択する、必須項目)
* category[third] from $JP_ObservationDetailedDentalCategory_VS (required)
* category[third].coding.system = $JP_ObservationDentalCategory_CS (exactly)
* category[third].coding.code 1..1
* category[third].coding.code = #DO-1-04 (exactly)

* insert SetDefinition(code.coding, このObservationの対象を特定するコード。LOINCよりReferral noteを表す 57133-1 を選択する。)
* code.coding.system = $Loinc_CS (exactly)
* code.coding.code 1..1
* code.coding.code = $Loinc_CS#57133-1 (exactly)
* code.coding.display = "Referral note"

* subject 1..1
* subject only Reference(JP_Patient)
* insert SetDefinition(subject, 観察対象者  
【JP Core仕様】患者情報)

* insert SetDefinition(focus, subject 要素が実際のobservationの対象でない場合に、observation の対象物。  
【JP Core仕様】未使用)

* insert SetDefinition(encounter, このobservationが行われるヘルスケアイベント)
* encounter ^comment = "例：診療、歯科検診"

* effective[x] only dateTime
* insert SetDefinition(effective[x], 臨床的に関連する時刻または時間  
【JP Core仕様】実施日時)

* insert SetDefinition(issued, このバージョンが利用可能となった日時  
【JP Core仕様】所見確定日時)

* insert SetDefinition(performer, observationに責任をもつ者)
* performer ^comment = "例：歯科医師など"

* value[x] only CodeableConcept
* insert SetDefinition(value[x], 実際の結果値  
【JP Core仕様】歯の処置状態。現存歯、欠損歯、粒度の細かさ、粗さにかかわらず、そのうち一つをVSより選択する)
* value[x] from $JP_DentalFundamentalStatus_VS (required) // TBD

* insert SetDefinition(dataAbsentReason, 結果が欠損値である理由
【JP Core仕様】結果が存在しなかった場合、その理由)

* insert SetDefinition(interpretation, 高、低、正常等の結果のカテゴリ分けした評価
【JP Core仕様】未使用)

* insert SetDefinition(note, 結果に対するコメント  
【JP Core仕様】未使用)

* insert SetDefinition(bodySite, 観察された身体部位  
【JP Core仕様】未使用)

// extension 参照宣言
* extension contains
    JP_Observation_DentalOral_BodyStructure_eCS named bodyStructure 1..

//* insert SetDefinition(method, 検査方法（目視、読影など)
//* insert SetDefinition(specimen, 未使用)
* device ^comment = "例：口腔内スキャナなど"
//* insert SetDefinition(referenceRange, 未使用)
* insert SetDefinition(hasMember, observationグループに属する関連リソース
【JP Core仕様】未使用)

* insert SetDefinition(derivedFrom, observationの発生源に関連する測定
【JP Core仕様】未使用)

* insert SetDefinition(component, 複合的な結果
【JP Core仕様】未使用)
