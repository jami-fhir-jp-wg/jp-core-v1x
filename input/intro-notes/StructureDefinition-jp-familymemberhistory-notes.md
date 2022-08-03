### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- patient : 本リソースを有する患者。
- relationship : 患者と家族との関係の種類（父、母、兄弟など）
- status : 家族歴のステータス（部分的 | 完全 | 記録エラー | 健康状態不明）

### Extensions定義

- Extensions定義はない。

## 利用方法

### インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                        |
| SHOULD（推奨）   | vread、history-instance                  |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | patient    | reference  | GET [base]/JP_FamilyMemberHistory?patient=123456 |
| SHALL            | patient,relationship | reference,reference | GET [base]/JP_FamilyMemberHistory?patient=123456&relationship=FAMMEMB |
| SHALL            | patient,status | reference,code | GET [base]/JP_FamilyMemberHistory?patient=123456&status=completed |
| SHOULD           | patient,date | reference,dateTime | GET [base]/JP_FamilyMemberHistory?patient=123456&date=ge2021-08-24 |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータpatientを指定し、該当するすべてのJP_FamilyMemberHistoryを検索。

   http
   GET [base]/JP_FamilyMemberHistory?patient={Type/}[id]

   例：

   http
   GET [base]/JP_FamilyMemberHistory?patient=123456
   
   指定された患者が有するすべてのJP_FamilyMemberHistoryを含むBundleを返却する。

2. 検索パラメータpatientとrelationshipを指定し、該当するすべてのJP_FamilyMemberHistoryを検索。

   http
   GET [base]/JP_FamilyMemberHistory?patient={Type/}[id]&relationship={Type/}[coding]

   例：

   http
   GET [base]/JP_FamilyMemberHistory?patient=123456&relationship=FAMMEMB
   
   指定された患者と対象家族が有するすべてのJP_FamilyMemberHistoryを含むBundleを返却する。


3. 検索パラメータpatientとstatusの組みを指定し、該当するすべてのJP_FamilyMemberHistoryを検索。
  * OR検索のサポートを含む(例えば status={system|}[code],{system|}[code],...)

    http
    GET [base]/JP_FamilyMemberHistory?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}
    
    例：

    http
    GET [base]/JP_FamilyMemberHistory?patient=123456&status=completed
    
    指定された患者とステータスを有するすべてのP_FamilyMemberHistoryを含むBundleを返却する。

##### 推奨検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートすることが推奨（SHOULD）される。

1. 検索パラメータpatientとdateの組みを指定し、該当するすべてのJP_FamilyMemberHistoryを検索。

  * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
    http
    GET [base]/JP_FamilyMemberHistory?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    
    例：

    http
    GET [base]/JP_FamilyMemberHistory?patinet=123456&date=ge2021-08-24
    
    指定された患者と日付を有するすべてのJP_FamilyMemberHistoryを含むBundleを返却する。

##### オプション検索パラメータ 

- オプション検索パラメータはない。

#### Operation一覧

- Operation一覧はない。

## 注意事項

- 特になし。

## その他、参考文献・リンク等

- 特になし。
