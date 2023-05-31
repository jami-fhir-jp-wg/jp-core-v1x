// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_Microbiology
Parent: DiagnosticReport
Id: jp-diagnosticreport-microbiology
Title: "JP Core DiagnosticReport Microbiology Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、データを送受信するための細菌検査レポートの制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Microbiology"
* ^status = #active
* ^date = "2023-03-22"
* . ^short = "診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ。【詳細参照】"
* . ^definition = "患者、患者のグループ、デバイス、場所、これらから派生した検体に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。"
* . ^comment = "これは単一のレポートをキャプチャすることを目的としており、複数のレポートをカバーする要約情報の表示に使用するのには適していない。たとえば、このリソースは、検査結果の累積レポート形式やシーケンスの詳細な構造化レポート用に作られていない。\r\n\r\n【JP Core仕様】DiagnosticReportリソースの共通プロフィール"
* identifier ^short = "実行者/実施者または他のシステムによってこのレポートに割り当てられた識別子【詳細参照】"
* identifier ^definition = "実行者/実施者または他のシステムによってこのレポートに割り当てられた識別子"
* basedOn ^short = "元になった検査や診断の依頼。【詳細参照】"
* basedOn only Reference(CarePlan or ImmunizationRecommendation or JP_MedicationRequest or JP_MedicationRequest_Injection or NutritionOrder or ServiceRequest)
* basedOn ^definition = "Note: Usually there is one test request for each result, however in some circumstances multiple test requests may be represented using a single test result resource. Note that there are also cases where one request leads to multiple reports.\r\n通常、１結果ごとに１つの検査依頼があるが、状況によっては、複数の検査要求に対して１レポートがある場合がある。また 1つの検査依頼に対して複数のレポートが作成される場合もあることに注意。\r\n\r\n【JP Core仕様】ServiceRequestリソースを参照(ObservationLabResultと同様）"
* basedOn ^comment = "通常、１結果ごとに１つの検査依頼があるが、状況によっては、複数の検査要求に対して１レポートがある場合がある。また 1つの検査依頼に対して複数のレポートが作成される場合もあることに注意。"
* status ^definition = "診断レポートのステータス。"
* category 1..
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains microbiology 1..1
* category[microbiology] from $JP_DiagnosticReportCategory_VS (required)
* category[microbiology] ^comment = "Multiple categories are allowed using various categorization schemes.   The level of granularity is defined by the category concepts in the value set. More fine-grained filtering can be performed using the metadata and/or terminology hierarchy in DiagnosticReport.code.\r\nさまざまなカテゴリ化スキームを使用して、複数のカテゴリを使用できる。粒度のレベルは、それぞれの値セットのカテゴリの概念によって定義される。 DiagnosticReport.codeのメタデータや用語の階層を使用して、よりきめ細かいフィルタリングを実行できる。\r\n\r\n【JP Core仕様】Diagnostic Service Section Codesの\"LAB\"を使用"
* category[microbiology].coding.system = $US_Loinc_CS
* category[microbiology].coding.code = $US_Loinc_CS#LP7819-8
* category[microbiology].coding.text =  "微生物検査"
* category ^short = "サービスカテゴリー。【詳細参照】"

