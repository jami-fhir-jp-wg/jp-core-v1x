// ==============================
//   Profile 定義
// ==============================
Profile: JP_Media_Endoscopy
Parent: Media
Id: jp-media-endoscopy
Title: "JP Core media Endoscopy Profile"
Description: "このプロファイルはMediaリソースに対して、主に内視鏡検査で取得または使用される画像、映像、音声に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Media_Endoscopy"
* ^status = #active
* ^date = "2024-11-18"
* . ^short = "内視鏡検査で取得または使用される画像、映像、音声に関わる情報。"
* . ^definition = "内視鏡検査で取得または使用される画像、映像、音声に関わる情報。"
* identifier ^short = "製品またはシステムが管理する、施設内で画像（JPEG等）、映像（MPEG等）、音声ファイルなどのメディアを一意に識別するためのID。"
* identifier ^definition = "製品またはシステムが管理する、施設内で画像（JPEG等）、映像（MPEG等）、音声ファイルなどのメディアを一意に識別するためのID。"
* basedOn ^short = "他のシステムから依頼されたオーダ情報。"
* basedOn ^definition = "他のシステムから依頼されたオーダ情報。"
* basedOn ^comment = "通常、依頼元となるServiceRequestリソースを参照する。他のシステムと連携していない場合は参照不要。"
* partOf ^short = "参照されるイベントの一部。"
* partOf ^definition = "参照されるイベントの一部。"
* partOf ^comment = "使用する場合は、基底にある Definition、Requirement、Comments の内容を参考に使用する。"
* status ^short = "メディアのステータス。"
* status ^definition = "メディアのステータス。"
* status ^comment = "”completed” を指定する。"
* type ^short = "メディアの種類。"
* type ^definition = "メディアの種類。"
* type ^comment = "使用する場合は、メディアの種類を image, video, audio から選択する。"
* modality from $JP_DICOMModality_VS (preferred)
* modality ^short = "メディアを取得・撮影した装置（モダリティ）。"
* modality ^definition = "メディアを取得・撮影した装置（モダリティ）。"
* modality ^comment = "使用する場合、ImagingStudy同様”ES”を指定することが望ましい。"
* view ^short = "メディアのイメージングビュー（例：横方向、前後方向など）。"
* view ^definition = "メディアのイメージングビュー（例：横方向、前後方向など）。"
* view ^comment = "内視鏡では省略してよい。将来的にニーズが出てきた場合には検討する。"
* subject only Reference(JP_Patient)
* subject ^short = "メディアの対象患者に関する情報。"
* subject ^definition = "メディアの対象患者に関する情報。"
* subject ^comment = "JP Core Patientリソースを参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "このメディアが生成されるきっかけとなった情報。"
* encounter ^definition = "このメディアが生成されるきっかけとなった情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* created[x] ^short = "このメディアが生成された日時。"
* created[x] ^definition = "このメディアが生成された日時。"
* created[x] ^comment = "静止画の場合createdDateTime、ビデオ、音声の場合createdPeriodを指定する。"
* issued ^short = "DiagnosticReportのStatusがFinalになった日時（レポート確定日時）。"
* issued ^definition = "DiagnosticReportのStatusがFinalになった日時（レポート確定日時）。"
* issued ^comment = "内視鏡では、mediaが示すデータが単独でリソース化されることはない前提。"
* operator only Reference(JP_Practitioner)
* operator ^short = "内視鏡検査の実施医。"
* operator ^definition = "内視鏡検査の実施医。"
* operator ^comment = "内視鏡検査実施医の情報が入っているリソースを参照する。"
* reasonCode ^short = "このメディアが生成された理由。"
* reasonCode ^definition = "このメディアが生成された理由。"
* reasonCode ^comment = "内視鏡では省略してよい。"
* bodySite ^short = "このメディアの対象となる解剖学的部位。"
* bodySite ^definition = "このメディアの対象となる解剖学的部位。"
* bodySite ^comment = "内視鏡では省略してよい。将来的にニーズが出てきた場合には検討する。"
* deviceName ^short = "このメディアを生成した装置名。"
* deviceName ^definition = "このメディアを生成した装置名。"
* deviceName ^comment = "原則機種名（スコープ）を記載する。デジカメの場合Exifヘッダの機種名とする。"
* device ^short = "メディアの収集に使用されるデバイス。"
* device ^definition = "メディアの収集に使用されるデバイス。"
* device ^comment = "内視鏡では省略してよい。使用する場合には、参照するリソースで定義して使用する。"
* height ^short = "画像の高さ（ピクセル単位）（写真/ビデオ）。"
* height ^definition = "画像の高さ（ピクセル単位）（写真/ビデオ）。"
* height ^comment = "使用する場合は、画像の高さ（ピクセル単位）（写真/ビデオ）を指定する。"
* width ^short = "画像の幅（ピクセル単位）（写真/ビデオ）。"
* width ^definition = "画像の幅（ピクセル単位）（写真/ビデオ）。"
* width ^comment = "使用する場合は、画像の幅（ピクセル単位）（写真/ビデオ）を指定する。"
* frames ^short = "フレーム数。"
* frames ^definition = "フレーム数。"
* frames ^comment = "EUSの場合など、フレーム数が1より大きいメディア（単一のメディアで複数のスライスを取得する画像取得コンテキスト）を扱う場合に使用する。"
* duration ^short = "ビデオ映像・音声向けの、秒単位の録画・記録時間。"
* duration ^definition = "ビデオ映像・音声向けの、秒単位の録画・記録時間。"
* content ^short = "埋め込まれたメディアの実際のコンテンツ、またはメディアソースファイルへの直接参照。"
* content ^definition = "埋め込まれたメディアの実際のコンテンツ、またはメディアソースファイルへの直接参照。"
* note ^short = "メディアについてのコメント。"
* note ^definition = "メディアについてのコメント。"