CapablityStatementは、実際のユースケースに応じて各アクタがどのような振る舞いや機能を有しているかを外部向けに公開するためのものである。<br/>
JP Coreより派生したサイトでは、アクタ毎にこれらの機能定義の提示をコンフォーマンスとして提示し、プログラム開発もしくは設定等を行なってゆく。
JP CoreではCapablityStatementのサンプルや作成に際した注意事項等を記載する。

### Capability Statement策定の流れ
#### 利用方法の明確化
1. アクタの洗い出し<br/>
データの受け渡しに送受信双方の登場アクタ等を洗い出します。
1. ユースケースからの利用データの洗い出し<br/>
利用シーンを想定し、アクタ間でどのようなデータのやり取りがあるのかに着目します。
1. 対象リソースおよび検索パラメータの洗い出し<br/>
ユースケース時の問合せの関する引数や戻り値を分析し、問合せの際に利用する検索パラメータを洗い出します。

#### Capability Statement定義作成
##### インタラクション定義
1. 定義対象アクタの決定<br/>
Capability Statementを記載する対象となるアクタを決定します。洗い出したアクタに対して、Server, Clinetのどちらに相当するかを振り分け、定義が必要なアクタ(Actor)を決定します。受け取ったデータを送信するなどブローカー的な役割を果たすアクタについては、Server, Clientの両方のCapability Statementを記載する必要なケースもあります。

1. 対象プロファイル(Profile)の洗い出し<br/>
対象となるプロファイルを洗い出しを行ないます。一般的にFHIR BASEに定義されているプロファイルには定義済み検索パラメータ([Defined Search Parameters](https://fhir-ru.github.io/searchparameter-registry.html))をこれを利用するため、Capability Statementは派生元であるプロファイル(Profile)に対して定義を行ない、派生先プロファイル(profile)はサポートプロファイル(Supported Profile)に列挙するのが一般的です。
  
1. インタラクションの列挙およびコンフォーマンス<br/>
対処のプロファイルに対して、どのようあインタラクションを機能として提供するかどうかを決定します。また必要性に応じてコンフォーマンス(shall,should,may)を記載することもできます。
    * read
    * vread
    * update
    * patch
    * delete
    * history-instance
    * history-type

1. 検索パラメータ(Search Parameter)定義<br/>
派生元プロファイルにてFHIR Baseのが存在しているかどうかを確認し、なるべくこれを利用する様に検討します。
   1. パラメータの列挙<br/>
  提供するSearchParameterを列挙します。まずFHIR BASEにある定義済み検索パラメータ([Defined Search Parameters](https://fhir-ru.github.io/searchparameter-registry.html))や[JP Coreで定義された検索パラメータ](group-searchParameter.html)の中より、適合するものがないかを確認し、あればこれを採用します。もし適合するものが見つからない場合、独自にSearch Parameterを定義することも可能です。例えば派生先サイトで追加定義した拡張パラメータを検索対象にしたいときなどがこれに相当します。

   1. 単一パラメータに対するコンフォーマンス定義（オプション）<br/>
  Search Parameterの実装に関するコンフォーマンス(Shall, Should, May)を割り当てます。

   1. 組み合わせ条件およびそのコンフォーマンス定義（オプション）<br/>
  Search Parameterを単独で利用させたくない等の組み合わせの条件を指定する場合、組み合わせに関するコンフォーマンスを定義することも可能です。


### サンプル
#### ユースケース
JP Coreのリソース定義をClientよりServerに対して検索を行なう単純なユースケースを想定した。

#### アクタ
* Server<br/>
FHIR準拠したサーバで、Resouceを永続化して保持ししているものに対して検索のサービスを提供する。

* Client
FHIR準拠したクライアントにて、リソースに対する検索機能を有する。

#### サーバ
[JP Core Server Capability Statement][JP_Server_CapabilityStatement]
#### クライアント

[JP Core Client Capability Statement][JP_Client_CapabilityStatement]

{% include markdown-link-references.md %}