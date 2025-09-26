// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_SpecimenType_VS
Id: jp-specimentype-vs
Title: "JP Core Specimen Type ValueSet"
Description: "病理検体の種類を表すコードの値セット"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_SpecimenType_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* $SnomedCT_CS#309049000 "Biopsy specimen (specimen)"
* $SnomedCT_CS#309051001 "Surgical specimen (specimen)"
* $SnomedCT_CS#309201001 "Cytology specimen (specimen)"
* $SnomedCT_CS#399492000 "Tissue specimen from breast (specimen)"
* $SnomedCT_CS#309079007 "Gastrointestinal biopsy specimen (specimen)"
* $SnomedCT_CS#122571007 "Bone marrow specimen (specimen)"
* $SnomedCT_CS#258603007 "Specimen from respiratory system (specimen)"

ValueSet: JP_SpecimenCollectionMethod_VS
Id: jp-specimencollectionmethod-vs
Title: "JP Core Specimen Collection Method ValueSet"
Description: "病理検体の採取方法を表すコードの値セット"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_SpecimenCollectionMethod_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* $SnomedCT_CS#129300006 "Biopsy - action (qualifier value)"
* $SnomedCT_CS#129314008 "Excision - action (qualifier value)"
* $SnomedCT_CS#129323009 "Aspiration - action (qualifier value)"
* $SnomedCT_CS#129256008 "Resection - action (qualifier value)"
* $SnomedCT_CS#439339004 "Endoscopic biopsy (procedure)"
* $SnomedCT_CS#90199006 "Transbronchial biopsy (procedure)"
* $SnomedCT_CS#287854007 "Fine needle aspiration biopsy (procedure)"

ValueSet: JP_SpecimenProcessingProcedure_VS
Id: jp-specimenprocessingprocedure-vs
Title: "JP Core Specimen Processing Procedure ValueSet"
Description: "病理検体の処理手順を表すコードの値セット"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_SpecimenProcessingProcedure_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* $SnomedCT_CS#430864009 "Tissue fixation (procedure)"
* $SnomedCT_CS#433466003 "Embedding in paraffin wax (procedure)"
* $SnomedCT_CS#434164005 "Sectioning of tissue specimen (procedure)"
* $SnomedCT_CS#104210008 "Staining method (procedure)"
* $SnomedCT_CS#385808003 "Decalcification procedure (procedure)"
* $SnomedCT_CS#434472006 "Immunohistochemistry staining method (procedure)"

ValueSet: JP_PathologyStainMethod_VS
Id: jp-pathologystainmethod-vs
Title: "JP Core Pathology Stain Method ValueSet"
Description: "病理染色方法を表すコードの値セット"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_PathologyStainMethod_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* include codes from system JP_PathologyStainMethod_CS

// ==============================
//   CodeSystem 定義
// ==============================
CodeSystem: JP_PathologyStainMethod_CS
Id: jp-pathologystainmethod-cs
Title: "JP Core Pathology Stain Method CodeSystem"
Description: "病理染色方法のコードシステム"
* ^url = "http://jpfhir.jp/fhir/core/CodeSystem/JP_PathologyStainMethod_CS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* ^caseSensitive = true
* ^content = #complete
* #HE "Hematoxylin and Eosin stain" "ヘマトキシリン・エオジン染色"
* #PAS "Periodic acid-Schiff stain" "PAS染色"
* #EVG "Elastica van Gieson stain" "エラスチカ・ワンギーソン染色"
* #MT "Masson's trichrome stain" "マッソン・トリクローム染色"
* #PAM "Periodic acid-methenamine silver stain" "PAM染色"
* #Grocott "Grocott's methenamine silver stain" "グロコット染色"
* #ZN "Ziehl-Neelsen stain" "チール・ネールゼン染色"
* #KB "Kinyoun stain" "キニヨン染色"
* #Giemsa "Giemsa stain" "ギムザ染色"
* #Papanicolaou "Papanicolaou stain" "パパニコロウ染色"
* #IHC "Immunohistochemistry" "免疫組織化学染色"