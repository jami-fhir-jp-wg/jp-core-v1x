本プロファイルは、[DiagnosticReportリソース][JP_DiagnosticReport_Radiology] のうち、放射線画像検査における患者、患者群、機器、場所、およびこれらから得られた画像に対して実施された診断結果またはその解釈を示す「報告書」を表現するリソースの定義である。ここでは、DiagnosticReport リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。
報告書は、依頼者や撮影の情報などの臨床的背景のほか、いくつかの計測値、画像、テキストおよびコード化された解釈、テンプレート化された診断報告書により構成される。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- 施設内で発生するオーダをもとに実施される画像検査に対する診断レポートの保存
- 他のリソースからの放射線検査レポートの参照<br/>
（例：[ImagingStudyリソース][JP_ImagingStudy_Radiology]) や[ServiceRequestリソース](https://www.hl7.org/fhir/R4/servicerequest.html) のreasonReference エレメントで参照される放射線検査レポート）

## スコープ

放射線検査レポートで取り扱う診断報告書は、検査の終了後に、検査の診断結果として提供される一連の情報である。
この情報には、テキストレポート、画像、コード、および計測値などが含まれる。この組み合わせは、診断手順や特定の検査の結果の性質に応じて変化する。FHIRでは、レポートはドキュメント、RESTful API、メッセージングフレームワークなど、さまざまな方法で伝達することができる。これらの方法に含まれるのは、DiagnosticReportリソースそのものである。

DiagnosticReportリソースは、診断レポート自体の他に、患者など対象者に関する情報を持つ。また、オーダに関する情報や所見の詳細、画像を参照することもできる。レポートの結論は、テキスト、構造化されたコード化データ、またはPDFなどの完全に標準化された添付レポートとして表現することができる。

もっとも典型的にはレポートの診断結果をDiagnosticReport.conclusionエレメントに保持しDiagnosticReport.presentedFormエレメントでレポート全体のデータを持つ。また、キー画像等の添付データはDiagnosticReport.mediaエレメントにMediaリソースへのリンクとして保持する。

レポート全体のデータは、レポーティングシステム等により作成された多彩な表現型（PDF, RichText, xhtml等）でBase64のAttachmentとして提供される。ただし、結果参照や検索の汎用性を担保しHuman readableな形で提供されることを目的とし、レポートの内容はDomainResourceであるDiagnosticReport.textエレメントにも格納される。

DiagnosticReportリソースは、過去の結果（リソース内での過去および現在の結果）の提示をサポートすることを意図していない。DiagnosticReportリソースは、シーケンスの構造化を含めレポートの完全なサポートをまだ提供できていないが、将来実装される予定である。

## 関連するプロファイル

以下のリソースは関連情報として presentedForm にて参照されるレポート内に保持される可能性がある。ただし、レポートシステムの仕様に依存するため、レポートシステムでは各リソースとの相互運用性の確保に配慮することが求められる。

- [患者 (`Patient`)][JP_Patient]
- [依頼医，読影医，確定医など (`Practitioner`)][JP_Practitioner]
- [身長 (`Observation`)][JP_Observation_BodyMeasurement]
- [体重 (`Observation`)][JP_Observation_BodyMeasurement]
- [アレルギー情報 (`AllergyIntorelance`)][JP_AllergyIntolerance]
- [キー画像 (`media`)](http://www.hl7.org/fhir/R4/media.html)
- [尿素窒素（BUN）(`Observation`)][JP_Observation_LabResult]
- [クレアチニン（Cre）(`Observation`)][JP_Observation_LabResult]
- 感染症情報 [ (`RiskAssessment`) ](https://hl7.org/fhir/R4/riskassessment.html) あるいは [ (`Observation`) ][JP_Observation_LabResult]

運用のフローに関連する TASK、Procedure 等のリソース定義についてはここでは触れない。
## プロファイル定義


{% include markdown-link-references.md %}
