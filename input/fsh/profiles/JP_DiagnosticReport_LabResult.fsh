// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_LabResult
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-labresult
Title: "JP Core DiagnosticReport LabResult Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、検体検査結果のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_LabResult"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ　【JP Core仕様】検体検査結果レポートのプロフィール"
* . ^definition = "患者、患者のグループ、デバイス、場所、これらから派生した検体に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。\r\nわせ　\r\n【JP Core仕様】検体検査結果レポートのプロフィール"
* identifier ^short = "レポートを識別するビジネス識別子"
* identifier ^definition = "実施者または他のシステムによってこのレポートに割り当てられた識別子。"
* identifier ^comment = "発生源の検査室からこのレポートについてクエリを作成するとき、およびFHIRコンテキスト外のレポートにリンクするときに使用する識別子を知る必要がある。\r\n\r\n【JP Core仕様】レポートをユニークに識別する識別子。依頼者オーダ番号と関連付ける場合が多い。\r\n\r\n検体検査の特性として、複数の容器の結果を含む。容器ごと（厳密には項目ごと）に結果のタイミングは異なる場合がある。"
* basedOn ^comment = "通常、１結果ごとに１つの検査依頼があるが、状況によっては、複数の検査要求に対して１レポートがある場合がある。また 1つの検査依頼に対して複数のレポートが作成される場合もあることに注意。\r\n\r\n【JP Core仕様】ServiceRequestリソースを参照(ObservationLabResultと同様）"
* status ^definition = "診断レポートのステータス。"
* status ^comment = "有れば：ORC-5\r\n\r\nもしくは\r\n\r\n無ければ：OBR-25(\"F\")のAND結果\r\n\r\n　例：全部\"F\"なら\"F\"、それ以外の場合は要検討\r\n\r\n設定する値は、DiagnosticReportStatus（コード）から1つ選ぶ\r\n\r\nコード体系：HL7 Table 0038のコードと定義"
* category 1..
* category ^slicing.discriminator.type = #pattern
// #patternでなく#valueでよいはずだが、#valueだと警告"For the complex type CodeableConcept, consider using a pattern rather than a fixed value to avoid over-constraining the instance"が出る。
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains laboratory 1..1
* insert SetDefinitionRef(category, 診断レポートを作成した臨床分野、部門、または診断サービスを分類するコード。検体査では、LoincコードのLP29693-6 検体検査/LAB を使用する。)
* category[laboratory] ^comment = "【JP Core仕様】レポートカテゴリーとして、LoincコードのLP29693-6(検体検査/LAB)を使用する。"
* category[laboratory] from $JP_DiagnosticReportCategory_VS (required)
//* category[laboratory] = $Loinc_CS#LP29693-6 "検体検査" (exactly)
* category[laboratory] = $Loinc_CS#LP29693-6

* code ^comment = ""
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains laboratoryCode 0..1
* code.coding[laboratoryCode] ^short = "検体検査レポート項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している【詳細参照】"
* code.coding[laboratoryCode] ^definition = "検体検査レポート項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。"
* code.coding[laboratoryCode] ^comment = "推奨コードは必須ではない、派生先によるコード体系を作成し割り振ることを否定しない"
* code.coding[laboratoryCode].system = $JP_DocumentCodes_CS
* code.coding[laboratoryCode].code = #11502-2
* code.coding[laboratoryCode].display = "検体検査報告書"
* subject only Reference(JP_Patient)
* subject ^short = "レポートの対象、常にではないが、通常は患者"
* subject ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。\r\n\r\n【JP Core仕様】Patientリソースを参照"
* encounter ^comment = "【JP Core仕様】入院外来の区別や所在場所、担当診療科の情報に使用する。\r\n\r\n※このプロファイルの用途では通常は必須と考えられるが、ユースケースにより使用されない場合を考慮し、1..1に制約しない。"
* effective[x] ^comment = "診断手順が患者に対して実行された場合、これは実施された時刻。対象が検体である場合は、検体採取時間から診断関連時刻を導き出すことができるが、検体情報が常に入手できるとは限らず、検体と診断関連時刻の正確な関係は必ずしも自明ではない。\r\n\r\n【JP Core仕様】検体採取時間"
* issued ^comment = "リソース自体の更新時刻とは異なる場合がある。これは、レポートの実際の提供時刻ではなく、リソース自体の更新時刻はレコード（場合によってはセカンダリコピー）のステータスの更新時刻となるため。\r\n\r\n【JP Core仕様】このデータが出来た時間"
* performer ^comment = "必ずしも１項目データ単位のデータソースまたは結果を解釈した主体でなない。臨床レポートに責任をもつ主体のこと。\r\n\r\n【JP Core仕様】検査に関わった人もしくは組織"
* resultsInterpreter ^comment = "レポートに責任を持つ主体とは異なる場合がある。\r\n\r\n【JP Core仕様】検査責任者"
* specimen ^comment = "検査結果名称のコードを見れば検体情報が十分に判明するような場合には、この検体情報は冗長になる。複数の検体が関与する場合には、検査や検査グループごとに検体情報が記述されることがある。\r\n\r\n【JP Core仕様】該当するspecimenを設定"
* result only Reference(JP_Observation_LabResult)
* result ^definition = "診断レポートの一部"
* result ^comment = "Observationはobservationを含みうる。\r\n\r\n【JP Core仕様】該当するObservationを設定"
* imagingStudy ^comment = "ImagingStudyと画像要素は多少重複する。通常、画像要素内の画像参照のリストは、画像検査リソースのひとつにも存在する。ただし、それぞれがさまざまなタイプの目的のためにさまざまなタイプのディスプレイに対応している。どちらも、どちらか、または両方を提供することはできない。\r\n\r\n【JP Core仕様】使わない"
* media ^comment = "【JP Core仕様】レポート1つに対して、複数の画像・コメントがぶら下がる"
* media.comment ^comment = "【JP Core仕様】画像に対するコメント"
* media.link ^comment = "【JP Core仕様】画像に対するリンク"
* conclusion ^definition = "診断レポートの簡潔で臨床的に文脈化された要約結論（解釈/印象）。"
* conclusion ^comment = "【JP Core仕様】原則使わない"
* conclusionCode ^comment = "【JP Core仕様】原則使わない"
* presentedForm ^comment = "application/pdfがこのコンテキストで最も信頼でき相互運用可能なものとして推奨される。\r\n\r\n【JP Core仕様】原則使わない"
