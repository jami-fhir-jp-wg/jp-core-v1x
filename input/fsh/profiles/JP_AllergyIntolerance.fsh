// ==============================
//   Profile 定義
// ==============================
Profile: JP_AllergyIntolerance
Parent: AllergyIntolerance
Id: jp-allergyintolerance
Title: "JP Core AllergyIntolerance Profile"
Description: "このプロファイルはAllergyIntoleranceリソースに対して、患者のアレルギー不耐症に関するデータを送受信するための制約と拡張を定めるものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_AllergyIntolerance"
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "Allergy or Intolerance (generally: Risk of adverse reaction to a substance). アレルギー不耐症 (特定の物質への曝露で生じた有害反応)"
* . ^definition = "Risk of harmful or undesirable, physiological response which is unique to an individual and associated with exposure to a substance.  
このリソースは患者のアレルギー不耐症を表現する。具体的には、特定の物質または物質群へのに曝露よって生じる有害反応の傾向や、潜在的なリスクを表現する。"
* text ^short = "Text summary of the resource, for human interpretation. このリソースを人間が解釈するためのテキスト要約"
* clinicalStatus ^short = "active | inactive | resolved (アクティブ | 非アクティブ | 解決済み)"
* clinicalStatus ^definition = "The clinical status of the allergy or intolerance.  
このアレルギー不耐症のステータス。"
* verificationStatus ^short = "unconfirmed | confirmed | refuted | entered-in-error (未確認 | 確認済み | 否定された | 入力エラー)"
* verificationStatus ^definition = "Assertion about certainty associated with the propensity, or potential risk, of a reaction to the identified substance (including pharmaceutical product).  
特定された物質（医薬品を含む）が有害反応を誘発する確実性の度合い。"
* type ^short = "allergy | intolerance - Underlying mechanism (if known) （アレルギー | 不耐症）"
* type ^definition = "Identification of the underlying physiological mechanism for the reaction risk.  
有害反応を誘発する生理的なメカニズムが特定できる場合にアレルギーか不耐性かを区別する。"
* category ^short = "food | medication | environment | biologic (食品 | 薬品 | 環境 | 生体)"
* category ^definition = "Category of the identified substance.  
同定された物質のカテゴリー。"
* criticality ^short = "low | high | unable-to-assess (低い | 高い | 評価できない)"
* criticality ^definition = "Estimate of the potential clinical harm, or seriousness, of the reaction to the identified substance.  
同定された物質が誘発する有害反応の臨床的な重要度。"
* code from $JP_AllergyIntolerance_VS (example)
* code ^short = "Code that identifies the allergy or intolerance. このアレルギー不耐症の識別コード"
* code ^definition = "Code for an allergy or intolerance statement (either a positive or a negated/excluded statement). This may be a code for a substance or pharmaceutical product that is considered to be responsible for the adverse reaction risk (e.g., \"Latex\"), an allergy or intolerance condition (e.g., \"Latex allergy\"), or a negated/excluded code for a specific substance or class (e.g., \"No latex allergy\") or a general or categorical negated statement (e.g., \"No known allergy\", \"No known drug allergies\"). Note: the substance for a specific reaction may be different from the substance identified as the cause of the risk, but it must be consistent with it. For instance, it may be a more specific substance (e.g. a brand medication) or a composite product that includes the identified substance. It must be clinically safe to only process the 'code' and ignore the 'reaction.substance'. If a receiving system is unable to confirm that AllergyIntolerance.reaction.substance falls within the semantic scope of AllergyIntolerance.code, then the receiving system should ignore AllergyIntolerance.reaction.substance.   
アレルギー不耐症を識別するためのコード（肯定または否定・除外の両者を含む）。このコードは、アレルゲンとなる物資（例:Latex）、状態としてのアレルギー不耐性（例:Latex allergy）、特定の物質やクラスに対する否定・除外コード（例: No latex allergy）、物質やクラス全般に対する否定・除外コード（例: No known allergy, No known drug allergies）などが考えられる。  
注: 特定の有害反応を誘発する物質は、原因として特定された物質と異なっていてもよいが、整合がとれていなければならない。たとえば、より具体的な物質（ブランド薬など）や、特定された物質を含む複合製品の場合がある。  
AllergyIntolerance.codeのみを処理し、AllergyIntolerance.reaction.substanceを無視しても、臨床的に安全でなければならない。  
受信システムがAllergyIntolerance.reaction.substanceがAllergyIntolerance.codeのセマンティックスコープ内に（前者が後者の意味的な下位概念にあること）を確認できない場合、受信システムはAllergyIntolerance.reaction.substanceを無視する必要がある。"
* code ^comment = "このプロファイルを利用するにあたっては注意事項も参照のこと。[JP Core Allergyintoleranceプロファイル 注意事項](StructureDefinition-jp-allergyintolerance.html#%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A0%85)"
* patient only Reference(JP_Patient)
* patient ^short = "Who the sensitivity is for. このアレルギー不耐症を有する患者"
* patient ^definition = "The patient who has the allergy or intolerance.  
このアレルギー不耐症を有する患者。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "Encounter when the allergy or intolerance was asserted. このアレルギー不耐症が判明した受療の状況（外来、入院、救急、在宅など）"
* encounter ^definition = "The encounter when the allergy or intolerance was asserted.  
このアレルギー不耐症が判明した受療の状況（外来、入院、救急、在宅など）"
* onset[x] ^short = "When allergy or intolerance was identified. アレルギー不耐症が出現した時期"
* onset[x] ^definition = "Estimated or actual date, date-time, or age when allergy or intolerance was identified.  
このアレルギー不耐症が確認された、もしくは推定された時期（日付、日時、年齢）"
* recordedDate ^short = "Date first version of the resource instance was recorded. このアレルギー不耐症が初めて記録された日時"
* recordedDate ^definition = "The recordedDate represents when this particular AllergyIntolerance record was created in the system, which is often a system-generated date. このアレルギー不耐症の記録がシステムで作成された日時を表し、多くの場合、システムが生成した日付である。"
* recorder only Reference(JP_Practitioner or JP_PractitionerRole or JP_Patient or RelatedPerson)
* recorder ^short = "Who recorded the sensitivity. 誰がこのアレルギー不耐症を記録したか"
* recorder ^definition = "Individual who recorded the record and takes responsibility for its content.  
このアレルギー不耐症を記録しその内容に責任を持つ個人。"
* asserter only Reference(JP_Patient or RelatedPerson or JP_Practitioner or JP_PractitionerRole)
* asserter ^short = "Source of the information about the allergy. このアレルギー不耐症の情報源"
* asserter ^definition = "The source of the information about the allergy that is recorded.  
このアレルギー不耐症に関する情報の発生源または取得元。"
* lastOccurrence ^short = "Date(/time) of last known occurrence of a reaction. このアレルギー不耐症が最も直近に発生した日時"
* lastOccurrence ^definition = "Represents the date and/or time of the last known occurrence of a reaction event.  
最も直近に発生した日時を表す。"
* note ^short = "Additional text not captured in other fields. 他のフィールド要素では記述できない追加テキスト"
* note ^definition = "Additional narrative about the propensity for the Adverse Reaction, not captured in other fields.  
他のフィールド要素では表現できない、このアレルギー不耐症に関する追加的な記述。"
* reaction ^short = "Adverse Reaction Events linked to exposure to substance. このアレルゲンへの曝露に関連する有害反応"
* reaction ^definition = "Details about each adverse reaction event linked to exposure to the identified substance.  
同定された物質への曝露に関連する個々の有害反応に関する詳細情報。"
* reaction.substance ^short = "Specific substance or pharmaceutical product considered to be responsible for event. 有害反応の原因と考えられる特定の物質または医薬品"
* reaction.substance ^definition = "Identification of the specific substance (or pharmaceutical product) considered to be responsible for the Adverse Reaction event. Note: the substance for a specific reaction may be different from the substance identified as the cause of the risk, but it must be consistent with it. For instance, it may be a more specific substance (e.g. a brand medication) or a composite product that includes the identified substance. It must be clinically safe to only process the 'code' and ignore the 'reaction.substance'.  If a receiving system is unable to confirm that AllergyIntolerance.reaction.substance falls within the semantic scope of AllergyIntolerance.code, then the receiving system should ignore AllergyIntolerance.reaction.substance.  
有害反応の原因と考えられる物質（または医薬品）。  
注：特定の有害反応を誘発する物質は、原因として特定された物質と異なっていてもよいが、整合がとれていなければならない。たとえば、より具体的な物質（ブランド薬など）や、特定された物質を含む複合製品の場合がある。  
AllergyIntolerance.codeのみを処理し、AllergyIntolerance.reaction.substanceを無視しても、臨床的に安全でなければならない。  
受信システムがAllergyIntolerance.reaction.substanceがAllergyIntolerance.codeのセマンティックスコープ内に（前者が後者の意味的な下位概念にあること）を確認できない場合、受信システムはAllergyIntolerance.reaction.substanceを無視する必要がある。"
* reaction.manifestation ^short = "Clinical symptoms/signs associated with the Event. この有害反応に関連する症状や兆候"
* reaction.manifestation ^definition = "Clinical symptoms and/or signs that are observed or associated with the adverse reaction event.  
この有害反応に関連する症状や兆候。"
* reaction.description ^short = "Description of the event as a whole. この有害反応に関する全般的な記述"
* reaction.description ^definition = "Text description about the reaction as a whole, including details of the manifestation if required.  
必要であれば症状兆候の詳細も含めた、有害反応全体に関するテキストによる記述。"
* reaction.onset ^short = "Date(/time) when manifestations showed. この有害反応がみられた日時"
* reaction.onset ^definition = "Record of the date and/or time of the onset of the Reaction.  
この有害反応の開始の日付もしくは日時の記録。"
* reaction.severity ^short = "mild | moderate | severe (of event as a whole) （軽度 | 中度 | 重度）"
* reaction.severity ^definition = "Clinical assessment of the severity of the reaction event as a whole, potentially considering multiple different manifestations.  
有害反応の重症度の全体としての臨床的な評価で、潜在的には複数の異なる症状兆候を考慮して決める。"
* reaction.exposureRoute ^short = "How the subject was exposed to the substance. 患者がこの物質にどのように曝露したか"
* reaction.exposureRoute ^definition = "Identification of the route by which the subject was exposed to the substance.  
患者がどのような経路でこの物質に曝露したかの同定。"
* reaction.note ^short = "Text about event not captured in other fields. 他のフィールド要素では記述できない追加テキスト"
* reaction.note ^definition = "Additional text about the adverse reaction event not captured in other fields.  
他のフィールド要素では記述できない、有害反応に関する追加テキスト。"
