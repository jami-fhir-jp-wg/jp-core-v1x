この章ではJP Core Requestor[クライアント]から発行される問い合わせに対して応答する責務のある、JP Core Serverに要求される機能(expected capabilities)について記載する。  
JP Core Serverによってサポートされる FHIR プロファイル・RESTful操作・検索パラメータの完全なリストを定義する。  
JP Core Clientは個別のユースケースや意味的な要請に応じてこれらのリストを通じて必要なデータにアクセスすることができる。

## FHIR RESTful Capabilities
- JP Coreは以下の要件を必須とする(**SHALL**)
  - FHIR仕様に基づくRESTfulなふるまいの実装
- 以下のレスポンスクラスを返すこと
  - (Status 400): invalid parameter
  - (Status 401/4xx): unauthorized request
  - (Status 403): insufficient scope
  - (Status 404): unknown resource
  - (Status 410): deleted resource.

- 全てのJP Core interactionにおいてjson記述をサポートすること(**SHOULD**)  

- JP Coreは以下の要件を満たすべきである(**SHOULD**)
  - 各インスタンス を、FHIR meta.profile 属性の一部としてサポートされる JP Core profileとして認識すること

- セキュリティ  
  - See the General Security Considerations section for requirements and recommendations.
  - サーバはunauthorizedなリクエストに対してはHTTP 401を返さなければならない。(**SHALL**)

## RESTful Capabilities by Resource/Profile:

{% include markdown-link-references.md %}