### 必須要素

次のデータ項目は必須（データが存在しなければならない）である。

- status : DICOM画像のステータス。登録済み、利用可能、取消済み、エラーで入力、不明のいずれかを指定する。
- subject : DICOM画像の対象患者に関する情報。JP Core Patientリソースを参照する。

### Extensions定義

本プロファイルで追加定義された拡張はない。

## 利用方法

##### 必須検索パラメータ

本プロファイルで必須（**SHALL**）として定義された検索パラメータはない。

##### 推奨検索パラメータ

本プロファイルで推奨（**SHOULD**）として定義された検索パラメータはない。

##### 追加検索パラメータ

本プロファイルで追加定義された検索パラメータはない。

#### Operation一覧

本プロファイルで追加定義されたOperationはない。

## 注意事項

#### identifier

DICOM画像全体を一意に識別するためのIDである。
Study Instance UIDの値を指定する。

#### modality

DICOM画像で使用された撮影装置を表す。
病理WSIを表すモダリティコードである`SM`を指定する。
`SM`はSlide Microscopyを表す。
ValueSetはJP Core DICOM Modality ValueSetを必須Bindingとして参照する。

#### started

検査開始日時、または撮影装置に患者情報が届いた日時を表す。
病理では、検体採取日時を指定する。

#### basedOn

他のシステムから依頼されたオーダ情報を表す。
通常、依頼元となるServiceRequestリソースを参照する。
他のシステムと連携していない場合は参照不要である。

#### encounter

このDICOM画像を取得するきっかけとなった情報を表す。
JP Core Encounterリソースを参照する。

#### referrer

依頼医師を表す。
JP Core PractitionerまたはJP Core PractitionerRoleを参照する。
病理では原則使用しない。

#### interpreter

画像を診断した医師を表す。
通常は病理医を表す。
JP Core PractitionerまたはJP Core PractitionerRoleを参照する。
病理では原則使用しない。

#### endpoint

DICOMのリソースが存在する位置を表す。
DICOM WADO-RS、DICOM WADO-URI、DICOM QIDO-RSなどを指定する。

#### procedureReference

実施された処置に関する情報を表す。
病理では省略してよい。
使用する場合はJP Core Procedureを参照する。

#### procedureCode

実施された処置を表すコードである。
病理では原則使用しない。
ValueSetはJP Core DICOM RadLex Playbook ValueSetを参照する。

#### location

ImagingStudyが実行された場所を表す。
画像がスキャンされた場所を示すJP Core Locationリソースがある場合に参照する。

#### reasonCode

DICOM画像が依頼された理由を表すコードである。
病理では原則使用しない。

#### reasonReference

DICOM画像の実施理由に関する情報を表す。
JP Core DiagnosticReport Pathologyリソースを参照する。

#### note

病理では原則使用しない。

#### series

DICOM画像に含まれるシリーズ単位の情報を表す。
シリーズのUIDにはSeries Instance UIDの値を指定する。
シリーズのモダリティには病理WSIを表す`SM`を指定する。
1シリーズは1つのモダリティで構成される。
1つのシリーズの中に複数のモダリティは混在しない。

#### series.specimen

シリーズの検体に関する情報を表す。
JP Core Specimen Pathologyリソースを参照する。

#### series.started

シリーズの開始日時を表す。
Series DateおよびSeries Timeに値が入っていれば、その値を指定する。

#### series.performer

シリーズの実施医を表す。
病理では原則使用しない。

#### series.instance

シリーズに含まれるインスタンス単位の情報を表す。
インスタンスのUIDにはSOP Instance UIDの値を指定する。
SOPクラスUIDには、病理では主にVL Whole Slide Microscopy Image Storageを指定する。
このコード値は`1.2.840.10008.5.1.4.1.1.77.1.6`である。
SOPクラスUIDのValueSetはJP Core DICOM Sop Class ValueSetを拡張可能Bindingとして参照する。
インスタンス番号に値が入っている場合は、Instance Numberの値を指定する。
部門システム側で画像に関する説明を付ける場合は、titleに指定してよい。

## その他、参考文献・リンク等

{% include markdown-link-references.md %}
{% include external-link-reference.md %}
