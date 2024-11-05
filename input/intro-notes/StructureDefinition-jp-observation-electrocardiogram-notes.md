### 必須要素

次のデータ項目はデータが存在しなければ    ならない（必須）、あるいは、データが送信システムに存在する場合はサポートされなければならない（Must Support）要素である。

#### 必須
このプロファイルでは、次の要素を持たなければならない。

- status: 心電図検査の結果の状態を示すために必須である。
- category: この検査のカテゴリーがprocedureであることを示すために必須である。
- code︓この検査が心電図検査(LOINC: 11624-5, EKG Study)であることを示すため必須である。
- subject: この心電図検査の実施対象を示すために必須である。

#### MustSupport  
このプロファイルではMust Supportの要素は存在しない。

### Extension定義

このプロファイルで定義した心電図検査結果を記録するために使用される拡張を以下に示す。

|拡張|説明|定義|値型|
| --- | --- | --- | --- |
|誘導の数|心電図検査を行った際に測定される誘導の数|JP_Observation_Electrocardiogram_NumberOfLead|integer|
|自動判定|自動判定の有無|JP_Observation_Electrocardiogram_DeviceInterpertation|boolean|
|測定時間|測定した時間の長さ|JP_Observation_Electrocardiogram_Duration|Duration, CodeableConcept|
|負荷条件|負荷心電図の種類|


### 用語定義

心電図検査の所見・解釈を示すコードはミネソタコードをベースとして、学会や検査機器ベンダー各社によって補足、追加されたコードが使用されている。以下に所見・解釈を示すコードの一覧を例として示す。

|分類|CS名|URI|
| --- | --- | --- |
|所見|ECAPS|urn:oid:1.2.392.200119.5.2.3.3.1|
|所見|MINNESOTA1987_NK|urn:oid:1.2.392.200119.5.2.3.3.2.1|
|所見|MINNESOTA2005_NK|urn:oid:1.2.392.200119.5.2.3.3.2.2|
|所見|FKD_GRADE|urn:oid:1.2.392.200119.5.2.4.1.1.1|
|所見|FKD_INTER|urn:oid:1.2.392.200119.5.2.4.1.1.2|
|所見|MINESOTA_CODE|urn:oid:1.2.392.200119.5.2.4.1.1.3|


## 利用方法


#### 12誘導心電図結果

プロファイル ：[JP Core Observation Electrocardiogram （心電図検査）プロファイル][JP_Observation_Electrocardiogram]<br>
　　URL :　http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Electrocardiogram<br>

カテゴリー　必須<br>
category.system = ["http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS"][JP_SimpleObservationCategory_CS]<br>
category.code = "procedure"　固定値<br>
category.display = "Procedure"　固定値<br>

コード 必須　<br>
code.coding.system = "http://loinc.org"<br>
code.coding.code = "11524-6" 固定値
code.coding.display = "EKG study"  固定値

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧


| コンフォーマンス | パラメータ | 型 | 例 |
| --- | --- | --- | --- |
| SHOULD | patient,category,code | reference,token,token,quantity  | GET [base]/Observation?patient=123&category=procedure&code=http://loinc.org\|11524-6 |
| SHOULD | patient,category,code,date | reference,token,token,quantity,date  | GET [base]/Observation?patient=123&category=procedure&code=http://loinc.org\|11524-6&date=le2020-12-31 |

#### 操作詳細

##### 必須検索パラメータ(SHALL)
必須の検索パラメータは設定しない。


##### 推奨検索パラメータ(SHOULD)

以下のパラメータで検索できることを推奨する。


1. patient, category, codeを指定して患者がうけた心電図検査の取得をサポートしていることがのぞましい。（**SHOULD**）

   ```
   GET [base]/Observation?patient={reference}?category={token}&code={token}
   ```

   例：

   ```
   GET [base]/Observation?patient=123?category=http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS|procedure&code=http://loinc.org\|11524-6
   ```

   リソースIDが123の患者が受けた心電図検査を取得する。

1. patient, category, code, dateを指定して患者がうけた心電図検査の取得をサポートしていることがのぞましい。（**SHOULD**）

   ```
   GET [base]/Observation?patient={reference}?category={token}&code={token}
   ```

   例：

   ```
   GET [base]/Observation?patient=123&category=http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS|procedure&code=http://loinc.org\|11524-6&date=2024-10-31
   ```

   リソースIDが123の患者が2024年10月31日に受けた心電図検査に該当するObservationリソースを検索する。



##### オプション検索パラメータ(**MAY**)

オプションとしての検索パラメータは現時点では設定しない。


{% include markdown-link-references.md %}
