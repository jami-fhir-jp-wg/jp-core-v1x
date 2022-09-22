// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDispenseBase
Parent: MedicationDispense
Id: jp-medicationdispensebase
Title: "JP Core MedicationDispenseBase Profile"
Description: "このプロファイルはユーザは直接適用するものではなく、JP_MedicationDispenseとJP_MedicationDispenseInjectionの共通の親となる抽象プロファイルである。このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するため、JP_MedicationDispenseとJP_MedicationDispenseInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispenseBase"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダに対して薬局システムが対応した結果となる。"
* extension contains JP_MedicationDispense_Preparation named preparation ..*
* partOf only Reference(JP_Procedure)
* partOf ^short = "Event that dispense is part of 親イベントへの参照"
* partOf ^definition = "The procedure that trigger the dispense. \r\n\r\nこの調剤の契機となったProcedureリソースへの参照。"
* status ^short = "preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | unknown 一連の調剤イベントの状態"
* status ^definition = "A code specifying the state of the set of dispense events.\r\n\r\n一連の調剤イベントの状態を指定するコード。"
* statusReason[x] ^short = "Why a dispense was not performed　調剤が実行されなかった理由"
* statusReason[x] ^definition = "Indicates the reason why a dispense was not performed.\r\n\r\n調剤が実行されなかった理由を示す。"
* category ^short = "Type of medication dispense　調剤タイプ"
* category ^definition = "Indicates the type of medication dispense (for example, where the medication is expected to be consumed or administered (i.e. inpatient or outpatient)).\r\n\r\n投薬のタイプを示す（たとえば、薬剤が消費または投与されると予想される場所（つまり、入院患者または外来患者））。　入院、外来、退院、自宅など。"
* medication[x] ^short = "What medication was supplied　医薬品"
* medication[x] ^definition = "Identifies the medication that was administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications.\r\n\r\n投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "If only a code is specified, then it needs to be a code for a specific product. If more information is required, then the use of the medication resource is recommended.  For example, if you require form or lot number, then you must reference the Medication resource.\r\n\r\nひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\n\rなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\n\rひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。\rただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。\rまた、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* subject 1..1
* subject only Reference(JP_Patient)
* subject ^short = "Who received medication　投与対象患者"
* subject ^definition = "The person or animal or group receiving the medication.\r\n\r\n投与を受ける患者"
* subject ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* context only Reference(JP_Encounter or EpisodeOfCare)
* context ^short = "Encounter / Episode associated with event　調剤ベントに関連するEncounterやエピソード"
* context ^definition = "The encounter or episode of care that establishes the context for this event.\r\n\r\n調剤ベントに関連するEncounterやエピソードへの参照。"
* context ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* supportingInformation ^short = "Information that supports the dispensing of the medication　薬の調剤をサポートする情報"
* supportingInformation ^definition = "Additional information that supports the medication being dispensed.\r\n\r\n調剤される薬剤をサポートする追加情報への任意のリソースへの参照。"
* supportingInformation ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* performer ^short = "Who performed event　調剤を実施した人"
* performer ^definition = "Indicates who or what performed the event.\r\n調剤した人を示す"
* performer.actor only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or Device or RelatedPerson)
* location only Reference(JP_Location)
* location ^short = "Where the dispense occurred　調剤実施場所"
* location ^definition = "The principal physical location where the dispense was performed. \r\n\r\n調剤が実施された場所を示すLocationリソースへの参照。"
* location ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* authorizingPrescription only Reference(JP_MedicationRequestBase)
* authorizingPrescription ^short = "Medication order that authorizes the dispense　調剤を正当化する元の処方オーダ"
* authorizingPrescription ^definition = "Indicates the medication order that is being dispensed against.\r\n調剤の元になった処方オーダを表すMedicationRequestリソースへの参照。"
* type ^short = "実行される調剤イベント"
* type ^definition = "Indicates the type of dispensing event that is performed. For example, Trial Fill, Completion of Trial, Partial Fill, Emergency Fill, Samples, etc.\r\n実行される調剤イベントのタイプを示す。たとえば、トライアルフィル、トライアルの完了、部分フィル、緊急フィル、サンプルなどである。"
* type ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* quantity 1..
* quantity only JP_MedicationSimpleQuantity
* quantity ^short = "Trial fill, partial fill, emergency fill, etc. 払い出される薬剤の量"
* quantity ^definition = "調剤総量。\r\nJP Coreでは必須\r\n払い出される薬剤の量。計測単位を含む。"
* quantity ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator.\r\n\r\n使用状況によって、これがどのような量であるか、したがってどのような単位を使用できるかが定義される場合がかなりある。使用状況によっては、比較演算子の値も制限される場合がある。"
* daysSupply only JP_MedicationSimpleQuantity
* daysSupply ^short = "Amount of medication expressed as a timing amount　　タイミングとして表される投薬量"
* daysSupply ^definition = "The amount of medication expressed as a timing amount.\r\n\r\nタイミングとして表される投薬量。すなわち、XX日分、XX回分などの数量。"
* daysSupply ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator.\r\n\r\n使用状況によって、これがどのような量であるか、したがってどのような単位を使用できるかが定義される場合がかなりある。使用状況によっては、比較演算子の値も制限される場合がある。"
* whenPrepared ^short = "When product was packaged and reviewed　調剤がパッケージ化され、レビューされた日時"
* whenPrepared ^definition = "The time when the dispensed product was packaged and reviewed.\r\n\r\n調剤がパッケージ化され、レビューされた日時"
* whenHandedOver 1..
* whenHandedOver ^short = "Medication order that authorizes the dispense　払い出された日時"
* whenHandedOver ^definition = "The time the dispensed product was provided to the patient or their representative.\r\n\r\n必須。\r\n患者あるいはその代理人に払い出される薬剤が提供された日時。"
* destination only Reference(JP_Location)
* destination ^short = "Where the medication was sent　薬が送られた場所"
* destination ^definition = "Identification of the facility/location where the medication was shipped to, as part of the dispense event.\r\n\r\n調剤イベントの一環として、薬剤が出荷された行先先の施設/場所のLocationリソースへの参照。"
* destination ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* receiver only Reference(JP_Patient or JP_Practitioner)
* receiver ^short = "Who collected the medication　 薬を受け取った人"
* receiver ^definition = "Identifies the person who picked up the medication.  This will usually be a patient or their caregiver, but some cases exist where it can be a healthcare professional.\r\n\r\n薬を受け取った人を識別する。これは通常、患者またはその介護者だが、医療専門家になる場合もある。"
* receiver ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* note ^short = "Information about the dispense　調剤に関する備考"
* note ^definition = "Extra information about the dispense that could not be conveyed in the other attributes.\r\n\r\n他の要素では伝達できなかった調剤に関する追加情報。"
* note ^comment = "For systems that do not have structured annotations, they can simply communicate a single annotation with no author or time.  This element may need to be included in narrative because of the potential for modifying information.  *Annotations SHOULD NOT* be used to communicate \"modifying\" information that could be computable. (This is a SHOULD because enforcing user behavior is nearly impossible).\r\n\r\n構造化された注釈（アノテーション）を持たないシステムの場合、作成者や時間なしで単一の注釈を簡単に伝達できる。情報を変更する可能性があるため、この要素をナラティブに含める必要がある場合がある。 \r\n*注釈は、計算機処理れきる「変更」情報を伝達するために使用されるべきではない*。 （ユーザの行動を強制することはほとんど不可能であるため、これはSHOULDとする）。"
* dosageInstruction only JP_MedicationDosageBase
* substitution ^short = "Whether a substitution was performed on the dispense　調剤で置換が実行されたかどうか"
* substitution ^definition = "Indicates whether or not substitution was made as part of the dispense. In some cases, substitution will be expected but does not happen, in other cases substitution is not expected but does happen. This block explains what substitution did or did not happen and why. If nothing is specified, substitution was not done. \r\n 調剤の一部として置換が行われたかどうかを示す。場合によっては、置換が期待されるが発生しない場合もあれば、置換が予期されないが発生する場合もある。このブロックは、置換が行われたか行われなかったか、およびその理由を説明する。何も指定されていない場合、置換は行われていない。"
* substitution.wasSubstituted ^short = "Whether a substitution was or was not performed on the dispense　調剤で置換が実行されたか、あるいはされていないかを'true'または'false'で表す"
* substitution.wasSubstituted ^definition = "True if the dispenser dispensed a different drug or product from what was prescribed. \r\n処方されたものとは異なる薬剤または製品を調剤した場合に、'true'を設定する。"
* substitution.type ^short = "Code signifying whether a different drug was dispensed from what was prescribed　処方されたものとは異なる薬が調剤されたかどうかを示すコード"
* substitution.type ^definition = "A code signifying whether a different drug was dispensed from what was prescribed.\r\n\r\n処方されたものとは異なる薬が調剤されたかどうかを示すコード。\r\nHL7 v3 Value Set ActSubstanceAdminSubstitutionCode　から以下のコードが使用できる。 \r\nE: 別の生物学的同等および治療的に同等の製品で置換が行われたか、許可された。\r\nEC: 代替品が発生したか、次のような別の製品で許可されている：同じ有効成分を含むが異なる塩で処方された代替医薬品、同じ有効成分を持つエステル医薬品同等物、強度、剤形、投与経路.\r\nBC: 代替が発生したか、同等のブランド間で許可されてるが、ジェネリックでは許可されない。\r\nG: 代替が発生したか、同等のジェネリック間で許可されているが、ブランド間では許可されない。\r\nTE:同じ治療目的と安全性プロファイルを持つ別の製品で代替が発生したか、許可された。\r\nTB:ジェネリック医薬品ではなく、治療的に同等のブランド間で代替品が発生したか、許可されている\r\nTG:治療的に同等のジェネリック間で置換が発生したか、許可されているが、ブランドは許可されない。\r\nF:処方ガイドラインに準拠。\r\nN:置換は発生しなかったか、許可されていない。"
* substitution.type ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination."
* substitution.reason ^short = "Why was substitution made　置換が実施された理由"
* substitution.reason ^definition = "Indicates the reason for the substitution (or lack of substitution) from what was prescribed.\r\n\r\n処方されたものからの置換（または置換の欠如）の理由を示す。\r\nHL7 v3 Value Set SubstanceAdminSubstitutionReason　では以下のコードが定義されている。\r\nCT:治療継続性確保のため、FP:処方方針、 OS: 在庫欠品、  RR:代替えを義務付けまたは禁止する規制要件に従った"
* substitution.reason ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* substitution.responsibleParty only Reference(JP_Practitioner or JP_PractitionerRole)
* substitution.responsibleParty ^short = "Who is responsible for the substitution　置換責任者"
* substitution.responsibleParty ^definition = "The person or organization that has primary responsibility for the substitution.\r\n\r\n置換の主な責任を負う個人または組織。Practitioner   PractitionerRole リソースへの参照。"
* substitution.responsibleParty ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* detectedIssue ^short = "Clinical issue with action アクションを伴う臨床的問題"
* detectedIssue ^definition = "Indicates an actual or potential clinical issue with or between one or more active or proposed clinical actions for a patient; e.g. drug-drug interaction, duplicate therapy, dosage alert etc.\r\n\r\n患者に対する1つまたは複数のアクティブまたは提案された臨床アクションを伴う、またはそれらの間の実際のまたは潜在的な臨床問題を示す。例えば薬物間相互作用、重複治療、投与量アラートなど。\r\nDetectedIssue リソースへの参照。"
* eventHistory ^short = "A list of relevant lifecycle events　関連するライフサイクルイベントのリスト"
* eventHistory ^definition = "A summary of the events of interest that have occurred, such as when the dispense was verified.\r\n\r\n調剤が確認されたときなど、発生した対象のイベントのサマリー。"

