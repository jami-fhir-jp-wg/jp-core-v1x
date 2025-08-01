// ==============================
//   Profile 定義
// ==============================
Profile: JP_ImagingStudy_Endoscopy
Parent: ImagingStudy
Id: jp-imagingstudy-endoscopy
Title: "JP Core ImagingStudy Endoscopy Profile"
Description: "このプロファイルはImagingStudyリソースに対して、主に内視鏡検査で撮影された画像に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Endoscopy"
* ^status = #active
* ^date = "2025-07-30"
* . ^short = "内視鏡を使用したDICOM画像検査に関する情報"
* identifier MS
* identifier ^short = "DICOM画像検査全体を一意に識別するためのID【詳細参照】"
* identifier ^definition = "DICOM画像検査全体を一意に識別するためのID。"
* identifier ^comment = "Study Instance UIDの値を指定する。"
* status ^short = "DICOM画像検査のステータス"
* status ^definition = "DICOM画像検査のステータス。"
* modality from $JP_DICOMModality_VS (required)
* modality ^short = "DICOM画像検査で使用された撮影装置（モダリティ）【詳細参照】"
* modality ^definition = "DICOM画像検査で使用された撮影装置（モダリティ）。"
* modality ^comment = "内視鏡を表すモダリティコード”ES”を指定する。複数モダリティを使用した場合には、該当するモダリティコードを並記する。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^short = "DICOM画像検査の対象患者に関する情報【詳細参照】"
* subject ^definition = "DICOM画像検査の対象患者に関する情報。"
* subject ^comment = "JP Core Patientリソースを参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "このDICOM画像検査を実施するきっかけとなった情報【詳細参照】"
* encounter ^definition = "このDICOM画像検査を実施するきっかけとなった情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* started ^short = "検査開始日時、もしくは撮影装置に患者情報が届いた/入力された日時"
* started ^definition = "検査開始日時、もしくは撮影装置に患者情報が届いた/入力された日時。"
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
* interpreter ^comment = "通常、読影医。内視鏡では省略してよい。使用する場合には、JP Core Practitionerリソースを参照する。"
* endpoint ^short = "このDICOM画像検査リソースが存在する位置【詳細参照】"
* endpoint ^definition = "このDICOM画像検査リソースが存在する位置。"
* endpoint ^comment = "基本的には1つ指定する。"
* numberOfSeries ^short = "このDICOM画像検査に含まれるシリーズ数"
* numberOfSeries ^definition = "このDICOM画像検査に含まれるシリーズ数。"
* numberOfInstances ^short = "このDICOM画像検査に含まれるイメージ（インスタンス）の数"
* numberOfInstances ^definition = "このDICOM画像検査に含まれるイメージ（インスタンス）の数。"
* procedureReference only Reference(JP_Procedure)
* procedureReference ^short = "実施された処置に関する情報【詳細参照】"
* procedureReference ^definition = "実施された処置に関する情報。"
* procedureReference ^comment = "内視鏡では省略してよい。使用する場合には、JP Core Procedureを参照する。"
* procedureCode ^short = "実施された処置を表すコード【詳細参照】"
* procedureCode ^definition = "実施された処置を表すコード。"
* procedureCode ^comment = "内視鏡では省略してよい。"
//* procedureCode from http://playbook.radlex.org/playbook/SearchRadlexAction (extensible)
* procedureCode from $JP_DICONRadLexPlaybook_VS
* location only Reference(JP_Location)
* location ^short = "DICOM画像検査が実施された場所【詳細参照】"
* location ^definition = "DICOM画像検査が実施された場所。"
* location ^comment = "使用する場合には、JP Core Locationリソースを参照する。"
* reasonCode from $JP_ReasonCodesJed_VS (example)
* reasonCode ^short = "DICOM画像検査が依頼された理由を表す1つ以上のコード【詳細参照】"
* reasonCode ^definition = "DICOM画像検査が依頼された理由を表す1つ以上のコード。"
* reasonCode ^comment = "JED (Japan Endoscopy Database) Projectで定義されている検査種別については、JED基本情報用語の”検査目的”、”治療目的”のコードを使用することを強く推奨する。"
* reasonReference only Reference(JP_DiagnosticReport_Endoscopy)
* reasonReference ^short = "DICOM画像検査の実施理由に関する情報【詳細参照】"
* reasonReference ^definition = "DICOM画像検査の実施理由に関する情報。"
* reasonReference ^comment = "使用する場合には、JP Core DiagnosticReport Endoscopyリソースを参照する。"
* note ^short = "description要素に関するコメント"
* note ^definition = "description要素に関するコメント。"
* description ^short = "DICOM画像検査に関する記述【詳細参照】"
* description ^definition = "DICOM画像検査に関する記述。"
* description ^comment = "JAHIS 内視鏡DICOM画像データ規約の(0008,1030)の記載例に合わせ、検査種別を記載することを推奨する。"
* series ^short = "DICOM画像検査に含まれるシリーズ（大まかな画像のグループ）"
* series ^definition = "DICOM画像検査に含まれるシリーズ（大まかな画像のグループ）。"
* series.uid ^short = "シリーズを一意に識別するためのUID【詳細参照】"
* series.uid ^definition = "シリーズを一意に識別するためのUID。"
* series.uid ^comment = "Series Instance UID (0020,000E) の値を指定する。"
* series.number ^short = "Series Instance UIDとは別に、ユーザー（または装置）が自由に決められるシリーズ番号"
* series.number ^definition = "Series Instance UIDとは別に、ユーザー（または装置）が自由に決められるシリーズ番号。"
* series.modality MS
* series.modality from $JP_DICOMModality_VS (required)
* series.modality ^short = "このシリーズが取得された撮影装置（モダリティ）【詳細参照】"
* series.modality ^definition = "このシリーズが取得された撮影装置（モダリティ）。"
* series.modality ^comment = "内視鏡を表すモダリティコード”ES”を指定する。1シリーズ1モダリティで、1つのシリーズの中に複数のモダリティが混在することはない。"
* series.description ^short = "このシリーズに関する記述"
* series.description ^definition = "このシリーズに関する記述。"
* series.numberOfInstances ^short = "このシリーズに含まれる画像枚数"
* series.numberOfInstances ^definition = "このシリーズに含まれる画像枚数。"
* series.endpoint ^short = "このシリーズのリソースが存在する位置"
* series.endpoint ^definition = "このシリーズのリソースが存在する位置。"
* series.bodySite ^short = "このシリーズの対象となる解剖学的部位【詳細参照】"
* series.bodySite ^definition = "このシリーズの対象となる解剖学的部位。"
* series.bodySite ^comment = "内視鏡では省略してよい。"
//* series.bodySite from JP_ImagingStudy_Radiology_BodySite_VS (example)
* series.laterality ^short = "解剖学的部位の左右【詳細参照】"
* series.laterality ^definition = "解剖学的部位の左右。"
* series.laterality ^comment = "内視鏡では省略してよい。"
* series.specimen ^short = "このシリーズの検体に関する情報【詳細参照】"
* series.specimen ^definition = "このシリーズの検体に関する情報。"
* series.specimen ^comment = "内視鏡では省略してよい。"
* series.started ^short = "このシリーズの開始日時【詳細参照】"
* series.started ^definition = "このシリーズの開始日時。"
* series.started ^comment = "Series Date (0008,0021)、およびSeries Time (0008,0031)（いずれもType3）に値が入っていれば、その値を指定する。"
* series.performer ^short = "このシリーズの実施医【詳細参照】"
* series.performer ^definition = "このシリーズの実施医。"
* series.performer ^comment = "内視鏡では省略してよい。"
* series.performer.function ^short = "このシリーズの実施医の役割【詳細参照】"
* series.performer.function ^definition = "このシリーズの実施医の役割。"
* series.performer.function ^comment = "内視鏡では省略してよい。"
* series.performer.actor ^short = "このシリーズの撮影者、もしくは組織【詳細参照】"
* series.performer.actor ^definition = "このシリーズの撮影者、もしくは組織。"
* series.performer.actor ^comment = "内視鏡では省略してよい。"
* series.instance ^short = "シリーズに含まれるインスタンス（画像）単位の情報"
* series.instance ^definition = "シリーズに含まれるインスタンス（画像）単位の情報。"
* series.instance.uid MS
* series.instance.uid ^short = "インスタンス（画像）のユニークID【詳細参照】"
* series.instance.uid ^definition = "インスタンス（画像）のユニークID。"
* series.instance.uid ^comment = "SOP Instance UID (0008,0018) に入力されている値を指定する。"
* series.instance.sopClass MS
* series.instance.sopClass ^short = "SOPクラスUID【詳細参照】"
* series.instance.sopClass ^definition = "SOPクラスUID。"
* series.instance.sopClass ^comment = "内視鏡では、主に以下の値が指定される。  
　VL Endoscopic Image Storage:1.2.840.10008.5.1.4.1.1.77.1.1  
　Secondary Capture Image Storage:1.2.840.10008.5.1.4.1.1.7"
* series.instance.sopClass from $JP_DICOMSopClass_VS (extensible)
* series.instance.number ^short = "SOP Instance UIDとは別に、ユーザー（または装置）が自由に決められるインスタンス（画像）ごとの番号【詳細参照】"
* series.instance.number ^definition = "SOP Instance UIDとは別に、ユーザー（または装置）が自由に決められるインスタンス（画像）ごとの番号。"
* series.instance.number ^comment = "Instance Number (0020,0013) に値が入っていた場合は、その値を指定する。"
* series.instance.title ^short = "画像に関する説明【詳細参照】"
* series.instance.title ^definition = "画像に関する説明。"
* series.instance.title ^comment = "部門システム側で説明を付ける場合は、その説明を指定してもよい。"
