Instance: jp-department-ssmix-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Department_SsMix_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core Department SsMix NamingSystem JAMI SSMIX2診療科コード表"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200250.2.2.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200250.2.2.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Department_SsMix_CS
* uniqueId[=].preferred = true

Instance: jp-medicationusagejami-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationUsageJAMI_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP MedicationUsage JAMI NamingSystem JAMI用法コード表ー１６桁バージョン"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200250.2.2.20.20"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200250.2.2.20.20"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationUsageJAMI_CS
* uniqueId[=].preferred = true

Instance: jp-medicationusagejamiadditional-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationUsageJAMIAdditional_NamingSystem JAMI用法コード表ー８桁補足用法コード"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationUsage JAMI Additional NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200250.2.2.20.22"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200250.2.2.20.22"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationUsageJAMIAdditional_CS
* uniqueId[=].preferred = true

// JAMI 用法コード
Instance: jp-medicationmethodjamibasicusage-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationMethodJAMIBasicUsage_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationMethod JAMI BasicUsage NamingSystem JAMI用法コード表ー基本用法コード１桁"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200250.2.2.20.30"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200250.2.2.20.30"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationMethodJAMIBasicUsage_CS
* uniqueId[=].preferred = true

Instance: jp-medicationbodysitejamiexternal-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationBodySiteJAMIExternal_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core Medication BodySite JAMI External NamingSystem JAMI用法コード表ー外用部位コード表３桁"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200250.2.2.20.32"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200250.2.2.20.32"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationBodySiteJAMIExternal_CS
* uniqueId[=].preferred = true

// MEDIS病名マスタ
Instance: jp-medis-master-disease-keynumber-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MEDIS_Master_Disease_KeyNumber_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP MEDIS Master Disease KeyNumber NamingSystem MEDIS 病名マスタ 病名管理番号 NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.101.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.101.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Disease_MEDIS_ManagementID_CS
* uniqueId[=].preferred = true

Instance: jp-medis-master-disease-excode-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MEDIS_Master_Disease_ExCode_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP MEDIS Master Disease ExCode NamingSystem MEDIS 病名マスタ 病名交換用コード"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.101.6"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.101.6"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Disease_MEDIS_Concept_CS
* uniqueId[=].preferred = true

Instance: jp-medis-master-disease-modkeynumber-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MEDIS_Master_Disease_ModKeyNumber_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP MEDIS Master Disease ModKeyNumber NamingSystem MEDIS 病名マスタ 修飾語管理番号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.201.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.201.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Modifier_MEDIS_ManagementID_CS
* uniqueId[=].preferred = true

Instance: jp-medis-master-disease-modExCode-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MEDIS_Master_Disease_ModExCode_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP MEDIS Master Disease ModExCode NamingSystem MEDIS 病名マスタ 修飾語交換用コード"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.201.5"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.201.5"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Modifier_MEDIS_Concept_CS
* uniqueId[=].preferred = true

// HOTコード
Instance: jp-medis-medicationcodehot13-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MEDIS_MedicationCodeHOT13_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationCode HOT13 NamingSystem MEDIS　医薬品基準番号（ＨＯＴ１３）"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.402.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.402.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationCodeHOT13_CS
* uniqueId[=].preferred = true

Instance: medis-medicationcodehot9-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MEDIS_MedicationCodeHOT9_NamingSystem MEDIS　医薬品基準番号（ＨＯＴ９）"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationCode HOT9 NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.403.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.403.1"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.2.74"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.2.74"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationCodeHOT9_CS
* uniqueId[=].preferred = true

Instance: medis-medicationcodehot7-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MEDIS_MedicationCodeHOT7_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationCode HOT7 NamingSystem　MEDISー医薬品処方用番号（ＨＯＴ７）"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.403.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.403.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationCodeHOT7_CS
* uniqueId[=].preferred = true

//検査
Instance: jp-medis-observation-jlac10-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MEDIS_Observation_JLAC10_CodeSystem"
* status = #active
* date = "2023-10-31"
* kind = #codesystem
* description = "JP Core Observation JLAC10 NamingSystem MEDISー臨床検査コードまとめ表「17桁コード表」"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.504"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.504"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_ObservationLabResultCode_CS
* uniqueId[=].preferred = true

