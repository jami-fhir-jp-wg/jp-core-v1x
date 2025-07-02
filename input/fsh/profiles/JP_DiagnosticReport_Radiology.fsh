// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_Radiology
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-radiology
Title: "JP Core DiagnosticReport Radiology Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、放射線検査報告書（レポート）のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Radiology"
* ^status = #active
* ^date = "2025-07-04"
* . ^short = "診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ　【JP Core仕様】画像結果レポートのプロフィール【詳細参照】"
* . ^definition = "患者、患者のグループ、デバイス、場所、これらから派生した検体に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。  
【JP Core仕様】画像結果レポートのプロフィール"
* text MS
* text ^short = "人が読める形式で提示された情報。放射線レポートの場合はレポートの所見が保持される【詳細参照】"
* text ^definition = "リソースの概要を含み、リソースの内容を人間が解釈できる形で表現するために用いられる。すべての構造化データをエンコードする必要はないが、人間がテキストを読むだけで「臨床的に安全」になるように十分な詳細を含める必要がある。リソース定義は、臨床的安全性を確保するために、テキストの中でどのコンテンツを表現すべきかを定義することができる。放射線レポートでは少なくともレポートの所見が格納されることが期待される。また，検索可能な文字列が存在する部位としても利用されることを想定している。"
* text ^comment = "放射線レポートの場合、主となる所見を表すエレメントは他のリソースエレメントには存在しない。よってこのドメインリソースを用いてレポートの少なくとも「所見」を人間が可読な状態で保持することが求められる。"
* identifier ^definition = "実行者または他のシステムによってこのレポートに割り当てられた識別子。"
* identifier ^comment = "通常は診断サービスプロバイダの情報システムにより設定される。  
【JP Core仕様】レポート番号  
（放射線情報システム(RIS)による発番が想定されるが、施設によって電子カルテ等のオーダ番号を使う場合もあり得る）"
* identifier ^requirements = "このレポートについてクエリを実行するとき、およびFHIRコンテキスト外のレポートにリンクするときにどの識別子を使用するかを知る必要がある"
* basedOn MS
* basedOn ^short = "レポート作成サービスに対する要求の詳細【詳細参照】"
* basedOn only Reference(CarePlan or ImmunizationRecommendation or JP_MedicationRequest or JP_MedicationRequest_Injection or NutritionOrder or ServiceRequest)
* basedOn ^definition = "検査や診断の依頼の元になったもの。通常はServiceRequestあるいはCarePlan（治験や抗がん剤投与等により検査を行うことが必須の場合、根拠となった事象を追記することは制限しない）"
* basedOn ^comment = "通常は１つのリクエストに対し１つの検査結果となるが、状況によって１つのリクエストに対し複数の検査結果が要求され、複数のレポートが作成される場合もあるので注意すること。  
【JP Core仕様】オーダ発生元の ServiceRequest または CarePlan への参照（多くの場合はServiceRequest（オーダ）が存在するが、オーダが発生しない検査も想定される。）"
* basedOn ^requirements = "このエレメントによりレポートの認可をトレースしたり、レポート作成サービスに対する提案や推奨事項を追跡することができる。"
* status ^short = "診断レポートの状態【詳細参照】"
* status ^definition = "診断レポートの状態。以下のいずれかが設定される。registered | partial | preliminary | final | amended | corrected | appended | cancelled | entered-in-error | unknown"
* status ^comment = "FHIRのstringsは1MBを越えてはならない（SHALL NOT）ことに留意すること。  
【JP Core仕様】  
・診断レポートのステータス  
・定義通りの選択肢（例：preliminary 一次読影, final 二次読影（完了）等）を利用。"
* status ^requirements = "診断サービスではルーチンに仮確定あるいは不完全なレポートが発生することがある。また、しばしば前に発行されたレポートが取り消されることもある。"
* category MS
* category ^short = "レポートを作成した分野を分類するコード【詳細参照】"
* category ^definition = "レポートを作成した臨床分野・部門、または診断サービス（CT, US, MRIなど）を分類するコード。 これは、検索、並べ替え、および表示の目的で使用される。【JP-Core仕様】放射線レポートは ”RAD” をデフォルトとして設定。追加の情報については任意で設定可能。"
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.ordered = false
* category contains first 1..1 and second ..*
* category[first] MS
* category[first] ^short = "レポートを作成した分野を分類するコード【詳細参照】"
* category[first] ^definition = "レポートを作成した臨床分野・部門、または診断サービス（CT, US, MRIなど）を分類するコード。 これは、検索、並べ替え、および表示の目的で使用される。【JP-Core仕様】放射線レポートは第1コードとして LP29684-5 を固定値として設定。第2コード以下にDICOMModalityコードを列挙することでレポートの対象検査内容を示す。"
* category[first] from $JP_DiagnosticReportCategory_VS (required)
* category[first].coding.system = $Loinc_CS (exactly)
* category[first].coding.code 1..
* category[first].coding.code = $Loinc_CS#LP29684-5 (exactly)
* category[second] MS
* category[second] ^short = "レポート対象のモダリティを示すコード【詳細参照】"
* category[second] ^definition = "レポート対象のモダリティを示すコード。放射線を表す第1コードのLP29684-5に続くサブカテゴリコードとして第2コード以下に保持される。複数のモダリティの組み合わせを許容するため、コードの列挙を許容する。"
* category[second] from $JP_DICOMModality_VS (required)
* category[second].coding.system = $dicom-ontology (exactly)
* category[second].coding.code ^short = "DICOMのモダリティコードを指定"
* category[second].coding.code ^definition = "DICOMのモダリティコードを指定"
* category[second].coding.display ^short = "DICOMのモダリティコードの意味を記載（例: 超音波検査）"
* category[second].coding.display ^definition = "DICOMのモダリティコードの意味を記載（例: 超音波検査）"

