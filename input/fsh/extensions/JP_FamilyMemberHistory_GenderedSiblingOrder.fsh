Extension: JP_FamilyMemberHistory_GenderedSiblingOrder
Id: jp-familymemberhistory-genderedsiblingorder
Title: "JP Core FamilyMemberHistory Gendered Sibling Order Extension"
Description: "性別同胞内出生順（長男、長女など）をFamilyMemberHistoryに付記するための拡張。日本固有の社会学的・文化的表現。valueは CodeableConcept で、JP_GenderedSiblingOrder_VS のジェンダー別コード（GSO1_M, GSO1_F など）を推奨する。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory_GenderedSiblingOrder"
* ^status = #active
* ^date = "2025-12-01"
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory"
* . ^short = "性別同胞内出生順"
* . ^definition = "FamilyMemberHistory リソース全体に対して、関連する家族成員の性別同胞内出生順を表現する拡張。日本語での表現（長男、長女、次男など）を CodeableConcept で提供する。この拡張は社会学的・文化的文脈で利用され、医学的な遺伝情報とは独立している。家系図はスコープ外。"
* extension contains
    genderedSiblingOrder 0..1
    genderedSiblingDisplay 0..1
* extension[genderedSiblingOrder] ^short = "性別同胞内出生順（整数）"
* extension[genderedSiblingOrder] ^definition = "同胞内での出生順を性別別に表現した数値。"
* extension[genderedSiblingOrder].valueInteger ^minValue = 1
* extension[genderedSiblingOrder].valueInteger ^description = "同胞内での出生順を整数で表現。"
* extension[genderedSiblingDisplay] ^short = "性別同胞内出生順ラベル"
* extension[genderedSiblingDisplay] ^definition = "同胞内での出生順を性別別に表現したラベル。"
* extension[genderedSiblingDisplay].value[x] only CodeableConcept
* extension[genderedSiblingDisplay].valueCodeableConcept from $JP_GenderedSiblingOrder_VS (preferred)

