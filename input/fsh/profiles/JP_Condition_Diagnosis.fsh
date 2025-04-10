// ==============================
//   Profile 定義
// ==============================
Profile: JP_Condition_Diagnosis
Parent: JP_Condition
Id: jp-condition-diagnosis
Title: "JP Core Condition Diagnosis Profile"
Description: "このプロファイルはConditionリソースに対して、患者の診断に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition_Diagnosis"
* ^status = #active
* ^date = "2024-11-18"
* . ^short = "Detailed information about disease. 患者の診断に関する詳細な情報"
* . ^definition = "A clinical condition, problem, diagnosis, or other event, situation, issue, or clinical concept that has risen to a level of concern.\r\n\r\n健康上の懸念となるレベルに達した、身体的、精神的、社会的な負の状態(condition)や問題（problem／issue）、医療者による診断(diagnosis)、生じたイベント(event)、置かれている状況(situation)、臨床的概念(clinical concept)。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    JP_Condition_DiseaseOutcome named diseaseOutcome ..1
* clinicalStatus ^short = "active | recurrence | relapse | inactive | remission | resolved （アクティブ | 再発 | 再燃 | インアクティブ | 寛解 | 完治）【詳細参照】"
* clinicalStatus ^definition = "The clinical status of the condition.\r\n\r\nこの患者状態の臨床的ステータス（アクティブか否かなど）"
* clinicalStatus ^comment = "診断の場合、転帰区分を指定するのに使用する。使用する場合、ConditionClinicalStatusCodesは必須で、それ以外にHL7表0241、JHSD表0006、レセプト電算システム転帰区分コードが使用できる。"
* verificationStatus ^short = "unconfirmed | provisional | differential | confirmed | refuted | entered-in-error（十分に確認されていない | 暫定的 | 鑑別的 | 十分な根拠で存在 | 十分な根拠で否定 | 誤記載）。【詳細参照】"
* verificationStatus ^definition = "The verification status to support the clinical status of the condition.\r\n\r\n この患者状態が存在するかどうかの検証状況。"
* verificationStatus ^comment = "疑い病名を指定するのに使用する。疑い病名の場合は 'unconfirmed'を、確定病名の場合は'confirmed'をそれぞれ指定する。"
* code ^short = "病名の識別コード。【詳細参照】"
* code ^definition = "病名を識別するためのコード。"
* code ^comment = "JP_Condition_DiseaseCode_VSの中から適切な病名識別コードを指定する"
* code MS
* code.text ^short = "病名や所見、症状のフルテキスト【詳細参照】"
* code.text ^definition = "病名や所見、症状のフルテキスト。"
* code.text ^comment = "修飾語などを含めた病名や所見、症状のフルテキストを記述する。特に所見や症状などでコード化が難しい場合は、ここにテキストとして記述する。"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false
* code.coding contains
    medisExchange 0..1 and
    medisRecordNo 0..1 and
    receipt 0..1 and
    icd10 0..1
