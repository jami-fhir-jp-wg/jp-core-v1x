// ==============================
//   Profile 定義
// ==============================
Profile: JP_Media_Pathology
Parent: Media
Id: jp-media-pathology
Title: "JP Core Media Pathology Profile"
Description: "このプロファイルはMediaリソースに対して、主に病理診断で取得または使用されるNon-DICOMフォーマットの画像に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Media_Pathology"
* ^status = #active
* ^date = "2025-08-14"
* . ^short = "病理診断で取得または使用されるNon-DICOMフォーマットの画像に関する情報"
* . ^definition = "病理診断で取得または使用されるNon-DICOMフォーマットの画像に関する情報"
* . ^comment = "病理診断におけるNon-DICOMフォーマットの画像、映像、音声記録に関わるデータ"
* identifier ^short = "病理診断に関する画像に対して、施設内で割り振られる一意の識別子。"
* identifier ^definition = "病理診断に関する画像に対して、施設内で割り振られる一意の識別子。"
* basedOn only Reference(ServiceRequest)
* basedOn ^short = "この画像が作成されることになった依頼や計画、提案に関する情報。【詳細参照】"
* basedOn ^definition = "この画像が作成されることになった依頼や計画、提案に関する情報。"
* basedOn ^comment = "【JP Core仕様】オーダ情報がある場合、このプロファイルでは ServiceRequest のリソースを参照。"
* partOf ^short = "この画像が親イベントの一部を成す要素であるとき、その親イベントに関する情報。【詳細参照】"
* partOf ^definition = "この画像が親イベントの一部を成す要素であるとき、その親イベントに関する情報。"
* partOf ^comment = "【JP Core仕様】病理診断手技の背景情報にあたる場合 Procedure のリソースを参照。"
* status MS
* status ^short = "画像ステータス【詳細参照】"
* status ^definition = "画像ステータス。"
* status ^comment = "preparationまたはcomplete。"
* type MS
* type ^short = "画像の種類【詳細参照】"
* type ^definition = "画像の種類。"
* type ^comment = "病理診断では主に静止画像（image）を使用する。"
* modality MS
* modality from $JP_DICOMModality_VS (extensible)
* modality ^short = "撮影装置【詳細参照】"
* modality ^definition = "撮影装置。"
* modality ^comment = "病理診断では顕微鏡を表すコード"GM"を指定することを推奨する。"
* view from JP_PathologyStaining_VS (example)
* view ^short = "撮影方法や染色方法【詳細参照】"
* view ^definition = "撮影方法や染色方法。"
* view ^comment = "HE染色、PAS染色、免疫組織化学染色など。"
* subject MS
* subject only Reference(JP_Patient or JP_Practitioner or JP_PractitionerRole or Group or Device or JP_Specimen or JP_Location)
* subject ^short = "画像の対象【詳細参照】"
* subject ^definition = "画像の対象。"
* subject ^comment = "通常は患者（JP_Patient）または検体（JP_Specimen）を参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "この画像を撮影するきっかけとなった情報【詳細参照】"
* encounter ^definition = "この画像を撮影するきっかけとなった情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* created[x] MS
* created[x] ^short = "画像作成日時【詳細参照】"
* created[x] ^definition = "画像作成日時。"
* created[x] ^comment = "DateTimeまたはPeriodを使用する。"
* issued ^short = "画像配信日時【詳細参照】"
* issued ^definition = "画像配信日時。"
* issued ^comment = "システムが画像を利用可能にした日時。"
* operator only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam or JP_Patient or Device or RelatedPerson)
* operator ^short = "画像の撮影者【詳細参照】"
* operator ^definition = "画像の撮影者。"
* operator ^comment = "通常は病理技師または病理医。JP Core Practitionerリソースを参照することを推奨する。"
* reasonCode MS
* reasonCode from JP_PathologyDiagnosis_VS (example)
* reasonCode ^short = "この画像を撮影した理由【詳細参照】"
* reasonCode ^definition = "この画像を撮影した理由。"
* reasonCode ^comment = "病理診断の目的や臨床診断を記載する。"
* bodySite MS
* bodySite from JP_PathologyOrgan_VS (example)
* bodySite ^short = "撮影部位【詳細参照】"
* bodySite ^definition = "撮影部位。"
* bodySite ^comment = "病理診断では部位の情報が重要である。"
* deviceName ^short = "撮影機器の名称【詳細参照】"
* deviceName ^definition = "撮影機器の名称。"
* deviceName ^comment = "顕微鏡の機種名やカメラの名称など。"
* device only Reference(Device or DeviceMetric)
* device ^short = "撮影機器【詳細参照】"
* device ^definition = "撮影機器。"
* device ^comment = "顕微鏡やカメラなどのデバイス情報。"
* height ^short = "画像の高さ（ピクセル）"
* height ^definition = "画像の高さ（ピクセル）。"
* width ^short = "画像の幅（ピクセル）"
* width ^definition = "画像の幅（ピクセル）。"
* frames ^short = "動画のフレーム数"
* frames ^definition = "動画のフレーム数。"
* duration ^short = "動画の長さ（秒）"
* duration ^definition = "動画の長さ（秒）。"
* content MS
* content ^short = "実際の画像データ【詳細参照】"
* content ^definition = "実際の画像データ。"
* content.contentType MS
* content.contentType ^short = "画像のMIMEタイプ【詳細参照】"
* content.contentType ^definition = "画像のMIMEタイプ。"
* content.contentType ^comment = "image/jpeg、image/png、image/tiffなど。"
* content.language ^short = "画像の言語【詳細参照】"
* content.language ^definition = "画像の言語。"
* content.language ^comment = "通常はja-JP。"
* content.data ^short = "埋め込み画像データ【詳細参照】"
* content.data ^definition = "埋め込み画像データ。"
* content.data ^comment = "小さな画像の場合、Base64エンコードしたデータを直接格納することもできる。"
* content.url MS
* content.url ^short = "画像データのURL【詳細参照】"
* content.url ^definition = "画像データのURL。"
* content.url ^comment = "通常は画像サーバのURLを指定する。"
* content.size ^short = "画像データのサイズ（バイト）"
* content.size ^definition = "画像データのサイズ（バイト）。"
* content.hash ^short = "画像データのハッシュ値"
* content.hash ^definition = "画像データのハッシュ値。"
* content.title ^short = "画像のタイトル【詳細参照】"
* content.title ^definition = "画像のタイトル。"
* content.title ^comment = "染色方法や倍率、部位などの情報を含める。"
* content.creation ^short = "画像データの作成日時"
* content.creation ^definition = "画像データの作成日時。"
* note ^short = "画像に関する追加コメント【詳細参照】"
* note ^definition = "画像に関する追加コメント。"
* note ^comment = "撮影条件や特記事項などを記載する。"
