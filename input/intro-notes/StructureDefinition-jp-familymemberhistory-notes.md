### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- patient : 本リソースを有する患者
- relationship : 患者と家族との関係の種類（父、母、兄弟など）
- status : 家族歴のステータス（部分的 \| 完全 \| 記録エラー \| 健康状態不明）

### Extensions定義

 本プロファイルで使用される拡張は次の通りである。

<table  class="extension_description">
  <tr>
    <th>拡張</th>
    <th>説明</th>
    <th>URL</th>
    <th>値の型</th>
  </tr>
  <tr>
    <td>ジェノグラム用同胞内出生順</td>
    <td>ジェノグラムを用途とした社会学的・文化的な同胞内出生順の複合拡張</td>
    <td>http://jpfhir.jp/fhir/core/ValueSet/JP_GenderedSiblingOrder_VS</td>
    <td>Extension</td>
  </tr>
</table>


- [JP_SiblingOrder][JP_FamilyMemberHistory_GenogramBasedSiblingOrder]

  - ジェノグラムを用途とした社会学的・文化的な同胞内出生順の複合拡張

- [JP_SiblingBirthOrder][JP_FamilyMemberHistory_SiblingBirthOrder]

  - 同胞内出生順を表す数値。社会学的な出生順を格納し、また、臨床においてしばし発生する不完全な家族歴の聴取を補完し、病歴聴取時の出生順を入力すること用途としている。

- [JP_GenderedSiblingBirthOrder][JP_FamilyMemberHistory_GenderedSiblingBirthOrder]

  - 社会学的、文化的な視点から、性別同胞内出生順名称を表す名称（長男、長女、次男、次女など）。性の多様性はtext要素に詳述（code要素は、#OTHER、#NOS）。外国人の場合、出身国の文化に基づく同胞内出生順の名称を表現するコードシステムを拡張することで対応できる。

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

{% include markdown-link-references.md %}