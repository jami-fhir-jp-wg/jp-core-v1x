Profile: JP_Observation_Microbiology
Parent: JP_Observation_Common
Id: jp-observation-microbiology
Title: "JP Core Observation Microbiology Profile"
Description: "このプロファイルはObservationリソースに対して、微生物学検査のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Microbiology"
* ^status = #active
* ^date = "2024-11-18"
* insert SetDefinition(identifier, 当該検査項目に対し施設内で割り振られる一意の識別子があればこれを使用する)
* insert SetDefinition(basedOn, このObservationが実施されることになった依頼や計画／提案に関する情報、オーダ情報（ServiceRequest）)
* basedOn only Reference(ServiceRequest)
* basedOn ^comment = "【JP Core仕様】オーダ情報（ServiceRequestリソース）"
* insert SetDefinition(partOf, このObservationが親イベントの一部を成す要素であるときこの親イベントに関する情報、未使用)
* status 1..1
* category 1..
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains
    laboratory 1..1 and
    microbiology 1..1 and
    microbiologyCategory ..1
* category ^comment = "【JP Core仕様】日本では適切なコード体系が存在しないため、独自のバリューセットを定義する  
JP CoreとしてはsimpleObservationコード体系を必須とし、他のローカルコード等を使用する場合はCategory要素の2つ目以降に設定する"
* insert SetDefinition(category[laboratory], このObservationに関する分類（JP_SimpleObservationCategory_VS）、必須項目)
* category[laboratory] from JP_SimpleObservationCategory_VS (required)
* category[laboratory].coding.system = $JP_SimpleObservationCategory_CS (exactly)
* category[laboratory].coding.code 1..
* category[laboratory].coding.code = $JP_SimpleObservationCategory_CS#laboratory (exactly)

* insert SetDefinition(category[microbiology], このObservationに関するLOINC上の分類、任意項目)
* category[microbiology] from $JP_ObservationCategory_Microbiology_VS (preferred)
* category[microbiology].coding.system = $Loinc_CS (exactly)
* category[microbiology].coding.code 1..
* category[microbiology].coding.code = $Loinc_CS#18725-2 (exactly)
* category[microbiology].coding.display = "Microbiology studies (set)"

* insert SetDefinition(category[microbiologyCategory], このObservationに関する詳細分類、JP_MicrobiologyCategory_VSより選択する、任意項目)
* category[microbiologyCategory] from $JP_MicrobiologyCategory_VS (required)
* category[microbiologyCategory].coding.system = $JP_MicrobiologyCategory_CS (exactly)

* code 1..
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains
    infectious-agent ..1 and
    antimicrobial-drug ..1 and
    jlac10 ..1
* insert SetDefinition(code.coding, このObservationの対象を特定するコード)
* code.coding ^comment = "【JP Core仕様】[Slicing](http://hl7.org/fhir/R4/profiling.html#slicing)を使用して複数のコード体系に対応  
基本方針としてカテゴリに応じた標準コードの使用を想定しているが、ローカルコードを使用してもよい"
* code.coding[infectious-agent] from $JP_Microbiology_InfectiousAgent_VS (required)
* code.coding[infectious-agent].system = $JP_Microbiology_InfectiousAgent_CS (exactly)
* insert SetDefinition(code.coding[infectious-agent], 同定菌名を表現する場合に使用するコード、JANIS菌名コードを利用)
* code.coding[infectious-agent] ^comment = "【JP Core仕様】同定菌名を表現する場合に使用する  
NeXEHRSで使用を定める標準コードに準じて、JANIS菌名コードを採用する"

* code.coding[antimicrobial-drug] from $JP_Microbiology_AntiMicrobialDrug_VS (required)
* code.coding[antimicrobial-drug].system = $JP_Microbiology_AntiMicrobialDrug_CS (exactly)
* insert SetDefinition(code.coding[antimicrobial-drug], 抗菌薬コードを表現する場合に使用するコード、JANIS抗菌薬コードを利用)
* code.coding[antimicrobial-drug] ^definition = "抗菌薬コードを表現する場合に使用するコード、JANIS抗菌薬コードを利用"
* code.coding[antimicrobial-drug] ^comment = "【JP Core仕様】抗菌薬コードを表現する場合に使用する  
NeXEHRSで使用を定める標準コードに準じて、JANIS抗菌薬コードを採用する"

* code.coding[jlac10] from $JP_ObservationLabResultCode_VS (required)
* code.coding[jlac10].system = $JP_ObservationLabResultCode_CS (exactly)
* insert SetDefinition(code.coding[jlac10], 塗抹結果、培養・同定結果を表現する場合に使用するコード、JLAC10を利用)
* code.coding[jlac10] ^comment = "【JP Core仕様】塗抹結果、培養・同定結果を表現する場合に使用する  
JLAC10コードを採用する"

* subject 1..
* subject only Reference(JP_Patient)
* effective[x] only dateTime or Period
* insert SetDefinition(effective[x], 取得された結果が臨床的に確定された日時、検体採取日)
* effective[x] ^comment = "【JP Core仕様】検体採取日"
* value[x] only Quantity or CodeableConcept or string
* insert SetDefinition(value[x], 検査によって得られた値を格納する)
* value[x] ^comment = "【JP Core仕様】valueQuantity：同定検査の菌量（定量）、薬剤感受性結果（MIC値）を表現する場合に使用する想定  
valueCodeableConcept ： 同定検査の菌種を表現する場合に使用する想定  
valueString ： 塗抹結果、培養検査の週数・菌量を表現する場合に使用する想定"
* insert SetDefinition(interpretation, 高、低、正常、High、low、 normal等、薬剤感受性結果（判定）を表現する場合に使用)
* interpretation ^comment = "【JP Core仕様】薬剤感受性結果（判定）を表現する場合に使用する想定"
* hasMember only Reference(JP_Observation_Microbiology)
