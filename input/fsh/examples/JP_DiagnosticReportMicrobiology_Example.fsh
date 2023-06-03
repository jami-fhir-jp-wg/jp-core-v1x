Instance: jp-diagnosticreport-microbiology-example-1
InstanceOf: JP_DiagnosticReport_Microbiology
Title: "JP Core DiagnosticReport_Microbiology Example 一般細菌検査レポート"
Description: "一般細菌検査レポート"
Usage: #example
* contained[+] = gram-strain1
* contained[+] = gram-strain2
* contained[+] = gram-strain3
* contained[+] = gram-strain4
* contained[+] = organism-panels1
* contained[+] = organism-panels2
* contained[+] = organism-panels3
* contained[+] = organism-panels4
* contained[+] = susceptibility-measurements1-1
* contained[+] = susceptibility-measurements1-2
* contained[+] = susceptibility-measurements1-3
* contained[+] = susceptibility-measurements1-4
* contained[+] = susceptibility-measurements1-5
* contained[+] = susceptibility-measurements1-6
* contained[+] = susceptibility-measurements1-7
* contained[+] = susceptibility-measurements1-8
* contained[+] = susceptibility-measurements1-9
* contained[+] = susceptibility-measurements1-10
* contained[+] = susceptibility-measurements1-11
* contained[+] = susceptibility-measurements1-12
* contained[+] = susceptibility-measurements1-13
* contained[+] = susceptibility-measurements1-14
* contained[+] = susceptibility-measurements1-15
* contained[+] = susceptibility-measurements1-16
* contained[+] = susceptibility-measurements1-17
* contained[+] = susceptibility-measurements1-18
* contained[+] = susceptibility-measurements1-19
* contained[+] = susceptibility-measurements1-20
* contained[+] = susceptibility-measurements1-21
* contained[+] = susceptibility-measurements1-22
* contained[+] = susceptibility-measurements2-1
* contained[+] = susceptibility-measurements2-2
* contained[+] = susceptibility-measurements2-3
* contained[+] = susceptibility-measurements2-4
* contained[+] = susceptibility-measurements2-5
* contained[+] = susceptibility-measurements2-6
* contained[+] = susceptibility-measurements2-7
* contained[+] = susceptibility-measurements2-8
* contained[+] = susceptibility-measurements2-9
* contained[+] = susceptibility-measurements2-10
* contained[+] = susceptibility-measurements2-11
* contained[+] = susceptibility-measurements2-12
* contained[+] = susceptibility-measurements2-13
* contained[+] = susceptibility-measurements2-14
* contained[+] = susceptibility-measurements2-15
* contained[+] = susceptibility-measurements2-16
* contained[+] = susceptibility-measurements2-17
* contained[+] = susceptibility-measurements2-18
* contained[+] = susceptibility-measurements2-19
* contained[+] = susceptibility-measurements2-20
* contained[+] = susceptibility-measurements2-21
* contained[+] = susceptibility-measurements2-22
* contained[+] = organism-id1
* contained[+] = organism-id2
* contained[+] = organism-id3
* contained[+] = organism-id4
* contained[+] = susceptibility-panels1
* contained[+] = susceptibility-panels2
* identifier.use = #usual
* identifier.system = "http://abc-hospital.local/fhir/mb/reportid"
* identifier.value = "1234567"
* basedOn = Reference(ServiceRequest/jp-servicerequest-example-1)
* status = #final
* category[microbiology] = $US_Loinc_CS#LP7819-8 "微生物検査"
* code = $US_Loinc_CS#18725-2 "Microbiology studies"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2021-03-04T08:30:00+11:00"
* issued = "2021-03-04T11:45:33+11:00"
* performer = Reference(Organization/jp-organization-example-inspection) "株式会社ＡＢＣ検査"
* presentedForm.contentType = #application/pdf
* presentedForm.language = #ja-JP
* presentedForm.data = "JVBERi0xLjUNCiW1tbW1DQoxIDAgb2JqDQo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgMiAwIFIvTGFuZyhqYS1KUCkgL1N0cnVjdFRyZWVSb290IDEzIDAgUi9NYXJrSW5mbzw8L01hcmtlZCB0cnVlPj4+Pg0KZW5kb2JqDQoyIDAgb2JqDQo8PC9UeXBlL1BhZ2VzL0NvdW50IDEvS2lkc1sgMyAwIFJdID4+DQplbmRvYmoNCjMgMCBvYmoN"
* presentedForm.title = "検査結果PDFレポート"
* resultsInterpreter = Reference(Practitioner/jp-practitioner-example-female-1) "福岡 花子"
* specimen = Reference(Specimen/jp-specimen-example-3) "喀痰"
* result[0] = Reference(Observation/gram-strain1)
* result[+] = Reference(Observation/gram-strain2)
* result[+] = Reference(Observation/gram-strain3)
* result[+] = Reference(Observation/gram-strain4)
* result[+] = Reference(Observation/organism-panels1)
* result[+] = Reference(Observation/organism-panels2)
* result[+] = Reference(Observation/organism-panels3)
* result[+] = Reference(Observation/organism-panels4)

// ----- 第1階層 ----- //
Instance: gram-strain1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#gram-stain "Gram stain"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z1 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義1(白血球)"
* code.text = "白血球"
* valueString = "1+"

Instance: gram-strain2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#gram-stain "Gram stain"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z2 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義2(上皮細胞)"
* code.text = "上皮細胞"
* valueString = "少数"

Instance: gram-strain3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#gram-stain "Gram stain"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z3 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義3(グラム陽性球菌（GPC）)"
* code.text = "グラム陽性球菌（GPC）"
* valueString = "1+"

