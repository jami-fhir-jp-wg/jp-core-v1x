Profile: JP_Observation_Microbiology
Parent: JP_Observation_Common
Id: jp-observation-microbiology
Title: "JP Core Observation Microbiology Profile"
Description: "このプロファイルはObservationリソースに対して、細菌検査のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Microbiology"
* ^status = #active
* basedOn only Reference(ServiceRequest)
* basedOn ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.<br><br>【JP仕様】<br>オーダ情報（ServiceRequestリソース）"
* category 1..1
//* category from $microbiology-category (required)
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set.<br><br>【JP仕様】<br>日本では適切なコード体系が存在しないため、独自のバリューセットを定義する<br>JP Coreとしては本コード体系を必須とし、他のローカルコード等を使用する場合はCoding要素の2つ目以降に設定する"
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.<br><br>【JP仕様】<br>[Slicing](http://hl7.org/fhir/profiling.html#slicing)を使用して複数のコード体系に対応<br>基本方針としてカテゴリに応じた標準コードの使用を想定しているが、ローカルコードを使用してもよい"
* code.coding contains
    infectious-agent 0..1 and
    antimicrobial-drug 0..1 and
    jlac10 0..1
//* code.coding[infectious-agent] from $microbiology-infectious-agent (required)
* code.coding[infectious-agent] ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.<br><br>【JP仕様】<br>同定菌名を表現する場合に使用する<br>NeXEHRSで使用を定める標準コードに準じて、JANIS菌名コードを採用する"
//* code.coding[antimicrobial-drug] from $microbiology-antimicrobial-drug (required)
* code.coding[antimicrobial-drug] ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.<br><br>【JP仕様】<br>抗菌薬コードを表現する場合に使用する<br>NeXEHRSで使用を定める標準コードに準じて、JANIS抗菌薬コードを採用する"
* code.coding[jlac10] from $JP_ObservationLabResultCode_VS (required)
* code.coding[jlac10] ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.<br><br>【JP仕様】<br>塗抹結果、培養・同定結果を表現する場合に使用する<br>JLAC10コードを採用する"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.<br><br>【JP仕様】<br>患者（Patientリソース）"
* encounter 1..
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).<br><br>【JP仕様】<br>診察（Encounterリソース）"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.<br><br>【JP仕様】<br>検体採取日"
* value[x] only Quantity or CodeableConcept or string
* value[x] ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below.<br><br>【JP仕様】<br>valueQuantity：同定検査の菌量（定量）、薬剤感受性結果（MIC値）を表現する場合に使用する想定<br>valueCodeableConcept：同定検査の菌種を表現する場合に使用する想定<br>valueString：塗抹結果、培養検査の週数・菌量を表現する場合に使用する想定"
* interpretation ^comment = "Historically used for laboratory results (known as 'abnormal flag' ),  its use extends to other use cases where coded interpretations  are relevant.  Often reported as one or more simple compact codes this element is often placed adjacent to the result value in reports and flow sheets to signal the meaning/normalcy status of the result.<br><br>【JP仕様】<br>薬剤感受性結果（判定）を表現する場合に使用する想定"
* interpretation.coding.system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation" (exactly)
* interpretation.coding.system ^comment = "【JP仕様】<br>[FHIR仕様](http://hl7.org/fhir/v3/ObservationInterpretation/cs.html)で定義されているコード体系を採用"
* hasMember only Reference(JP_Observation_Microbiology)
* hasMember ^comment = "When using this element, an observation will typically have either a value or a set of related resources, although both may be present in some cases.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.  Note that a system may calculate results from [QuestionnaireResponse](questionnaireresponse.html)  into a final score and represent the score as an Observation.<br><br>【JP仕様】<br>本リソースの子となるObservationリソース"