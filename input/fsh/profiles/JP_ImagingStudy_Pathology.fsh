// ==============================
//   Profile 定義
// ==============================
Profile: JP_ImagingStudy_Pathology
Parent: ImagingStudy
Id: jp-imagingstudy-pathology
Title: "JP Core ImagingStudy Pathology Profile"
Description: "このプロファイルはImagingStudyリソースに対して、病理WSI（Whole Slide Imaging）画像に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Pathology"
* ^status = #active
* ^date = "2025-01-15"
* . ^short = "病理WSI画像検査に関する情報"
* . ^definition = "病理WSI画像検査に関する情報。"
* identifier MS
* identifier ^short = "WSI画像検査全体を一意に識別するためのID【詳細参照】"
* identifier ^definition = "WSI画像検査全体を一意に識別するためのID。"
* identifier ^comment = "Study Instance UIDの値を指定する。"
* status MS
* status ^short = "WSI画像検査のステータス"
* status ^definition = "WSI画像検査のステータス。"
* modality MS
* modality from $JP_DICOMModality_VS (required)
* modality ^short = "WSI画像検査で使用された撮影装置（モダリティ）【詳細参照】"
* modality ^definition = "WSI画像検査で使用された撮影装置（モダリティ）。"
* modality ^comment = "病理WSIを表すモダリティコード「SM」（Slide Microscopy）を指定する。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^short = "WSI画像検査の対象患者に関する情報【詳細参照】"
* subject ^definition = "WSI画像検査の対象患者に関する情報。"
* subject ^comment = "JP Core Patientリソースを参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "このWSI画像検査に関連する受診情報【詳細参照】"
* encounter ^definition = "このWSI画像検査に関連する受診情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* started MS
* started ^short = "WSIスキャン開始日時"
* started ^definition = "WSIスキャン開始日時。"
* basedOn ^short = "他のシステムから依頼されたオーダ情報【詳細参照】"
* basedOn ^definition = "他のシステムから依頼されたオーダ情報。"
* basedOn ^comment = "通常、依頼元となるServiceRequestリソースを参照する。"
* referrer only Reference(JP_Practitioner)
* referrer ^short = "依頼医師【詳細参照】"
* referrer ^definition = "依頼医師。"
* referrer ^comment = "病理検査を依頼した医師。使用する場合には、JP Core Practitionerリソースを参照する。"
* interpreter only Reference(JP_Practitioner)
* interpreter ^short = "画像を診断した病理医【詳細参照】"
* interpreter ^definition = "画像を診断した病理医。"
* interpreter ^comment = "WSI画像を診断した病理医。使用する場合には、JP Core Practitionerリソースを参照する。"
* endpoint ^short = "このWSI画像リソースが存在する位置【詳細参照】"
* endpoint ^definition = "このWSI画像リソースが存在する位置。"
* endpoint ^comment = "DICOMweb等のエンドポイントを指定する。"
* numberOfSeries MS
* numberOfSeries ^short = "このWSI画像検査に含まれるシリーズ数"
* numberOfSeries ^definition = "このWSI画像検査に含まれるシリーズ数。"
* numberOfInstances MS
* numberOfInstances ^short = "このWSI画像検査に含まれるイメージ（インスタンス）の数"
* numberOfInstances ^definition = "このWSI画像検査に含まれるイメージ（インスタンス）の数。"
* procedureReference only Reference(JP_Procedure)
* procedureReference ^short = "実施された処置に関する情報【詳細参照】"
* procedureReference ^definition = "実施された処置に関する情報。"
* procedureReference ^comment = "生検や手術等の情報がある場合、JP Core Procedureを参照する。"
* procedureCode ^short = "実施された処置を表すコード【詳細参照】"
* procedureCode ^definition = "実施された処置を表すコード。"
* procedureCode ^comment = "生検、手術等のコードを使用する場合に指定。"
* location only Reference(JP_Location)
* location ^short = "WSI画像検査が実施された場所【詳細参照】"
* location ^definition = "WSI画像検査が実施された場所。"
* location ^comment = "使用する場合には、JP Core Locationリソースを参照する。"
* reasonCode ^short = "WSI画像検査が依頼された理由を表すコード【詳細参照】"
* reasonCode ^definition = "WSI画像検査が依頼された理由を表すコード。"
* reasonCode ^comment = "診断目的等を示すコードを使用。"
* reasonReference only Reference(JP_Condition or JP_Observation_Pathology)
* reasonReference ^short = "WSI画像検査の実施理由に関する情報【詳細参照】"
* reasonReference ^definition = "WSI画像検査の実施理由に関する情報。"
* reasonReference ^comment = "関連する病態や観察結果を参照する。"
* note ^short = "WSI画像検査に関するコメント"
* note ^definition = "WSI画像検査に関するコメント。"
* description MS
* description ^short = "WSI画像検査に関する記述【詳細参照】"
* description ^definition = "WSI画像検査に関する記述。"
* description ^comment = "検査の概要、スキャン条件等を記載する。"
* series MS
* series ^short = "WSI画像検査に含まれるシリーズ"
* series ^definition = "WSI画像検査に含まれるシリーズ。"
* series.uid MS
* series.uid ^short = "シリーズを一意に識別するためのUID【詳細参照】"
* series.uid ^definition = "シリーズを一意に識別するためのUID。"
* series.uid ^comment = "Series Instance UID (0020,000E) の値を指定する。"
* series.number ^short = "シリーズ番号"
* series.number ^definition = "シリーズ番号。"
* series.modality MS
* series.modality from $JP_DICOMModality_VS (required)
* series.modality ^short = "このシリーズの撮影装置（モダリティ）【詳細参照】"
* series.modality ^definition = "このシリーズの撮影装置（モダリティ）。"
* series.modality ^comment = "病理WSIを表すモダリティコード「SM」を指定する。"
* series.description MS
* series.description ^short = "このシリーズに関する記述【詳細参照】"
* series.description ^definition = "このシリーズに関する記述。"
* series.description ^comment = "染色法、倍率、標本番号等を記載。"
* series.numberOfInstances MS
* series.numberOfInstances ^short = "このシリーズに含まれる画像枚数"
* series.numberOfInstances ^definition = "このシリーズに含まれる画像枚数。"
* series.endpoint ^short = "このシリーズのリソースが存在する位置"
* series.endpoint ^definition = "このシリーズのリソースが存在する位置。"
* series.bodySite ^short = "このシリーズの対象となる解剖学的部位【詳細参照】"
* series.bodySite ^definition = "このシリーズの対象となる解剖学的部位。"
* series.bodySite ^comment = "検体採取部位を示す場合に使用。"
* series.laterality ^short = "解剖学的部位の左右【詳細参照】"
* series.laterality ^definition = "解剖学的部位の左右。"
* series.laterality ^comment = "必要に応じて使用。"
* series.specimen MS
* series.specimen only Reference(JP_Specimen_Pathology)
* series.specimen ^short = "このシリーズの検体に関する情報【詳細参照】"
* series.specimen ^definition = "このシリーズの検体に関する情報。"
* series.specimen ^comment = "JP Core Specimen Pathologyリソースを参照する。"
* series.started MS
* series.started ^short = "このシリーズのスキャン開始日時【詳細参照】"
* series.started ^definition = "このシリーズのスキャン開始日時。"
* series.started ^comment = "WSIスキャンを開始した日時。"
* series.performer ^short = "このシリーズの実施者【詳細参照】"
* series.performer ^definition = "このシリーズの実施者。"
* series.performer ^comment = "WSIスキャンを実施した技師等。"
* series.performer.function ^short = "このシリーズの実施者の役割【詳細参照】"
* series.performer.function ^definition = "このシリーズの実施者の役割。"
* series.performer.actor only Reference(JP_Practitioner or JP_Organization)
* series.performer.actor ^short = "このシリーズの実施者【詳細参照】"
* series.performer.actor ^definition = "このシリーズの実施者。"
* series.instance MS
* series.instance ^short = "シリーズに含まれるインスタンス（画像）単位の情報"
* series.instance ^definition = "シリーズに含まれるインスタンス（画像）単位の情報。"
* series.instance.uid MS
* series.instance.uid ^short = "インスタンス（画像）のユニークID【詳細参照】"
* series.instance.uid ^definition = "インスタンス（画像）のユニークID。"
* series.instance.uid ^comment = "SOP Instance UID (0008,0018) に入力されている値を指定する。"
* series.instance.sopClass MS
* series.instance.sopClass ^short = "SOPクラスUID【詳細参照】"
* series.instance.sopClass ^definition = "SOPクラスUID。"
* series.instance.sopClass ^comment = "病理WSIでは、VL Whole Slide Microscopy Image Storage: 1.2.840.10008.5.1.4.1.1.77.1.6 等を指定。"
* series.instance.sopClass from $JP_DICOMSopClass_VS (extensible)
* series.instance.number ^short = "インスタンス番号【詳細参照】"
* series.instance.number ^definition = "インスタンス番号。"
* series.instance.number ^comment = "Instance Number (0020,0013) に値が入っていた場合は、その値を指定する。"
* series.instance.title ^short = "画像に関する説明【詳細参照】"
* series.instance.title ^definition = "画像に関する説明。"
* series.instance.title ^comment = "標本の説明、染色法等を記載。"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_ImagingStudy_Pathology_ScannerInfo
Parent: Extension
Id: jp-imagingstudy-pathology-scannerinfo
Title: "JP Core ImagingStudy Pathology Scanner Info Extension"
Description: "WSIスキャナー情報を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_ImagingStudy_Pathology_ScannerInfo"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "ImagingStudy.series"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_ImagingStudy_Pathology_ScannerInfo" (exactly)
* extension contains
    manufacturer 0..1 and
    model 0..1 and
    magnification 0..1
* extension[manufacturer].url = "manufacturer" (exactly)
* extension[manufacturer].value[x] only string
* extension[manufacturer] ^short = "スキャナー製造元"
* extension[model].url = "model" (exactly)
* extension[model].value[x] only string
* extension[model] ^short = "スキャナーモデル"
* extension[magnification].url = "magnification" (exactly)
* extension[magnification].value[x] only decimal
* extension[magnification] ^short = "スキャン倍率"