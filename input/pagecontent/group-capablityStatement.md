## Capblity Statement
CapablityStatementは、実際のユースケースに応じて各アクタがどのような振る舞いや機能を有しているかを外部向けに公開するためのものである。JP Coreで定義されたプロファイル以外にも、FHIR BASE等も含めた機能定義が必要になる。<br/>
実際にFHIR運用するサイトでは、アクタ毎にこれらの機能定義の提示をコンフォーマンスとして利用し、プログラム開発もしくは設定等を行なってゆく。
JP Coreでは参考としてCapablityStatementの作成サンプルを提示し、作成の際に注意しなければならないことをなどを記載することにする。
本サンプルにより運用サイト側に制限をかけるものではないことを注意されたい。

### CapablityStementの作成手順
#### 利用リソース

#### アクタの洗い出し

#### アクタ毎のインタラクション定義

#### SearchParameter(検索パラメタ)の定義
##### CommonSearchParameter
##### 独自パラメター
##### 複数組み合わせ定義


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