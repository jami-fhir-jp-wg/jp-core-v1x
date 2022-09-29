### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- patient : 本リソースを有する患者
- relationship : 患者と家族との関係の種類（父、母、兄弟など）
- status : 家族歴のステータス（部分的 \| 完全 \| 記録エラー \| 健康状態不明）

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス    | パラメータ             | 型                  | 例                                                           |
| ---------------- | -------------------- | ------------------- | ------------------------------------------------------------ |
| SHALL            | identifier           | token               | GET [base]/FamilyMemberHistory?identifier=http://myhospital.com/fhir/gamilymemberhistory\|123 |
| SHOULD           | patient              | reference           | GET [base]/FamilyMemberHistory?patient=Patient/123           |
| MAY              | patient,relationship | reference,reference | GET [base]/FamilyMemberHistory?patient=Patient/123&relationship=FAMMEMB |
| MAY              | patient,status       | reference,code      | GET [base]/FamilyMemberHistory?patient=Patient/123&status=completed     |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（**SHALL**）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりFamilyMemberHistoryを検索

   ```
   GET [base]/FamilyMemberHistory?identifier={system|}[code]
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

    * OR検索のサポートを含む(例えば status={system\|}[code],{system\|}[code],...)
      
      ```
      GET [base]/FamilyMemberHistory?patient={reference}&status={system|}[code]{,{system|}[code],...}
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