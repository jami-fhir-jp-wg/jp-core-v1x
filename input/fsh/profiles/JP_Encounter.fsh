// ==============================
//   Profile 定義
// ==============================
Profile: JP_Encounter
Parent: Encounter
Id: jp-encounter
Title: "JP Core Encounter Profile"
Description: "このプロファイルはEncounterリソースに対して、来院/入院情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Encounter"
* ^status = #active
* ^date = "2024-11-18"
* . ^short = "患者にサービスが提供されている間の相互作用"
* . ^definition = "医療サービスの提供または患者の健康状態の評価を目的とした、患者と医療提供者との間の相互作用。Encounterと表現される。  
【JP Core仕様】外来受診、救急受診、入院、退院、対面診察、電話診察、など。"
* extension contains $encounter-associatedEncounter named associatedEncounter ..1
* extension[associatedEncounter] ^short = "関連するEncounter"
* extension[associatedEncounter] ^definition = "関連するEncounter"
* identifier ^short = "このEncounterが知られている識別子（複数可）"
* identifier ^definition = "このEncounterが知られている識別子（複数可）。"
* status ^short = "planned | arrived | triaged | in-progress | onleave | finished | cancelled + / 予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+"
* status ^definition = "planned | arrived | triaged | in-progress | onleave | finished | cancelled +.  
予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+."
* status ^comment = "内部のビジネス・ルールは、ステータス(およびクラス)間で発生する可能性のある適切な遷移を検出することに注意すること。"
* status ^isModifierReason = "この要素は、リソースを有効なものとして扱うべきではないことを意味する status entered-in-error を含む status 要素であるため、修飾子としてラベル付けされる。"
* statusHistory ^short = "過去のEncounterのステータス一覧【詳細参照】"
* statusHistory ^definition = "ステータス履歴(status History)は、リソースの歴史的なバージョンを読み込んだり、サーバに保存させたりすることなく、Encounterリソースがステータス履歴を含むことを可能にする。"
* statusHistory ^comment = "現在のステータスは、ステータスの履歴ではなく、常にリソースの現在のバージョンにある。"
* statusHistory.status ^short = "planned | arrived | triaged | in-progress | onleave | finished | cancelled + / 予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+."
* statusHistory.status ^definition = "planned | arrived | triaged | in-progress | onleave | finished | cancelled +.  
予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+."
* statusHistory.status ^comment = "文字列のサイズは 1MB を超えてはならないことに注意すること。"
* statusHistory.period ^short = "そのエピソードが指定された状態になっていた時間"
* statusHistory.period ^definition = "そのエピソードが指定された状態になっていた時間。"
* statusHistory.period ^comment = "期間とは時間の範囲で指定される。範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、または範囲から1つの値が適用されるか（たとえば、「これら2回の間に患者に与える」）を指定する。 期間が必要な場合は、タイプをInterval | Durationとして指定する。"
* class ^short = "患者とのEncounterの分類【詳細参照】"
* class ^definition = "外来（外来）、入院、救急、在宅医療、その他の地域差による患者Encounterの分類を表す概念。"
* class ^comment = "コードは列挙やコードリストの中で非常にカジュアルに定義されることもあれば、SNOMED CTのような非常にフォーマルな定義まである。 - 詳細はHL7 v3コア・プリンシプルを参照すること。"
* classHistory ^short = "過去のEncounter classのリスト【詳細参照】"
* classHistory ^definition = "クラスの履歴は、リソースの履歴を経由することなく、Encounterの遷移を追跡することを可能にする。これは、入院患者が緊急時にEncounterした後、入院患者のシナリオに移行する場合に使用される。このようにして、新しいEncounterを再開しないようにすることで、検査/診断結果がより簡単に患者を追跡することができ、再処理を必要とせず、救急から入院への退院の際に紛失したりキャンセルされたりすることがないことを保証する。"
* classHistory.class ^short = "inpatient | outpatient | ambulatory | emergency + / 入院｜外来｜外来｜救急＋"
* classHistory.class ^definition = "inpatient | outpatient | ambulatory | emergency +.  
入院｜外来｜外来｜救急＋。"
* classHistory.class ^comment = "コードは列挙やコードリストの中で非常にカジュアルに定義されることもあれば、SNOMED CTのような非常にフォーマルな定義まである- 詳細はHL7 v3コア・プリンシプルを参照すること。"
* classHistory.period ^short = "指定されたクラスにエピソードがあった時間"
* classHistory.period ^definition = "指定されたクラスにエピソードがあった時間。"
* classHistory.period ^comment = "期間とは時間の範囲で指定される。範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、または範囲から1つの値が適用されるか（たとえば、「これら2回の間に患者に与える」）を指定する。 期間が必要な場合は、タイプをInterval | Durationとして指定する。"
* subject only Reference(JP_Patient or Group)
* participant.individual only Reference(JP_Practitioner or JP_PractitionerRole or RelatedPerson)
* participant.individual only Reference(JP_Practitioner or JP_PractitionerRole or RelatedPerson)
* appointment only Reference(Appointment)
* reasonReference only Reference(JP_Condition or JP_Procedure or Observation or ImmunizationRecommendation)
* reasonReference only Reference(JP_Condition or JP_Procedure or JP_Observation_Common or ImmunizationRecommendation)
* diagnosis.condition only Reference(JP_Condition or JP_Procedure)
* diagnosis.condition only Reference(JP_Condition or JP_Procedure)
* hospitalization.origin only Reference(JP_Location or JP_Organization)
* hospitalization.origin only Reference(JP_Location or JP_Organization)
* hospitalization.destination only Reference(JP_Location or JP_Organization)
* hospitalization.destination only Reference(JP_Location or JP_Organization)
* location.location only Reference(JP_Location)
* location.location only Reference(JP_Location)
* serviceProvider only Reference(JP_Organization)
* serviceProvider only Reference(JP_Organization)
* partOf only Reference(JP_Encounter)
* partOf only Reference(JP_Encounter)