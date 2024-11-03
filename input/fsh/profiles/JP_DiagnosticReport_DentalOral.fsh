Profile: JP_DiagnosticReport_DentalOral
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-dentaloral
Title: "JP Core DiagnosticReport DentalOral Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、口腔診査の結果（口腔所見）のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_DentalOral"
* ^status = #active
* ^date = "2024-10-31"
* . ^short = "診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ　【JP Core仕様】口腔診査結果レポートのプロフィール"
* . ^definition = "患者、患者のグループ、デバイス、場所、これらから派生した対象に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。
【JP Core仕様】口腔診査結果レポートのプロフィール"
* . ^comment = "これは単一のレポートをキャプチャすることを目的としており、複数のレポートをカバーする要約情報の表示に使用するのには適していない。たとえば、このリソースは、検査結果の累積レポート形式やシーケンスの詳細な構造化レポート用に作られていない。
【JP Core仕様】DiagnosticReportリソースの共通プロフィール"

* insert SetDefinition(identifier, 当該検査項目に対して、施設内で割り振られる一位の識別子があればそちらを使用する。例：電子カルテ等のオーダ番号、レポート番号、実施日に連番を付加した番号など)
* basedOn only Reference(CarePlan or ServiceRequest)
* insert SetDefinition(basedOn, オーダ発生元のServiceRequestまたはCarePlanへの参照)
* insert SetDefinition(status, 診断レポートのステータス。レポートの記載状況をバインディングされたコードセットから必ず一つ選ぶ。)

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains dentaloral 1..1
* insert SetDefinition(category, サービスカテゴリー SS-MIX2拡張ストレージ構成の説明と構築ガイドラインに従う)
* category[dentaloral] ^comment = "【JP Core仕様】レポートカテゴリーとして、LoincコードのLP31759-1（歯科口腔）を使用する。"
* category[dentaloral] from $JP_DiagnosticReportCategory_VS (required)
* category[dentaloral].coding.system = $Loinc_CS (exactly)
* category[dentaloral].coding.code 1..
* category[dentaloral].coding.code = $Loinc_CS#LP31759-1 (exactly)

* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "coding.system"
* code.coding ^slicing.rules = #open
* code.coding contains dentaloral 1..1
* insert SetDefinition(code, 診断レポート種別「口腔診査報告書」を表す文書コード)
* code.coding[dentaloral].system = $JP_DocumentCodes_CS (exactly)
* code.coding[dentaloral].code 1..
* code.coding[dentaloral].code = #32453-3 (exactly)

* subject only Reference(JP_Patient)
* insert SetDefinition(subject, Paitientリソースを参照)
* encounter only Reference(JP_Encounter)
* insert SetDefinition(encounter, このレポートを書く切っ掛けとなるEncounterリソースを参照。例：診療、歯科健診（検診）、身元不明者調査)

* effective[x] only dateTime
* insert SetDefinition(effective[x],  レポート作成日時)
* effective[x] ^comment = "観測値が関連する時間または期間。レポートの対象が患者である場合、これは通常、読影開始の時間であり、日付／時刻自体のみ提供される。実施日時。"
* insert SetDefinition(issued,  最新のレポート確定日時)
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* insert SetDefinition(performer, レポート確定者。例：歯科医師など)
* insert SetDefinition(resultsInterpreter,  レポートの作成者。例：歯科医師、歯科研修医など)
* insert SetDefinition(specimen, 未使用)

* result only Reference(JP_Observation_DentalOral_ToothExistence)
* insert SetDefinition(result, 検査結果)
* result ^comment = "Observationsは階層構造を持てる。"

* insert SetDefinition(imagingStudy, 診断レポートに関連づけられた画像検査の詳細情報への参照)
* insert SetDefinition(media, このレポートに関連づけられたキー画像)
* insert SetDefinition(media.link, 例：口腔内写真、jpgで保存されている画像、3Dデータなど)
* insert SetDefinition(conclusion, 未使用)
* insert SetDefinition(conclusionCode, 未使用)
* insert SetDefinition(presentedForm, 発行されたレポート全体)