// MEDIS看護
Instance: medis-master-nursingobservationkeycode-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MEDIS_Master_NursingObservation_KeyCode_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "MEDIS 看護観察テーブル（観察名称管理番号（コード）） NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.804"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.804"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_ObservationVitalSignsCode_CS
* uniqueId[=].preferred = true

// 注射関連
Instance: jp-medicationingredientstrengthstrengthtype-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationIngredientStrengthStrengthType_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core Medication IngredientStrength StrengthType NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.2.22"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.2.22"
* uniqueId[+].type = #uri
* uniqueId[=].value =  $JP_MedicationIngredientStrengthStrengthType_CS
* uniqueId[=].preferred = true

Instance: jp-medicationmethodjamidetailusage-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationMethodJAMIDetailUsage_NamingSystem JAMI用法コード表ー投与経路区分コード２桁（基本用法コード１桁と詳細区分コード１桁を連結）"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationMethod JAMI DetailUsage NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200250.2.2.20.40"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200250.2.2.20.40"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationMethodJAMIDetailUsage_CS
* uniqueId[=].preferred = true

Instance: jp-medicationsubstitutionnotallowedreason-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationSubstitutionNotAllowedReason_NamingSystem"
* status = #active
* date = "2023-11-18"
* kind = #codesystem
* description = "JP Core MedicationSubstitution NotAllowedReason NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.2.41"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.2.41"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationSubstitutionNotAllowedReason_CS
* uniqueId[=].preferred = true


Instance: jp-insuredpersoncategory-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_InsuredPersonCategory_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core InsuredPersonCategory NamingSystem 被保険者区分コード	NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.2.51"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.2.51"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_InsuredPersonCategory_CS
* uniqueId[=].preferred = true

Instance: jp-medicationcodeyj-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationCodeYJ_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationCode YJ NamingSystem 個別医薬品コード（YJ コード）リスト"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.1.73"
                     //1.2.392.100495.20.2.73
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.1.73"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationCodeYJ_CS
* uniqueId[=].preferred = true

Instance: jp-medicationcodecommon-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationCodeCommon_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationCode Common NamingSystem 一般名処方マスタ"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.1.81"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.1.81"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationCodeCommon_CS
* uniqueId[=].preferred = true


Instance: jp-medicationunitmerit9-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationUnitMERIT9_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicationUnit MERIT9 NamingSystem 医薬品単位略号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.2.101"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.2.101"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationUnitMERIT9_CS
* uniqueId[=].preferred = true

Instance: jp-prefecturenumber-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_PrefectureNumber_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core PrefectureNumber NamingSystem 都道府県番号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.21"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.21"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_PrefectureNumber_CS
* uniqueId[=].preferred = true


Instance: jp-medicalfeescoretype-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicalFeeScoreType_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #codesystem
* description = "JP Core MedicalFeeScoreType NamingSystem 点数表番号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.22"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.22"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicalFeeScoreType_CS
* uniqueId[=].preferred = true

Instance: jp-medical-organizationid-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Medical_OrganizationID_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #IdSystem
* description = "JP Core MedicalOrganizationID NamingSystem 保険医療機関コード（７桁）"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.23"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.23"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_IdSystem_MedicalOrganizationID
* uniqueId[=].preferred = true

Instance: jp-medical-registration-number-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Medical_Registration_Number_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #IdSystem
* description = "JP Core Medical Registration Number NamingSystem 医籍登録番号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.31"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.31"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_IdSystemMedicalRegistrationNumber
* uniqueId[=].preferred = true

Instance: jp-insurer-number-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Insurer_Number_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #IdSystem
* description = "JP Core Insurer Number NamingSystem 保険者番号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.61"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.61"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_IdSystem_InsurerNumber
* uniqueId[=].preferred = true


Instance: jp-insured-person-symbol-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Insured_Person_Symbol_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #IdSystem
* description = "JP Core Insured Person Symbol NamingSystem 被保険者証記号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.62"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.62"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Coverage_InsuredPersonSymbol
* uniqueId[=].preferred = true

