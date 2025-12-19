Profile: JP_Observation_DentalOral_eCS
Parent: JP_Observation_Common
Id: jp-observation-dentaloral-ecs
Title: "JP Core Observation DentalOral eCS Profile"
Description: "このプロファイルはObservationリソースに対して、診療情報提供書用のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_eCS"
* ^status = #active
* ^date = "2025-07-30"
* . ^short = "診療情報提供書用のプロファイル"
* . ^definition = "歯科臨床においては、複数の部位が同一の疾患を有していたり、複数部位からなる疾患が存在するため、複数の部位を表現することのできるプロファイルが必要である"

* insert SetDefinition(identifier, Observationのためのビジネス識別子 【JP Core仕様】当該口腔診査（検査項目）に対して、施設内で割り振られる一意の識別子。)
* identifier ^comment = "例：実施日に連番を付加した番号"

* insert SetDefinition(basedOn, 実施されるプラン、提案、依頼  【JP Core仕様】未使用)
* basedOn ^comment = "本プロファイル（複数の部位が同一の疾患を有していたり、複数部位からなる疾患が存在した際に、複数の部位を表現することのできるプロファイル）は診療情報提供書に紐付く前提のため、本プロファイル特有の定義はしない。"

* insert SetDefinition(partOf, 参照されるイベントの一部分 【JP Core仕様】未使用)
* insert SetDefinition(status, 結果の状態 【JP Core仕様】ステータス)

* category contains
    second 1..1 and
    third 1..1
* insert SetDefinition(category, Observationの種類（タイプ）の分類 【JP Core仕様】各種Catageoryは固定となる)
* category ^comment = "このObservationの分類。  
【JP Core仕様】以下を指定する。  
第1コード：exam  
第2コード：LP89803-8（Dental）  
第3コード：DO-1-04（ClinicalInformationSharing）"

* insert SetDefinition(category[first], このObservationに関する分類（JP_SimpleObservationCategory_VS）、必須項目)
* category[first].coding.system = $JP_SimpleObservationCategory_CS (exactly)
* category[first].coding.code 1..1
* category[first].coding.code = #exam (exactly)

* insert SetDefinition(category[second],第2カテゴリはLOINCのコードLP89803-8固定で必須とする、ValueSetは指定しない)
* category[second].coding.system = $Loinc_CS (exactly)
* category[second].coding.code 1..1
* category[second].coding.code = #LP89803-8 (exactly)

* insert SetDefinition(category[third], このObservationに関する詳細分類、JP_ObservationDetailedDentalCategory_VSより選択する、必須項目)
* category[third] from $JP_ObservationDetailedDentalCategory_VS (required)
* category[third].coding.system = $JP_ObservationDentalCategory_CS (exactly)
* category[third].coding.code 1..1
* category[third].coding.code = #DO-1-04 (exactly)

* insert SetDefinition(code.coding, observation のタイプ（コードまたはタイプ 【JP Core仕様】57133-1（Referral note）を指定する)
* code.coding.system = $Loinc_CS (exactly)
* code.coding.code 1..1
* code.coding.code = $Loinc_CS#57133-1 (exactly)
* code.coding.display = "Referral note"

* subject 1..1
* subject only Reference(JP_Patient)
* insert SetDefinition(subject, 観察対象者 【JP Core仕様】患者情報)
* insert SetDefinition(focus, subject 要素が実際のobservationの対象でない場合に、observation の対象物。 【JP Core仕様】未使用)
* insert SetDefinition(encounter, このobservationが行われるヘルスケアイベント)
* encounter ^comment = "例：診療、歯科検診"

* effective[x] only dateTime
* insert SetDefinition(effective[x], 臨床的に関連する時刻または時間 【JP Core仕様】実施日時)
* insert SetDefinition(issued, このバージョンが利用可能となった日時 JP Core仕様】所見確定日時)
* insert SetDefinition(performer, observationに責任をもつ者)
* performer ^comment = "例：歯科医師など"

