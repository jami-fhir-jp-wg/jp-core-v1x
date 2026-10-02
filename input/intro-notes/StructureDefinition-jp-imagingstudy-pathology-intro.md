本プロファイルは、ImagingStudyリソースを使用して、病理WSIのDICOM画像に関するデータを送受信するために、最低限遵守すべき制約と拡張を取り纏めたものである。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。
- 病理WSIのDICOM画像に関する画像検査情報の送受信
- DICOM画像全体を一意に識別するStudy Instance UIDの記録
- 病理WSIを表すモダリティコードに基づく画像情報の記録
- JP Core Patientリソースからの対象患者情報の参照
- JP Core DiagnosticReport Pathologyリソースからの実施理由の参照
- JP Core Specimen Pathologyリソースからの検体情報の参照
- DICOM WADO-RS、DICOM WADO-URI、DICOM QIDO-RSなどによる画像リソース位置の記録

## スコープ

ImagingStudyリソースは、DICOM画像検査に含まれるstudy、series、および画像インスタンスに関する情報を表現する。  
本プロファイルでは、病理WSIのDICOM画像を対象とし、DICOM画像全体、シリーズ、およびインスタンス単位の情報を扱う。

DICOM画像全体の識別子には、Study Instance UIDの値を指定する。  
画像のステータスには、ImagingStudy.statusで定義される登録済み、利用可能、取消済み、エラーで入力、不明のいずれかを指定する。  
モダリティには、病理WSIを表すDICOMモダリティコードであるSMを指定する。

対象患者は、ImagingStudy.subjectでJP Core Patientリソースを参照する。  
DICOM画像を取得するきっかけとなった情報は、ImagingStudy.encounterでJP Core Encounterリソースを参照する。  
他のシステムから依頼されたオーダ情報は、通常、ImagingStudy.basedOnでServiceRequestリソースを参照する。  
他のシステムと連携していない場合、basedOnの参照は不要である。

DICOM画像のリソースが存在する位置は、ImagingStudy.endpointに記録する。  
endpointには、DICOM WADO-RS、DICOM WADO-URI、DICOM QIDO-RSなどを指定する。  
DICOM画像の実施理由に関する情報は、ImagingStudy.reasonReferenceでJP Core DiagnosticReport Pathologyリソースを参照する。

病理では、ImagingStudy.startedに検体採取日時を指定する。  
referrer、interpreter、procedureCode、reasonCode、noteなどは、病理では原則使用しない。  
procedureReferenceを使用する場合は、JP Core Procedureリソースを参照する。  
locationを使用する場合は、ImagingStudyが実行された場所を表すJP Core Locationリソースを参照する。

series要素は、DICOM画像に含まれるシリーズ単位の情報を表す。  
series.uidにはSeries Instance UIDの値を指定する。  
series.modalityには、病理WSIを表すDICOMモダリティコードであるSMを指定する。  
1シリーズは1つのモダリティで構成され、複数のモダリティは混在しない。

series.specimenでは、このシリーズの検体に関する情報としてJP Core Specimen Pathologyリソースを参照する。  
series.startedには、Series DateおよびSeries Timeに値が存在する場合、その値を指定する。  
series.performerおよびその下位要素は、病理では原則使用しない。

series.instanceは、シリーズに含まれる画像インスタンス単位の情報を表す。  
series.instance.uidには、SOP Instance UIDに値が存在する場合、その値を指定する。  
series.instance.sopClassには、病理で主に使用されるSOPクラスUIDを指定する。  
病理では、VL Whole Slide Microscopy Image Storageの値として1.2.840.10008.5.1.4.1.1.77.1.6が指定される。  
series.instance.numberには、Instance Numberに値が存在する場合、その値を指定する。  
series.instance.titleには、部門システム側で説明を付ける場合、その説明を指定してよい。

## プロファイル定義

{% include markdown-link-references.md %}