Instance: gram-strain4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#gram-stain "Gram stain"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6A010000006170449 "塗抹鏡検(一般細菌)"
* code.coding[+] = urn:EXAMPLE_LOCAL_CODE#6A0100000061704Z4 "塗抹鏡検(一般細菌)_喀痰_グラム染色_ユーザ定義4(グラム陽性桿菌（GPR）)"
* code.text = "グラム陽性桿菌（GPR）"
* valueString = "少数"

Instance: organism-panels1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/organism-id1)
* hasMember[+] = Reference(Observation/susceptibility-panels1)

Instance: organism-panels2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/organism-id2)
* hasMember[+] = Reference(Observation/susceptibility-panels2)

Instance: organism-panels3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/organism-id3)

Instance: organism-panels4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism-panels "Organism panels"
* code.coding[0] = $JP_ObservationLabResultCode_CS#6B010000006174149 "培養同定(一般細菌)"
* code.text = "培養同定(一般細菌)"
* hasMember[0] = Reference(Observation/organism-id4)

// ----- 第2階層 ----- //
Instance: organism-id1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#1303
* code.text = "Staphylococcus aureus (MRSA)"
* valueString = "2+"

Instance: susceptibility-panels1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-panels "Susceptibility panels"
* code.coding[0] = $JANIS_Kinmei_CODE#1303
* code.text = "Staphylococcus aureus (MRSA)"
* hasMember[0] = Reference(Observation/susceptibility-measurements1-1)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-2)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-3)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-4)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-5)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-6)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-7)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-8)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-9)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-10)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-11)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-12)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-13)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-14)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-15)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-16)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-17)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-18)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-19)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-20)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-21)
* hasMember[+] = Reference(Observation/susceptibility-measurements1-22)

Instance: organism-id2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#1131
* code.text = "Streptococcus pneumoniae"
* valueString = "1+"

Instance: susceptibility-panels2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-panels "Susceptibility panels"
* code.coding[0] = $JANIS_Kinmei_CODE#1131
* code.text = "Streptococcus pneumoniae"
* hasMember[0] = Reference(Observation/susceptibility-measurements2-1)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-2)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-3)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-4)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-5)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-6)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-7)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-8)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-9)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-10)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-11)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-12)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-13)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-14)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-15)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-16)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-17)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-18)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-19)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-20)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-21)
* hasMember[+] = Reference(Observation/susceptibility-measurements2-22)

Instance: organism-id3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#1101
* code.text = "α-Streptococcus"
* valueString = "1+"

Instance: organism-id4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#organism "Organism"
* code.coding[0] = $JANIS_Kinmei_CODE#6000
* code.text = "Corynebacterium sp."
* valueString = "少数"

// ----- 第3階層 ----- //
Instance: susceptibility-measurements1-1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1201 "ベンジルペニシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1216 "アンピシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1281 "スルバクタム・アンピシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1266 "ピペラシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-5
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1821 "ゲンタマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#R "Resistant"

Instance: susceptibility-measurements1-6
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1816 "アミカシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-7
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1871 "アルベカシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"

Instance: susceptibility-measurements1-8
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2121 "ミノサイクリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#R "Resistant"

Instance: susceptibility-measurements1-9
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1901 "エリスロマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-10
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1941 "アジスロマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-11
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1537 "セファゾリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-12
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1546 "セフォチアム"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-13
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1656 "セフトリアキソン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-14
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1701 "フロモキセフ"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-15
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1661 "セフタジジム"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-16
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1596 "セフカペン・ピボキシル"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-17
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2006 "クリンダマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#R "Resistant"

Instance: susceptibility-measurements1-18
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2516 "レボフロキサシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#R "Resistant"

Instance: susceptibility-measurements1-19
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2601 "ホスホマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-20
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1401 "イミペネム・シラスタチン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-21
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1411 "メロペネム"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements1-22
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2301 "バンコマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"

Instance: susceptibility-measurements2-1
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1201 "ベンジルペニシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"

Instance: susceptibility-measurements2-2
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1216 "アンピシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-3
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1281 "スルバクタム・アンピシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-4
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1266 "ピペラシリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-5
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1821 "ゲンタマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-6
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1816 "アミカシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-7
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1871 "アルベカシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-8
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2121 "ミノサイクリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#R "Resistant"

Instance: susceptibility-measurements2-9
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1901 "エリスロマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#R "Resistant"

Instance: susceptibility-measurements2-10
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1941 "アジスロマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-11
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1537 "セファゾリン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-12
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1546 "セフォチアム"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-13
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1656 "セフトリアキソン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"

Instance: susceptibility-measurements2-14
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1701 "フロモキセフ"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-15
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1661 "セフタジジム"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-16
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1596 "セフカペン・ピボキシル"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"

Instance: susceptibility-measurements2-17
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2006 "クリンダマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#R "Resistant"

Instance: susceptibility-measurements2-18
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2516 "レボフロキサシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"

Instance: susceptibility-measurements2-19
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2601 "ホスホマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-20
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1401 "イミペネム・シラスタチン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#I "Intermediate"

Instance: susceptibility-measurements2-21
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#1411 "メロペネム"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"

Instance: susceptibility-measurements2-22
InstanceOf: JP_Observation_Microbiology
Usage: #inline
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#laboratory "Laboratory"
* category[+] = $US_Loinc_CS#18725-2 "Microbiology studies"
* category[+] = $JP_MicrobiologyCategory_CS#susceptibility-measurements "Susceptibility measurements"
* code.coding[0] = $AntiMicrobialDrug_CODE#2301 "バンコマイシン"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#S "Susceptible"