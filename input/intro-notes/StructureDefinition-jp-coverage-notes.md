
### 必須要素

Coverage リソースは、次の要素を必ず持たなければならない。

- status ： 「リソースのインスタンスの状態」を示すエレメント。
- beneficiary : 「サービスを受ける者」を示すエレメント。Patientリソースを参照する。
- payor ： 「負担者」を示すエレメント。Organaization、Patient、RelatedPersonのいずれかを参照する。

<br><br>


### Extensions定義

JP Core Coverage プロファイルで使用される拡張は次の通りである。
- [JP_Coverage_InsuredPersonSymbol](https://simplifier.net/jp-core-draftv1/jpcoverageinsuredpersonsymbol)
    - 健康保険における被保険者証記号を示す拡張。
- [JP_Coverage_InsuredPersonNumber](https://simplifier.net/jp-core-draftv1/jpcoverageinsuredpersonnumber)
    - 健康保険における被保険者証番号を示す拡張。
- [JP_Coverage_InsuredPersonSubNumber](https://simplifier.net/jp-core-draftv1/jpcoverageinsuredpersonsubnumber)
    - 健康保険における被保険者証番号の枝番を示す拡張。

<br><br>


### 用語定義


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Coverage.status | インスタンスの状態を指定するcode。 | Required | [FinancialResourceStatusCodes](https://www.hl7.org/fhir/valueset-fm-status.html) |
| Coverage.type | 保険種別（国民健康保険、公害医療、労災、地方公費など）を表すCodeableConcept。<br>JAHIS病名情報交換規約、又は電子処方箋CDA記述仕様のコード表を参照することができる。 | Preferred　|  [JAHIS病名情報データ交換規約・JHSD0001](https://www.jahis.jp/standard/detail/id=134) <br> [電子処方箋CDA記述仕様・別表11](https://www.mhlw.go.jp/content/10800000/000342368.pdf)|
| Coverage.relationship | 患者と被保険者の関係を表すCodeableConcept。<br>JAHIS病名情報交換規約、又は電子処方箋CDA記述仕様のコード表を参照することができる。 | Extensible | [JAHIS病名情報データ交換規約・HL7表0063](https://www.jahis.jp/standard/detail/id=134) <br> [電子処方箋CDA記述仕様・別表12](https://www.mhlw.go.jp/content/10800000/000342368.pdf) |
| Coverage.costToBeneficiary.type | 患者の自己負担額に関するサービスや負担率、上限額等の種類を指定するCodeableConcept。 | Extensible | [CoverageCopayTypeCodes](https://www.hl7.org/fhir/valueset-coverage-copay-type.html) |


<br>
### 制約一覧

JP Coverage リソースには、制約は存在しない。
<br><br>

## 利用方法
<br>

### インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

<br>

### OperationおよびSearch Parameter 一覧

<br>

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD            | beneficiary   | 	reference  | GET [base]/Coverage?beneficiary=*** |
| SHOULD            | class-type    | token | GET [base]/Coverage.class?type=****                            |
| SHOULD           | class-value | string  | GET [base]/Coverage.class?value=***
| SHOULD           | dependent | string  | GET [base]/Coverage?dependent=***
| SHOULD           | identifier | token  | GET [base]/Coverage?identifier=***
| SHOULD           | patient | reference  | GET [base]/Coverage?beneficiary=Patient/***
| SHOULD           | payor | reference  | GET [base]/Coverage?payor=***
| SHOULD           | policy-holder | reference  | GET [base]/Coverage?policy-holder=***
| SHOULD           | status | token  | GET [base]/Coverage?status=***
| SHOULD           | subscriber | reference  | GET [base]/Coverage?subscriber=***
| SHOULD           | type | token  | GET [base]/Coverage?token=***



##### 推奨検索パラメータ

<span style="color: red;">★★コメント： 説明は記載途中です★★</span>

次の検索パラメータをサポートすることが望ましい。

1. beneficiary 検索パラメータを使用して、識別子によるCoverageの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Coverage?beneficiary={system|}[code]
   ```

   例：

   ```
   GET [base]/Coverage?beneficiary=*****
   ```

   指定された識別子に一致するCoverageリソースを含むBundleを検索する。
   
2. class-type 検索パラメータを使用して、言語コードによるOrganizationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Coverage.class?type={token}
   ```

   例：

   ```
   GET [base]/Coverageclass?type=*****
   ```