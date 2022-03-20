
### 必須要素 

次のデータ項目はデータが存在しなければならない（必須）であるか、あるいは、データが送信システムに存在する場合はサポートされなければならない（Must Support）要素である。

#### 必須
本プロファイルでは、次の要素を持たなければならない。

 - `status`︓検体検査情報項目の状態は必須である。
 - `category`︓このリソースが示す検体検査情報項目を分類するための区分であり、このプロファイルでは必須とする。
 - `code`︓このリソースは何の検体検査情報項目であるかを示すため必須である。
 - `subject`︓このリソースが示す検体検査情報項目が、どの患者のものかを示すため、このプロファイルでは参照する`patient`リソースの定義を必須とする。
 - `effective[x]`：このリソースが示す検体検査情報項目が、いつ発生したかを示すためこのプロファイルでは必須とする。検体採取日時。
 - `specimen`：このリソースが示す検体検査情報項目が、どの検体で検査されるのかを示すため、このプロファイルでは参照する`specimen`リソースの定義を必須とする。

#### MustSupport
本プロファイルでは、次の要素はMustSupportである。

 - `value[x]`：このリソースが示す検体検査情報項目の結果である。

### Extensions定義

このプロファイルでは拡張定義は行っていない。

### 用語定義
| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `Observation.category` | 「laboratoy」固定 | Preferred | [`ObservationCategoryCodes`](https://hl7.org/fhir/valueset-observation-category.html) |
| `Observation.code` | JLAC10 | Preferred | `LabResultCode` |

### 制約一覧

<!-- <span style="color:red;">レベルの指定が必要。</span>> 
-->

| id |レベル| 位置 | 説明 |式|
|  ---  |  ---  |  ---  |  ---  |  ---  |
| jp-core-1 | Warning | `Observation.effective[x]` | 一日を含む細かな検体採取日時を必要がある。（年月のみでは不足） | `Observation.effectiveDateTime.exists() implies Observation.effectiveDateTime.toString().length() >= 8` |
| jp-core-2 | Warning | `Observation` | `component` または、`hasMember` が存在しない場合、`value`が存在する必要がある。 | `component.empty() and hasMember.empty()) implies  value.exists()` |
| obs-3 | Guideline | `Observation.referenceRange` | 可能な限り`low`、`high`に構造化すべき。構造化できない場合、あるいは`low`、`high`に該当しない場合は`text`を使用 | `low.exists() or high.exists() or text.exists()` |


## 利用方法

### インタラクション一覧

`Observation`リソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧](Observation#ObsInteraction)

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

検体検査結果ユースケースのSearch Parameter一覧は共通情報プロファイルとは異なり以下の通りである。

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | `subject`,`code`,`date`,`based-on` | `reference`,`token`,`date`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`code`,`date`,`value-quantity`,`based-on` | `reference`,`token`,`date`,`quantity`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-quantity=gt40&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`code`,`date`,`value-concept`,`based-on` | `reference`,`token`,`date`,`code`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-concept=http://snomed.info/sct|1082004&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`code`,`date`,`value-string`,`based-on` | `reference`,`token`,`date`,`string`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-string=positive&based-on=ServiceRequest/456` |
| SHOULD | `code`,`value-quantity`,`subject` | `token`,`quantity`,`reference`  | `GET [base]/Observation?code=http://loinc.org|8867-4&value-quantity=gt40&subject=Patient/123` |
| SHOULD | `code`,`value-concept`,`subject` | `token`,`code`,`reference` | `GET [base]/Observation?code=http://loinc.org|8867-4&value-concept=http://snomed.info/sct|1082004&subject=Patient/123` |
| SHOULD | `code`,`value-string`,`subject` | `token`,`string`,`reference`  | `GET [base]/Observation?code=http://loinc.org|8867-4&value-string=positive&subject=Patient/123` |


#### 操作詳細

##### 必須検索パラメータ

このプロファイルでは必須（SHALL）としての検索項目は定義していない。

##### 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（SHOULD）

1. 臨床での検索：subject = Patient（対象患者）、検体採取日、検査項目、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`,`code`,`date`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&based-on=ServiceRequest/456
   ```

2. 臨床（NST）での検索：`subject = Patient`（対象患者）、検査項目、検査値（数値、条件：基準値から外れている、等）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(SHOULD)

`subject`,`code`,`date`,`value-quantity`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&value-quantity={quantity}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org\|8867-4&date=le2020-12-31&value-quantity=gt40&based-on=ServiceRequest/456
   ```

3. 臨床（NST）での検索：`subject = Patient`（対象患者）、検査項目、検査値（コード）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(SHOULD)

`subject`,`code`,`date`,`value-concept`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&value-concept={code}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-concept=http://snomed.info/sct|1082004&based-on=ServiceRequest/456
   ```


4. 臨床（NST）での検索：subject = Patient（対象患者）、検査項目、検査値（文字列）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(SHOULD)

`subject`,`code`,`date`,`value-string`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&value-string={string}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-string=positive&based-on=ServiceRequest/456
   ```

5. 研究での検索：検査項目、検査値（数値、条件：ある値以上／以下、等）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(SHOULD)

`code`,`value-quantity`,`subject` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-quantity={quantity}&subject={reference}&
   ```

   例：

   ```
   GET [base]/Observation?code=http://loinc.org|8867-4&value-quantity=gt40&subject=Patient/123
   ```

6. 研究での検索：検査項目、検査値（コード）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(SHOULD)

`code`,`value-concept`,`subject` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-concept={code}&subject={reference}
   ```

   例：

   ```
   GET [base]/Observation?code=http://loinc.org|8867-4&value-concept=http://snomed.info/sct|1082004&subject=Patient/123
   ```

5. 研究での検索：検査項目、検査値（文字列）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(SHOULD)

`code`,`value-string`,`subject` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-string={string}&subject={reference}
   ```

   例：

   ```
   GET [base]/Observation?code=http://loinc.org|8867-4&value-string=positive&subject=Patient/123
   ```



##### オプション検索パラメータ

<!--
オプションとして次の検索パラメータをサポートすることができる。(MAY)
-->
このプロファイルでは、オプション検索パラメータ(MAY)は定義していない。


#### Operation一覧

`Observation`リソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧](Observation#ObsOperation)

### サンプル
```json
{
  "resourceType": "Observation",
  "id": "lab-12345",
  "category": [
    {
      "coding": [
        {
          "code": "laboratory",
          "system": "http://terminology.hl7.org/CodeSystem/observation-category",
          "display": "Laboratory"
        }
      ]
    }
  ],
  "basedOn": [
    {
      "reference": "ServiceRequest/ServiceRequest-12345"
    }
  ],
  "code": {
    "coding": [
      {
        "code": "05104",
        "system": "http://abc-hospital.local/fhir/Observation/localcode",
        "display": "尿酸"
      },
      {
        "code": "3C020000002327101",
        "system": "http://jpfhir.jp/Common/ValueSet/labResult-code",
        "display": "尿酸(UA)"
      }
    ],
    "text": "検査項目コード"
  },
  "interpretation": [
    {
      "coding": [
        {
          "code": "L",
          "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "display": "正常値下限越え"
        }
      ],
      "text": "HLマーク"
    }
  ],
  "effectiveDateTime": "2021-10-19T17:39:00+09:00",
  "status": "final",
  "referenceRange": [
    {
      "low": {
        "value": 3.7
      },
      "high": {
        "value": 7.8
      },
      "type": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/referencerange-meaning",
            "code": "normal",
            "display": "Normal Range"
          }
        ]
      }
    }
  ],
  "valueQuantity": {
    "unit": "mg/dL",
    "value": 3.5
  },
  "subject": {
    "reference": "Patient/Patient-67890"
  },
  "performer": [
    {
      "reference": "Practitioner/Practitioner-abcde"
    }
  ],
  "specimen": {
    "reference": "Specimen/Specimen-fgh"
  },
  "meta": {
    "lastUpdated": "2021-10-19T08:59:58Z",
    "versionId": "1"
  }
}
```
