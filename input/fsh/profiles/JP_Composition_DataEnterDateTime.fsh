// ==============================
//   Extension 定義
// ==============================
Extension: JP_Composition_DataEnterDateTime
Id: jp-composition-dataenterdatetime
Title: "JP Core Composition Data Enter Date Time Extension"
Description: "記事の入力日時を格納するための拡張"
* ^url = $JP_Composition_DataEnterDateTime
* ^status = #active
* ^date = "2026-11-01"
* ^context[0].type = #element
* ^context[0].expression = "Composition.section.section"
* . ^short = "記事の入力日時"
* . ^definition = "記事の入力日時を格納するための拡張"
* url = $JP_Composition_DataEnterDateTime (exactly)
* value[x] only dateTime
* value[x] ^short = "記事の入力日時"
