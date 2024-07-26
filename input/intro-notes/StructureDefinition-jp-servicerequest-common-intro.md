本プロファイル説明は、患者に対し立案・実施されるリクエストの記録で、処置や診断、もしくは他のサービスのために用いられるFHIR ServiceRequestリソースを使用するにあたっての、最低限の制約を記述したものである。

## スコープ

このServiceRequestリソースはFHIRにおけるワークフロー管理を構成するリソース群（Request, Event, Definition）のRequestに相当する。 － [WorkFlow](http://hl7.org/fhir/R4/workflow.html)を参照のこと。

ServiceRequestリソースは患者に対し立案・実施されるリクエストの記録で、処置や診断、もしくは他のサービス（その内容はServiceRequest.intentエレメントの値によって区別される）に関するものを示す。処置・行為は、[Procedure](http://jpfhir.jp/fhir/core/StructureDefinition/JP_Procedure.html)リソースまたは[DiagnosticReport](http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common.html)リソースを導出し、次いで通常は１つ以上のDiagnostic Medicine Module（例：[Observation](http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common.html)リソース）を参照する。参照されるObservationリソースは手順の実行状況や対象患者の治療・管理に関連する観察、 画像、所見などに関連する文書を要約したものになる。また、このリソースは、患者が他の医療機関に転院あるいは紹介される場合の情報共有にも使われる。具体的には、診察やセカンドオピニオンを受けたい場合や、健康上の問題の短期的な管理や長期的な治療を必要とする場合の情報共有に使われることがある。

* 診断検査
* 内視鏡検査
* カウンセリング
* 生検
* 治療（例：理学療法、社会療法、精神療法）
* 手術や処置
* 運動
* 専門医へのコンサルト
* 専門医のアセスメント
* 地域のサービス
* 看護サービス
* 薬剤師の内服管理
* 他の臨床的介入

処置は医療従事者だけでなく、友人、親戚、場合によっては患者自身で実施される。

ServiceRequestリソースの主な目的は、ある患者（獣医学の患畜も含まれる）の処置のオーダリングのサポートである。しかし、ヘルスケア関連の業務には、被験者のグループや医療機器、さらには建物内部の配管や水の集まる場所などの環境に対する診断調査なども含まれ、ServiceRequestリソースはこれらのユースケースのすべてをサポートする点を認識する必要がある。サービスリクエストは、医師等によってオーダリングシステム（CPOEシステム）に入力されたオーダと同様に、患者の臨床記録やケアの記録に基づいて作成された臨床判断支援システム（CDSシステム） による提案も表現する。[CarePlan](http://hl7.org/fhir/R4/careplan.html)リソースで参照される計画された処置を表す場合にもこのリソースによって表現される。

このリソースが用いられる一般的なワークフローは、臨床システムでのサービスリクエストの作成である。サービスリクエストは、処置を実施する部門（例えば手術部門、生理機能検査部門、臨床検査部門、画像診断検査部門、理学療法部門など）のシステム（エージェントなど）からアクセスされたり、交換される。。サービスリクエストを受けた部門はリクエストを受諾した後、処置を実施し、実施されたリクエストを参照するレポートを発行する。

ServiceRequestリソースが要求できる処置は1つに限定される。ワークフローが複数の処置を同時に要求した場合は、複数のServiceRequestインスタンスが作成される。これらのインスタンスはワークフローの要求により異なった方法でリンクされる。詳しくは、[Request pattern](http://hl7.org/fhir/R4/request.html)を参照のこと。

## 関連するリソースとの関係性

ServiceRequestリソースは実施されるサービスの立案、オーダの記録であり、結果として、[Procedure](http://jpfhir.jp/fhir/core/StructureDefinition/JP_Procedure.html)、[Observation](http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common.html)、[DiagnosticReport](http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common.html)、[ImagingStudy](http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Radiology.html)など、関連するリソースが作られる。ServiceRequestリソースと対照的に、[Task](http://hl7.org/fhir/R4/task.html)リソースは計画から結果までを網羅し、完了するまでの実施状況を追跡する。つまり、レコードに対して実行するタスクのリクエストや追跡、または実施過程の一部として施行すべき手順のチェックリストに対する追跡など、「管理的」なアクションを目的とする。ServiceRequestリソースは、Taskリソースを作成する上位のトリガーでもあり、Taskリソースが達成しようとしているRequestリソースにもなる。

ServiceRequestリソースは[CommunicationRequest](http://hl7.org/fhir/R4/communicationrequest.html)リソースとも関連する。CommunicationRequestリソースは単に情報を開示するRequestリソースである。一方で、ServiceRequestリソースは、トレーニングやカウンセリングの一環として情報を要求する場合に使われ、例えば、患者の理解度を確認したり、患者の精神状態を変化させようとするために使われる。あるワークフローでは両方のリソースが存在する。例えば、CommunicationRequestを受けて、医師はServiceRequestをオーダするかもしれない。

## リファレンス

このリソースは [Appointment](http://hl7.org/fhir/R4/appointment.html#Appointment), [BiologicallyDerivedProduct](http://hl7.org/fhir/R4/biologicallyderivedproduct.html#BiologicallyDerivedProduct), [CarePlan](http://hl7.org/fhir/R4/careplan.html#CarePlan), [Claim](http://hl7.org/fhir/R4/claim.html#Claim), [DeviceUseStatement](http://hl7.org/fhir/R4/deviceusestatement.html#DeviceUseStatement), [DiagnosticReport](http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common.html), [Encounter](https://jami-fhir-jp-wg.github.io/jp-core-v1xpages/jpcore-r4/feature/swg2_servicerequest/StructureDefinition-jp-encounter.html), [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html#EpisodeOfCare), [ExplanationOfBenefit](http://hl7.org/fhir/R4/explanationofbenefit.html#ExplanationOfBenefit),[Goal](http://hl7.org/fhir/R4/goal.html#Goal), [ImagingStudy](http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Radiology.html), [Media](http://hl7.org/fhir/R4/media.html#Media), [MedicationRequest](https://jami-fhir-jp-wg.github.io/jp-core-v1xpages/jpcore-r4/feature/swg2_servicerequest/StructureDefinition-jp-medicationrequest.html), [MedicationStatement](http://hl7.org/fhir/R4/medicationstatement.html#MedicationStatement), [Observation](https://jami-fhir-jp-wg.github.io/jp-core-v1xpages/jpcore-r4/feature/swg2_servicerequest/StructureDefinition-jp-observation-common.html), [Procedure](https://jami-fhir-jp-wg.github.io/jp-core-v1xpages/jpcore-r4/feature/swg2_servicerequest/StructureDefinition-jp-procedure.html), [QuestionnaireResponse](http://hl7.org/fhir/R4/questionnaireresponse.html#QuestionnaireResponse), [Specimen](http://hl7.org/fhir/R4/specimen.html#Specimen)などのリソースとServiceRequest自身から参照される。

このリソースは[Request](http://hl7.org/fhir/R4/request.html#Request)パターンを実装する。

## プロファイル定義

{% include markdown-link-references.md %}