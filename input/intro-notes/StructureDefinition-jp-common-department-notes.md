
### 値の選択

本拡張では、以下の2つの値型から選択して使用する。

| 値型 | 説明 | 使用場面 |
|:----|:----|:----|
| valueCodeableConcept | 診療科コード（SS-MIX2等） | 診療科コードのみで十分な場合 |
| valueReference | JP_Organization_Departmentへの参照 | 診療科の詳細情報（所属医療機関、連絡先等）が必要な場合 |

### 用語定義

診療科コードとしてSS-MIX2診療科コードの使用を推奨する。

| 分類 | 用語集 | URI |
|-----|----|----|
| 診療科 | SS-MIX2診療科コード | http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment |

SS-MIX2診療科コードは2桁または3桁のコードを使用する。

- 2桁コード例：01（内科）、16（整形外科）
- 3桁コード例：011（消化器内科）、012（循環器内科）

診療科名称は医療機関ごとに異なることが多いため、コードが利用できない場合はCodeableConcept.text要素にテキストで診療科名を設定することも可能である。

### 使用例

#### 1. SS-MIX2診療科コードを使用する場合

```json
{
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment",
            "code": "01",
            "display": "内科"
          }
        ]
      }
    }
  ]
}
```

#### 2. JP_Organization_Departmentへの参照を使用する場合

```json
{
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department",
      "valueReference": {
        "reference": "Organization/dept-001",
        "display": "第一内科"
      }
    }
  ]
}
```

#### 3. テキストのみで診療科名を指定する場合

```json
{
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department",
      "valueCodeableConcept": {
        "text": "消化器腫瘍外科"
      }
    }
  ]
}
```

### サンプル

* [**MedicationRequestでの使用例（CodeableConcept）**][jp-medicationrequest-department-example-01]
* [**MedicationRequestでの使用例（Reference）**][jp-medicationrequest-department-example-02]
* [**ServiceRequestでの使用例（テキストのみ）**][jp-servicerequest-department-example-03]

## その他、参考文献、リンク等

1. SS-MIX2 標準化ストレージ 仕様書 Ver.1.2h [https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf](https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf)

{% include markdown-link-references.md %}

