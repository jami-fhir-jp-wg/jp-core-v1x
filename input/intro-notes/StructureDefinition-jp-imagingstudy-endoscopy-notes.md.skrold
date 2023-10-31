
### 必須要素

次の要素は必須（**SHALL**）である。
- status : リソースの状態（基底のValueSetから選択：registered/available/cancelled/entered-in-error/unknown）
- subject : JP Core Patientを参照する

#### 必須項目
ImagingStudyリソースは、次の要素を持たなければならない。(**SHALL**)
- status : 検査項目情報の状態は必須である
- subject : このリソースが示す検査項目がどの患者のものかを示すため、参照するpatientリソース定義を必須とした

#### Must Support

次の要素に関する情報が送信システムに存在する場合、その要素がサポートされなければならないことを意味する（**Must Support**）
- identifier : DICOMフォーマットのデータが存在する場合、DICOMタグのStudy Instance UID（0020,000D）が保持される必要がある
- series.modality : DICOMフォーマットのデータが存在する場合、シリーズが取得されたモダリティを示す。DICOMでは必須情報となっており、DICOMタグ（0008,0060）の情報が格納される。内視鏡検査の場合は"ES"が指定される
- series.instance.uid : DICOMフォーマットのデータ（インスタンス）のユニークIDを示す。DICOMタグ（0008,0018）の情報を格納する
- series.instance.sopClass : SOPクラスUID。DICOMタグ（0008,0016）の情報を格納する。内視鏡の場合、通常以下のいずれかが指定される


  |動画・静止画|SOP Class| UID |
  |---------|---------|-----|
  |静止画|VL Endoscopic Image Storage |1.2.840.10008.5.1.4.1.1.77.1.1 |
  |静止画|Secondary Capture Image Storage | 1.2.840.10008.5.1.4.1.1.7 |
  |動画|Video Endoscopic Image Storage | 1.2.840.10008.5.1.4.1.1.77.1.1.1 |

### Extension定義

このプロファイルでは拡張定義は行っていない。

## 注意事項

### マッピング

ImagingStudyはDICOM tagとの対応が重要である。各エレメントとDICOM tagのマッピングについては[Resource ImagingStudy - Mappings - DICOM Tag Mapping](https://hl7.org/fhir/R4/imagingstudy-mappings.html#dicom)を参照すること。

### reasonCode
消化器内視鏡検査のDICOMフォーマットのデータを扱う際、ImagingStudy.reasonCodeには[JP Core ReasonCode JED ValueSet][JP_ReasonCodesJed_VS]をbindした。これは [日本消化器内視鏡学会](https://www.jges.net/)が推進する[JED (Japan Endoscopy Database) Project](https://jedproject.jges.net/)で定義されている[JED用語集](https://jedproject.jges.net/about/terms-about/)のコード集であり、このうち、基本用語集の"検査目的"、"治療目的"のコード値を設定することを強く推奨する。


## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例          |
| -------------| ----- | ------ | ----- |
| SHOULD | patient | reference | `GET [base]/ImagingStudy?patient=123` |
| SHOULD | patient, modality | reference, token | `GET [base]/ImagingStudy?patient=123&modality=ES` |
| SHOULD | patient,started | reference, date | `GET [base]/ImagingStudy?patient=123&started=eq2021-06-25` |
| SHOULD | patient, started, modality | reference, date, token | `GET [base]/ImagingStudy?patient=123&started=eq2021-06-18&modality=ES` |

なお検索パラメターmodalityは[定義済み検索パラメーター](https://www.hl7.org/fhir/R4/searchparameter-registry.html)にseries.modalityを対象として定義されているため、ImagingStudy.modalityを対象としていないことに注意すること。
またImagingStudy.modalityには値が入っていない可能性がある点にも留意すること。

#### 操作詳細

##### 必須検索パラメータ

本プロファイルで必須(**SHALL**)として定義された検索項目はない。

##### オプション検索パラメータ

本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**上部消化管内視鏡検査画像**][jp-imagingstudy-endoscopy-example-1]

## その他、参考文献・リンク等

消化器内視鏡検査レポートについては、[日本消化器内視鏡学会](https://www.jges.net/)が推進する[JED (Japan Endoscopy Database) Project](https://jedproject.jges.net/)に準拠していることが強く推奨される。
また、消化器内視鏡検査のDICOMフォーマットのデータを扱う際、ImagingStudy.reasonCodeにはJED Projectで定義されている[JED基本情報用語](https://jedproject.jges.net/about/terms-about/)の"検査目的"、"治療目的"のコード値を設定することを強く推奨する。

{% include markdown-link-references.md %}
{% include external-link-reference.md %}