Instance: jp-insured-person-number-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_InsuredPersonNumber_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #IdSystem
* description = "JP Core Insured Person Number NamingSystem 被保険者証番号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.63"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.63"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Coverage_InsuredPersonNumber
* uniqueId[=].preferred = true

Instance: jp-medication-rpgroup-number-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Medication_RpGroup_Number_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #IdSystem
* description = "JP Core Medication RpGroup Number NamingSystem RP番号"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.81"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.81"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_Medication_RPGroupNumber
* uniqueId[=].preferred = true

Instance: jp-medication-rpgruop-index-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Medication_RpGruop_Index_NamingSystem"
* status = #active
* date = "2024-11-18"
* kind = #IdSystem
* description = "JP Core Medication RpGruop Index NamingSystem RP内の順序を示す連番"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.3.82"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.3.82"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationAdministrationIndex
* uniqueId[=].preferred = true

Instance: jp-medicationroute-hl7-0162-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationRoute_HL7_0162_NamingSystem"
* status = #active
* date = "2023-10-31"
* kind = #codesystem
* description = "JP MedicationRouteHL7 0162 NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.2.34"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.2.34"
* uniqueId[+].type = #oid
* uniqueId[=].value = "2.16.840.1.113883.3.1937.777.10.5.162"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationRouteHL70162_CS
* uniqueId[=].preferred = true

Instance: jp-endoscopyterminology-codes-jed-ns
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Endoscopy_TerminologyCodes_JED_NamingSystem"
* status = #active
* date = "2023-10-31"
* kind = #codesystem
* description = "日本消化器内視鏡学会が推進するJED (Japan Endoscopy Database) Projectで定義されるコード"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200270.4.1000.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200270.4.1000.1"
* uniqueId[=].preferred = true
* uniqueId[+].type = #uri
* uniqueId[=].value = "http://jpfhir.jp/fhir/core/CodeSystem/JP_EndoscopyTerminologyCodesJED_CS"

Instance: jp-microbiology-antimicrobialdrug-ns
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Microbiology_AntiMicrobialDrug_NamingSystem"
* status = #active
* date = "2023-10-31"
* kind = #codesystem
* description = "微生物学的検査抗菌薬コード(Ver.5.2)  
本コードは厚生労働省院内感染対策サーベイランス事業(https://janis.mhlw.go.jp/)で作成されているマスタを編集・加工して利用している"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.10.3.100.5.11.5.2"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.10.3.100.5.11.5.2"
* uniqueId[=].preferred = true
* uniqueId[+].type = #uri
* uniqueId[=].value = "http://jpfhir.jp/fhir/core/CodeSystem/JP_Microbiology_AntiMicrobialDrug_CS"

Instance: jp-microbiology-infectious-agent-ns
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_Microbiology_InfectiousAgent_NamingSystem"
* status = #active
* date = "2023-10-31"
* kind = #codesystem
* description = "微生物学的検査感染性物質コード(Ver.6.2)
本コードは厚生労働省院内感染対策サーベイランス事業(https://janis.mhlw.go.jp/)で作成されているマスタを編集・加工して利用している"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.10.3.100.5.27.6.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.10.3.100.5.27.6.1"
* uniqueId[=].preferred = true
* uniqueId[+].type = #uri
* uniqueId[=].value = "http://jpfhir.jp/fhir/core/CodeSystem/JP_Microbiology_InfectiousAgent_CS"



// template

// Instance: jp-XXXXXXXXXXXXXXXXXXXXXXX-namingsystem
// InstanceOf: NamingSystem
// Usage: #definition
// * name = "XXXXXXXXXXXXXXXXXXXXXXXXXXX_NamingSystem"
// * status = #active
// * date = "2024-11-18"
// * kind = #codesystem
// * description = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
// * uniqueId[+].type = #oid
// * uniqueId[=].value = "XXXXXXXXXXXXXXX"
// * uniqueId[+].type = #uri
// * uniqueId[=].value = "urn:oid:XXXXXXXXXXXXXXX"
// * uniqueId[+].type = #uri
// * uniqueId[=].value = $XXXXXXXXXXXXXXXXXXXXXXXX
// * uniqueId[=].preferred = true