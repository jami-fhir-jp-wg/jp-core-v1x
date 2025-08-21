// ==============================
//   Profile 定義
// ==============================
Profile: JP_Specimen_Pathology
Parent: JP_Specimen_Common
Id: jp-specimen-pathology
Title: "JP Core Specimen Pathology Profile"
Description: "このプロファイルはSpecimenリソースに対して、病理検査で使用される検体情報を送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Specimen_Pathology"
* ^status = #active
* ^date = "2025-01-15"
* . ^short = "病理検査で使用される検体に関する情報。"
* . ^definition = "病理検査で使用される検体に関する情報。"
* identifier MS
* identifier ^short = "検体番号、ブロック番号、標本番号等の識別子。【詳細参照】"
* identifier ^definition = "検体番号、ブロック番号、標本番号等の識別子。"
* identifier ^comment = "病理部門で管理される各種番号を格納する。"
* accessionIdentifier MS
* accessionIdentifier ^short = "病理受付番号。【詳細参照】"
* accessionIdentifier ^definition = "病理受付番号。"
* accessionIdentifier ^comment = "病理部門で検体を受け付けた際に付与される番号。"
* status MS
* status ^short = "検体の状態。【詳細参照】"
* status ^definition = "検体の状態。"
* status ^comment = "available（利用可能）、unavailable（利用不可）等を指定。"
* type MS
* type from JP_SpecimenType_VS (extensible)
* type ^short = "検体の種類。【詳細参照】"
* type ^definition = "検体の種類。"
* type ^comment = "生検、手術材料、細胞診等を示すコードを使用。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^short = "検体の提供者（患者）。"
* subject ^definition = "検体の提供者（患者）。"
* receivedTime MS
* receivedTime ^short = "病理部門での検体受付日時。【詳細参照】"
* receivedTime ^definition = "病理部門での検体受付日時。"
* receivedTime ^comment = "病理部門で検体を受け付けた日時を記録。"
* parent ^short = "親検体の参照。【詳細参照】"
* parent ^definition = "親検体の参照。"
* parent ^comment = "ブロックから切片を作成した場合等、親となる検体を参照。"
* request only Reference(ServiceRequest)
* request ^short = "この検体に関連する検査依頼。"
* request ^definition = "この検体に関連する検査依頼。"
* collection MS
* collection ^short = "検体採取に関する情報。"
* collection ^definition = "検体採取に関する情報。"
* collection.collector only Reference(JP_Practitioner or JP_PractitionerRole)
* collection.collector ^short = "検体採取者。"
* collection.collector ^definition = "検体採取者。"
* collection.collected[x] MS
* collection.collected[x] ^short = "検体採取日時。"
* collection.collected[x] ^definition = "検体採取日時。"
* collection.duration ^short = "検体採取期間。"
* collection.duration ^definition = "検体採取期間。"
* collection.quantity ^short = "採取量。"
* collection.quantity ^definition = "採取量。"
* collection.method MS
* collection.method from JP_SpecimenCollectionMethod_VS (extensible)
* collection.method ^short = "採取方法。【詳細参照】"
* collection.method ^definition = "採取方法。"
* collection.method ^comment = "生検、切除、穿刺等の採取方法を示す。"
* collection.bodySite MS
* collection.bodySite ^short = "採取部位。【詳細参照】"
* collection.bodySite ^definition = "採取部位。"
* collection.bodySite ^comment = "解剖学的な採取部位を示す。"
* collection.fastingStatus[x] ^short = "絶食状態。"
* collection.fastingStatus[x] ^definition = "絶食状態。"
* processing MS
* processing ^short = "検体処理に関する情報。【詳細参照】"
* processing ^definition = "検体処理に関する情報。"
* processing ^comment = "固定、包埋、薄切等の処理情報を記録。"
* processing.description MS
* processing.description ^short = "処理の説明。【詳細参照】"
* processing.description ^definition = "処理の説明。"
* processing.description ^comment = "固定液の種類、固定時間、染色方法等を記載。"
* processing.procedure MS
* processing.procedure from JP_SpecimenProcessingProcedure_VS (extensible)
* processing.procedure ^short = "処理手順。【詳細参照】"
* processing.procedure ^definition = "処理手順。"
* processing.procedure ^comment = "固定、脱灰、包埋、薄切、染色等の処理を示すコード。"
* processing.additive ^short = "添加物。【詳細参照】"
* processing.additive ^definition = "添加物。"
* processing.additive ^comment = "固定液等の添加物を参照。"
* processing.time[x] MS
* processing.time[x] ^short = "処理日時。"
* processing.time[x] ^definition = "処理日時。"
* container MS
* container ^short = "検体容器に関する情報。"
* container ^definition = "検体容器に関する情報。"
* container.identifier ^short = "容器の識別子。"
* container.identifier ^definition = "容器の識別子。"
* container.description ^short = "容器の説明。"
* container.description ^definition = "容器の説明。"
* container.type ^short = "容器の種類。"
* container.type ^definition = "容器の種類。"
* container.capacity ^short = "容器の容量。"
* container.capacity ^definition = "容器の容量。"
* container.specimenQuantity ^short = "容器内の検体量。"
* container.specimenQuantity ^definition = "容器内の検体量。"
* container.additive[x] ^short = "容器内の添加物。【詳細参照】"
* container.additive[x] ^definition = "容器内の添加物。"
* container.additive[x] ^comment = "固定液等を示す。"
* condition ^short = "検体の状態。"
* condition ^definition = "検体の状態。"
* note MS
* note ^short = "検体に関する追加情報。【詳細参照】"
* note ^definition = "検体に関する追加情報。"
* note ^comment = "臨床情報、特記事項等を記載。"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_Specimen_Pathology_BlockNumber
Parent: Extension
Id: jp-specimen-pathology-blocknumber
Title: "JP Core Specimen Pathology Block Number Extension"
Description: "病理ブロック番号を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_BlockNumber"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "Specimen"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_BlockNumber" (exactly)
* value[x] only string
* value[x] ^short = "ブロック番号"
* value[x] ^definition = "病理検体のブロック番号"

Extension: JP_Specimen_Pathology_SlideNumber
Parent: Extension
Id: jp-specimen-pathology-slidenumber
Title: "JP Core Specimen Pathology Slide Number Extension"
Description: "病理標本番号（スライド番号）を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_SlideNumber"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "Specimen"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_SlideNumber" (exactly)
* value[x] only string
* value[x] ^short = "標本番号"
* value[x] ^definition = "病理標本のスライド番号"

Extension: JP_Specimen_Pathology_StainMethod
Parent: Extension
Id: jp-specimen-pathology-stainmethod
Title: "JP Core Specimen Pathology Stain Method Extension"
Description: "染色方法を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_StainMethod"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "Specimen.processing"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_StainMethod" (exactly)
* value[x] only CodeableConcept
* value[x] from JP_PathologyStainMethod_VS (extensible)
* value[x] ^short = "染色方法"
* value[x] ^definition = "病理標本の染色方法"