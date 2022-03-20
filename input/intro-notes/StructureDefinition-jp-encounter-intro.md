本プロファイルは、患者の医療機関受診に関する情報の登録や検索、取得のために 、FHIR Encounter リソースを使用するにあたっての、最低限の制約を記述したものである。Encounter リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 患者番号・診察券番号による患者受診歴の検索

- 患者番号・診察券番号による入院履歴の検索

- 外来予約患者の来院状況の検索、一覧表示

- その他、上記以外の他のリソースからの患者受診歴の参照（例：Observationリソースの encounterで参照される対象とする患者の受診や、Careplanリソースのencounterで参照される患者の受診歴（入院歴））

<h3>Scope and Usageの内容</h3>

範囲と使用方法

患者に関連したEncounterの情報はその利用される状況によって特徴づけられる。例えば、外来、救急、在宅医療、入院、およびオンライン受診の情報も含まれる。Encounterは入院前手続き、外来受診、入院、入院中の滞在、および退院などの一連のライフサイクルを含む。Encounterに含まれる、PratitionerやLocationといった情報は状況に応じて変更されていくことがある。

このようにEncounterの適用範囲は広範になるため、すべてのエレメントがすべての状況で利用されるとは限らない。このため、入院/退院に関連した情報は、Encounter内のhospitalizationエレメントに保持される。classエレメントはこれらの状況を区別するために使用され、これによりさらなる検証とビジネスルールの適用が導かれる。