* code.coding[medisExchange] from $JP_Disease_MEDIS_Concept_VS (required)
* code.coding[medisExchange].system = $JP_Disease_MEDIS_Concept_CS (exactly)
* code.coding[medisExchange].code 1..
* code.coding[medisExchange] ^short = "MEDIS ICD10対応標準病名マスター(交換用コード)。【詳細参照】"
* code.coding[medisExchange] ^definition = "MEDIS ICD10対応標準病名マスターの管理番号。"
* code.coding[medisExchange] ^comment = "JP_Disease_MEDIS_Concept_VSの中から適切なコードを指定する。"
* code.coding[medisRecordNo] from $JP_Disease_MEDIS_ManagementID_VS (required)
* code.coding[medisRecordNo].system = $JP_Disease_MEDIS_ManagementID_CS (exactly)
* code.coding[medisRecordNo].code 1..
* code.coding[medisRecordNo] ^short = "MEDIS ICD10対応標準病名マスターの交換用コード。"
* code.coding[medisRecordNo] ^definition = "MEDIS ICD10対応標準病名マスターの交換用コード。"
* code.coding[medisRecordNo] ^comment = "JP_Disease_MEDIS_ManagementID_VSの中から適切なコードを指定する。"
* code.coding[receipt] from $JP_Disease_Claim_VS (required)
* code.coding[receipt].system = $JP_Disease_Claim_CS (exactly)
* code.coding[receipt].code 1..
* code.coding[receipt] ^short = "レセプト電算用傷病名マスター。【詳細参照】"
* code.coding[receipt] ^definition = "レセプト電算用傷病名マスター。"
* code.coding[receipt] ^comment = "JP_Disease_Claim_VSの中から適切なコードを指定する。"
* code.coding[icd10] from $JP_ConditionDiseaseCodeICD10_VS (required)
* code.coding[icd10].system = $JP_ConditionDiseaseCodeICD10_CS (exactly)
* code.coding[icd10].code 1..
* code.coding[icd10] ^short = "ICD-10コード。【詳細参照】"
* code.coding[icd10] ^definition = "ICD-10コード。"
* code.coding[icd10] ^comment = "JP_ConditionDiseaseCodeICD10_VSの中から適切なコードを指定する。"
* code.extension ^slicing.discriminator.type = #value
* code.extension ^slicing.discriminator.path = "url"
* code.extension ^slicing.rules = #open
* code.extension contains
    JP_Condition_DiseasePrefixModifier named diseasePrefixModifier ..* and
    JP_Condition_DiseasePostfixModifier named diseasePostfixModifier ..*
