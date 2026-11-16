// ==============================
//   Extension 定義
// ==============================
Extension: JP_Composition_EventDateTime
Id: jp-composition-eventdatetime
Title: "JP Core Composition Event Date Time Extension"
Description: "記録/記事のイベント日時を格納するための拡張"
* ^url = $JP_Composition_EventDateTime
* ^status = #active
* ^date = "2026-11-01"
* ^context[0].type = #element
* ^context[0].expression = "Composition"
* ^context[1].type = #element
* ^context[1].expression = "Composition.section.section"
* . ^short = "記録/記事のイベント日時"
* . ^definition = "記録/記事のイベント日時を格納するための拡張"
* url = $JP_Composition_EventDateTime (exactly)
* value[x] only dateTime
* value[x] ^short = "記録/記事のイベント日時"
