Extension: JP_FamilyMemberHistory_GenderedBirthOrder
Id: jp-familymemberhistory-genderedbirthorder
Title: "JP Core FamilyMemberHistory Gendered Birth Order Extension"
Description: "同胞内での性別の出生順（長男、長女、次男、次女など）をFamilyMemberHistory.relationshipに付記するための拡張。日本やアジア圏の社会学的・文化的表現。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory_GenderedBirthOrder"
* ^status = #active
* ^date = "2025-12-01"
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory.relationship"
* . ^short = "同性同胞内での出生順"
* . ^definition = "FamilyMemberHistory.relationship（関係：SON/DAUなど）に属する、同性同胞内での出生順を表現する拡張。日本語での表現（長男、長女、次男など）を CodeableConcept で提供する。この拡張は社会学的・文化的文脈で利用され、医学的な遺伝情報とは独立している。"
* valueCodeableConcept 0..1
* valueCodeableConcept from $JP_GenderedBirthOrder_VS (preferred)

// 留意点: この拡張は JP_FamilyMemberHistory_BirthOrder（医学的な出生順）と独立している。
// 例: relationship=SON, genderedBirthOrder=GBO1_M（長男）