//--------------------------
// 内服 JP_MedicationDispense
//--------------------------
Profile: JP_MedicationDispense
Parent: JP_MedicationDispenseBase
Id: jp-medicationdispense
Title: "JP Core MedicationDispense Profile"
Description: "このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダに対して薬局システムが対応した結果となる。"
* medication[x] only CodeableConcept
* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^short = "コード集で定義された医薬品コード"
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
* dosageInstruction only JP_MedicationDosage

//--------------------------
// 注射 JP_MedicationDispense_Injection
//--------------------------
Profile: JP_MedicationDispense_Injection
Parent: JP_MedicationDispenseBase
Id: jp-medicationdispense-injection
Title: "JP Core MedicationDispense Injection Profile"
Description: "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "指定された患者への注射薬剤の払い出し"
* . ^definition = "指定された患者・個人へ注射薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や注射薬剤の服用に関する指示も含まれる。薬剤払い出しは注射オーダに対して薬局システムが対応した結果となる。"
* medication[x] only Reference(Medication)
* medicationReference only Reference(JP_Medication)
* dosageInstruction only JP_MedicationDosage_Injection

// ==============================
//   Extension 定義
// ==============================
Extension: JP_MedicationDispense_Preparation
Id: jp-medicationdispense-preparation
Title: "JP Core MedicationDispense Preparation Extension"
Description: "薬剤単位の調剤結果"
* ^url = $JP_MedicationDispense_Preparation
* ^status = #active
* ^date = "2022-09-26"
* ^purpose = "薬剤単位の調剤結果"
* ^context.type = #element
* ^context.expression = "MedicationDispense"
* . ^short = "調剤結果"
* . ^definition = "薬剤単位の調剤結果"
* url = $JP_MedicationDispense_Preparation (exactly)
* value[x] only string or CodeableConcept
* value[x] ^short = "調剤結果"
* value[x] ^definition = "薬剤単位の調剤結果"
* valueCodeableConcept from $JP_MedicationInstructionForDispenseJHSP0002_VS (example)
* valueString ^short = "テキスト記載"
