### 必須要素 
本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- status : 処置のステータス。
- code : 処置の種類を示すコード。
- subject : 処置の実施対象となる患者。
- performed : 処置が実施もしくは実施が予定されていた、推定または実際の日付、日時、期間、または年齢。

### Extensions定義

- Extensions定義はない

### 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Procedure.status |本処置の状態 | Required          | [EventStatus](http://www.hl7.org/fhir/ValueSet/event-status) |
| Procedure.statusReason| 本処置が行われなかった場合、その理由を表すコード。 | Example        | http://jpfhir.jp/fhir/CodeSystem/*** (予定) |
| Procedure.category | 本処置のカテゴリ | Example  | http://jpfhir.jp/fhir/CodeSystem/*** (予定) |
| Procedure.code| 本処置のコード | Required          | [ProcedureCodes](http://www.hl7.org/fhir/valueset/jp-core-procedure-code) |
| Procedure.performer.function | 本処置を行う医療者の職種| Example | http://jpfhir.jp/fhir/CodeSystem/*** (予定) |
| Procedure.reasonCode | 本処置が行われた理由　| Example| 未定　|
| Procedure.bodySite | 本処置が行われた部位　| Example | http://jpfhir.jp/fhir/CodeSystem/*** (予定) 　|
| Procedure.outcome | 本処置によるアウトカム 　| Example | http://hl7.org/fhir/ValueSet/procedure-outcome |
| Procedure.complication | 本処置により生じた合併症 |未定 | 未定　 |
| Procedure.followUp | 本処置の後に行われる処置 |未定 | 未定　 |
| PProcedure.focalDevice.action | 本処置の最中にデバイスに生じた変更 |未定 | 未定　 |
| Procedure.usedCode | 本処置に使われたデバイス |未定 | 未定　 |

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
| SHALL            | patient    | reference  | GET [base]/Procedure?patient=123456 |
| SHALL            | patient,date          | reference,date | GET [base]/Procedure?patient=123456&date=ge2021-08-24 |


##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータpatientで指定される患者が有する全てのProcedureの検索をサポートしなければならない（SHALL）。

   http
   GET [base]/Procedure?patient={Type/}[id]
   

   例：

   http
   GET [base]/Procedure?patient=123456
   

   指定された患者のすべてのProcedureリソースを含むBundleを検索する。

2. 検索パラメータpatientとdateの両者で指定されるProcedureの検索をサポートしなければならない（SHALL）。

  * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
    http
    GET [base]/Procedure?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    

    例：

    http
    GET [base]/Procedure?patinet=123456&date=ge2021-08-24
    

    指定された患者および日付のすべてのProcedureを含むBundleを検索する。


##### 推奨検索パラメータ

次の検索パラメータをサポートすることが推奨(SHOULD)される。

1. 検索パラメータpatientとstatusパラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば status={system|}[code],{system|}[code],...)

    http
    GET [base]/Procedure?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/Procedure?patient=123456&status=completed
    

    指定された患者およびステータスのすべてのProcedureを含むBundleを検索する。

2. 検索パラメータpatientとcodeとdateパラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のオプションのサポートを含む (例えば code={system|}[code],{system|}[code],...)
  * dateに対する次の比較演算子のサポートを含む:gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えばdate=[date]&date=[date]]&...)
    http
    GET [base]/Procedure?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    

    例：

    http
    GET [base]/Procedure?patient=123456&date=ge2019-01-14T00:00:00Z&code=http://jpfhir.jp/fhir/CodeSystem/Procedure|123456
    

    指定された患者および日付およびプロシージャコードのすべてのProcedureを含むBundleを検索する。複数のコードによる検索をサポートしなければならない。

##### オプション検索パラメータ 

- オプション検索パラメータはない

#### Operation一覧

- Operation一覧はない

## 注意事項

- 未定

## その他、参考文献・リンク等

- 未定








