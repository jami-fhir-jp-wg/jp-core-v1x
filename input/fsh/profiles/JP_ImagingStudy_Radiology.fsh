// ==============================
//   Profile 定義
// ==============================
Profile: JP_ImagingStudy_Radiology
Parent: ImagingStudy
Id: jp-imagingstudy-radiology
Title: "JP Core ImagingStudy Radiology Profile"
Description: "このプロファイルはImagingStudyリソースに対して、放射線検査画像のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Radiology"
* ^status = #active
* ^date = "2023-10-31"
* . ^short = "DICOM画像検査で作成されたコンテンツの表現。スタディは一連のシリーズで構成され、各シリーズには、共通のコンテキストで取得または生成された一連のサービスオブジェクトペアインスタンス（SOPインスタンス-画像またはその他のデータ）が含まれる、シリーズは1つのモダリティ（X線、CT、MR、超音波など）のみだがスタディには複数の異なるモダリティのシリーズが含まれる場合がある"
* identifier MS
* identifier ^short = "スタディ全体の識別子"
* identifier ^definition = "DICOMスタディインスタンスUIDやアクセッション番号などのImagingStudyの識別子。"
* identifier ^comment = "DICOMスタディインスタンスUIDのエンコードについては、[Imaging Study Implementation Notes]（imagingstudy.html#notes）の説明を参照。アクセッション番号はACSN識別子タイプを使用する必要がある。  
【JP-Core仕様】Study Instance UIDは画像が存在する場合に必須、その他は任意。StudyInstanceUID (0020,000D)"
* identifier ^requirements = "ImagingStudyに1つ以上のシリーズ要素が存在する場合、1つのDICOMスタディUID識別子が存在する必要がある（[DICOM PS 3.3 C.7.2]（https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.2.html）を参照） 。"
* status MS
* status ^definition = "ImagingStudyの現在のステータス"
* status ^comment = "不明(unknown)は「その他」を表すものではない。定義されたステータスの1つを適用する必要がある。不明(unknown)は、オーサリングシステムが現在のステータスを確認できない場合に使用される。  
【JP-Core仕様】リソースの状態。"
* modality from $JP_DICOMModality_VS (required)
* modality ^short = "実際の取得モダリティーの場合、モダリティーの全シリーズ。対応するDICOM tag: (0008, 0061)"
* modality ^definition = "実際の取得モダリティであるすべてのseries.modality値のリスト、つまりDICOMコンテキストグループ29（値セットOID 1.2.840.10008.6.1.19）の値。"
* modality ^comment = "コードは、列挙型またはコードリストで、DICOMのモダリティコードを利用する。  
・モダリティのコードを設定。  
・Seriesの階層の(0008,0060)を集約する、または(0008,0060)　と　(0008, 0061) のOR。但し、重複する値は1つにまとめて表現。"
* subject MS
* subject only Reference(JP_Patient or Device or Group)
* subject ^short = "検査対象者"
* subject ^definition = "画像検査の対象、通常は患者。"
* subject ^comment = "QAファントムはDeviceリソースとして記録できる。複数の被験者（マウスなど）の場合はGroupリソースで記録できる。  
・患者(Patient)リソースを参照。  
・DICOMタグ値を参照する場合は、tag mappingの通りグループ0010（患者情報に関連する情報を扱うグループ）を参照。  
・不明患者は、空もしくは不明を指すPatientリソースを参照。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "この画像検査が関連しているEncounterリソース"
* encounter ^definition = "このImagingStudyが行われるヘルスケアイベント（患者とヘルスケアプロバイダの相互作用など）。"
* encounter ^comment = "これは通常、イベントが発生したEncounterであるが、一部のイベントは、Encounterの正式な完了の前または後に開始される場合があり、それでもそのEncounterのコンテキストに関連付けられている（例：入院前の検査）  
受付を示すEncounterリソースを参照。  
（補足：訪問診療では医療者が患者と会った事を指す）"
* started ^short = "スタディの開始時期"
* started ^definition = "スタディの開始日時"
* started ^comment = "検査開始日時　もしくは　撮影装置へ患者情報が届いた/入力した日時。"
* basedOn ^short = "実施された依頼"
* basedOn ^definition = "この画像検査の実施につながった診断依頼のリスト。"
* basedOn ^comment = "参照は、実在するFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的に使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
依頼元のServiceRequestを紐付ける。"
* basedOn ^requirements = "グループ化された手技をサポートすること。（一つの画像検査に複数の種類の手技が含まれることがある。例：胸部/腹部/骨盤部 CT）"
* referrer only Reference(JP_Practitioner or JP_PractitionerRole)
* referrer ^short = "依頼紹介医師"
* referrer ^definition = "依頼紹介医師"
* referrer ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
依頼医師。必須ではない（ServiceRequestから参照できるため）。"
* interpreter only Reference(JP_Practitioner or JP_PractitionerRole)
* interpreter ^short = "画像の読影者"
* interpreter ^definition = "画像の読影者"
* interpreter ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
読影医"
* endpoint ^short = "スタディにアクセスするエンドポイント（画像へのURI）"
* endpoint ^definition = "スタディへのアクセス（クエリ、表示、取得など）を提供するネットワークサービス。 DICOMエンドポイントの使用については、実装ノートを参照。スタディレベルのエンドポイントは、同じEndpoint.connectionTypeを持つシリーズレベルのエンドポイントによってオーバーライドされない限り、スタディの各シリーズに適用される。"
* endpoint ^comment = "典型的なエンドポイントタイプには、RESTful APIを使用してネイティブまたはレンダリング（JPG、PNGなど）形式でDICOMインスタンスを取得するために使用されるDICOM WADO-RSが含まれる。 DICOM WADO-URI。HTTPクエリベースのアプローチを使用することを除いて、ネイティブインスタンスまたはレンダリングされたインスタンスを同様に取得できる。 DICOM QIDO-RS。実際のインスタンスを取得せずに、DICOM情報のRESTfulクエリを可能にする。またはIHEInvoke Image Display（IID）。これは、イメージングWebビューアの標準的な呼び出しを提供する。  
DICOMのリソース位置を指定。基本的には1つ。"
* endpoint ^requirements = "スタディまたはスタディに含まれるシリーズやインスタンスを閲覧（例：IHE’s IID profile）したり、取得（例：DICOM’s WADO-URI and WADO-RS）したりするためのアクセス方法。スタディレベルのbaseLocationは、同じタイプのシリーズレベルのbaseLocationにてオーバーライドされない限り、スタディ内の各シリーズに適用される。"
* numberOfSeries ^short = "スタディに含まれるシリーズ数"
* numberOfSeries ^definition = "調査のシリーズ数。指定されたこの値は、リソースの可用性、セキュリティ、またはその他の要因により、このリソースに含まれる一連の要素の数よりも大きい場合がある。系列要素が存在する場合、この要素が存在する必要がある。"
* numberOfSeries ^comment = "32ビット数で表す。これより大きい値の場合は、10進数を使用する。  
シリーズの数"
* numberOfInstances ^short = "スタディ関連のインスタンス数"
* numberOfInstances ^definition = "スタディの中のSOPインスタンスの数。指定されたこの値は、リソースの可用性、セキュリティ、またはその他の要因により、このリソースに含まれるインスタンス要素の数よりも大きい場合がある。インスタンス要素が存在する場合は、この要素が存在する必要がある。"
* numberOfInstances ^comment = "32ビット数で表す。これより大きい値の場合は、10進数を使用する。  
イメージ（インスタンス）の数。"
* procedureReference only Reference(JP_Procedure)
* procedureReference ^short = "実施されたProcedure への参照"
* procedureReference ^definition = "このImagingStudyが含まれていたprocedure リソースへの参照。"
* procedureReference ^comment = "参照は、実在するFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
進捗状況に関するProcedureリソースを参照。"
* procedureCode ^short = "実施されたProcedureのコード"
* procedureCode ^definition = "実施されたProcedureのタイプを表すコード。"
* procedureCode ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係と調整前後の関係を管理するための独自の構造を提供する必要がある。  
エラーコードなどを記載"
// * procedureCode from http://playbook.radlex.org/playbook/SearchRadlexAction (extensible)
* procedureCode ^binding.description = "コードは http://playbook.radlex.org/playbook/SearchRadlexAction に該当があれば使わなければならない。ただし、実施された行為のタイプにこれらのコードがなじまない場合は他のコードが利用される可能性がある。"
* location ^short = "ImagingStudy が実施された場所"
* location ^definition = "ImagingStudyが実施された主要な物理的な場所。"
* location ^requirements = "イベントをレコードが保持される可能性が高い場所に結び付け、イベントの発生に関するコンテキストを提供する。 (たとえば、専用の医療環境の内外で発生した場合など。）"
* location ^comment = "参照は、実在のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
撮影室を示すLocationリソースを参照。"
* reasonCode ^short = "スタディが依頼された理由"
* reasonCode ^definition = "ImagingStudyが要求された理由を示す臨床状態の説明。"
* reasonCode ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係と調整前後の関係を管理するための独自の構造を提供する必要がある。  
JP Coreでは未使用"
* reasonReference only Reference(JP_Condition or JP_Observation_Common or Media or JP_DiagnosticReport_Common or DocumentReference)
* reasonReference ^short = "スタディが実施された理由"
* reasonReference ^definition = "このスタディを正当化する別のリソースを示す。"
* reasonReference ^comment = "参照は、実在のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
実施理由が書かれたDiagnosticReportリソースを参照。"
* note ^short = "ユーザが定義したコメント"
* note ^definition = "推奨されるDICOMマッピングによると、この要素はスタディの説明属性（0008,1030）から派生している。画像検査に関する観察または所見は、この要素に記述するのではなく、Observationのような別のリソースに記録する必要がある。"
* note ^comment = "構造化された注釈（アノテーション）を持たないシステムの場合、作成者や時間なしで単一の注釈を簡単に伝達できる。情報を変更する可能性があるため、この要素をナラティブに含める必要がある場合がある。  
*注釈は、計算機処理れきる「変更」情報を伝達するために使用されるべきではない*。 （ユーザの行動を強制することはほとんど不可能であるため、これはSHOULDとする）。  
コメント（Annotation型による記述）"
* description ^short = "機関生成の記述"
* description ^definition = "スタディのイメージングマネージャの説明。実施されたスタディ（コンポーネント）の機関生成の説明または分類。"
* description ^comment = "FHIR文字列のサイズは1MBを超えてはならないことに注意。  
検査に関するフリーコメント。"
* series ^short = "個々のスタディはインスタンスの１以上のシリーズを有する"
* series ^definition = "個々のスタディは画像か他の内容の１以上のシリーズを有する。"
* series ^comment = "シリーズ（大まかな画像のグループ）"
* series.uid ^short = "そのシリーズに対するDICOM Series Instance UID"
* series.uid ^definition = "そのシリーズに対するDICOM Series Instance UID"
* series.uid ^comment = "[DICOM PS3.3 C.7.3]（https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.3.html）を参照。  
study階層のidentifierと同じ概念。(0020,000E)にseries固有のUIDが付与される。"
* series.number ^short = "このシリーズの数値型識別子"
* series.number ^definition = "このシリーズの数値型識別子"
* series.number ^comment = "32ビット数で表す。これより大きい値の場合は、10進数を使用する。  
上記UIDとは別に、ユーザ（または装置）が自由に決められる番号。"
* series.modality MS
* series.modality from $JP_DICOMModality_VS (required)
* series.modality ^short = "シリーズが取得されたモダリティ"
* series.modality ^definition = "シリーズが取得されたモダリティー"
* series.modality ^comment = "JP CoreではDICOMのモダリティコードを利用する。SNOMED CTは推奨しない。  
（参照先）   
http://jpfhir.jp/fhir/core/ValueSet/JP_DICOMModality_VS.html"
* series.description ^short = "シリーズの人間可読な形式での短い要約記述"
* series.description ^definition = "シリーズの記述。"
* series.description ^comment = "FHIR文字列のサイズは1MBを超えてはならないことに注意。  
シリーズごとにつけられるフリーコメント。"
* series.numberOfInstances ^definition = "スタディの中のSOPインスタンスの数。指定されたこの値は、リソースの可用性、セキュリティ、またはその他の要因により、このリソースに含まれるインスタンス要素の数よりも大きい場合がある。インスタンス要素が存在する場合は、この要素が存在する必要がある。"
* series.numberOfInstances ^comment = "32ビット数で表す。これより大きい値の場合は、10進数を使用する。  
シリーズに含まれる画像枚数"
* series.endpoint ^short = "シリーズにアクセスするエンドポイント（画像へのURI）"
* series.endpoint ^definition = "シリーズへのアクセス（クエリ、表示、取得など）を提供するネットワークサービス。 DICOMエンドポイントの使用については、実装ノートを参照。シリーズレベルのエンドポイントは、同じEndpoint.connectionTypeを持つシリーズレベルのエンドポイントによってオーバーライドされない限り、スタディの各シリーズに適用される。"
* series.endpoint ^comment = "典型的なエンドポイントタイプには、RESTful APIを使用してネイティブまたはレンダリング（JPG、PNGなど）形式でDICOMインスタンスを取得するために使用されるDICOM WADO-RSが含まれる。 DICOM WADO-URI。HTTPクエリベースのアプローチを使用することを除いて、ネイティブインスタンスまたはレンダリングされたインスタンスを同様に取得できる。 DICOM QIDO-RSは、実際のインスタンスを取得せずにDICOM情報のRESTfulクエリを可能にする。  
study階層のendpointと同じ。DICOMのリソース位置を指定。基本的には1つ。"
* series.bodySite ^short = "検査した人体部位"
* series.bodySite ^definition = "検査対象の解剖学的構造。   
bodySiteは、画像化された身体部分の左右差を示している場合がある。その場合、ImagingStudy.series.lateralityのコンテンツと一致している必要がある。"
* series.bodySite ^comment = "コードは、列挙型またはコードリストで、どの部位の検査なのかを示す。フリーではなく、DICOM定義書の中で示される語句（コード）をデフォルトとするが、JJ1017Pの小部位コードの利用を許容する。"
* series.bodySite ^binding.description = "DICOM tagに設定されているコードをデフォルトとするが、JJ1017Pの小部位コードの利用を許容する。"
* series.laterality ^short = "人体部位の左右識別"
* series.laterality ^definition = "検査した（おそらく対になっている）解剖学的構造の左右識別。  
例：左膝、両方の肺、または対になっていない腹部。存在する場合は、ImagingStudy.series.bodySiteに示されている左右差情報と一致している必要がある。"
* series.laterality ^comment = "コードは、列挙型またはコードリストで、どの部位の検査なのかを示す。フリーではなく、DICOM定義書の中で示される語句（コード）をデフォルトとするが、JJ1017Pの左右コードの利用を許容する。"
* series.laterality ^binding.description = "DICOM定義書の中で示される語句（コード）をデフォルトとするが、JJ1017Pの左右コードの利用を許容する。"
* series.specimen ^short = "画像検査をした検体"
* series.specimen ^definition = "例えば、生検のスライド全体の画像化のために画像化された標本。通常の放射線画像検査では使用されない。（DICOMを用いた病理画像検査で用いられる）"
* series.specimen ^comment = "参照は、実在のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
【JP Core仕様】UIDは別のtagが存在するので、ユーザ側で自由に付与していい番号と思われる。"
* series.started ^short = "シリーズの開始時期"
* series.started ^definition = "シリーズの開始日付、日時。"
* series.started ^comment = "シリーズ単位での開始時刻。最初にシリーズを取得 or 定義した時刻。"
* series.performer ^short = "シリーズの実施者"
* series.performer ^definition = "シリーズを実施し、関係した人を示す。"
* series.performer ^comment = "シリーズを実施した人がわからない場合は、その組織が記録される場合がある。患者または関係者は、患者自身で取得した画像の場合など、パフォーマーである可能性がある。  
【JP Core仕様】検査を実施した（画像を取得する操作を行った）人。  
　　(0008,1050)Performing Physician's Name  
　　(0008,1052)Performing Physician Identification Sequence  
　　(0008,1070)Operators' Name  
　　(0008,1072)Operator Identification Sequence"
* series.performer.actor MS
* series.performer.actor only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam or JP_Patient or Device or RelatedPerson)
* series.performer.actor ^comment = "【JP Core仕様】組織または撮影者"
* series.instance ^short = "シリーズからの単一SOPインスタンス"
* series.instance ^definition = "ひとつの画像、またはプレゼンテーションの状態など、シリーズ内の単一のSOPインスタンス。"
* series.instance ^comment = "インスタンス（画像）単位の情報"
* series.instance.uid MS
* series.instance.uid ^comment = "[DICOM PS3.3 C.12.1](https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.12.html#sect_C.12.1)を参照。  
【JP Core仕様】画像のユニークID。DICOMタグマッピングにある値をそのまま設定。"
* series.instance.sopClass MS
* series.instance.sopClass ^comment = "【JP Core仕様】SOPクラスUID。DICOMタグマッピングにある値をそのまま設定。"
* series.instance.number ^comment = "32ビット数で表す。これより大きい値の場合は、10進数を使用する。  
【JP Core仕様】ユーザ（または装置）が自由に決められる画像ごとの番号。DICOMタグマッピングにある値をそのまま設定。"
* series.instance.title ^short = "インスタンスの記述"
* series.instance.title ^definition = "インスタンスの記述"
* series.instance.title ^comment = "【JP Core仕様】画像に対する説明。DICOMタグマッピングにある値があれば、そのまま設定  
　　(0008,0008)Image Type  
　　(0040,A043)Concept Name Code Sequence  
　　(0008,0104)Code Meaning  
　　(0042,0010)Document Title"
