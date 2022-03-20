
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

#### 必須
`ImagingStudy`リソースは、次の要素を持たなければならない。

- `status`︓検査項目情報の状態は必須である。
- `subject`︓このリソースが示す検査項目が、どの患者のものかを示すため、このプロファイルでは参照する`patient`リソースの定義を必須である。

#### MustSupport
`ImagingStudy`リソースは、以下をサポートしなければならない。

- 画像データが送信システムに存在する場合には`identifier`, `modality`はサポートされなければならない。
- 画像データが送信システムにSeriesが存在する場合には, `series.uid`, `series.modality`, `series.instance.uid`, `series.instance.sopClass`はサポートされなければならない。
- 画像検査を行うためのオーダ情報が送信システムに存在する場合には, `encouter`と`basedOn`はサポートされなければならない。

<br>

### Extension定義

このプロファイルでは拡張定義は行っていない。

<br>

### 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `ImagingStudy.modality` | 全シリーズで用いられているモダリティのリスト。(0008,0060), (0008, 0061)をOR条件で記述し、重複する値は１つにまとめて表現する。 | Extensible | [DICOM Part16 CID29 Acquisition Modality](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html) |
| `ImagingStudy.series.modality` | このシリーズのモダリティ |  Extensible | [DICOM Part16 CID29 Acquisition Modality](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html) |
| `ImagingStudy.series.bodySite` | このシリーズの撮像対象となった解剖学的部位 | Example | [DICOM Part16 Annex L](http://dicom.nema.org/medical/dicom/current/output/chtml/part16/chapter_L.html) |


<br>

### 制約一覧

このプロファイルでは制約定義は行っていない。

## 利用方法

### インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

<br>

### OperationおよびSearch Parameter 一覧

<br>

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
 | SHOULD | `subject(Patient)` | `reference` | `GET [base]/ImagingStudy?subject=Patient/123` |
 | SHOULD | `subject,modality` | `reference`,`token` | `GET [base]/ImagingStudy?subject=Patient/123&modality=CT` |
 | SHOULD | `subject`,`bodysite` | `reference`,`token` | `GET [base]/ImagingStudy?subject=Patient/123&bodysite=T-15460` |
 | SHOULD | `subject`,`started` | `reference`,`date` | `GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-25` |
 | SHOULD | `subject`,`started`,`modality`,`bodysite` | `reference`,`date`,`token`,`token`  | `GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-18&modality=CT&bodysite=T-15460` |
 | SHOULD | `encounter` | `reference`  | `GET [base]/ImagingStudy?encounter=Encounter/456` |


<br>

#### 操作詳細

<br>

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。（SHALL）
`ImagingStudy`リソースでは検索の多様性が求められるため、必須としての検索項目は定義していない。

<br>

##### 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（SHOULD）

1.患者中心での検索：対象患者（= `Patient`リソース）を条件とした検索をサポートすることが望ましい。

   ```
   GET [base]/ImagingStudy?subject={reference}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123
   ```

<br>

2.モダリティ中心の検索：対象患者（= `Patient`リソース）と撮影に使用されたモダリティを条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&modality={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123&modality=CT
   ```
<br>

3.部位中心の検索：対象患者（= `Patient`リソース）と撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&bodysite={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123&bodysite=T-15460
   ```
<br>

4.日付中心の検索：対象患者（= `Patient`リソース）と撮影の日時を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&started={date}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=subject=Patient/123&data=eq2021-06-25
   ```

<br>

5.日付中心の検索：対象患者（= `Patient`リソース）と撮影の日時を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&started={date}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=subject=Patient/123&data=eq2021-06-25
   ```

<br>
   
6.複数の条件を組み合わせた検索：対象患者（= `Patient`リソース）、撮影の日時、撮影に使用されたモダリティ、撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&data={date}&modality={token}&bodysite={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-18&modality=CT&bodysite=T-15460
   ```

<br>
   
7.来院情報中心の検索：来院情報（= `Encounter`リソース）を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?encounter={reference}
   ```

   例：

   ```
   GET [base]/ImagingStudy?encounter=Encounter/456
   ```



<br>

##### オプション検索パラメータ

このプロファイルではオプション検索パラメータ定義は行っていない。

<br>

#### Operation一覧

このプロファイルではオペレーション定義は行っていない。

#### サンプル
```json
{
  "resourceType": "ImagingStudy",
  "id": "imagingstudy-example-12345",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">胸部CT  患者番号: 09236 アクセッション番号: W12342398 2011-01-01実施 3シリーズ, 12画像撮影。</div>"
  },
  "identifier": [
    {
      "system": "urn:dicom:uid",
      "value": "urn:oid:2.16.124.113543.6003.1154777499.30246.19789.3503430045"
    }
  ],
  "status": "available",
  "subject": {
    "reference": "Patient/Patient-67890"
  },
  "started": "2011-01-01T11:01:20+09:00",
  "numberOfSeries": 1,
  "numberOfInstances": 1,
  "series": [
    {
      "uid": "2.16.124.113543.6003.2588828330.45298.17418.2723805630",
      "number": 3,
      "modality": {
        "system": "http://dicom.nema.org/resources/ontology/DCM",
        "code": "CT"
      },
      "description": "CT胸部スクリーニング",
      "numberOfInstances": 1,
      "bodySite": {
        "system": "http://jpfhir.jp/Common/ValueSet/imagingStudy-bodySite",
        "code": "43799004",
        "display": "Chest"
      },
      "instance": [
        {
          "uid": "2.16.124.113543.6003.189642796.63084.16748.2599092903",
          "sopClass": {
            "system": "urn:ietf:rfc:3986",
            "code": "urn:oid:1.2.840.10008.5.1.4.1.1.2"
          },
          "number": 1
        }
      ]
    }
  ]
}
```
