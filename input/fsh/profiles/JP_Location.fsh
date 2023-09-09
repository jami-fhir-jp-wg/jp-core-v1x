// ==============================
//   Profile 定義
// ==============================
Profile: JP_Location
Parent: Location
Id: jp-location
Title: "JP Core Location Profile"
Description: "このプロファイルはLocationリソースに対して、所在場所のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Location"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "物理的な場所の詳細情報と位置情報"
* . ^definition = "サービスが提供され、リソースとそれに関わる人たちが存在する物理的な場所の詳細情報と位置情報。"
