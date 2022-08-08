// ==============================
//   Profile 定義
// ==============================
Profile: JP_Condition
Parent: Condition
Id: jp-condition
Title: "JP Core Condition Profile"
Description: "このプロファイルはConditionリソースに対して、患者の健康状態に関するデータを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "Detailed information about conditions, problems or diagnoses 患者の臨床状態、問題、または診断に関する詳細な情報"
* . ^definition = "A clinical condition, problem, diagnosis, or other event, situation, issue, or clinical concept that has risen to a level of concern.\r\n\r\n健康上の懸念となるレベルに達した、身体的、精神的、社会的な負の状態(condition)や問題（problem／issue）、医療者による診断(diagnosis)、生じたイベント(event)、置かれている状況(situation)、臨床医学的概念(clinical concept)。"
* identifier ^definition = "Business identifiers assigned to this condition by the performer or other systems which remain constant as the resource is updated and propagates from server to server.\r\n\r\n実行者または他のシステムによってこの条件に割り当てられたビジネス識別子。リソースが更新され、サーバーからサーバーに伝送されるときにも変化しない。"
* identifier ^comment = "This is a business identifier, not a resource identifier (see [discussion](resource.html#identifiers)).  It is best practice for the identifier to only appear on a single resource instance, however business practices may occasionally dictate that multiple resource instances with the same identifier can exist - possibly even with different resource types.  For example, multiple Patient and a Person resource instance might share the same social insurance number.\r\n\r\nこれはビジネス識別子であり、リソース識別子ではない。全インスタンスを通して識別子は単一インスタンスを指し示すことがベストである。しかし、異なるリソースタイプの複数のリソースインスタンスに同じ識別子を割り当てることも稀にはある。例えば、重複するPatientリソースインスタンスとPersonリソースインスタンスは同じソーシャルセキュリティー番号を共有することなどである。"
* clinicalStatus ^definition = "The clinical status of the condition.\r\n\r\n状態の臨床的なステータス（アクティブか否かなど）"
* verificationStatus ^definition = "The verification status to support the clinical status of the condition.\r\n\r\n clinicalStatusの検証ステータス（未確定、暫定的、鑑別的、確定的など）"
* verificationStatus ^comment = "verificationStatus is not required. For example, when a patient has abdominal pain in the ED, there is not likely going to be a verification status.\r\nThe data type is CodeableConcept because verificationStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity.\r\n\r\nCodeSystemはhttp://terminology.hl7.org/CodeSystem/condition-ver-statusを用いる。\r\nLv0 unconfirmed: 該当する状態の存在を確定とは言い切れないことを示す。\r\nLv1 provisional: 該当する状態の存在は暫定的であることを示す。\r\nLv1 differential: 該当する状態を鑑別するべき意図で記載されたことを示す。\r\nLv0 confirmed: 該当する状態は十分な根拠によって確定されたものであることを示す。\r\nLv0 refuted: 該当する状態は十分な根拠によって除外されたものであることを示す。\r\nLv0 entered-in-error: 有効でない入力であることを示す。"
* severity from JP_ConditionSeverity_VS (preferred)
* severity ^short = "Subjective severity of condition 主観的な重症度"
* severity ^definition = "A subjective assessment of the severity of the condition as evaluated by the clinician.\r\n\r\n医師によって評価された本状態の主観的な重症度。"
* severity ^comment = "Coding of the severity with a terminology is preferred, where possible.\r\n可能な限り、ターミノロジーを用いて重症度をコーディングすることが好ましい。\r\n\r\n 本プロファイルはHL70421 Severity of Illness Code（MI 軽度, MO 中度, SE 重度）を採用。"
* code ^short = "Identification of the condition, problem or diagnosis 臨床状態、問題、診断の識別情報"
* bodySite ^short = "Anatomical location, if relevant もし関連するのであれば、その人体部位"
* subject only Reference(JP_Patient)
* encounter only Reference(JP_Encounter)
* encounter ^definition = "The Encounter during which this Condition was created or to which the creation of this record is tightly associated.\r\n\r\n本状態の記録やレコードの作成に関連づけられる受診詳細情報。"
* encounter ^comment = "This will typically be the encounter the event occurred within, but some activities may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter. This record indicates the encounter this particular record is associated with.  In the case of a \"new\" diagnosis reflecting ongoing/revised information about the condition, this might be distinct from the first encounter in which the underlying condition was first \"known\".\r\n\r\nこれは通常、イベントが発生したエンカウンターだが、場合によっては病状状態は、エンカウンターが完了する前または後に開始されているる場合がある。それでもエンカウンターのコンテキストに関連付けられる。このレコードは、この特定のレコードが関連付けられているエンカウンターを示す。状態に関する進行中/新しい情報を反映した「新しい」診断の場合には、それまでに存在していた状態がはじめて「知られた」最初のエンカウンターとは異なる可能性がある。"
* onset[x] ^short = "Estimated or actual date,  date-time, or age 推定される、または実際に始まった日付または日時または年齢"
* onset[x] ^definition = "Estimated or actual date or date-time  the condition began, in the opinion of the clinician.\r\n\r\n臨床医の判断における、本状態が始まったと推定される、または実際に始まった日付または日時。"
* onset[x] ^comment = "Age is generally used when the patient reports an age at which the Condition began to occur.\r\n\r\n年齢は一般的に、患者が症状が発生し始めた年齢を報告したケースで使用される。"
* abatement[x] ^short = "When in resolution/remission 治癒（解決）/寛解した時期"
* abatement[x] ^definition = "The date or estimated date that the condition resolved or went into remission. This is called \"abatement\" because of the many overloaded connotations associated with \"remission\" or \"resolution\" - Conditions are never really resolved, but they can abate.\r\n\r\n状態が解決した、または寛解した日付または推定日。これは、「寛解」または「治癒（解決）」のどちらかを使うには意味が重すぎることから「軽快」と呼ばれる-状態は実際には治癒していないが、軽快にすることはできる。"
* abatement[x] ^comment = "There is no explicit distinction between resolution and remission because in many cases the distinction is not clear. Age is generally used when the patient reports an age at which the Condition abated.  If there is no abatement element, it is unknown whether the condition has resolved or entered remission; applications and users should generally assume that the condition is still valid.  When abatementString exists, it implies the condition is abated.\r\n\r\n多くの場合、解決と寛解の間に明確な区別はない。年齢は一般的に、患者が状態が緩和した年齢を報告するケースで使用される。軽快要素がない場合、状態が解決したか、寛解に入ったかは不明である。アプリケーションとユーザーは通常、状態がまだ有効であると想定する必要がある。abatementStringが存在する場合、それは状態が軽快されることを意味する。"
* recordedDate ^short = "Date record was first recorded 記録が最初に記録された日"
* recordedDate ^definition = "The recordedDate represents when this particular Condition record was created in the system, which is often a system-generated date.\r\n\r\nレコードがシステムで作成された日時。多くの場合、システムで生成された日。"
* recorder only Reference(JP_Practitioner or JP_PractitionerRole or JP_Patient or RelatedPerson)
* recorder ^short = "Who recorded the condition 誰がこの状態を記録したか"
* recorder ^definition = "Individual who recorded the record and takes responsibility for its content.\r\n\r\n本記録を記録し、その内容に責任を負う人。"
* recorder ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* asserter only Reference(JP_Patient or RelatedPerson or JP_Practitioner or JP_PractitionerRole)
* asserter ^short = "Person who asserts this condition この状態をアサートした人"
* asserter ^definition = "Individual who is making the condition statement.\r\n\r\n本状態があるという事実を作成した個人。"
* asserter ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。\r\n\r\n【JP-Core仕様】\r\n通常の診療では判断した個人と記載した個人は同一であるケースが一般的であり、既存の情報の転記などの際に、記載者と状態の存在を判断した個人が異なる場合に記入が必要となると考えられる。"
* stage ^short = "Stage/grade, usually assessed formally ステージやグレードで、通常は正式に評価されたもの"
* stage ^definition = "Clinical stage or grade of a condition. May include formal severity assessments.\r\n\r\n病状の臨床病期またはグレード。正式な重症度評価を含む場合がある。"
* stage.assessment only Reference(ClinicalImpression or JP_DiagnosticReport_Common or JP_Observation_Common)
* evidence ^definition = "Supporting evidence / manifestations that are the basis of the Condition's verification status, such as evidence that confirmed or refuted the condition.\r\n\r\n状態を確認または反駁した証拠など、状態の検証ステータスの基礎となる裏付けとなる証拠/兆候。"
* evidence ^comment = "The evidence may be a simple list of coded symptoms/manifestations, or references to observations or formal assessments, or both.\r\n\r\nこのエビデンスは、コード化された症状/症状の単純なリスト、観察または正式な評価への言及、あるいはその両方であってもよい。"
* note ^short = "Additional information about the Condition この状態に関する追加情報"
* note ^definition = "Additional information about the Condition. This is a general notes/comments entry for description of the Condition, its diagnosis and prognosis.\r\n本状態に関する追加情報。これは、本状態の説明、診断、予後に関する一般的なメモ/コメントである。"
* note ^comment = "For systems that do not have structured annotations, they can simply communicate a single annotation with no author or time.  This element may need to be included in narrative because of the potential for modifying information.  *Annotations SHOULD NOT* be used to communicate \"modifying\" information that could be computable. (This is a SHOULD because enforcing user behavior is nearly impossible).\r\n\r\n構造化された注釈（アノテーション）を持たないシステムの場合、作成者や時間なしで単一の注釈を簡単に伝達できる。情報を変更する可能性があるため、この要素をナラティブに含める必要がある場合がある。 \r\n*注釈は、計算機処理れきる「変更」情報を伝達するために使用されるべきではない*。 （ユーザーの行動を強制することはほとんど不可能であるため、これはSHOULDである）。"
