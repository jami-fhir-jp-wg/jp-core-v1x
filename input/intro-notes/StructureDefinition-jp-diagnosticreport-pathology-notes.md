### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。
DiagnosticReport リソースは、次の要素を持たなければならない。
- status : 診断レポートのステータス。preliminary、final、appended、amended、correctedのいずれかを指定する。
- category : 診断レポートの分野を表すコード。JP Core DiagnosticReport Category ValueSetから、Pathologyを表すLP7839-6を指定する。
- code : 病理分野の診断レポートを分類するためのコード。JP Core DocumentCodeから、適切な病理分野の報告書コードを指定する。

DiagnosticReport リソースは、次の要素をサポートしなければならない。
- presentedForm : 診断レポート本体。PDF形式やxml形式などで添付する。

### Extensions定義

本プロファイルで追加定義された拡張はない。

## 利用方法

##### 必須検索パラメータ

本プロファイルで必須（**SHALL**）として定義された検索項目はない。

##### 推奨検索パラメータ

本プロファイルで追加定義された推奨検索パラメータはない。

##### 追加検索パラメータ

本プロファイルで追加定義された追加検索パラメータはない。

#### Operation一覧

本プロファイルで追加定義された操作はない。

#### Operation 詳細

本プロファイルで追加定義された操作はない。

### サンプル

本プロファイルで追加定義されたサンプルはない。

## 注意事項

本プロファイルは、DiagnosticReportリソースに対して、病理分野の診断レポートのデータを送受信するための制約を定める。

identifierには、システムが管理する、施設内で診断レポートを一意に識別するためのIDを指定する。病理では、標本番号（受付番号、病理番号）と版数を指定する。

basedOnは、他のシステムから依頼されたオーダ情報を表す。通常、依頼元となるJP Core ServiceRequest Commonリソースを参照する。他のシステムと連携していない場合は参照不要である。

categoryには、JP Core DiagnosticReport Category ValueSetの中からPathologyを表すLOINC Part CodeであるLP7839-6を指定する。

codeには、JP Core DocumentCodeの中から適切な病理分野の報告書コードを指定する。組織診では11526-1、細胞診では47526-9、剖検では18743-5を指定する。

subjectは、診断レポートの対象患者に関する情報を表す。JP Core Patientリソースを参照する。

encounterは、この診断レポートを書くきっかけとなった情報を表す。JP Core Encounterリソースを参照する。

effective[x]には、診断レポートの作成日時をdateTime型で指定する。

issuedには、レポート確定日時を指定する。statusがfinalになった日時を指定する。

performerは、レポートを確定した医師を表す。JP Core Practitioner、JP Core PractitionerRole、またはJP Core Organizationを参照する。

resultsInterpreterは、この診断レポートの作成者を表す。複数いる場合は列記する。JP Core Practitioner、JP Core PractitionerRole、またはJP Core Organizationを参照する。

specimenは、この診断レポートの検体に関する情報を表す。JP Core Specimen Pathologyリソースを参照する。

resultは、この診断レポートの一部となるObservationに関する情報を表す。病理では未使用である。

imagingStudyは、診断レポートに関連づけられたDICOM画像に関する情報を表す。JP Core ImagingStudy Pathologyリソースを参照する。

mediaは、診断レポートに関連づけられたメディアに関する情報を表す。主に、レポートに添付される画像を指す。media.linkは、JP Core Media Pathologyリソースを参照する。

conclusionには、総合診断に相当する要約結論をテキストで可能な限り記載する。

conclusionCodeには、病理診断レポートの要約結論を表す1つ以上のコードを指定する。腫瘍の場合はICD-O-3、腫瘍以外はICD-10またはICD-11の病名を設定する。ただし、運用上コード指定ができない場合、設定されなくてもよい。

presentedFormには、診断レポート本体をPDF形式やxml形式などで添付する。フォーマットは問わない。

## その他、参考文献・リンク等

{% include markdown-link-references.md %}
{% include external-link-reference.md %}
