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
    <td>ジェノグラムのための同胞内出生順</td>
    <td>ジェノグラムを用途とした社会学的・文化的な同胞内出生順の複合拡張</td>
    <td>http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_FamilyMemberHistory_GenogramBasedSiblingOrder</td>
    <td>Extension</td>
  </tr>
  <tr>
    <td>同胞内出生順</td>
    <td>ジェノグラムのための同胞内出生順の複合拡張の要素。社会的・文化的な同胞内出生順の整数値。</td>
    <td>siblingBirthOrder</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>性別同胞内出生順名称</td>
    <td>ジェノグラムのための同胞内出生順の複合拡張の要素。社会的・文化的な同胞内出生順の整数値。</td>
    <td>GenderedSiblingBirthOrder</td>
    <td>CodeableConcept</td>
  </tr>

</table>

### 用語定義

|分類|CS名|URI|
|---------|----|---------------------------|
|続柄|relathionship|http://terminology.hl7.org/ValueSet/v3-FamilyMember|
|性別同胞内出生順名称|GenderedSiblingBirthOrder|http://jpfhir.jp/fhir/core/CodeSystem/JP_GenderedSiblingBirthOrder_CS|

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

##　注意事項

### 用途
HL7 FHIR Baseとしての使い方は従来通り。
GenogramBasedSiblingOrder複合拡張は、生物学的な血縁に基づく同胞内の出生順だけでは表現できない、社会的・文化的な関係性を記述するジェノグラム（Genogram、家族図）を表現することを用途としている。
FamilyMemberHistoryのrelationship（続柄）と組み合わせて、対象者の同胞内の社会的・文化的に表現される同胞内の出生順を整数で、性別で分かれて表現することの多い同胞内の出生準名称を用語で表現する。
また、臨床の現場で家族全員の生年月日や年齢を聴取できないが、断片的に対象者の出生順を表現しておきたい場合も想定している。
遺伝学的血統図を用途としておらず、その場合は、FamilyMemberHistory Geneticリソースや、GA4GH等のプロファイルを参照すること。

### 同胞内出生順（整数）について
同胞内での出生順を表現した数値。社会的・法的には血縁に関係なく出生順に基づいて採番されており、その整数値を格納する。また、家族歴の聴取が不完全で、年齢や生年月日が不明な場合にも、対象者の社会的な同胞内出生順を表現できる。

### 性別同胞内出生順名称（用語）について
同胞内の性別の出生順の名称。国内では、長男、長女、次男、次女などであり、JP_GenderedSiblingBirthOrderを用いる。
性の多様性の表現は、"GSBO_OTHER"のコードを当て、CodeableContext.text要素に詳細を記述。
外国人においても、出身国の命名ルールのコードを拡張すれば同様に表現できる。

## 実装上の推奨

- `siblingOrder` は オプション（0..1）の拡張です。出生順を数値で記録する必要がある場合に使用してください。
- `siblingOrder` の値は整数で、1以上の値を指定してください。
- `genderedSiblingOrder` はオプション（0..1）の拡張です。UI表示やローカライズ、文化的文脈が必要な場合に使用してください。
- `genderedSiblingOrder` の値は、`JP_GenderedSiblingOrder_CS` のジェンダー別コード（GSO1_M、GSO1_F、GSO2_M、GSO2_F等）から選択してください。
- `relationship`（SON/DAU等）と `genderedSiblingOrder` を組み合わせることで、「長男」「長女」等の意味を正確に表現できます。

## 事例

- `siblingBirthOrder` = 2, `genderedSiblingBirthOrder` = `GSBO1_M`, `relationship` = `SON`（長男）
- `siblingBirthOrder` = 1, `genderedSiblingBirthOrder` = `GSBO1_F`, `relationship` = `DAU`（長女）

- `siblingBirthOrder` = 1, `genderedSiblingBirthOrder` = `GSBO1_M`, `relationship` = `UNCLE`（おじで長男）
- `siblingBirthOrder` = 2, `genderedSiblingBirthOrder` = `GSBO_OTHER`, `relationship` = `AUNT`（遺伝学的には長女、トランスジェンダー）
- `siblingBirthOrder` = 3, `genderedSiblingBirthOrder` = `GSBO2_F`, `relationship` = `AUNT`（おばで次女）

## 医学的な遺伝解析との整合性

- 医学的に厳密な出生順情報が必要な場合は、GA4GH（Global Alliance for Genomics and Health）の遺伝学的プロファイルを参照してください。
- `Patient.multipleBirthInteger`（多胎情報）との整合性は、実装時に確認してください。
- 血縁関係の遺伝学的解析には、より詳細な家系情報の構造化が別途必要になります。

## 注意点

- 多胎（双子等）の場合の取り扱いは別途検討（`Patient.multipleBirthInteger` と整合する必要あり）。
- これらの拡張は社会学的・文化的表現であり、医学的なデータとして必須ではありません。

{% include markdown-link-references.md %}