* code ^definition = "この診断レポートを表現するコードや名称"
* code ^comment = "【JP Core仕様】[画像診断レポート交換手順ガイドライン](https://www.jira-net.or.jp/publishing/files/jesra/JESRA_TR-0042_2018.pdf)「5.1 レポート種別コード」に記載されているLOINCコード [Diagnostic imaging study](https://loinc.org/18748-4/) を指定。コードを指定できない場合はCodeableConceptを使用せずテキスト等を直接コーディングすることも許容されるが、要素間の調整と事前・事後の内容の整合性確保のために独自の構造を提供する必要があるので留意すること。"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains radiologyReportCode ..1
* code.coding[radiologyReportCode] ^short = "放射線レポート項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している【詳細参照】"
* code.coding[radiologyReportCode] ^definition = "放射線レポート項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。"
* code.coding[radiologyReportCode] ^comment = "推奨コードは必須ではない、派生先によるコード体系を作成し割り振ることを否定しないが、互換性を意識すること。"
* code.coding[radiologyReportCode].system = $JP_DocumentCodes_CS (exactly)
* code.coding[radiologyReportCode].code 1..
* code.coding[radiologyReportCode].code = #18748-4 (exactly)
* code.coding[radiologyReportCode].display = "画像検査報告書"
* subject MS
* subject ^definition = "レポートの対象。 必ずでは無いが、通常、これには「患者」が該当する。"
* subject ^comment = "参照は実際のFHIRリソースへの参照であり、解決可能である必要がある。解決はURLから取得するか、または、リソースタイプが利用できる場合は絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索する。  
【JP Core仕様】Patient リソースを参照"
* subject ^requirements = "対象のコンテキストが必要である。"
* encounter ^definition = "この診断レポートが関するヘルスケアイベント。"
* encounter ^comment = "これは通常、レポートの作成が発生するEncounterだが、一部のイベントはEncounterの正式な完了の前または後に開始される場合がある（例えば入院前の検査）。その場合でも（入院に関連して検査が行われる場合など）、Encounterのコンテキストに関連付けられる。  
【JP Core仕様】このレポートを書く切っ掛けとなる Encounterリソース（例：術前検査の場合、術前訪問） を参照"
* encounter ^requirements = "Encounterコンテキストへのリンクが必要である"
* effective[x] MS
* effective[x] only dateTime
* effective[x] ^definition = "観測値が関連する時間または期間。レポートの対象が患者である場合、これは通常、読影開始の時間であり、日付/時刻自体のみが提供される。"
* effective[x] ^comment = "診断手順が患者に対して実行された場合、これは実行された時間を示す。  
【JP Core仕様】レポート作成日時  
（DateTimeを採用し、Periodは不使用）"
* issued MS
* issued ^definition = "このバージョンのレポートがプロバイダに提供された日時。通常、レポートがレビューおよび検証された後になる。"
* issued ^comment = "リソース自体の更新時間とは異なる場合がある。これは、レポートの実際のリリース時間ではなく、レコード（場合によってはセカンダリコピー）のステータスであるため。  
【JP Core仕様】レポート確定日時"
* issued ^requirements = "臨床医は、レポートがリリースされた日付を確認できる必要がある。"
* performer MS
* performer only Reference(JP_Practitioner)
* performer ^definition = "レポートの発行を担当するもの。"
* performer ^comment = "臨床診断レポートに対して責任を持つもの.  
【JP Core仕様】レポート確定者  
（責任としては performer > resultsInterpreter という関係性）"
* performer ^requirements = "結果に関する問い合わせがある場合は、誰に連絡を取るべきかを知る必要がある。また、データ二次分析のためにレポートの発生源を追跡する必要が生じる場合もある。"
* resultsInterpreter MS
* resultsInterpreter only Reference(JP_Practitioner)
* resultsInterpreter ^definition = "レポートの結論や読影に関わる医師や組織"
* resultsInterpreter ^comment = "必ずしも診断レポートに対して責任を持つものを示すわけでは無い。  
【JP Core仕様】但し、一次読影や二次読影などの役割 (Practitioner Roll) の指定方法はペンディング"
* resultsInterpreter ^requirements = "結果に関する問い合わせがある場合は、誰に連絡を取るべきかを知る必要がある。また、データ二次分析のためにレポートの発生源を追跡する必要が生じる場合もある。"
* specimen ^short = "【JP Core仕様】未使用  
・画像ガイド下生検で得られる検体の可能性は有り得るが、放射線レポートでは特には規定しない【詳細参照】"
* specimen ^definition = "診断レポートの対象となる検体"
* specimen ^comment = "【JP Core仕様】未使用  
・画像ガイド下生検で得られる検体の可能性は有り得るが、本項目は病理レポートで利用されることを想定し、放射線レポートでは特には規定しない"
* specimen ^requirements = "レポートの対象となる取集された検体についての情報をレポートできる必要がある。"
* result MS
* result only Reference(JP_Observation_Radiology_Findings or JP_Observation_Radiology_Impression or JP_Observation_Common)
* result ^short = "診断レポートの一部となるObservationリソース【詳細参照】"
* result ^definition = "【JP Core仕様】所見(findings)や診断の結果(impression)を示すObservationリソースへの参照。この他、計測情報などの付随所見をObservationリソースとして定義できる。関連する検体検査結果（腎機能や感染症情報等）を保持することは可能。"
* result ^comment = "Observationはさらにobservationを含むことができる。  
【JP Core仕様】所見(findings)や診断の結果(impression)を示すObservationリソース以外では、計測情報などの付随所見をObservationリソースとして定義できるが、ユースケースに依存するためJP Coreでは未定義とする。関連する検体検査結果（腎機能や感染症情報等）を保持することは可能。"
* result ^requirements = "結果のグループ化が任意だが、意味のある個別の結果または結果のグループをサポートする必要がある。"
* imagingStudy MS
* imagingStudy only Reference(JP_ImagingStudy_Radiology)
* imagingStudy ^definition = "実行された画像検査の完全な詳細に関する1つあるいは複数のリンク。通常、これは DICOM対応モダリティによって実行されるイメージングだが、DICOMであることが必須ではない。完全に有効な PACS ビューアは、この情報を使用してソース イメージのビューを提供できる。"
* imagingStudy ^comment = "【JP Core仕様】・対象となるImagingStudyリソースを参照  
・放射線レポートでは検査実施後には必須（複数もあり得る）"
* media ^definition = "このレポートに関連付けられているキーイメージの一覧。"
* media ^comment = "【JP Core仕様】キーイメージを設定"
* media ^requirements = "多くの診断サービスには、サービスの一部としてレポートに画像が含まれている。"
* media.comment ^definition = "イメージに関するコメント。通常、これは画像が含まれる理由を説明したり、依頼者の注意を重要な内容に引き付けるために使用される。"
* media.comment ^comment = "コメントは、画像と共に表示される。レポートでは画像の内容に関する追加の議論が、DiagnosticReport.textやDiagnosticReport.conclusionなどの他のセクションに含まれるのが一般的である。  
【JP Core仕様】キーイメージの説明"
* media.comment ^requirements = "レポート作成者は、レポートに含まれる各画像についてコメントを付け加える"
* media.link MS
* media.link ^definition = "イメージ ソースへの参照。"
* media.link ^comment = "参照は実際のFHIRリソースへの参照であり、解決可能である必要がある。解決はURLから取得するか、または、リソースタイプが利用できる場合は絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索する。  
【JP Core仕様】キーイメージの参照先"
* conclusion MS
* conclusion ^definition = "診断報告書の簡潔かつ臨床的に文脈化された要約結論(interpretation/impression)"
* conclusion ^comment = "FHIRのstringsは1MBを越えてはならない（SHALL NOT）ことに留意すること。  
【JP Core仕様】放射線レポートの結果/結論/インプレッションの文章を記載"
* conclusion ^requirements = "基本的な結果で、失われない結論を提供する必要がある。"
* conclusionCode ^definition = "診断レポートの要約の結論 (interpretation/impression) を表す 1 つ以上のコード。"
* conclusionCode ^comment = "すべての用語の使用がこの一般的なパターンに適合するわけではない。 場合によっては、モデルにcodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係と事前調整および事後調整を管理するための独自の構造を提供する必要がある。   
【JP Core仕様】・放射線レポートの所見の結論となるコードを設定。  
・例えば、ICD 病名コード"
* presentedForm MS
* presentedForm ^definition = "診断サービスによって発行された結果全体のリッチ テキスト表現。複数の形式は許可されるが、意味的に等価である必要がある。"
* presentedForm ^comment = "\"application/pdf\" がこのコンテキストで最も信頼性が高く、相互運用可能なアプリケーションとして推奨される。  
【JP Core仕様】添付するXHTMLやPDFなどの文書"
* presentedForm ^requirements = "臨床での再現性を担保するために、独自の完全にフォーマットされたレポートを提供可能である。"
