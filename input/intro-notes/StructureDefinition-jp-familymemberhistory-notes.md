### 必須要素

本プロファイルに準拠するためには、次の要素の値が存在しなければならない。

- `patient` : 本リソースが対象とする患者
- `relationship` : 患者と家族との続柄（父、母、兄弟姉妹など）
- `status` : 家族歴の記録状態（partial | completed | entered-in-error | health-unknown）


### 実装ガイダンス

#### 記録単位

`FamilyMemberHistory` は、患者に関連する個人1人につき1リソースとして記録する。

#### 続柄 relationship の記録

患者と対象となる家族構成員との関係は `FamilyMemberHistory.relationship` に記録する。  
`relationship` には、HL7 V3 RoleCode の FamilyMember ValueSet を使用する。

#### 出生順呼称 BirthOrderLabel の記録

家族内で用いられる「長男」「二男」「長女」「二女」などの出生順に基づく呼称は、`BirthOrderLabel` 拡張で記録する。

出生順呼称は、患者との続柄そのものを置き換えるものではない。患者との関係は `relationship` で表現し、出生順呼称は対象となる家族構成員に関する補足情報として記録する。

出生順呼称は、必ずしも客観的に算出された生物学的出生順位、戸籍上の記載、または遺伝学的血統図における出生順と一致するとは限らない。日常診療で患者または情報提供者から申告された家族内呼称を記録することを想定する。

**実装例：母方のおば（次女）の場合**

以下の例は、患者の母方のおば（`relationship` = `MAUNT`：母方のおば）が、母の兄弟姉妹の中で「次女」と呼称されている場合の実装を示す。

```json
{
  "resourceType": "FamilyMemberHistory",
  "status": "partial",
  "patient": {
    "reference": "Patient/jp-patient-example-1",
    "display": "山田 太郎"
  },
  "relationship": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code": "MAUNT",
      "display": "母方のおば"
    }]
  },
  "extension": [{
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_FamilyMemberHistory_BirthOrderLabel",
    "valueCodeableConcept": {
      "coding": [{
        "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_BirthOrderLabel_CS",
        "code": "daughter-2",
        "display": "second daughter"
      }],
      "text": "次女"
    }
  }],
  "sex": {
    "coding": [{
      "system": "http://hl7.org/fhir/administrative-gender",
      "code": "female"
    }]
  }
}
```

上記例では、`relationship` に `MAUNT`（母方のおば）を記録し、`extension` に `BirthOrderLabel` 拡張を追加して「次女」（`daughter-2`）を補足情報として記録している。これにより、患者との続柄と家族内での出生順呼称を区別して表現できる。

#### 疾患情報 condition の記録

対象となる家族構成員の疾患情報は `condition` 要素に記録する。  
疾患をコード化できる場合は `condition.code.coding` に記録し、必要に応じて `condition.code.text` に自由記載を行う。

#### 補足情報 note の使用

血縁関係、法的関係、同居関係、内縁関係など、`relationship` と出生順呼称のみでは十分に表現できない情報は、必要に応じて `note` に記録する。

#### 複数の家族歴の集約

複数の `FamilyMemberHistory` インスタンスをまとめて扱う場合は、`List` リソース等を用いて患者の家族歴全体を集約できる。


### 拡張定義

JP Core FamilyMemberHistoryプロファイルで使用される拡張は次の通りである。

<table class="extension_description">
  <tr>
    <th>拡張</th>
    <th>説明</th>
    <th>URL</th>
    <th>値の型</th>
    <th>Binding</th>
  </tr>
  <tr>
    <td>出生順呼称</td>
    <td>FamilyMemberHistory.relationshipで表現される続柄を補足し、家族内で用いられる出生順に基づく呼称（長男、二男、長女、二女など）を表現する。</td>
    <td>http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_FamilyMemberHistory_BirthOrderLabel</td>
    <td>CodeableConcept</td>
    <td>JP_BirthOrderLabel_VS(preferred)</td>
  </tr>
</table>


### 用語定義

#### 続柄

`relationship` には HL7 V3 RoleCode の FamilyMember ValueSet を使用する。

#### 出生順呼称

出生順呼称には、JP_BirthOrderLabel_CS および JP_BirthOrderLabel_VS を使用する。


| 分類 | 名称 | URI |
|----|---|---|
| 続柄 | HL7 V3 FamilyMember ValueSet | http://terminology.hl7.org/ValueSet/v3-FamilyMember |
| 出生順呼称 | JP BirthOrderLabel CodeSystem | http://jpfhir.jp/fhir/core/CodeSystem/JP_BirthOrderLabel_CS |
| 出生順呼称 | JP BirthOrderLabel ValueSet | http://jpfhir.jp/fhir/core/ValueSet/JP_BirthOrderLabel_VS |


## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ                | 型               | 例                                                                                             |
|----------|----------------------|-----------------|-----------------------------------------------------------------------------------------------|
| SHALL    | identifier           | token           | GET [base]/FamilyMemberHistory?identifier=http://myhospital.com/fhir/familymemberhistory\|123 |
| SHOULD   | patient              | reference       | GET [base]/FamilyMemberHistory?patient=Patient/123                                            |
| MAY      | patient,relationship | reference,token | GET [base]/FamilyMemberHistory?patient=Patient/123&relationship=FAMMEMB                       |
| MAY      | patient,status       | reference,token | GET [base]/FamilyMemberHistory?patient=Patient/123&status=completed                           |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（**SHALL**）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりFamilyMemberHistoryを検索

   ```
   GET [base]/FamilyMemberHistory?identifier={system|}[token]
   ```
   例：
   ```
   GET [base]/FamilyMemberHistory?identifier=http://myhospital.com/fhir/familymemberhistory|123
   ```

   指定された識別子に一致するFamilyMemberHistoryリソースを含むBundleを検索する。

##### 推奨検索パラメータ

1. 検索パラメータpatientを指定し、該当するすべてのFamilyMemberHistoryを検索

   ```
   GET [base]/FamilyMemberHistory?patient={reference}
   ```
   例：
   ```
   GET [base]/FamilyMemberHistory?patient=Patient/123
   ```

   指定された患者のすべてのFamilyMemberHistoryを含むBundleを返却する。

##### 追加検索パラメータ

オプションとして次の検索パラメータをサポートできる（MAY）

1. 検索パラメータpatientとstatusの組みを指定し、該当するすべてのFamilyMemberHistoryを検索

    * OR検索のサポートを含む(例えば status=[token],[token],...)
      
      ```
      GET [base]/FamilyMemberHistory?patient={reference}&status=[token]{,[token],...}
      ```
      例：
      ```
      GET [base]/FamilyMemberHistory?patient=Patient/123&status=completed
      ```

      指定された患者のすべてのFamilyMemberHistoryを含むBundleを返却する。

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**母親**][jp-familymemberhistory-example-1]
* [**息子（長男）**][jp-familymemberhistory-example-2]
* [**内縁のパートナー**][jp-familymemberhistory-example-3]
* [**母方のおば（次女）**][jp-familymemberhistory-example-4]
* [**家族歴一覧**][jp-familymemberhistory-example-list]

{% include markdown-link-references.md %}