* onset[x] ^short = "発症日（病名開始日）。診断された疾患や症状が開始された、推定もしくは実際の日付、日時、年齢。【詳細参照】"
* onset[x] ^definition = "臨床医の判断における、この疾患や症状が始まったと推定される、または実際に始まった日または日時。"
* onset[x] ^comment = "発症日が不明な場合、病名開始日（当該病名の診療を開始した日）を記述してもよい。年齢は一般的に、患者の症状が発生し始めた年齢を報告する場合に使用される。"
* abatement[x] ^short = "転帰日（病名終了日）。診断された疾患や症状がいつ治癒／寛解／軽快したか。【詳細参照】"
* abatement[x] ^definition = "診断された疾患や症状が解決または寛解した日付または推定日付。 「寛解(remission)」や「解決(resolution)」には過剰な意味合いがあるため「軽減(abatement)」と呼ばれる。つまり、疾患や症状は本当に解決されることはないが、軽減することはある。"
* abatement[x] ^comment = "転帰日が不明の場合、病名終了日（当該病名の診療を終了した日）を記述してもよい。多くのケースでは解決と寛解の区別は明確でないため、これらに明確な区別はない。 年齢は通常、患者の症状が軽減した年齢を報告する場合に使用される。abatement要素がない場合、症状が解決したか寛解に入ったかは不明である。 アプリケーションとユーザーは通常、状態がまだ有効であると想定する必要がある。 abatementString が存在する場合、状態が軽減されることを意味する。"
* evidence.code ^definition = "この状態の記録に至った兆候や症状。"
* evidence.code ^short = "ステージングの種類"
// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_Condition_DiseaseOutcome
//-------------------------------
Extension: JP_Condition_DiseaseOutcome
Id: jp-condition-disease-outcome
Title: "JP Core Disease Outcome Extension"
Description: "病名の転帰を格納するための拡張"
* ^url = $JP_Condition_DiseaseOutcome
* ^status = #active
* ^date = "2024-08-31"
* ^context.type = #element
* ^context.expression = "Condition"
* . ^short = "病名転帰"
* . ^definition = "病名の転帰を格納するための拡張。\r\n病名の転帰をCodeableConcept型で記述する。"
* url = $JP_Condition_DiseaseOutcome (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "病名転帰"
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding contains
    hl70241 0..1 and
    jhsd0006 0..1 and
    receipt 0..1
* valueCodeableConcept.coding[hl70241] from $JP_ConditionDiseaseOutcomeHL70241_VS (required)
* valueCodeableConcept.coding[hl70241].system = $JP_ConditionDiseaseOutcomeHL70241_CS (exactly)
* valueCodeableConcept.coding[hl70241].code 1..
* valueCodeableConcept.coding[hl70241] ^short = "HL7表0241。【詳細参照】"
* valueCodeableConcept.coding[hl70241] ^definition = "HL7表0241で定義されているコード。"
* valueCodeableConcept.coding[hl70241] ^comment = "JP_ConditionDiseaseOutcomeHL70241_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[jhsd0006] from $JP_ConditionDiseaseOutcomeJHSD0006_VS (required)
* valueCodeableConcept.coding[jhsd0006].system = $JP_ConditionDiseaseOutcomeJHSD0006_CS (exactly)
* valueCodeableConcept.coding[jhsd0006].code 1..
* valueCodeableConcept.coding[jhsd0006] ^short = "JHSD表0006。【詳細参照】"
* valueCodeableConcept.coding[jhsd0006] ^definition = "JHSD表0006で定義されているコード。"
* valueCodeableConcept.coding[jhsd0006] ^comment = "JP_ConditionDiseaseOutcomeJHSD0006_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[receipt] from $JP_ConditionDiseaseOutcomeReceipt_VS (required)
* valueCodeableConcept.coding[receipt].system = $JP_ConditionDiseaseOutcomeReceipt_CS (exactly)
* valueCodeableConcept.coding[receipt].code 1..
* valueCodeableConcept.coding[receipt] ^short = "レセプト電算システム転帰区分コード。【詳細参照】"
* valueCodeableConcept.coding[receipt] ^definition = "レセプト電算システムで定義されている転帰区分コード。"
* valueCodeableConcept.coding[receipt] ^comment = "JP_ConditionDiseaseOutcomeReceipt_VSの中から適切なコードを指定する。"

//-------------------------------
// JP_Condition_DiseasePrefixModifier
//-------------------------------
Extension: JP_Condition_DiseasePrefixModifier
Id: jp-condition-disease-prefix-modifier
Title: "JP Core Disease Prefix Modifier Extension"
Description: "病名の前置修飾語を格納するための拡張"
* ^url = $JP_Condition_DiseasePrefixModifier
* ^status = #active
* ^date = "2023-08-05"
* ^context.type = #element
* ^context.expression = "Condition.code"
* . ^short = "前置修飾語"
* . ^definition = "前置修飾語を格納するための拡張。\r\n前置修飾語をCodeableConcept型で記述する。"
* url = $JP_Condition_DiseasePrefixModifier (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "前置修飾語"
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding contains
    medisExchange 0..1 and
    medisRecordNo 0..1 and
    receipt 0..1
* valueCodeableConcept.coding[medisExchange] from $JP_Modifier_MEDIS_Concept_VS (required)
* valueCodeableConcept.coding[medisExchange].system = $JP_Modifier_MEDIS_Concept_CS (exactly)
* valueCodeableConcept.coding[medisExchange].code 1..
* valueCodeableConcept.coding[medisExchange] ^short = "MEDIS ICD10対応標準病名マスター(修飾語交換用コード) 。【詳細参照】"
* valueCodeableConcept.coding[medisExchange] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語交換用コード "
* valueCodeableConcept.coding[medisExchange] ^comment = "JP_Modifier_MEDIS_Concept_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[medisRecordNo] from $JP_Modifier_MEDIS_ManagementID_VS (required)
* valueCodeableConcept.coding[medisRecordNo].system = $JP_Modifier_MEDIS_ManagementID_CS (exactly)
* valueCodeableConcept.coding[medisRecordNo].code 1..
* valueCodeableConcept.coding[medisRecordNo] ^short = "MEDIS ICD10対応標準病名マスター(修飾語管理番号) 。【詳細参照】"
* valueCodeableConcept.coding[medisRecordNo] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語管理番号 "
* valueCodeableConcept.coding[medisRecordNo] ^comment = "JP_ConditionDiseaseModifierMEDISRercordNo_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[receipt] from $JP_Modifier_Disease_Claim_VS (required)
* valueCodeableConcept.coding[receipt].system = $JP_Modifier_Disease_Claim_CS (exactly)
* valueCodeableConcept.coding[receipt].code 1..
* valueCodeableConcept.coding[receipt] ^short = "レセプト電算用修飾語マスター。【詳細参照】"
* valueCodeableConcept.coding[receipt] ^definition = "レセプト電算システムで定義されている修飾語コード。"
* valueCodeableConcept.coding[receipt] ^comment = "JP_ConditionDiseaseModifierReceipt_VSの中から適切なコードを指定する。"

//-------------------------------
// JP_Condition_DiseasePostfixModifier
//-------------------------------
Extension: JP_Condition_DiseasePostfixModifier
Id: jp-condition-disease-postfix-modifier
Title: "JP Core Disease Postfix Modifier Extension"
Description: "病名の後置修飾語を格納するための拡張"
* ^url = $JP_Condition_DiseasePostfixModifier
* ^status = #active
* ^date = "2023-08-05"
* ^context.type = #element
* ^context.expression = "Condition.code"
* . ^short = "後置修飾語"
* . ^definition = "後置修飾語を格納するための拡張。\r\n後置修飾語をCodeableConcept型で記述する。"
* url = $JP_Condition_DiseasePostfixModifier (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "後置修飾語"
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.ordered = false
* valueCodeableConcept.coding contains
    medisExchange 0..1 and
    medisRecordNo 0..1 and
    receipt 0..1
* valueCodeableConcept.coding[medisExchange] from $JP_Modifier_MEDIS_Concept_VS (required)
* valueCodeableConcept.coding[medisExchange].system = $JP_Modifier_MEDIS_Concept_CS (exactly)
* valueCodeableConcept.coding[medisExchange].code 1..
* valueCodeableConcept.coding[medisExchange] ^short = "MEDIS ICD10対応標準病名マスター(修飾語交換用コード) 。【詳細参照】"
* valueCodeableConcept.coding[medisExchange] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語交換用コード "
* valueCodeableConcept.coding[medisExchange] ^comment = "JP_Modifier_MEDIS_Concept_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[medisRecordNo] from $JP_Modifier_MEDIS_ManagementID_VS (required)
* valueCodeableConcept.coding[medisRecordNo].system = $JP_Modifier_MEDIS_ManagementID_CS (exactly)
* valueCodeableConcept.coding[medisRecordNo].code 1..
* valueCodeableConcept.coding[medisRecordNo] ^short = "MEDIS ICD10対応標準病名マスター(修飾語管理番号) 。【詳細参照】"
* valueCodeableConcept.coding[medisRecordNo] ^definition = "MEDIS ICD10対応標準病名マスターの修飾語管理番号 "
* valueCodeableConcept.coding[medisRecordNo] ^comment = "JP_ConditionDiseaseModifierMEDISRercordNo_VSの中から適切なコードを指定する。"
* valueCodeableConcept.coding[receipt] from $JP_Modifier_Disease_Claim_VS (required)
* valueCodeableConcept.coding[receipt].system = $JP_Modifier_Disease_Claim_CS (exactly)
* valueCodeableConcept.coding[receipt].code 1..
* valueCodeableConcept.coding[receipt] ^short = "レセプト電算用修飾語マスター。【詳細参照】"
* valueCodeableConcept.coding[receipt] ^definition = "レセプト電算システムで定義されている修飾語コード。"
* valueCodeableConcept.coding[receipt] ^comment = "JP_Modifier_Disease_Claim_VSの中から適切なコードを指定する。"
