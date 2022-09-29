
### 必須要素

Coverage リソースは、次の要素を必ず持たなければならない。

- status ： 「リソースのインスタンスの状態」を示すエレメント
- beneficiary : 「サービスを受ける者」を示すエレメント、Patientリソースを参照する
- payor ： 「負担者」を示すエレメント。Organization、Patient、RelatedPersonのいずれかを参照する

### Extensions定義

JP Core Coverage プロファイルで使用される拡張は次の通りである。
- [JP_Coverage_InsuredPersonSymbol][JP_Coverage_InsuredPersonSymbol]
    - 健康保険における被保険者証記号を示す拡張
- [JP_Coverage_InsuredPersonNumber][JP_Coverage_InsuredPersonNumber]
    - 健康保険における被保険者証番号を示す拡張
- [JP_Coverage_InsuredPersonSubNumber][JP_Coverage_InsuredPersonSubNumber]
    - 健康保険における被保険者証番号の枝番を示す拡張

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier | token  | GET [base]/Coverage?identifier=***
| SHOULD           | beneficiary   | 	reference  | GET [base]/Coverage?beneficiary=*** |
| SHOULD           | class-type    | token | GET [base]/Coverage.class?type=*** |
| SHOULD           | class-value | string  | GET [base]/Coverage.class?value=*** |
| SHOULD           | dependent | string  | GET [base]/Coverage?dependent=*** |
| SHOULD           | patient | reference  | GET [base]/Coverage?beneficiary=Patient/*** |
| SHOULD           | payor | reference  | GET [base]/Coverage?payor=*** |
| SHOULD           | policy-holder | reference  | GET [base]/Coverage?policy-holder=*** |
| SHOULD           | status | token  | GET [base]/Coverage?status=*** |
| SHOULD           | subscriber | reference  | GET [base]/Coverage?subscriber=*** |
| SHOULD           | type | token  | GET [base]/Coverage?token=*** |

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. beneficiary 検索パラメータを使用して、識別子によるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?beneficiary={system|}[code]
   ```

   例：

   ```
   GET [base]/Coverage?beneficiary=*****
   ```

   指定された識別子に一致するCoverageリソースを含むBundleを検索する。
   
2. class-type 検索パラメータを使用して、言語コードによるOrganizationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage.class?type={token}
   ```

   例：

   ```
   GET [base]/Coverageclass?type=*****
   ```

### サンプル

* [**健康保険証**][jp-coverage-example-1]

{% include markdown-link-references.md %}
