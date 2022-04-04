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
* インタラクション
  * 定義毎にExpectionを記載
* 利用するSearch Parameter
* Search Parameterの組み合わせ条件


#### 各インタラクションのコンフォーマンス(expected)

#### SearchParameterの洗い出し
##### 定義済みSearch Parameterとの照らし合わせ

##### 独自Search Parameter定義

##### 複数組み合わせ条件に対する記述


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