// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_Common
Parent: DiagnosticReport
Id: jp-diagnosticreport-common
Title: "JP Core DiagnosticReport Common Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ【詳細参照】"
* . ^definition = "患者、患者のグループ、デバイス、場所、これらから派生した検体に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。"
* . ^comment = "これは単一のレポートをキャプチャすることを目的としており、複数のレポートをカバーする要約情報の表示に使用するのには適していない。たとえば、このリソースは、検査結果の累積レポート形式やシーケンスの詳細な構造化レポート用に作られていない。  
【JP Core仕様】DiagnosticReportリソースの共通プロフィール"
* insert SetDefinitionRef(identifier, 実行者/実施者または他のシステムによって、この診断レポートに割り当てられた識別子)
* identifier ^comment = "通常、診断サービスプロバイダの情報システム（フィラーID）によって割り当てられる。"
* identifier ^requirements = "発生源の検査室からこのレポートについてクエリを作成するとき、およびFHIRコンテキスト外のレポートにリンクするときに使用する識別子を知る必要がある。"
* basedOn only Reference(CarePlan or ImmunizationRecommendation or JP_MedicationRequest or JP_MedicationRequest_Injection or NutritionOrder or ServiceRequest)
* insert SetDefinitionRef(basedOn, 元になった検査や診断の依頼に関する情報)
* basedOn ^comment = "通常、１結果ごとに１つの検査依頼があるが、状況によっては、複数の検査要求に対して１レポートがある場合がある。また１つの検査依頼に対して複数のレポートが作成される場合もあることに注意。"
* insert SetDefinition(status, 診断レポートのステータス)
//* category from $JP_DiagnosticReportCategory_VS (preferred)
* insert SetDefinitionRef(category, 診断レポートを作成した臨床分野、部門、または診断サービス（心臓病学、生化学、血液学、放射線医学など）を分類するコード)
* category ^comment = "これは、検索、並べ替え、および表示の目的で使用される。"
* insert SetDefinition(category.coding.system, カテゴリーコードシステムの識別URL)
* insert SetDefinition(category.coding.code, カテゴリーコード)
* insert SetDefinition(category.coding.display, カテゴリー表示名)

* code from $JP_DocumentCodes_DiagnosticReport_VS (preferred)
* insert SetDefinitionRef(code, 診断レポートを説明するコードまたは名前)
* code ^comment = ""
* subject only Reference(JP_Patient or Group or Device or JP_Location)
* insert SetDefinitionRef(subject, 診断レポートの対象患者に関する情報)
* subject ^comment = "レポートの対象、通常、Patientリソースへの参照。ただし、他のさまざまなソースから収集された検体を対象とすることもある。参照は内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* encounter only Reference(JP_Encounter)
* insert SetDefinitionRef(encounter, 診断レポートが関係するヘルスケアイベントに関する情報)
* encounter ^comment = "受診、入院、診察など。通常、イベントが発生したEncounterであるが、一部のイベントは、Encounterの正式な完了の前または後に開始される場合があり、その場合でもEncounterのコンテキストに関連付けられている（例：入院前の臨床検査）。"
* insert SetDefinitionRef(effective[x], 診断レポートの作成日時)
* effective[x] ^comment = "診断手順が患者に対して実行された場合、これは実施された時間である。対象が検体である場合は、検体採取時間から診断関連時刻を導き出すことができるが、検体情報が常に入手できるとは限らず、検体と診断関連時刻の正確な関係は必ずしも自明ではない。"
* insert SetDefinitionRef(issued, このバージョンの診断レポートが医療者に提供/確定された日時)
* issued ^comment = "通常、レポートがレビューおよび検証・確定された後となる。リソース自体の更新時刻とは異なる場合がある。これは、レポートの実際の提供時刻ではなく、リソース自体の更新時刻はレコード（場合によってはセカンダリコピー）のステータスの更新時刻となるため。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* insert SetDefinitionRef(performer, 診断レポートの作成発行に責任をもつ診断サービス/担当者に関する情報)
* performer ^comment = "必ずしも１項目データ単位のデータソースまたは結果を解釈した主体でなない。臨床レポートに責任をもつ主体のこと。"
* resultsInterpreter only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* insert SetDefinitionRef(resultsInterpreter, 診断レポートの結論と解釈に責任を持つ医療者/組織に関する情報)
* resultsInterpreter ^comment = "診断レポートに責任を持つもの(performer)とは異なる場合がある。"
* insert SetDefinitionRef(specimen, 診断レポートのもとになった検体に関する情報)
* specimen ^comment = "検査結果名称のコードを見れば検体情報が十分に判明するような場合には、この検体情報は冗長になる。複数の検体が関与する場合には、検査や検査グループごとに検体情報が記述されることがある。"
* insert SetDefinitionRef(result, 診断レポートの一部となるObservationsに関する情報)
* result ^comment = "Observationsは階層構造を持てる。"
* result ^requirements = "個々の結果または結果のグループをサポートする必要がある。結果のグループ化は任意だが、意味がある場合にグループ化される。"
* insert SetDefinitionRef(imagingStudy, 診断レポートに関連づけれられたDICOM検査画像に関する情報)
* imagingStudy ^comment = "診断的精査中に実施された画像検査の詳細情報へのひとつ/複数のリンク。通常は、DICOM対応のモダリティーによって実施される画像検査だが、必須ではない。完全対応のPACSビューワはこの情報を使用して原画像の一覧を提供できる。"
* insert SetDefinitionRef(media, 診断レポートに関連づけられたメディアに関する情報)
* media ^comment = "通常は画像。診断プロセス中に作成され、患者から直接取得されたもの、あるいは調製された検体標本（つまり、関心のあるスライド）のこともある。"
* media ^requirements = "多くの診断業務では提供情報の一部としてレポートに画像を含む。"
* insert SetDefinition(conclusion, 簡潔かつ臨床的な文脈で表現した診断レポートの要約結論（解釈、インプレッション）)
* insert SetDefinitionRef(conclusionCode, 診断レポートの要約結論（解釈、インプレッション）を表すコード)
* conclusionCode ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、独自の構造を提供する必要がある。"
* insert SetDefinitionRef(presentedForm, 診断サービス/担当者によって発行された診断レポート全体のコンテンツ（例えばPDFファイルなど）)
* presentedForm ^comment = "複数のフォーマットが許可されるが、それらは意味的に同等である必要がある。「application / pdf」がこのコンテキストで最も信頼でき相互運用可能なものとして推奨される。"
