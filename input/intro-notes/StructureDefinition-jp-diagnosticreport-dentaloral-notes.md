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

- ケース1「身元確認のときの検索」（患者横断での探索）
  - 検索パラメータ：result (※), issued
  - ※ 第1階層（有・無）だけでなく第2階層（歯式や歯面、処置状態）などを条件として検索するユースケースが想定される。

- ケース2「結果の記録時や診療情報提供時の特定患者の検索」（患者単位での探索）
  - 検索パラメータ：patient
  - DiagnosticReport.subjectがpatientリソースを指している場合の検索式の例： `GET [base]/DiagnosticReport?subject:Patient.name=peter`

<!--
### サンプル
現状なし
-->

{% include markdown-link-references.md %}
