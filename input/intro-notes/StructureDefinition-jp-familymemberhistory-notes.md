### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- patient : 本リソースを有する患者
- relationship : 患者と家族との続柄（父、母、兄弟など）
- status : 家族歴のステータス（部分的 \| 完全 \| 記録エラー \| 健康状態不明）

### Extensions定義

JP Core FamilymMemberHistoryプロファイルで使用される拡張は次の通りである。

#### モデリング上の注意（運用ルール）

- `FamilyMemberHistory` は、患者に関連する家族 **1人につき1リソース**として作成する。
- 本プロファイルで扱う「同胞（`sibling`）」は、完全同胞および半同胞に加え、養子縁組・継子等の法的親子関係に基づく非血縁の兄弟姉妹関係も含み、戸籍法施行規則に整合している。
- 同胞内出生順は当該家族構成員の **続柄（`relationship`）に付随する属性**であるため、`FamilyMemberHistory.relationship` に対する拡張として表現する。
- 同胞内出生順（`SiblingOrder`）は非血縁関係が含まれうるため、遺伝学的血統図にはそのまま利用できない。ただし、参考資料になることを想定している。
- 遺伝学的血統図は、同胞を出生順に並べて家系構造を表現する必要がある。しかし、relationship（続柄）だけでは同胞内の順序を表現できず、氏名や生年月日が不明な場合には同一人物の追跡も困難になる。本拡張（`SiblingOrder`）は `siblingBirthOrder`（整数）および `siblingBirthOrderByGender`（長男・次女など）を`relationship`と組み合わせて保持することで、 血統図の自動配置（同胞の並び順の決定）と、追加聴取による家系情報の更新（差分修正）を容易にする。
- 家族歴を記録する理由（契機）は、`reasonCode`要素に記述する。
- 患者に関連する家族の病名は、`condition`要素に記述する。`condition.code.text`に自由記載できる。あわせて`condition.code.coding`によりコードを付与してもよい。
- 関連する家族が聴取したい病名に罹患していない旨を記録する場合は、`note`要素に記述する。

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

#### 続柄（`relationship`）日本語翻訳時の注意点

- 「おじ」「おば」の漢字は、両親より年上の時は「伯父」「伯母」、年下の時は「叔父」「叔母」の２つあり、V3RoleCodeの`UNCLE`は「おじ」, `AUNT`は「おば」と平仮名を使用した。
- 「養子」の漢字は総称と男性の両方に使われるため、`CHLDADOPT`を「養子」、 `SONADOPT`を「養子（男子）」とした。

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

* [**母親**][jp-familymemberhistory-example-1]
* [**息子（長男）**][jp-familymemberhistory-example-2]
* [**内縁の妻**][jp-familymemberhistory-example-3]
* [**母方のおば（三女）**][jp-familymemberhistory-example-4]

{% include markdown-link-references.md %}