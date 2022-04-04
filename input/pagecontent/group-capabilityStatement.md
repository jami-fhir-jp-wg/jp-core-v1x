## CapblityStatement概要
CapablityStatementは、実際のユースケースに応じて各アクタがどのような振る舞いや機能を有しているかを外部向けに公開するためのものである。<br/>
JP Coreより派生したサイトでは、アクタ毎にこれらの機能定義の提示をコンフォーマンスとして提示し、プログラム開発もしくは設定等を行なってゆく。
JP CoreではCapablityStatementのサンプルや作成に際した注意事項等を記載する。

## 方法作成

### 利用方法の明確化

1. アクタの洗い出し<br/>
データの受け渡しに関して登場する双方の役割等を洗い出します。
1. ユースケース洗い出し<br/>
利用シーンを想定し、アクタ間でどのようなデータのやり取りがあるのかに着目し、ユースケースとして洗い出します。
1. 対象リソース<br/>
ユースケース時に現れたデータを分析し、どのリソースに該当するのかを割り出します。

### CapabilityStatement定義作成
#### 利用するインタラクション
* アクタ<br/>
洗い出したアクタに対して、Server, Clinetのどちらに相当するかを振り分けます。ブローカー的な役割を果たすアクタについては、Server,Clientの両方のCapability Statementを記載します。
* リソース定義
  * 対象リソースの洗い出し<br/>
  対象となるProfileを洗い出しを行ないます。派生元ProfileにてFHIR BaseのDefined Search Parameterが存在しているかどうかを確認します。派生元のSearch Parameterで収まる場合、CapabilityStatementは派生元Profileにて定義をするようにします。
  * supportedProfileの定義<br/>
  派生先のProfileを列挙します。

* インタラクション
  * インタラクションの列挙<br/>
  提供するインタラクションを提供するかどうかを列挙します。
    * read
    * vread
    * update
    * patch
    * delete
    * history-instance
    * history-type
  * インタラクションのコンフォーマンス定義（オプション）<br/>
  インタラクションのコンフォーマンスを定義します。

* Search Parameter
  * パラメータの列挙<br/>
  提供するSearchParameterを列挙します。Defined Search ParamtersやJP Coreでの定義を利用できます。もしそれらにない検索を利用する場合（例えばサイトで追加定義した拡張パラメータを検索対象にしたいとき）には独自にSearch Parameterを定義する必要があります。
  * パラメータに対するコンフォーマンス定義（オプション）<br/>
  Search Parameterの実装に関するコンフォーマンス(Shall, Should, May)を割り当てます。

  * 組み合わせ条件およびそのコンフォーマンス定義（オプション）<br/>
  Search Parameterを単独で利用させたくない場合には、組み合わせに関するコンフォーマンスを定義することも可能です。

###　サンプル
#### ユースケース
JP Coreのリソース定義をClientよりServerに対して検索を行なう単純なユースケースを想定した。

#### アクタ
* Server<br/>
FHIR準拠したサーバで、Resouceを永続化して保持ししているものに対して検索のサービスを提供する。

* Client
FHIR準拠したクライアントにて、リソースに対する検索機能を有する。

### サンプル
#### サーバ

[JP Core Server Capability Statement][JP_Server_CapabilityStatement]
#### クライアント

[JP Core Client Capability Statement][JP_Client_CapabilityStatement]

{% include markdown-link-references.md %}