* value[x] only CodeableConcept
* insert SetDefinition(value[x], 実際の結果値 【JP Core仕様】歯の処置状態。現存歯、欠損歯、粒度の細かさ、粗さにかかわらず、そのうち一つをVSより選択する)
* value[x] from $JP_DentalTeethObservation_VS (preferred) 

* insert SetDefinition(dataAbsentReason, 結果が欠損値である理由 【JP Core仕様】結果が存在しなかった場合、その理由)
* insert SetDefinition(interpretation, 高、低、正常等の結果のカテゴリ分けした評価 【JP Core仕様】未使用)
* insert SetDefinition(note, 結果に対するコメント 【JP Core仕様】未使用)
* insert SetDefinition(bodySite, 観察された身体部位 【JP Core仕様】未使用)
* insert SetDefinition(method, 検査方法（目視、読影など)
* insert SetDefinition(specimen, 観察（観測、検査）に使われた検体材料 【JP Core仕様】未使用)
* device ^comment = "例：口腔内スキャナなど"
* insert SetDefinition(hasMember, observationグループに属する関連リソース 【JP Core仕様】未使用)
* insert SetDefinition(derivedFrom, observationの発生源に関連する測定 【JP Core仕様】未使用)
* insert SetDefinition(component, 複合的な結果 【JP Core仕様】未使用)

// extension 参照宣言
* bodySite.extension contains
    $JP_Observation_DentalOral_BodySiteStatus named bodySiteStatus 1..1 and
    $JP_Observation_DentalOral_BodyStructure_eCS named includedStructure 1..*

* insert SetDefinition(bodySite.extension[bodySiteStatus], 【JP Core仕様】特定の状態を示さない 0 を指定)
* bodySite.extension[bodySiteStatus] ^comment = "標準歯式コード仕様の5桁目、歯式にも関わらず状態を示すコードのため、状態なしである 0 を選択"
* bodySite.extension[bodySiteStatus].valueCodeableConcept.coding.system = $JP_DentalBodySiteStatus_CS (exactly)
* bodySite.extension[bodySiteStatus].valueCodeableConcept.coding.code 1..1
* bodySite.extension[bodySiteStatus].valueCodeableConcept.coding.code = #0 (exactly)

* bodySite.extension[includedStructure].extension[structure].valueCodeableConcept from JP_DentalBodySite_VS (required)
* insert SetDefinition(bodySite.extension[includedStructure].extension[structure], 【JP Core仕様】複数の『歯』を繰り返し指定)

* bodySite.extension[includedStructure].extension[qualifier].value[x].coding ^slicing.discriminator.type = #value
* bodySite.extension[includedStructure].extension[qualifier].value[x].coding ^slicing.discriminator.path = "system"
* bodySite.extension[includedStructure].extension[qualifier].value[x].coding ^slicing.rules = #open
* bodySite.extension[includedStructure].extension[qualifier].value[x].coding contains
  root 0..* and
  surface 0..*
* insert SetDefinition(bodySite.extension[includedStructure].extension[qualifier], 【JP Core仕様】特定の歯の歯根と、歯面の２項目を指定)

* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[root] from $JP_DentalRootBodyStructure_VS (required)
* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[root].system = $JP_DentalRootBodyStructure_CS (exactly)
* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[root] ^short = "特定の歯の『歯根』を指定"
* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[root] ^definition = "特定の歯の『歯根』を指定"

* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[surface] from $JP_DentalSurfaceBodyStructure_VS (required)
* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[surface].system = $JP_DentalSurfaceBodyStructure_CS (exactly)
* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[surface] ^short = "特定の歯の『歯面』を指定"
* bodySite.extension[includedStructure].extension[qualifier].valueCodeableConcept.coding[surface] ^definition = "特定の歯の『歯面』を指定"