また、どのビジネスイベントが新しいEncounterの開始につながるのか、あるいはEncounterにどのようなレベルの集計が使用されるのかについては、組織ごと（および管轄や国ごと）に大きな違いがある。例えば、入院中の外来診療/開業医への一回の来院は、それぞれ新しいEncounterのインスタンスにつながるかもしれないが、個別の運用や関係するシステムによっては、これが入院全体で一つのインスタンスに集約されることもあり得る。会計システムなどの財務的な理由またはその他の理由でEncounterのグループを導入する場合には、さらに多くの集約が行われる可能性がある。Encountersは、partOfエレメントを用いて他のEncountersの下に集約またはグループ化することができる。例については[こちらのリンク](http://hl7.org/fhir/encounter.html#examples)を参照すること。

Encounterインスタンスは、入院前情報を表現するために実際の外来や入院が行われる前に存在することがある。これには、予定された開始日または予定された場所を表現するためにEncounterを使用することも含まれる。この場合、status要素は「planned」に設定される。

Hospitalizationコンポーネントは、入院イベントに関連する拡張情報を格納するためのものである。これは常に、Encounter自体と同じ期間であることが期待される。期間が異なる場合は、別のEncounterのインスタンスを使用して、このEncounterのインスタンスの一部としてpartOfエレメントを使用してこの情報を取り込むべきである。

ProcedureとEncounterはお互いへの参照を持つが、これらは異なるProcedureであるべきである。1つは、Encounterの間に行われたProcedure（Procedure.encounterに格納）、もう1つは、Encounterが別のProcedureの結果である場合（Encounter.indicationに格納）、例えば、以前のProcedureによる合併症を解決するためのフォローアップのEncouterなどである。

<h3>Status Managementの内容</h3>

ステータス管理

Encounterのライフサイクルでは、多くのステータス(status)を遷移する。一般的に、これらは組織のワークフローの順に、 planned(計画), in-progress(進行中), finished/cancelled(終了/キャンセル)となります。
このステータス情報はしばしば他のことに使用され、その際にはステータス履歴の分析が必要となることもある。これは、Encounterのすべてのhistoryを検索し、それぞれの期間をチェックし、何らかの形で後処理を行うことで可能となる。しかし、このような負担を軽減するために（またはシステムがリソース履歴をサポートしていない場合のために）、statusHistoryコンポーネントが用意されている。

そのEncounterが「来院した/入院した」ということを判断できる、statusの値は存在しない。Encounterの使用法およびジネスプラクティス/ポリシー/ワークフロー/タイプがこの定義に影響を与える可能性がある。(例：急性期医療施設、高齢者医療センター、外来診療所、救急部、地域に根ざした診療所など）
arrived, triaged または in-progress のstatusは入院の開始と考えられ、入力されたhospitalizationサブコンポーネントの存在を意味する。

on leave のstatusは、例えば、患者が週末に帰宅することを許可された場合や、その他の形式の外部イベントの場合など、入院の一部である場合もあれば、そうでない場合もある。
Encounterには「入院した」という固定した定義はないので、例えば外来（日帰り手術-大腸内視鏡検査）などの例では、患者は入院しているとも考えられる。少なくとも、ステータスが「in-progress」の場合は、患者は入院していると考えられます。

<h3>Boudaries and Relationships の内容</h3>

境界線と関係性

Encounterリソースは予約情報を格納するために使用されるべきではなく、Appointmentリソースが予約情報のために使用されることが意図されている。多くのシステムでは、外来患者のEncounter（これはEncounterの範囲である）とAppointmentが同時に使用されていることに注意してほしい。FHIRでは、Appointmentはエンカウンターの日付を確定するために使用され、一方Encounterは実際の来院/入院等に関する情報、すなわち患者が現れることに適用される。
このように、「planned」のstatusのEncounterは、それを予定したAppointmentと同一ではないが、それは実際に発生する前のEncounterであり、Encounterが完了するまでに更新されることが期待される。患者の場所への到着は、必ずしもEncounterの開始を意味するものではない（例えば、患者が実際に施術者に診てもらうよりも1時間早く到着しても、Encounterの開始にはならない。）。

Appointmentは通常、Appointmentの計画段階、検索、空いている時間の場所の特定、そしてAppointmentの作成に使われる。このプロセスが完了し、Appointmentが開始されると、Appointmentは達成されたものとしてマークされ、新しく作成されたEncounterにリンクされる。
この新しいEncounterは、施設のある場所に入院したときに「arrived」状態で始まり、その後、病棟を移動した際には別のpartOfで関連付けられたEncounterが始まるかもしれない。

Communicationリソースは、直接の接触がない場合に、医療従事者と患者の間で同時に行われる対話に使用される。例としては、電話によるメッセージや、通信文書の送信などがある。通信資源には継続時間は記録されないが、送信時間と受信時間が含まれる可能性がある。

標準拡張。Associcated Encounter
この拡張機能は、リソース上にこの関連性を定義するプロパティが既に存在しない場合に、エンカウンターを参照するために使用されるべきである。

## スコープ

外来における入院前受診、来院、入院診療における入院、滞在、退院といった、全ての患者受診を表す。

Encounterリソースは、class要素を用いて医療提供環境を特徴づけることができる。具体的な例としては以下の環境が想定されている。

- 救急
- 在宅診療
- 入院前
- 入院
- 検査通院
- 遠隔診療

Encounter リソースは発生単位が医療機関や組織ごとに異なる可能性がある。例えば、入院中に開業医が1回訪問するたびに新しいEncounterインスタンスが発生する可能性もあるし、地域の慣行や関連システムによっては、入院全体で1つのインスタンスに集約される場合もある。

Encounterリソースは、partOf要素を仕様して、他のEncounterインスタンスの下に集約することができる。

またEncounterリソースは、受診前の情報を伝達するために生成することもできる。この場合、status要素は「planned」に設定される。患者の受信内容が入院に関連する場合は、hospitalization要素に入院イベントに関連する拡張情報を格納することができる。
なおこの入院イベントの関連付けは、Encounterリソースのperiod要素で指定されている期間と同じ期間内であることが望ましい。もし期間が異なる場合は、別のEncounterインスタンスを使用し、このEncounterインスタンスの一部として情報を関連付ける必要がある。


## 関連するプロファイル

Encounter リソースは、以下のリソースから直接参照される。

 - AdverseEvent
 - AllergyIntolerance
 - CarePlan
 - CareTeam
 - ChargeItem
 - Claim
 - ClinicalImpression
 - Communication
 - CommunicationRequest
 - Composition
 - Condition
 - Contract
 - DeviceRequest
 - DiagnosticReport
 - DocumentReference
 - Encounter
 - ExplanationOfBenefit
 - Flag
 - GuidanceResponse
 - ImagingStudy
 - Immunization
 - List
 - Media
 - MedicationAdministration
 - MedicationDispense
 - MedicationRequest
 - MedicationStatement
 - NutritionOrder
 - Observation
 - Procedure
 - QuestionnaireResponse
 - RequestGroup
 - RiskAssessment
 - ServiceRequest
 - Task
 - VisionPrescription


Encounter リソースは、以下のリソースを直接参照する。

 - Account
 - Appoiontment
 - Encounter
 - Location
 - Observation
 - Organization
 - Patient
 - ServiceRequest
 

## プロファイル定義