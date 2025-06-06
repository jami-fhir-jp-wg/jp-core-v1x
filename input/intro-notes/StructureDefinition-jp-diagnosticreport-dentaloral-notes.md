### 必須要素
本プロファイルでは、次の要素を持たなければならない。

- status : レポートの状態・進捗状況は必須
- category : レポートのカテゴリは、LP31759-1 "歯科口腔" を固定値として必須
- code : レポートの名前/コードは、32453-3 を固定値として必須
- effectiveDateTime : レポート作成日時は必須

### Extensions定義
本プロファイルで追加定義された拡張はない。

### 制約一覧
本プロファイルで追加定義された制約はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

口腔診査レポートを対象とした特有のユースケースとして、下記2つが想定される。

- **ケース1「結果の記録時や診療情報提供時の特定患者の検索」（患者単位での探索）**
  - 検索パラメータ：patient
  - DiagnosticReport.subjectがpatientリソースを指している場合の検索式の例：  
  `GET [base]/DiagnosticReport?subject:Patient.name=peter`

- **ケース2「身元確認のときの検索」（患者横断での探索）**
  - 検索パラメータ：result, issued
  - DiagnosticReport.resultで参照するObservationリソースにおいて、第1階層（有・無）だけでなく第2階層（歯式や歯面、処置状態）などを条件として検索するユースケースが想定される。
  - 例えば、『右側上顎第２小臼歯』(TB-2-1011)の現存歯の処置状態が『全部修復（全部金属冠・銀色）（ＦＭＣ）』(TP-21-01)と記載された『2000年1月1日以降』に作成されたレポートを取得する検索式：  
  ```
  GET /DiagnosticReport?
    issued=ge2000-01-01
    &result.bodySite.coding.system=http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS
    &result.bodySite.coding.code=TB-2-1011
    &result.component.code=http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalPresentTeethObservation_CS|TP-21-01
  ```
  - 上記のようにレポートから下層に紐付くリソース（result要素に紐付くObservationリソース）の要素の値で条件検索する方法以外に、下記の様に2段階に分けて検索することも出来る。
    - Step.1：条件に合致するObservationリソース一覧を取得する検索式  
    ```
    GET /Observation?
      bodySite.coding.system=http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS
      &bodySite.coding.code=TB-2-1011
      &component.code=http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalPresentTeethObservation_CS|TP-21-01
    ```
    - Step.2：取得したObservationのid（例：1234, 5678 の2つの場合）を基にレポートを取得する検索式  
    ```
    GET /DiagnosticReport?
      issued=ge2000-01-01
      &result.hasMember=Observation/1234,Observation/5678`
    ```

### サンプル
* [**口腔診査レポート**][jp-diagnosticreport-dentaloral-example-1]  
なお、result要素の参照先であるObservationリソースは [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)の記載例１を参考にサンプルデータを作成した。

## その他、参考文献、リンク等
- [公益社団法人 日本歯科医師会 「口腔診査情報標準コード仕様 Ver.1.02」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02.pdf)
- [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)


{% include markdown-link-references.md %}
