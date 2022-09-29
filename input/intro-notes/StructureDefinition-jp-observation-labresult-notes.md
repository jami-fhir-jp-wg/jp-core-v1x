### 必須要素
本プロファイルでは、次の要素を持たなければならない。

 - status︓検体検査情報項目の状態は必須である
 - category︓このリソースが示す検体検査情報項目を分類するための区分であり、このプロファイルでは必須とする
 - code︓このリソースは何の検体検査情報項目であるかを示すため必須である
 - subject︓このリソースが示す検体検査情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする
 - effective[x]：検体採取日時、このリソースが示す検体検査情報項目が、いつ発生したかを示すためこのプロファイルでは必須とする
 - specimen：このリソースが示す検体検査情報項目が、どの検体で検査されるのかを示すため、このプロファイルでは参照するspecimenリソースの定義を必須とする

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

検体検査結果ユースケースのSearch Parameter一覧は共通情報プロファイルとは異なり以下の通りである。

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | patient,code,date,based-on | reference,token,date,reference  | `GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&based-on=ServiceRequest/456` |
| SHOULD | patient,code,date,value-quantity,based-on | reference,token,date,quantity,reference  | `GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&value-quantity=gt40&based-on=ServiceRequest/456` |
| SHOULD | patient,code,date,value-concept,based-on | reference,token,date,code,reference  | `GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&value-concept=http://jpfhir.jp/fhir/example|1082004&based-on=ServiceRequest/456` |
| SHOULD | patient,code,date,value-string,based-on | reference,token,date,string,reference  | `GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&value-string=positive&based-on=ServiceRequest/456` |
| SHOULD | code,value-quantity,patient | token,quantity,reference  | `GET [base]/Observation?code=urn:oid:1.2.392.200119.4.504|9A610000000000000&value-quantity=gt40&patient=123` |
| SHOULD | code,value-concept,patient | token,code,reference | `GET [base]/Observation?code=urn:oid:1.2.392.200119.4.504|9A610000000000000&value-concept=http://jpfhir.jp/fhir/example|1082004&patient=123` |
| SHOULD | code,value-string,patient | token,string,reference  | `GET [base]/Observation?code=urn:oid:1.2.392.200119.4.504|9A610000000000000&value-string=positive&patient=123` |


#### 操作詳細

##### 必須検索パラメータ

必須（**SHALL**）としての検索項目は定義しない。

##### 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（**SHOULD**）

1. 臨床での検索：`subject = Patient`（対象患者）、検体採取日、検査項目、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。（**SHOULD**）


patient,code,date,based-on の各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?patient={reference}&code={code}}&date={date}}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&based-on=ServiceRequest/456
   ```

2. 臨床（NST）での検索：`subject = Patient`（対象患者）、検査項目、検査値（数値、条件：基準値から外れている、等）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(**SHOULD**)

patient,code,date,value-quantity,based-on の各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?patient={reference}&code={code}}&date={date}}&value-quantity={quantity}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&value-quantity=gt40&based-on=ServiceRequest/456
   ```

3. 臨床（NST）での検索：`subject = Patient`（対象患者）、検査項目、検査値（コード）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(**SHOULD**)

patient,code,date,value-concept,based-on の各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?patient={reference}&code={code}}&date={date}}&value-concept={code}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&value-concept=http://jpfhir.jp/fhir/example|1082004&based-on=ServiceRequest/456
   ```


4. 臨床（NST）での検索：`subject = Patient`（対象患者）、検査項目、検査値（文字列）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(**SHOULD**)

patient,code,date,value-string,based-on の各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?patient={reference}&code={code}}&date={date}}&value-string={string}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?patient=123&code=urn:oid:1.2.392.200119.4.504|9A610000000000000&date=le2020-12-31&value-string=positive&based-on=ServiceRequest/456
   ```

5. 研究での検索：検査項目、検査値（数値、条件：ある値以上／以下、等）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(**SHOULD**)

code,value-quantity,patient の各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-quantity={quantity}&patient={reference}&
   ```

   例：

   ```
   GET [base]/Observation?code=urn:oid:1.2.392.200119.4.504|9A610000000000000&value-quantity=gt40&patient=123
   ```

6. 研究での検索：検査項目、検査値（コード）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(**SHOULD**)

code,value-concept,patient の各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-concept={code}&patient={reference}
   ```

   例：

   ```
   GET [base]/Observation?code=urn:oid:1.2.392.200119.4.504|9A610000000000000&value-concept=http://jpfhir.jp/fhir/example|1082004&patient=123
   ```

5. 研究での検索：検査項目、検査値（文字列）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(**SHOULD**)

code,value-string,patient の各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-string={string}&patient={reference}
   ```

   例：

   ```
   GET [base]/Observation?code=urn:oid:1.2.392.200119.4.504|9A610000000000000&value-string=positive&patient=123
   ```



##### オプション検索パラメータ

 本プロファイルで追加定義されたオプション検索パラメータはない。


#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル

* [**検体検査（尿）**][jp-observation-labresult-example-1]

{% include markdown-link-references.md %}
