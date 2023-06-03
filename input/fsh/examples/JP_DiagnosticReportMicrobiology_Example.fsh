Instance: jp-diagnosticreport-microbiology-example-1
InstanceOf: JP_DiagnosticReport_Microbiology
Title: "JP Core DiagnosticReport_Microbiology Example 一般細菌検査レポート"
Description: "一般細菌検査レポート"
Usage: #example
* identifier.use = #usual
* identifier.system = "http://abc-hospital.local/fhir/mb/reportid"
* identifier.value = "1234567"
* basedOn = Reference(ServiceRequest/order1)
* status = #final
* category[microbiology] = $JP_DiagnosticReportCategory_CS#LP7819-8 "Microbiology"
* code = $US_Loinc_CS#18725-2 "Microbiology studies"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2021-03-04T08:30:00+11:00"
* issued = "2021-03-04T11:45:33+11:00"
* performer = Reference(Organization/0001-1111) "株式会社ＡＢＣ検査"
* presentedForm.contentType = #application/pdf
* presentedForm.language = #ja-JP
* presentedForm.data = "JVBERi0xLjUNCiW1tbW1DQoxIDAgb2JqDQo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgMiAwIFIvTGFuZyhqYS1KUCkgL1N0cnVjdFRyZWVSb290IDEzIDAgUi9NYXJrSW5mbzw8L01hcmtlZCB0cnVlPj4+Pg0KZW5kb2JqDQoyIDAgb2JqDQo8PC9UeXBlL1BhZ2VzL0NvdW50IDEvS2lkc1sgMyAwIFJdID4+DQplbmRvYmoNCjMgMCBvYmoN"
* presentedForm.title = "検査結果PDFレポート"
* resultsInterpreter = Reference(Practitioner/person1) "検査タロウ"
* specimen = Reference(Specimen/specimen1) "喀痰"
* result[0] = Reference(Observation/Gram_strain1)
* result[+] = Reference(Observation/Gram_strain2)
* result[+] = Reference(Observation/Gram_strain3)
* result[+] = Reference(Observation/Gram_strain4)
* result[+] = Reference(Observation/Organism_panels1)
* result[+] = Reference(Observation/Organism_panels2)
* result[+] = Reference(Observation/Organism_panels3)
* result[+] = Reference(Observation/Organism_panels4)

// ----- 第1階層 ----- //
Instance: Gram_strain1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#Gram-stain "Grams stain"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z1 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義1(白血球)"
* code.text = "白血球"
* valueString = "1+"

Instance: Gram_strain2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#Gram-stain "Grams stain"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z2 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義2(上皮細胞)"
* code.text = "上皮細胞"
* valueString = "少数"

Instance: Gram_strain3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#Gram-stain "Grams stain"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z3 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義3(グラム陽性球菌（GPC）)"
* code.text = "グラム陽性球菌（GPC）"
* valueString = "1+"

Instance: Gram_strain4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#Gram-stain "Grams stain"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z4 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義4(グラム陽性桿菌（GPR）)"
* code.text = "グラム陽性桿菌（GPR）"
* valueString = "少数"

Instance: Organism_panels1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/Organism_Id1)
* hasMember[+] = Reference(Observation/Susceptibility_panels1)

Instance: Organism_panels2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/Organism_Id2)
* hasMember[+] = Reference(Observation/Susceptibility_panels2)

Instance: Organism_panels3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/Organism_Id3)

Instance: Organism_panels4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_VS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/Organism_Id4)

// ----- 第2階層 ----- //
Instance: Organism_Id1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#1303
* code.text = "Staphylococcus aureus (MRSA)"
* valueString = "2+"

Instance: Susceptibility_panels1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-panels "Susceptibility panels"
* code.coding[0] = $JANIS_Kinmei_CODE#1303
* code.text = "Staphylococcus aureus (MRSA)"
* hasMember[0] = Reference(Observation/Susceptibility_measurements1-1)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-2)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-3)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-4)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-5)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-6)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-7)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-8)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-9)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-10)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-11)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-12)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-13)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-14)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-15)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-16)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-17)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-18)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-19)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-20)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-21)
* hasMember[+] = Reference(Observation/Susceptibility_measurements1-22)

