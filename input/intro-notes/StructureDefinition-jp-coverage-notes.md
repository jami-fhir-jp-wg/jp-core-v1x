

### 「被保険者識別子」の文字列仕様
保険情報識別子として、保険者情報と被保険者情報とを以下の仕様で連結したひとつの文字列を使用する。<br>
本仕様では、以下、これを「被保険者識別子」と称する。また英数字は１バイト系文字の英数字を指す。<br>
被保険者識別子:　以下の各情報（要素）を半角コロン（文字コード１６進数 5A）で結合する。<br>
要素を省略する、とある場合には、長さ０の文字列とする。<br>


<div>
<table border="2"  style="border-collapse: collapse">
<tr><th>要素順序番号</th><th>要素</th></tr>
<tr><td>第1要素</td><td>保険者等番号</td></tr>
<tr><td>第2要素</td><td>被保険者証（手帳）等の記号</td></tr>
<tr><td>第3要素</td><td>被保険者証（手帳）等の番号</td></tr>
<tr><td>第4要素</td><td>被保険者証等枝番</td></tr>
</table>
</div>

各要素の説明：

 - 保険者番号:　<br>
 英数字８桁　券面記載の保険者番号。８桁に満たない場合は、先頭に半角ゼロを追加して８桁とする。<br>
　　<br>
 - 被保険者証（手帳）等の記号:　<br>
 英数または全角文字。健康保険被保険者証、船員保険被保険者証、受給資格者票及び国民健康保険被保険者証等の「記号及び番号」欄の記号を記録する。全角だけからなる文字列または半角だけからなる文字列のどちらかとする。英数字だけの場合には 1 バイト系（半角）文字だけから構成するか、または全角文字だけから構成する。記号または仮名漢字を含む場合には、英数字を含めすべて全角文字だけから構成する。なお、いずれの場合にも、全角空白を含めないこととする。被保険者証（手帳）等の番号だけしかない場合には、本要素は省略する。<br><br>
 - 被保険者証（手帳）等の番号:　<br>
 英数または全角文字。健康保険被保険者証、船員保険被保険者証、受給資格者票及び国民健康保険被保険者証等の「記号及び番号」欄の番号、または後期高齢者被保険者証の被保険者番号を記録する。全角だけからなる文字列または半角だけからなる文字列のどちらかとする。英数字だけの場合には 1 バイト系（半角）文字だけから構成するか、または全角文字だけから構成する。記号または仮名漢字を含む場合には、英数字を含めすべて全角文字だけから構成する。なお、いずれの場合にも、全角空白を含めないこととする。<br><br>
 - 被保険者証等枝番: <br>
 「被保険者証等枝番」に対応する文字列。半角数字2桁固定(00〜99)とする。枝番がない（表記されていない）場合には、00とするのではなく本要素は省略（空文字列）する。<br>
<br>
例）保険者等番号＝12345、被保険者証（手帳）等の記号＝あいう、被保険者証（手帳）等の番号＝１８７、枝番＝05 の場合、<br>
　　被保険者識別子＝ "00012345:あいう:１８７:05" となる。<br>
　被保険者証（手帳）等の記号と枝番がない場合には<br>
　　被保険者識別子＝ "00012345::１８７:" となる。この場合、最後のコロンは必須である。<br><br>

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
| SHOULD           | beneficiary   | reference  | GET [base]/Coverage?beneficiary=*** |
| SHOULD           | class-type    | token | GET [base]/Coverage?class-type=*** |
| SHOULD           | class-value | string  | GET [base]/Coverage?class-value=*** |
| SHOULD           | dependent | string  | GET [base]/Coverage?dependent=*** |
| SHOULD           | patient | reference  | GET [base]/Coverage?patient=Patient/*** |
| SHOULD           | payor | reference  | GET [base]/Coverage?payor=*** |
| SHOULD           | policy-holder | reference  | GET [base]/Coverage?policy-holder=*** |
| SHOULD           | status | token  | GET [base]/Coverage?status=*** |
| SHOULD           | subscriber | reference  | GET [base]/Coverage?subscriber=*** |
| SHOULD           | type | token  | GET [base]/Coverage?type=*** |

##### 必須検索パラメータ

1. identifier 検索パラメータを使用して、識別子によるCoverageの検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/Coverage?identifier={system|}[token]
   ```

   例：

   ```
   GET [base]/Coverage?identifier=http://abchosptal.co.jp/coverage/idsys|123456
   ```

   指定された識別子に一致するCoverageリソースを含むBundleを検索する。

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. beneficiary 検索パラメータを使用して、識別子によるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?beneficiary=[reference]
   ```

   例：

   ```
   GET [base]/Coverage?beneficiary=*****
   ```

   指定された識別子に一致するCoverageリソースを含むBundleを検索する。
   
1. class-type 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?class-type={token}
   ```

   例：

   ```
   GET [base]/Coverage?class-type=*****
   ```

   指定されたclass-typeに一致するCoverageリソースを含むBundleを検索する。


1. class-value 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?class-value={string}
   ```

   例：

   ```
   GET [base]/Coverage?class-value=*****
   ```

   指定されたclass-valueに一致するCoverageリソースを含むBundleを検索する。


1. dependent 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?dependent={string}
   ```

   例：

   ```
   GET [base]/Coverage?dependent=*****
   ```

   指定されたdependentに一致するCoverageリソースを含むBundleを検索する。

1. patient 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?patient={reference}
   ```

   例：

   ```
   GET [base]/Coverage?patient=*****
   ```

   指定されたpatientに一致するCoverageリソースを含むBundleを検索する。

1. payor 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?payor={reference}
   ```

   例：

   ```
   GET [base]/Coverage?payor=*****
   ```

   指定されたpayorに一致するCoverageリソースを含むBundleを検索する。

1. policy-holder 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?policy-holder={reference}
   ```

   例：

   ```
   GET [base]/Coverage?policy-holder=*****
   ```

   指定されたpolicy-holderに一致するCoverageリソースを含むBundleを検索する。


1. status 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?status={token}
   ```

   例：

   ```
   GET [base]/Coverage?status=*****
   ```

   指定されたstatusに一致するCoverageリソースを含むBundleを検索する。


1. subscriber 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?subscriber={reference}
   ```

   例：

   ```
   GET [base]/Coverage?subscriber=*****
   ```

   指定された識subscriberに一致するCoverageリソースを含むBundleを検索する。


1. type 検索パラメータを使用して、言語コードによるCoverageの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Coverage?type={string}
   ```

   例：

   ```
   GET [base]/Coverage?type=*****
   ```

   指定されたtypeに一致するCoverageリソースを含むBundleを検索する。


### サンプル

* [**健康保険証**][jp-coverage-example-1]

{% include markdown-link-references.md %}
