CapablityStatementは、実際のユースケースに応じて各アクタがどのような振る舞いや機能を有しているかを外部向けに公開するためのものである。<br/>
JP Coreを派生したサイトでは、アクタ毎にこれらの機能定義を作成し、コンフォーマンスとして提示することを推奨する(***SHOULD***)。<br/>
ここではCapability Statementを構成する要素に対し策定時の注意事項や要求レベルについて記載をするとともに、各サイトでCapability Statementを作成する際の参考として作成例を提示する。

### Capability Statement作成
#### アクタ選出
データ受け渡し等を行う場合、送受信の両方のアクタについてCapability Statementを記載とすることが出来る。一般的にServer側へのCapabilityStatement定義され、Client側は必要に応じて記載する。役割やデータの受け渡しのフローにより、アクタが複数になる場合、それぞれのアクタにてCapability Statementの記載を検討する。

#### 対象プロファイル(Profile)
ユースケースより対象となるプロファイル(Profile)を洗い出しを行ないます。JP Coreで定義されているプロファイル場合は、これを優先して利用する。JP Coreで定義されていないプロファイルについても記載することは可能であり、FHIR BASEを初めてとして、他のImplementation Guideより適切なプロファイルを選択する。

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
FHIR BASEにある定義済み検索パラメータ([Defined Search Parameters](https://fhir-ru.github.io/searchparameter-registry.html))や[JP Coreで定義された検索パラメータ](group-searchParameter.html)の中より、適合するものがないかを確認しあればこれを採用します。
もし適合するものが見つからない場合、独自にSearch Parameterを定義した上で追加します。

## Capability Statementの実装例
* ユースケース<br/>
リソースデータを提供するServerに対して、Clientに対して検索機能をする。

* 登場アクタの説明

|アクタ|説明|
|---|---|
| Server | FHIR準拠したサーバで、Resourceを永続化して保持ししているものに対して検索のサービスを提供する。|
| Client | FHIR準拠したクライアントにて、リソースに対する検索機能を有する。|

#### Server CapabilityStatement
[JP Core Server Capability Statement][JP_Server_CapabilityStatement]

#### Client CapabilityStatement
[JP Core Client Capability Statement][JP_Client_CapabilityStatement]

{% include markdown-link-references.md %}