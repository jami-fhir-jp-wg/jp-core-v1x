// ==============================
//   Extension 定義
// ==============================
Extension: JP_Composition_ThumbnailImage
Id: jp-composition-thumbnailimage
Title: "JP Core Composition Thumbnail Image Extension"
Description: "記事のサムネイル画像を格納するための拡張"
* ^url = $JP_Composition_ThumbnailImage
* ^status = #active
* ^date = "2026-11-01"
* ^context[0].type = #element
* ^context[0].expression = "Composition.section.section"
* . ^short = "記事のサムネイル画像"
* . ^definition = "記事のサムネイル画像を格納するための拡張"
* url = $JP_Composition_ThumbnailImage (exactly)
* value[x] only Attachment
* value[x] ^short = "記事のサムネイル画像"
