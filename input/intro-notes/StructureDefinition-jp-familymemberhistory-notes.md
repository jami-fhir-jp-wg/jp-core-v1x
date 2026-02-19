### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- patient : 本リソースを有する患者
- relationship : 患者と家族との関係の種類（父、母、兄弟など）
- status : 家族歴のステータス（部分的 \| 完全 \| 記録エラー \| 健康状態不明）

### Extensions定義

JP Core FamilymMemberHistoryプロファイルで使用される拡張は次の通りである。

<table  class="extension_description">
  <tr>
    <th>拡張</th>
    <th>説明</th>
    <th>URL</th>
    <th>値の型</th>
  </tr>
  <tr>
    <td>同胞内出生順</td>
    <td>同胞内出生順の複合拡張</td>
    <td>http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_FamilyMemberHistory_SiblingOrder</td>
    <td>Extension</td>
  </tr>
  <tr>
    <td>同胞内出生順（整数）</td>
    <td>同胞内における社会的な出生順（整数値）</td>
    <td>siblingBirthOrder</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>性別同胞内出生順名称（コード値）</td>
    <td>同胞内における性別の社会的な出生順名称（コード値）。国内では、長男、長女、次男、次女など。国際化対応は、designationで出身国の用語を追加定義することで表現可能。</td>
    <td>SiblingBirthOrderByGender</td>
    <td>CodeableConcept</td>
  </tr>

</table>

### 用語定義

|分類| CS名                       | URI                                                                   |
|---------|---------------------------|-----------------------------------------------------------------------|
|続柄| relathionship             | http://terminology.hl7.org/ValueSet/v3-FamilyMember                   |
|性別同胞内出生順名称| SiblingBirthOrderByGender | http://jpfhir.jp/fhir/core/CodeSystem/JP_SiblingBirthOrderByGender_CS |


## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス    | パラメータ             | 型                  | 例                                                           |
| ---------------- | -------------------- | ------------------- | ------------------------------------------------------------ |
| SHALL            | identifier           | token               | GET [base]/FamilyMemberHistory?identifier=http://myhospital.com/fhir/gamilymemberhistory\|123 |
| SHOULD           | patient              | reference           | GET [base]/FamilyMemberHistory?patient=Patient/123           |
| MAY              | patient,relationship | reference,reference | GET [base]/FamilyMemberHistory?patient=Patient/123&relationship=FAMMEMB |
| MAY              | patient,status       | reference,token      | GET [base]/FamilyMemberHistory?patient=Patient/123&status=completed     |

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

オプションとして次の検索パラメータをサポートすることができる（MAY）

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

* [**家族歴（母親）**][jp-familymemberhistory-example-1]
* [**家族歴（息子、長男）**][jp-familymemberhistory-example-2]
* [**家族歴（内縁の妻）**][jp-familymemberhistory-example-3]
* [**家族歴（母方のおば）**][jp-familymemberhistory-example-4]

{% include markdown-link-references.md %}