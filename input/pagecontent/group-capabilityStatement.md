<H1>作成中</h1>

CapablityStatementは、実際のユースケースに応じて各アクタがどのような振る舞いや機能を有しているかを外部向けに公開するためのものである。<br/>
JP Coreを派生したサイトでは、アクタ毎にこれらの機能定義を作成し、コンフォーマンスとして提示することを推奨する(***SHOULD***)。<br/>
Capability Statementを構成する要素に対し策定時の注意事項や要求レベルについて記載をするとともに、サンプル定義を提示する。

### Capability Statement策定時注意事項
#### 定義対象
データ受け渡し等を行う場合、送受信の両方のアクタについてCapability Statementを記載とすることが出来る。一般的にServer側へのCapabilityStatement定義され、Client側は必要に応じて記載する。役割やデータの受け渡しのフローにより、アクタが多数になる場合もある。その場合はそれぞれにCapability Statement

#### 対象プロファイル(Profile)
ユースケースより対象となるプロファイル(Profile)を洗い出しを行ないます。FHIR BASEにある定義済み検索パラメータ([Defined Search Parameters](https://fhir-ru.github.io/searchparameter-registry.html))を利用すること、機能要件はFHIR BASEにて共通に提供されることから、FHIR BASE定義のプロファイル(Profile)を対象するのが一般的である。派生先プロファイル(profile)を利用できるようにするためには、サポートプロファイル(Supported Profile)に登録する必要がある。
  
#### インタラクション
各プロファイル(Profile)に対して、どのようなインタラクションを提供するかを決定します。
| インタラクション| 説明 |
|---|---|
|create| 新規作成 |
|search-type| 指定されたタイプのすべてのリソース |
|read| 現在状態の検索 |
|vread| 履歴検索 |
|update| 新規作成,更新 |
|patch| 更新 |
|delete| 削除 |
|history-instance| 特定のリソースの変更履歴を取得します。 |
|history-type| 特定のタイプのすべてのリソースの変更履歴を取得します。 |

### 検索パラメータ(Search Parameter)定義
#### 対象検索パラメータの列挙
FHIR BASEにある定義済み検索パラメータ([Defined Search Parameters](https://fhir-ru.github.io/searchparameter-registry.html))や[JP Coreで定義された検索パラメータ](group-searchParameter.html)の中より、適合するものがないかを確認しあればこれを採用します。もし適合するものが見つからない場合、独自にSearch Parameterを定義した上で追加します。

## Capablity Statementサンプル
* ユースケース<br/>
リソースデータを提供するServerに対して、Clientに対して検索機能をする。

* 登場アクタの説明

|アクタ|説明|
|---|---|
| Server | FHIR準拠したサーバで、Resouceを永続化して保持ししているものに対して検索のサービスを提供する。|
| Client | FHIR準拠したクライアントにて、リソースに対する検索機能を有する。|

#### Server CapabilityStatement
[JP Core Server Capability Statement][JP_Server_CapabilityStatement]

#### Client CapabilityStatement
[JP Core Client Capability Statement][JP_Client_CapabilityStatement]

{% include markdown-link-references.md %}