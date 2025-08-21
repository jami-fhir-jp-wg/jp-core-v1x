// ==============================
//   Profile 定義
// ==============================
Profile: JP_Media_Pathology
Parent: Media
Id: jp-media-pathology
Title: "JP Core Media Pathology Profile"
Description: "このプロファイルはMediaリソースに対して、病理検査で取得または使用される画像に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Media_Pathology"
* ^status = #active
* ^date = "2025-01-15"
* . ^short = "病理検査で取得または使用される画像に関わる情報。"
* . ^definition = "病理検査で取得または使用される画像に関わる情報。"
* identifier ^short = "病理画像を一意に識別するためのID。"
* identifier ^definition = "病理画像を一意に識別するためのID。"
* basedOn ^short = "他のシステムから依頼されたオーダ情報。"
* basedOn ^definition = "他のシステムから依頼されたオーダ情報。"
* basedOn ^comment = "通常、依頼元となるServiceRequestリソースを参照する。"
* partOf only Reference(JP_DiagnosticReport_Pathology or JP_Procedure)
* partOf ^short = "関連する診断レポートまたは手技。"
* partOf ^definition = "関連する診断レポートまたは手技。"
* partOf ^comment = "病理診断レポートまたは関連する手技を参照する。"
* status MS
* status ^short = "メディアのステータス。"
* status ^definition = "メディアのステータス。"
* status ^comment = "「completed」を指定する。"
* type MS
* type ^short = "メディアの種類。【詳細参照】"
* type ^definition = "メディアの種類。"
* type ^comment = "「image」（静止画）または「video」（動画）を指定する。"
* modality from JP_PathologyMediaModality_VS (preferred)
* modality ^short = "メディアを取得した方法。【詳細参照】"
* modality ^definition = "メディアを取得した方法。"
* modality ^comment = "肉眼写真、顕微鏡写真、WSI等を示すコードを使用。"
* view ^short = "画像のビュー。【詳細参照】"
* view ^definition = "画像のビュー。"
* view ^comment = "必要に応じて使用。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^short = "メディアの対象患者に関する情報。"
* subject ^definition = "メディアの対象患者に関する情報。"
* subject ^comment = "JP Core Patientリソースを参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "このメディアが生成された受診情報。"
* encounter ^definition = "このメディアが生成された受診情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* created[x] MS
* created[x] ^short = "このメディアが生成された日時。"
* created[x] ^definition = "このメディアが生成された日時。"
* created[x] ^comment = "画像撮影日時を記録。"
* issued ^short = "メディアが利用可能になった日時。"
* issued ^definition = "メディアが利用可能になった日時。"
* operator only Reference(JP_Practitioner or JP_PractitionerRole)
* operator ^short = "画像を撮影した者。"
* operator ^definition = "画像を撮影した者。"
* operator ^comment = "撮影を行った技師等の情報を参照する。"
* reasonCode ^short = "このメディアが生成された理由。"
* reasonCode ^definition = "このメディアが生成された理由。"
* reasonCode ^comment = "診断目的、記録目的等を示す。"
* bodySite MS
* bodySite ^short = "このメディアの対象となる解剖学的部位。【詳細参照】"
* bodySite ^definition = "このメディアの対象となる解剖学的部位。"
* bodySite ^comment = "検体採取部位や撮影部位を示す。"
* deviceName MS
* deviceName ^short = "このメディアを生成した装置名。【詳細参照】"
* deviceName ^definition = "このメディアを生成した装置名。"
* deviceName ^comment = "カメラ名、顕微鏡名、スキャナー名等を記載。"
* device ^short = "メディアの収集に使用されたデバイス。"
* device ^definition = "メディアの収集に使用されたデバイス。"
* device ^comment = "必要に応じて使用。"
* height ^short = "画像の高さ（ピクセル単位）。"
* height ^definition = "画像の高さ（ピクセル単位）。"
* width ^short = "画像の幅（ピクセル単位）。"
* width ^definition = "画像の幅（ピクセル単位）。"
* frames ^short = "フレーム数。"
* frames ^definition = "フレーム数。"
* frames ^comment = "Zスタック等、複数フレームがある場合に使用。"
* duration ^short = "動画の録画時間（秒単位）。"
* duration ^definition = "動画の録画時間（秒単位）。"
* content MS
* content ^short = "画像の実際のコンテンツまたは参照。"
* content ^definition = "画像の実際のコンテンツまたは参照。"
* note MS
* note ^short = "画像についてのコメント。【詳細参照】"
* note ^definition = "画像についてのコメント。"
* note ^comment = "撮影条件、染色法、倍率等の情報を記載。"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_Media_Pathology_Magnification
Parent: Extension
Id: jp-media-pathology-magnification
Title: "JP Core Media Pathology Magnification Extension"
Description: "病理画像の撮影倍率を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_Magnification"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "Media"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_Magnification" (exactly)
* value[x] only decimal
* value[x] ^short = "撮影倍率"
* value[x] ^definition = "病理画像の撮影倍率（例：40、100、400等）"

Extension: JP_Media_Pathology_StainMethod
Parent: Extension
Id: jp-media-pathology-stainmethod
Title: "JP Core Media Pathology Stain Method Extension"
Description: "病理画像の染色方法を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_StainMethod"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "Media"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_StainMethod" (exactly)
* value[x] only CodeableConcept
* value[x] from JP_PathologyStainMethod_VS (extensible)
* value[x] ^short = "染色方法"
* value[x] ^definition = "病理画像の染色方法"

Extension: JP_Media_Pathology_SpecimenLabel
Parent: Extension
Id: jp-media-pathology-specimenlabel
Title: "JP Core Media Pathology Specimen Label Extension"
Description: "病理画像に関連する検体ラベル情報を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_SpecimenLabel"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "Media"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_SpecimenLabel" (exactly)
* extension contains
    blockNumber 0..1 and
    slideNumber 0..1
* extension[blockNumber].url = "blockNumber" (exactly)
* extension[blockNumber].value[x] only string
* extension[blockNumber] ^short = "ブロック番号"
* extension[slideNumber].url = "slideNumber" (exactly)
* extension[slideNumber].value[x] only string
* extension[slideNumber] ^short = "標本番号（スライド番号）"

// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_PathologyMediaModality_VS
Id: jp-pathologymediamodality-vs
Title: "JP Core Pathology Media Modality ValueSet"
Description: "病理画像の取得方法を表すコードの値セット"
* ^url = $JP_PathologyMediaModality_VS
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* include codes from system JP_PathologyMediaModality_CS

// ==============================
//   CodeSystem 定義
// ==============================
CodeSystem: JP_PathologyMediaModality_CS
Id: jp-pathologymediamodality-cs
Title: "JP Core Pathology Media Modality CodeSystem"
Description: "病理画像の取得方法のコードシステム"
* ^url = $JP_PathologyMediaModality_CS
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* ^caseSensitive = true
* ^content = #complete
* #gross-photo "Gross photograph" "肉眼写真"
* #microscopic-photo "Microscopic photograph" "顕微鏡写真"
* #wsi-image "Whole slide image" "WSI画像"
* #frozen-section "Frozen section image" "凍結切片画像"
* #electron-microscopy "Electron microscopy image" "電子顕微鏡画像"
* #immunofluorescence "Immunofluorescence image" "蛍光免疫画像"