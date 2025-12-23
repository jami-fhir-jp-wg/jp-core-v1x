// ==============================
//   Invariant 定義
// ==============================
Invariant: jp-org-dept-identifier-local-system
Description: "ローカル診療科コードのsystemは 'http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/' で始まる必要がある"
Expression: "system.exists() implies (system.startsWith('http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment') or system.startsWith('http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/'))"
Severity: #warning

// ==============================
//   Profile 定義
// ==============================
Profile: JP_Organization_Department
Parent: Organization
Id: jp-organization-department
Title: "JP Core Organization Department Profile"
Description: "このプロファイルはOrganizationリソースに対して、診療科情報のデータを送受信するための制約と拡張を定めたものである。診療科を表すOrganizationとして利用することを想定している。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization_Department"
* ^status = #active
* ^date = "2025-10-28"
* . ^short = "診療科を表す組織情報"
* . ^definition = "医療機関内の診療科、部門を表すOrganization。病院、診療所などの医療機関に所属する診療科や部署を表現する。"
* . ^comment = "診療科は医療機関（Organization）の一部として、partOf要素を使用して親組織を参照することが推奨される。診療科の種別はtype要素でdept（部門）を指定する。"

* type 1..*
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains departmentType 1..1
* type[departmentType] from http://hl7.org/fhir/ValueSet/organization-type (required)
* type[departmentType] = http://terminology.hl7.org/CodeSystem/organization-type#dept
* type[departmentType] ^short = "診療科・部門を示す組織タイプ"
* type[departmentType] ^definition = "この組織が診療科・部門であることを示すコード。固定値でdept（部門）を設定する。"

// ==============================
//   Identifier スライシング定義
// ==============================
* identifier ^short = "診療科の識別子 【詳細参照】"
* identifier ^definition = "診療科を識別するための識別子。"
* identifier ^comment = "診療科の識別子は以下の2つのパターンで指定できる。
1. 医療機関固有の診療科コード（ローカルコード）
   - system: http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/{医療機関識別OID番号}
   - 医療機関識別OID番号は、医療機関コード（10桁）の先頭に1をつけた11桁とする
   - 例：医療機関コード「1312345670」の場合「http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/11312345670」
2. SS-MIX2標準診療科コード（ssmixDepartmentCodeスライス）
   - system: http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment
   - SS-MIX2で定義された診療科コードを使用"
* identifier obeys jp-org-dept-identifier-local-system
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    ssmixDepartmentCode ..1

* identifier[ssmixDepartmentCode] ^short = "SS-MIX2標準診療科コード"
* identifier[ssmixDepartmentCode] ^definition = "SS-MIX2で定義された標準診療科コード。"
* identifier[ssmixDepartmentCode] ^comment = "SS-MIX2に準拠した診療科コードを指定する場合に使用する。"
* identifier[ssmixDepartmentCode].system = "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment" (exactly)
* identifier[ssmixDepartmentCode].system ^short = "SS-MIX2診療科コード体系のURI"
* identifier[ssmixDepartmentCode].system ^definition = "SS-MIX2で定義された診療科コード体系を示すURI。"
* identifier[ssmixDepartmentCode].value 1..
* identifier[ssmixDepartmentCode].value ^short = "SS-MIX2診療科コードの値"
* identifier[ssmixDepartmentCode].value ^definition = "SS-MIX2で定義された診療科コードの値。"
* identifier[ssmixDepartmentCode].value ^comment = "SS-MIX2標準診療科コードの値を設定する（例：01=内科、02=精神科など）。"

* partOf only Reference(JP_Organization)
* partOf ^short = "所属する医療機関"
* partOf ^definition = "この診療科が所属する上位組織（医療機関）への参照"
* partOf ^comment = "診療科は通常、医療機関に所属するため、partOf要素で親組織を参照することが推奨される。"
