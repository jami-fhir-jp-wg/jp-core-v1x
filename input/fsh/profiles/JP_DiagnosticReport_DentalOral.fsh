Profile: JP_DiagnosticReport_DentalOral
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-dentaloral
Title: "JP Core DiagnosticReport DentalOral Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、口腔診査の結果（口腔所見）のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_DentalOral"
* ^status = #active
* ^date = "2025-06-24"
* . ^short = "診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ　【JP Core仕様】口腔診査結果レポートのプロフィール"
* . ^definition = "患者、患者のグループ、デバイス、場所、これらから派生した対象に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。
【JP Core仕様】口腔診査結果レポートのプロファイル"
* . ^comment = "これは単一のレポートをキャプチャすることを目的としており、複数のレポートをカバーする要約情報の表示に使用するのには適していない。たとえば、このリソースは、検査結果の累積レポート形式やシーケンスの詳細な構造化レポート用に作られていない。
【JP Core仕様】DiagnosticReportリソースの共通プロファイル"

* insert SetDefinition(identifier, レポートを識別するビジネス識別子  
【JP Core仕様】当該検査項目に対して、施設内で割り振られる一位の識別子があればそちらを使用する。)
* identifier ^comment = "例：電子カルテ等のオーダ番号、レポート番号、実施日に連番を付加した番号など"
* basedOn only Reference(CarePlan or ServiceRequest)
* insert SetDefinition(basedOn, 元になった検査や診断の依頼  
【JP Core仕様】オーダ発生元のServiceRequestまたはCarePlanへの参照)
* insert SetDefinition(status, 診断レポートのステータス  
【JP Core仕様】レポートの記載状況をバインディングされたコードセットから必ず一つ選ぶ。)

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains first 1..1
* insert SetDefinition(category, サービスカテゴリー SS-MIX2拡張ストレージ構成の説明と構築ガイドラインに従う)
* category[first] ^comment = "【JP Core仕様】レポートカテゴリーとして、LoincコードのLP31759-1（歯科口腔）を使用する。"
* category[first] from $JP_DiagnosticReportCategory_VS (required)
* category[first].coding.system = $Loinc_CS (exactly)
* category[first].coding.code 1..
* category[first].coding.code = $Loinc_CS#LP31759-1 (exactly)

* insert SetDefinition(code, 診断レポート種別「口腔診査報告書」を表す文書コード)
* code = $JP_DocumentCodes_CS#32453-3 "口腔診査報告書"
* subject only Reference(JP_Patient)
* insert SetDefinition(subject, レポートの対象、常にではないが、通常は患者  
【JP Core仕様】Patientリソースを参照)
* encounter only Reference(JP_Encounter)
* insert SetDefinition(encounter, 依頼時におけるヘルスケアイベント（受診など）  
【JP Core仕様】このレポートを書く切っ掛けとなるEncounterリソースを参照)
* encounter ^comment = "例：診療、歯科健診（検診）、身元不明者調査 ※JP Coreに網羅されていない"

* effective[x] only dateTime
* insert SetDefinition(effective[x],  臨床的に関連する時刻または時間  
【JP Core仕様】レポート作成日時)
* effective[x] ^comment = "観測値が関連する時間または期間。レポートの対象が患者である場合、これは通常、読影開始の時間であり、日付／時刻自体のみ提供される。実施日時。"
* insert SetDefinition(issued, このバージョンが作成された日時  
【JP Core仕様】最新のレポート確定日時)
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* insert SetDefinition(performer, レポート内容に責任をもつ診断的サービス  
【JP Core仕様】レポート確定者)
* performer ^comment = "例：歯科医師など"

* insert SetDefinition(resultsInterpreter,  結果の一次解釈者  
【JP Core仕様】レポートの作成者)
* resultsInterpreter ^comment = "例：歯科医師、歯科研修医など"

* insert SetDefinition(specimen, 診断レポートのもとになった検体に関する情報  
【JP Core仕様】未使用)

* result only Reference(JP_Observation_DentalOral_ToothExistence)
* insert SetDefinition(result, 診断レポートの一部となるObservationsに関する情報  
【JP Core仕様】検査結果)
* result ^comment = "Observationsは階層構造を持てる。"

* insert SetDefinition(media, 診断レポートに関連づけられたメディアに関する情報  
【JP Core仕様】このレポートに関連づけられたキー画像)
* media.link ^comment = "例：口腔内写真、jpgで保存されている画像、3Dデータなど"

* insert SetDefinition(conclusion, 簡潔かつ臨床的な文脈で表現した診断レポートの要約結論（解釈、インプレッション）  
【JP Core仕様】原則、未使用。レセプト傷病名などテキスト型で記載も可能。)
* insert SetDefinition(conclusionCode, 診断レポートの要約結論（解釈、インプレッション）を表すコード  
【JP Core仕様】原則、未使用。レセプト傷病名などのCodeableConcept型で定義も可能。)