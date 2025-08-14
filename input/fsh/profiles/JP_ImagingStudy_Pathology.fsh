// ==============================
//   Profile 定義
// ==============================
Profile: JP_ImagingStudy_Pathology
Parent: ImagingStudy
Id: jp-imagingstudy-pathology
Title: "JP Core ImagingStudy Pathology Profile"
Description: "このプロファイルはImagingStudyリソースに対して、主に病理診断で撮影された顕微鏡画像に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Pathology"
* ^status = #active
* ^date = "2025-08-14"
* . ^short = "病理診断を目的としたDICOM画像検査に関する情報"
* identifier MS
* identifier ^short = "DICOM画像検査全体を一意に識別するためのID【詳細参照】"
* identifier ^definition = "DICOM画像検査全体を一意に識別するためのID。"
* identifier ^comment = "Study Instance UIDの値を指定する。"
* status ^short = "DICOM画像検査のステータス"
* status ^definition = "DICOM画像検査のステータス。"
* modality from $JP_DICOMModality_VS (required)
* modality ^short = "DICOM画像検査で使用された撮影装置（モダリティ）【詳細参照】"
* modality ^definition = "DICOM画像検査で使用された撮影装置（モダリティ）。"
* modality ^comment = "病理診断では顕微鏡を表すモダリティコード"GM"を指定する。複数モダリティを使用した場合には、該当するモダリティコードを並記する。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^short = "DICOM画像検査の対象患者に関する情報【詳細参照】"
* subject ^definition = "DICOM画像検査の対象患者に関する情報。"
* subject ^comment = "JP Core Patientリソースを参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "このDICOM画像検査を実施するきっかけとなった情報【詳細参照】"
* encounter ^definition = "このDICOM画像検査を実施するきっかけとなった情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* started ^short = "検査開始日時、もしくは顕微鏡観察を開始した日時"
* started ^definition = "検査開始日時、もしくは顕微鏡観察を開始した日時。"
* basedOn ^short = "他のシステムから依頼されたオーダ情報【詳細参照】"
* basedOn ^definition = "他のシステムから依頼されたオーダ情報。"
* basedOn ^comment = "通常、依頼元となるServiceRequestリソースを参照する。他のシステムと連携していない場合は参照不要。"
* referrer only Reference(JP_Practitioner)
* referrer ^short = "依頼医師【詳細参照】"
* referrer ^definition = "依頼医師。"
* referrer ^comment = "ServiceRequestから参照できるため必須ではない。画像についていない情報を無理に生成してreferrerに入力する必要はない。使用する場合には、JP Core Practitionerリソースを参照する。"
* interpreter only Reference(JP_Practitioner)
* interpreter ^short = "画像を診断した医師【詳細参照】"
* interpreter ^definition = "画像を診断した医師。"
* interpreter ^comment = "通常、病理医。使用する場合には、JP Core Practitionerリソースを参照する。"
* endpoint ^short = "このDICOM画像検査リソースが存在する位置【詳細参照】"
* endpoint ^definition = "このDICOM画像検査リソースが存在する位置。"
* endpoint ^comment = "基本的には1つ指定する。"
* numberOfSeries ^short = "このDICOM画像検査に含まれるシリーズ数"
* numberOfSeries ^definition = "このDICOM画像検査に含まれるシリーズ数。"
* numberOfInstances ^short = "このDICOM画像検査に含まれるイメージ（インスタンス）の数"
* numberOfInstances ^definition = "このDICOM画像検査に含まれるイメージ（インスタンス）の数。"
* procedureReference only Reference(JP_Procedure)
* procedureReference ^short = "この画像検査と関連のある手技の情報【詳細参照】"
* procedureReference ^definition = "この画像検査と関連のある手技の情報。"
* procedureReference ^comment = "生検などの手技情報がある場合、JP Core Procedureリソースを参照する。"
* procedureCode from JP_PathologySpecimenType_VS (example)
* procedureCode ^short = "この画像検査と関連のある手技のコード【詳細参照】"
* procedureCode ^definition = "この画像検査と関連のある手技のコード。"
* procedureCode ^comment = "生検、手術検体、剖検などのコードを使用する。"
* location only Reference(JP_Location)
* location ^short = "検査実施場所【詳細参照】"
* location ^definition = "検査実施場所。"
* location ^comment = "JP Core Locationリソースを参照する。"
* reasonCode MS
* reasonCode from JP_PathologyDiagnosis_VS (example)
* reasonCode ^short = "この検査を実施した理由【詳細参照】"
* reasonCode ^definition = "この検査を実施した理由。"
* reasonCode ^comment = "病理診断の理由や臨床診断を記載する。"
* reasonReference only Reference(JP_Condition)
* reasonReference ^short = "この検査を実施した理由への参照【詳細参照】"
* reasonReference ^definition = "この検査を実施した理由への参照。"
* reasonReference ^comment = "JP Core Conditionリソースを参照する。"
* note ^short = "この検査に関するコメント【詳細参照】"
* note ^definition = "この検査に関するコメント。"
* note ^comment = "染色方法や特記事項などを記載する。"
* description ^short = "この検査についての説明【詳細参照】"
* description ^definition = "この検査についての説明。"
* description ^comment = "検査の概要や特記事項を記載する。"
* series MS
* series ^short = "このDICOM画像検査に含まれる各シリーズの情報【詳細参照】"
* series ^definition = "このDICOM画像検査に含まれる各シリーズの情報。"
* series.uid ^short = "DICOM Series Instance UID【詳細参照】"
* series.uid ^definition = "DICOM Series Instance UID。"
* series.uid ^comment = "Series Instance UIDの値を指定する。"
* series.number ^short = "シリーズ番号"
* series.number ^definition = "シリーズ番号。"
* series.modality from $JP_DICOMModality_VS (required)
* series.modality ^short = "シリーズのモダリティ【詳細参照】"
* series.modality ^definition = "シリーズのモダリティ。"
* series.modality ^comment = "病理診断では顕微鏡を表すモダリティコード"GM"を指定する。"
* series.description ^short = "シリーズの説明【詳細参照】"
* series.description ^definition = "シリーズの説明。"
* series.description ^comment = "染色方法や倍率などを記載する。"
* series.numberOfInstances ^short = "シリーズに含まれるインスタンス数"
* series.numberOfInstances ^definition = "シリーズに含まれるインスタンス数。"
* series.endpoint ^short = "このシリーズのリソースが存在する位置"
* series.endpoint ^definition = "このシリーズのリソースが存在する位置。"
* series.bodySite from JP_PathologyOrgan_VS (example)
* series.bodySite ^short = "撮影部位【詳細参照】"
* series.bodySite ^definition = "撮影部位。"
* series.bodySite ^comment = "病理診断では部位の情報が重要である。"
* series.laterality ^short = "身体の左右の区別"
* series.laterality ^definition = "身体の左右の区別。"
* series.specimen only Reference(JP_Specimen)
* series.specimen ^short = "このシリーズで撮影された検体【詳細参照】"
* series.specimen ^definition = "このシリーズで撮影された検体。"
* series.specimen ^comment = "JP Core Specimenリソースを参照する。"
* series.started ^short = "シリーズの開始日時"
* series.started ^definition = "シリーズの開始日時。"
* series.performer MS
* series.performer only Reference(JP_Practitioner)
* series.performer ^short = "シリーズの実施者【詳細参照】"
* series.performer ^definition = "シリーズの実施者。"
* series.performer ^comment = "通常、病理技師や病理医。JP Core Practitionerリソースを参照する。"
* series.instance MS
* series.instance ^short = "シリーズに含まれる各インスタンス（画像）の情報【詳細参照】"
* series.instance ^definition = "シリーズに含まれる各インスタンス（画像）の情報。"
* series.instance.uid ^short = "DICOM SOP Instance UID"
* series.instance.uid ^definition = "DICOM SOP Instance UID。"
* series.instance.sopClass ^short = "DICOM SOP Class UID"
* series.instance.sopClass ^definition = "DICOM SOP Class UID。"
* series.instance.number ^short = "インスタンス番号"
* series.instance.number ^definition = "インスタンス番号。"
* series.instance.title ^short = "インスタンスのタイトル【詳細参照】"
* series.instance.title ^definition = "インスタンスのタイトル。"
* series.instance.title ^comment = "染色方法や倍率、部位などの情報を含める。"