Instance: Organism_Id2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#1131
* code.text = "Streptococcus pneumoniae"
* valueString = "1+"

Instance: Susceptibility_panels2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-panels "Susceptibility panels"
* code.coding[0] = $JANIS_Kinmei_CODE#1131
* code.text = "Streptococcus pneumoniae"
* hasMember[0] = Reference(Observation/Susceptibility_measurements2-1)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-2)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-3)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-4)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-5)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-6)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-7)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-8)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-9)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-10)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-11)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-12)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-13)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-14)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-15)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-16)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-17)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-18)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-19)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-20)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-21)
* hasMember[+] = Reference(Observation/Susceptibility_measurements2-22)

Instance: Organism_Id3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#1101
* code.text = "α-Streptococcus"
* valueString = "1+"

Instance: Organism_Id4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#6000
* code.text = "Corynebacterium sp."
* valueString = "少数"

// ----- 第3階層 ----- //
Instance: Susceptibility_measurements1-1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1201 "ベンジルペニシリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1216 "アンピシリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1281 "スルバクタム・アンピシリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1266 "ピペラシリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-5
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1821 "ゲンタマイシン"
* interpretation = #R "Resistant"

Instance: Susceptibility_measurements1-6
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1816 "アミカシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-7
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1871 "アルベカシン"
* interpretation = #S "Susceptible"

Instance: Susceptibility_measurements1-8
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2121 "ミノサイクリン"
* interpretation = #R "Resistant"

Instance: Susceptibility_measurements1-9
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1901 "エリスロマイシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-10
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1941 "アジスロマイシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-11
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1537 "セファゾリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-12
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1546 "セフォチアム"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-13
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1656 "セフトリアキソン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-14
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1701 "フロモキセフ"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-15
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1661 "セフタジジム"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-16
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1596 "セフカペン・ピボキシル"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-17
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2006 "クリンダマイシン"
* interpretation = #R "Resistant"

Instance: Susceptibility_measurements1-18
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2516 "レボフロキサシン"
* interpretation = #R "Resistant"

Instance: Susceptibility_measurements1-19
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2601 "ホスホマイシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-20
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1401 "イミペネム・シラスタチン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-21
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1411 "メロペネム"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements1-22
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2301 "バンコマイシン"
* interpretation = #S "Susceptible"

Instance: Susceptibility_measurements2-1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1201 "ベンジルペニシリン"
* interpretation = #S "Susceptible"

Instance: Susceptibility_measurements2-2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1216 "アンピシリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1281 "スルバクタム・アンピシリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1266 "ピペラシリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-5
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1821 "ゲンタマイシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-6
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1816 "アミカシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-7
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1871 "アルベカシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-8
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2121 "ミノサイクリン"
* interpretation = #R "Resistant"

Instance: Susceptibility_measurements2-9
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1901 "エリスロマイシン"
* interpretation = #R "Resistant"

Instance: Susceptibility_measurements2-10
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1941 "アジスロマイシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-11
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1537 "セファゾリン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-12
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1546 "セフォチアム"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-13
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1656 "セフトリアキソン"
* interpretation = #S "Susceptible"

Instance: Susceptibility_measurements2-14
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1701 "フロモキセフ"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-15
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1661 "セフタジジム"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-16
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1596 "セフカペン・ピボキシル"
* interpretation = #S "Susceptible"

Instance: Susceptibility_measurements2-17
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2006 "クリンダマイシン"
* interpretation = #R "Resistant"

Instance: Susceptibility_measurements2-18
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2516 "レボフロキサシン"
* interpretation = #S "Susceptible"

Instance: Susceptibility_measurements2-19
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2601 "ホスホマイシン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-20
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1401 "イミペネム・シラスタチン"
* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#I "Intermediate"

Instance: Susceptibility_measurements2-21
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1411 "メロペネム"
* interpretation = #S "Susceptible"

Instance: Susceptibility_measurements2-22
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2301 "バンコマイシン"
* interpretation = #S "Susceptible"