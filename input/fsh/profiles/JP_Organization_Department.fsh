// ==============================
//   Profile 定義
// ==============================
Profile: JP_Organization_Department
Parent: JP_Organization
Id: jp-organization-department
Title: "JP Core Organization Department Profile"
Description: "このプロファイルはJP_Organizationリソースに対して、診療科情報のデータを送受信するための制約と拡張を定めたものである。診療科を表すOrganizationとして利用することを想定している。"
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

* partOf only Reference(JP_Organization)
* partOf ^short = "所属する医療機関"
* partOf ^definition = "この診療科が所属する上位組織（医療機関）への参照"
* partOf ^comment = "診療科は通常、医療機関に所属するため、partOf要素で親組織を参照することが推奨される。"
