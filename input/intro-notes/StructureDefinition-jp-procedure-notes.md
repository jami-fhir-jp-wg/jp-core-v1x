### 必須要素 
本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- status : 処置のステータス。
- subject : 処置が実施された対象の人。

### Extensions定義

- Extensions定義はない。

## 利用方法

### インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）   | search-type, read                           |
| SHOULD（推奨）  | vread, history-instance                     |
| MAY（利用可能） | create, update, patch, delete、history-type |

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | patient    | reference  | GET [base]/JP_Procedure?patient=123456 |
| SHALL            | patient,date          | reference,date | GET [base]/JP_Procedure?patient=123456&date=ge2021-08-24 |


##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータpatientで指定される患者が有する全てのJP_Procedureの検索をサポートしなければならない（SHALL）。

   http
   GET [base]/JP_Procedure?patient={Type/}[id]
   

   例：

   http
   GET [base]/JP_Procedure?patient=123456
   

   指定された患者のすべてのJP_Procedureリソースを含むBundleを検索する。

2. 検索パラメータpatientとdateの両者で指定されるJP_Procedureの検索をサポートしなければならない（SHALL）。

  * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
    http
    GET [base]/JP_Procedure?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    

    例：

    http
    GET [base]/JP_Procedure?patinet=123456&date=ge2021-08-24
    

    指定された患者および日付のすべてのJP_Procedureを含むBundleを検索する。


##### 推奨検索パラメータ

次の検索パラメータをサポートすることが推奨(SHOULD)される。

1. 検索パラメータpatientとstatusパラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば status={system|}[code],{system|}[code],...)

    http
    GET [base]/JP_Procedure?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/JP_Procedure?patient=123456&status=completed
    

    指定された患者およびステータスのすべてのJP_Procedureを含むBundleを検索する。

2. 検索パラメータpatientとcodeとdateパラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のオプションのサポートを含む (例えば code={system|}[code],{system|}[code],...)
  * dateに対する次の比較演算子のサポートを含む:gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えばdate=[date]&date=[date]]&...)
    http
    GET [base]/JP_Procedure?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    

    例：

    http
    GET [base]/JP_Procedure?patient=123456&date=ge2019-01-14T00:00:00Z&code=http://jpfhir.jp/fhir/CodeSystem/Procedure|123456
    

    指定された患者および日付およびプロシージャコードのすべてのJP_Procedureを含むBundleを検索する。複数のコードによる検索をサポートしなければならない。

##### オプション検索パラメータ 

- オプション検索パラメータはない。

#### Operation一覧

- Operation一覧はない。

## 注意事項

- 注意事項はない。

## その他、参考文献・リンク等

- ICHI(International Classification of Health Interventions) [https://icd.who.int/dev11/l-ichi/en](https://icd.who.int/dev11/l-ichi/en)
