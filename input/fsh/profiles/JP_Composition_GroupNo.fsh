// ==============================
//   Extension 定義
// ==============================
Extension: JP_Composition_GroupNo
Id: jp-composition-groupno
Title: "JP Core Composition Group No Extension"
Description: "記事グループの連番を格納するための拡張"
* ^url = $JP_Composition_GroupNo
* ^status = #active
* ^date = "2026-11-01"
* ^context[0].type = #element
* ^context[0].expression = "Composition.section"
* . ^short = "記事グループの連番を格納するための拡張"
* . ^definition = "記事グループの連番を格納するための拡張"
* url = $JP_Composition_GroupNo (exactly)
* value[x] only integer
* value[x] ^short = "記事グループの連番"
* value[x] ^definition = "記事グループの連番。最初のグループを「1」、次のグループを「2」などとする。"
