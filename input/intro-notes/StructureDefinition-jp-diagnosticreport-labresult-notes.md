
### 必須要素 

次のデータ項目はデータが存在しなければならない（必須）であるか、あるいは、データが送信システムに存在する場合はサポートされなければならない（Must Support）要素である。

#### 必須
`DiagnosticReport`リソースは、次の要素を持たなければならない。

 - `status`︓検体検査情報項目の状態は必須である。
 - `code`︓このリソースは何の検体検査情報項目であるかを示すため必須である。


#### MustSupport
このプロファイルではMustSupportMustSupportを定めていない。


### Extensions定義

このプロファイルでは拡張定義は行っていない。




<!--
## 注意事項
(全体に対する注意事項等、その他の部分について記載します。）## 
-->


### 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `DiagnosticReport.status` | レポートのステータス | Required | [`DiagnosticReportStatus`](http://hl7.org/fhir/valueset-diagnostic-report-status.html) |
| `DiagnosticReport.category` | レポート（所見）を作成した部門 | Preferred | [`DiagnosticServiceSectionCodes`](http://hl7.org/fhir/ValueSet/diagnostic-service-sections)<br>"RAD", "RX", "CT", "NMR", "NMS", "RUS", "VUS", "OUS", "CUS"などを指定。デフォルトは"LAB"。 |


## 利用方法

### Interaction一覧 
`DiagnosticReport` リソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。


[DiagnosticReport共通情報プロファイル#インタラクション一覧](DiagnosticReport#DxReportInteraction)



### OperationおよびSearch Parameter 一覧
#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | `subject`,`category` | `reference`  | `GET [base]/DiagnosticReport?subject=Patient/123&category=LAB` |
| SHOULD | `subject`,`category`,`based-on` | `reference`,`reference`  | `GET [base]/DiagnosticReport?subject=Patient/123&category=LAB&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`category`,`date` | `reference`,`date`  | `GET [base]/Observation?subject=Patient/123&category=LAB&date=le2020-12-31` |

##### 必須検索パラメータ

このプロファイルでは必須（SHALL）としての検索項目は定義していない。

##### 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（SHOULD）

1. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?subject={reference}&category={token}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?subject=Patient/123&category=LAB
   ```

2. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)、based-on (検査オーダの依頼科)を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`,`based-on`の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?subject={reference}&category={token}&based-on={reference}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?subject=Patient/123&category=LAB&based-on=ServiceRequest/456
   ```

3. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)、date(レポート作成日)を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`,`date`の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?subject={reference}&category={token}&date={date}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?subject=Patient/123&category=LAB&date=2021-11-08
   ```

##### オプション検索パラメータ
このプロファイルでは、オプション検索パラメータ(MAY)は定義していない。

#### Operation一覧
このプロファイルではOperationは定義していない。

### サンプル
```json
{
  "resourceType": "Bundle",
  "id": "101",
  "type": "collection",
  "entry": [
    {
      "fullUrl": "http://abc-hospital.local/fhir/DiagnosticReport/101",
      "resource": {
        "resourceType": "DiagnosticReport",
        "id": "101",
        "identifier": [
          {
            "system": "http://abc-hospital.local/fhir/lab/reportid",
            "value": "5234342"
          }
        ],
        "status": "final",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/v2-0074",
                "code": "HM"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "system": "http://abc-hospital.local/fhir/lab/report-type",
              "code": "58410-2",
              "display": "血球算定検査レポート"
            }
          ],
          "text": "血球算定検査レポート"
        },
        "subject": {
          "reference": "Patient/pat2"
        },
        "encounter": {
          "reference": "Encounter/example"
        },
        "effectiveDateTime": "2011-03-04T08:30:00+11:00",
        "issued": "2011-03-04T11:45:33+11:00",
        "performer": [
          {
            "reference": "Organization/org1",
            "display": "abc-hospital"
          }
        ],
        "result": [
          {
            "reference": "Observation/r1"
          },
          {
            "reference": "Observation/r2"
          },
          {
            "reference": "Observation/r3"
          },
          {
            "reference": "以降省略"
          }
        ],
        "presentedForm": [
          {
            "contentType": "application/pdf",
            "language": "ja-JP",
            "data": "JVBERi0xLjQKJcfsj6IKNSAwIG9iago8PC9MZW5ndGggNiAwIFIvRmlsdGVyIC9GbGF0ZURlY29kZT4(省略)",
            "title": "検査結果PDFレポート"
          }
        ]
      }
    },
    {
      "fullUrl": "http://abc-hospital.local/fhir/Observation/r1",
      "resource": {
        "resourceType": "Observation",
        "id": "r1",
        "status": "final",
        "code": {
          "coding": [
            {
              "code": "123",
              "system": "http://abc-hospital.local/fhir/Observation/localcode",
              "display": "ヘモグロビン"
            },
            {
              "code": "2A990000001930953",
              "system": "http://jpfhir.jp/Common/ValueSet/labResult-code",
              "display": "ヘモグロビン"
            }
          ],
          "text": "ヘモグロビン"
        },
        "subject": {
          "reference": "Patient/pat2"
        },
        "performer": [
          {
            "reference": "Organization/org1",
            "display": "abc-hospital"
          }
        ],
        "valueQuantity": {
          "value": 176,
          "unit": "g/L",
          "system": "http://unitsofmeasure.org",
          "code": "g/L"
        },
        "referenceRange": [
          {
            "low": {
              "value": 135,
              "unit": "g/L",
              "system": "http://unitsofmeasure.org",
              "code": "g/L"
            },
            "high": {
              "value": 180,
              "unit": "g/L",
              "system": "http://unitsofmeasure.org",
              "code": "g/L"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "http://abc-hospital.local/fhir/Observation/r2",
      "resource": {
        "resourceType": "Observation",
        "id": "r2",
        "status": "final",
        "code": {
          "coding": [
            {
              "code": "456",
              "system": "http://abc-hospital.local/fhir/Observation/localcode",
              "display": "赤血球数"
            },
            {
              "code": "2A990000001992051",
              "system": "http://jpfhir.jp/Common/ValueSet/labResult-code",
              "display": "赤血球数"
            }
          ],
          "text": "赤血球数"
        },
        "subject": {
          "reference": "Patient/pat2"
        },
        "performer": [
          {
            "reference": "Organization/org1",
            "display": "abc-hospital"
          }
        ],
        "valueQuantity": {
          "value": 5.9,
          "unit": "10*6/uL",
          "system": "http://unitsofmeasure.org",
          "code": "10*6/uL"
        },
        "referenceRange": [
          {
            "low": {
              "value": 4.2,
              "unit": "10*6./L",
              "system": "http://unitsofmeasure.org",
              "code": "10*6/uL"
            },
            "high": {
              "value": 6,
              "unit": "10*6./L",
              "system": "http://unitsofmeasure.org",
              "code": "10*6/uL"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "http://abc-hospital.local/fhir/Observation/r3",
      "resource": {
        "resourceType": "Observation",
        "id": "r3",
        "status": "final",
        "code": {
          "coding": [
            {
              "code": "789",
              "system": "http://abc-hospital.local/fhir/Observation/localcode",
              "display": "ヘマトクリット"
            },
            {
              "code": "2A990000001930954",
              "system": "http://jpfhir.jp/Common/ValueSet/labResult-code",
              "display": "ヘマトクリット"
            }
          ],
          "text": "ヘマトクリット"
        },
        "subject": {
          "reference": "Patient/pat2"
        },
        "performer": [
          {
            "reference": "Organization/org1",
            "display": "abc-hospital"
          }
        ],
        "valueQuantity": {
          "value": 55,
          "unit": "%"
        },
        "interpretation": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
                "code": "H"
              }
            ]
          }
        ],
        "referenceRange": [
          {
            "low": {
              "value": 38,
              "unit": "%"
            },
            "high": {
              "value": 52,
              "unit": "%"
            }
          }
        ]
      }
    }
  ]
}
```

## その他、参考文献、リンク等
