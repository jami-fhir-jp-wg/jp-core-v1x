Extension: JP_FamilyMemberHistory_GenderedSiblingOrder
Id: jp-familymemberhistory-genderedsiblingorder
Title: "JP Core FamilyMemberHistory Gendered Sibling Order Extension"
Description: "同性同胞内での出生順（長男、長女など）をFamilyMemberHistory.relationshipに付記するための拡張。日本固有の社会学的・文化的表現。valueは CodeableConcept で、JP_GenderedSiblingOrder_VS のジェンダー別コード（GSO1_M, GSO1_F など）を推奨する。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory_GenderedSiblingOrder"
* ^status = #active
* ^date = "2025-12-01"
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory.relationship"
* . ^short = "同性同胞内での出生順（ジェンダー別表記）"
* . ^definition = "FamilyMemberHistory.relationship（関係：SON/DAUなど）に属する、同性同胞内での出生順を表現する拡張。日本語での表現（長男、長女、次男など）を CodeableConcept で提供する。この拡張は社会学的・文化的文脈で利用され、医学的な遺伝情報とは独立している。"
* valueCodeableConcept 0..1
* valueCodeableConcept from $JP_GenderedSiblingOrder_VS (preferred)

// 留意点: この拡張は医学的な遺伝情報とは独立している。
// 例: relationship=SON, genderedSiblingOrder=GSO1_M（長男）
