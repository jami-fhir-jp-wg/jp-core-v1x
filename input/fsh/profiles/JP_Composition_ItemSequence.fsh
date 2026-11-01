// ==============================
//   Extension 定義
// ==============================
Extension: JP_Composition_ItemSequence
Id: jp-composition-itemsequence
Title: "JP Core Composition Item Sequence Extension"
Description: "記事の記録順序を格納するための拡張"
* ^url = $JP_Composition_ItemSequence
* ^status = #active
* ^date = "2026-11-01"
* ^context[0].type = #element
* ^context[0].expression = "Composition.section.section"
* . ^short = "記事の記録順序"
* . ^definition = "記事の記録順序を格納するための拡張"
* url = $JP_Composition_ItemSequence (exactly)
* value[x] only integer
* value[x] ^short = "記事の記録順序"