* code ^short = "この診断レポートの名前/コード。【詳細参照】"
* code ^definition = "診断レポートを説明するコードまたは名前。"
* code ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素と事前・事後の用語作成（pre- and post-coordination）との関係を管理するための独自の構造を提供する必要がある。"
* subject only Reference(JP_Patient or Group or Device or JP_Location)
* subject ^short = "レポートの対象、常にではないが、通常は患者。【詳細参照】"
* subject ^definition = "診断レポートの対象患者に関する情報。"
* subject ^comment = "レポートの対象、通常、Patientリソースへの参照。ただし、他のさまざまなソースから収集された検体を対象とすることもある。参照は内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "依頼時におけるヘルスケアイベント（受診など）。【詳細参照】"
* encounter ^definition = "診断レポートが関係するヘルスケアイベントに関する情報。"
* encounter ^comment = "受診、入院、診察など。通常、イベントが発生したEncounterであるが、一部のイベントは、Encounterの正式な完了の前または後に開始される場合があり、その場合でもEncounterのコンテキストに関連付けられている（例：入院前の臨床検査）。"
* effective[x] ^short = "臨床的に関連する時刻または時間。【詳細参照】"
* effective[x] ^definition = "診断レポートの作成日時。"
* effective[x] ^comment = "診断手順が患者に対して実行された場合、これは実施された時間である。対象が検体である場合は、検体採取時間から診断関連時刻を導き出すことができるが、検体情報が常に入手できるとは限らず、検体と診断関連時刻の正確な関係は必ずしも自明ではない。"
* issued ^short = "このバージョンが作成された日時。【詳細参照】"
* issued ^definition = "このバージョンの診断レポートが医療者に提供/確定された日時。"
* issued ^comment = "通常、レポートがレビューおよび検証・確定された後となる。リソース自体の更新時刻とは異なる場合がある。これは、レポートの実際の提供時刻ではなく、リソース自体の更新時刻はレコード（場合によってはセカンダリコピー）のステータスの更新時刻となるため。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* performer ^short = "診断レポートに責任をもつ診断サービス（部門）/担当者。【詳細参照】"
* performer ^definition = "診断レポートの作成発行に責任をもつ診断サービス（部門）/担当者に関する情報。"
* performer ^comment = "必ずしも１項目データ単位のデータソースまたは結果を解釈した主体でなない。臨床レポートに責任をもつ主体のこと。"
* resultsInterpreter only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* resultsInterpreter ^short = "結果の一次解釈者。【詳細参照】"
* resultsInterpreter ^definition = "診断レポートの結論と解釈に責任を持つ医療者/組織に関する情報。"
* resultsInterpreter ^comment = "診断レポートに責任を持つもの(performer)とは異なる場合がある。"
* specimen ^short = "診断レポートのもとになった検体。【詳細参照】"
* specimen ^definition = "この診断レポートのもとになった検体に関する詳細情報。"
* specimen ^comment = "検査結果名称のコードを見れば検体情報が十分に判明するような場合には、この検体情報は冗長になる。複数の検体が関与する場合には、検査や検査グループごとに検体情報が記述されることがある。"
* result ^short = "検査結果。Observationsリソースが参照される。【詳細参照】"
* result ^definition = "診断レポートの一部となるObservationsに関する情報。"
* result ^comment = "Observationsは階層構造を持てる。"
* result ^requirements = "個々の結果または結果のグループをサポートする必要がある。結果のグループ化は任意だが、意味がある場合にグループ化される。"
* imagingStudy ^short = "診断レポートに関連づけれらた画像検査の詳細情報への参照。【詳細参照】"
* imagingStudy ^definition = "診断レポートに関連づけれられたDICOM検査画像に関する情報。"
* imagingStudy ^comment = "診断的精査中に実施された画像検査の詳細情報へのひとつ/複数のリンク。通常は、DICOM対応のモダリティーによって実施される画像検査だが、必須ではない。完全対応のPACSビューワはこの情報を使用して原画像の一覧を提供できる。"
* media ^short = "診断レポートに関連づけられたメディア。【詳細参照】"
* media ^definition = "診断レポートに関連づけられたメディアに関する情報。"
* media ^comment = "通常は画像。診断プロセス中に作成され、患者から直接取得されたもの、あるいは調製された検体標本（つまり、関心のあるスライド）のこともある。"
* media ^requirements = "多くの診断業務では提供情報の一部としてレポートに画像を含む。"
* conclusion ^short = "検査結果の臨床的結論（解釈/インプレッション）。【詳細参照】"
* conclusion ^definition = "簡潔かつ臨床的な文脈で表現した診断レポートの要約結論（解釈/インプレッション）。"
* conclusionCode ^short = "検査結果の臨床的結論（解釈）用のコード。【詳細参照】"
* conclusionCode ^definition = "診断レポートの要約的な結論（解釈/インプレッション）を表す1つ以上のコード。"
* conclusionCode ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、独自の構造を提供する必要がある。"
* presentedForm ^short = "発行されたレポート全体。【詳細参照】"
* presentedForm ^definition = "診断サービス/担当者によって発行された診断レポート全体のコンテンツ（例えばPDFファイルなど）。"
* presentedForm ^comment = "複数のフォーマットが許可されるが、それらは意味的に同等である必要がある。「application / pdf」がこのコンテキストで最も信頼でき相互運用可能なものとして推奨される。"
