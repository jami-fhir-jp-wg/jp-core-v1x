### 必須要素
本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- subject : 本リソースを有する患者。

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
| SHALL            | patient    | reference  | GET [base]/JP_Condition?patient=123456 |
| SHALL            | patient,date | reference,date | GET [base]/JP_Condition?patient=123456&date=ge2021-08-24 |
| SHOULD           | patient,clinicalstatus | reference,code | GET [base]/JP_Condition?patient=123456&clinicalstatus=active |
| SHOULD           | patient,verificationstatus | reference,code | GET [base]/JP_Condition?patient=123456&verificationstatus=confirmed |
| SHOULD           | patient,category | reference,code | GET [base]/JP_Condition?patient=123456&category=jp_food |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータpatientで指定される患者が有する全てのJP_Conditionの検索をサポートしなければならない（SHALL）。

   http
   GET [base]/JP_Condition?patient={Type/}[id]
   
   例：
   http
   GET [base]/JP_Condition?patient=123456
   
   指定された患者のすべてのJP_Conditionリソースを含むBundleを検索する。

2. 検索パラメータpatientとdateの両者で指定されるJP_Conditionの検索をサポートしなければならない（SHALL）。

  * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)

    http
    GET [base]/JP_Condition?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    
    例：
    http
    GET [base]/JP_Condition?patinet=123456&date=ge2021-08-24
    
    指定された患者および日付のすべてのJP_Conditionを含むBundleを検索する。

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが推奨(SHOULD)される。

1. 検索パラメータpatientとclinicalstatusパラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば clinicalstatus={system|}[code],{system|}[code],...)

    http
    GET [base]/JP_Condition?patient={Type/}[id]&clinicalstatus={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/JP_Condition?patient=123456&clinicalstatus=active
    

    http
    GET [base]/JP_Condition?patient=123456&clinicalstatus=http://hl7.org/fhir/ValueSet/jp_condition-clinical|active
    

    指定された患者およびステータスのすべてのJP_Conditionを含むBundleを検索する。

2. 検索パラメータpatientとverificationstatusの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば verificationstatus={system|}[code],{system|}[code],...)

    http
    GET [base]/JP_Condition?patient={Type/}[id]&verificationstatus={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/JP_Condition?patient=123456&verificationstatus=confirmed
    

    http
    GET [base]/JP_Condition?patient=123456&verificationstatus=http://hl7.org/fhir/ValueSet/http://hl7.org/fhir/ValueSet/condition-ver-status|confirmed
    

    指定された患者およびステータスのすべてのJP_Conditionを含むBundleを検索する。

3. 検索パラメータpatientとcategoryの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば category={system|}[code],{system|}[code],...)

    http
    GET [base]/JP_Condition?patient={Type/}[id]&category={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/JP_Condition?patient=123456&category=claim-diagnosis
    

    http
    GET [base]/JP_Condition?patient=123456&category=	http://hl7.org/fhir/ValueSet/condition-category|claim-diagnosis
    

    指定された患者およびステータスのすべてのJP_Conditionを含むBundleを検索する。

##### オプション検索パラメータ 

- オプション検索パラメータはない。

#### Operation一覧

- Operation一覧はない。

## 注意事項

- 注意事項はない。

## その他、参考文献・リンク等

- HL70421 Severity of Illness Code ... JAHIS データ交換規約（共通編）Ver1.3 p.119 [https://www.jahis.jp/files/user/04_JAHIS%20standard/22-003_JAHIS%20データ交換規約（共通編）Ver.1.3.pdf](https://www.jahis.jp/files/user/04_JAHIS%20standard/22-003_JAHIS%20データ交換規約（共通編）Ver.1.3.pdf)
