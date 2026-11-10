// ==============================
//   Profile 定義
// ==============================
Profile: JP_Composition_ProgressNote
Parent: Composition
Id: jp-composition-progressnote
Title: "JP Core Composition ProgressNote Profile"
Description: "このプロファイルは、Compositionリソースに対して、SOAP形式の経過記録等に関する情報を送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Composition_ProgressNote"
* ^status = #active
* ^date = "2026-11-01"
* . ^short = "SOAP形式の経過記録等に関する詳細な情報"
* . ^definition = "SOAP形式の経過記録等に関する詳細な情報"

* obeys unique-article-section
* obeys consistent-article-group-extension

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $version-number named versionNumber ..1 and
    JP_Common_Department named department ..1 and
    JP_Composition_EventDateTime named eventDateTime ..1
* extension[versionNumber] ^short = "記録の版数"
* extension[versionNumber] ^definition = "記録の版数。形式は実装依存とし、本プロファイルでは規定しない。"

* type MS
* type ^short = "記録の種別"
* type ^definition = "記録の種別を表すコード。"
* type from $JP_Composition_ProgressNote_Type_VS (preferred)
* type.coding.system 1..
* type.coding.code 1.. 

* subject 1.. MS
* subject ^short = "記録の対象患者"
* subject ^definition = "記録の対象となった患者"

* date MS
* date ^short = "記録の作成日時"
* date ^definition = "記録を作成した日時"

* author MS
* author ^short = "記録の作成者"
* author ^definition = "記録を作成した人物"

* title ^short = "記録の人間向けのタイトル"
* title ^definition = "記録の人間向けのタイトル"

* section ^short = "セクション"
* section ^definition = "セクション"

* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section contains
    problems 0..* MS and
    subjective 0..* MS and
    objective 0..* MS and
    assessment 0..* MS and
    plan 0..* MS and
    additional 0..* MS
* section
  * extension ^slicing.discriminator.type = #value
  * extension ^slicing.discriminator.path = "url"
  * extension ^slicing.rules = #open
  * extension contains
    JP_Composition_GroupNo named groupNo 0..1 MS
  * title 1.. MS
  * code 1.. MS
    * coding 1..
      * system 1..
      * code 1..
  * text 0..0
  * section
    * extension ^slicing.discriminator.type = #value
    * extension ^slicing.discriminator.path = "url"
    * extension ^slicing.rules = #open
    * extension contains
      JP_Composition_EventDateTime named eventDateTime 0..1 MS and
      JP_Composition_ItemSequence named itemSequence 0..1 MS and
      JP_Composition_ThumbnailImage named thumbnailImage 0..1 MS

// Problems Section
* section[problems]
  * ^label = "Problems Section"
  * ^short = "Problems Section"
  * code = $Loinc_CS#11450-4
  * entry only Reference(Condition)
    * display MS
  * section ..0

// Subjective Section
* section[subjective]
  * ^label = "Subjective Section"
  * ^short = "Subjective Section"
  * code = $Loinc_CS#61150-9
  * entry 0..0
  * section 1..
    * text MS

// Objective Section
* section[objective]
  * ^label = "Objective Section"
  * ^short = "Objective Section"
  * code = $Loinc_CS#61149-1
  * entry 0..0
  * section 1..
    * text MS

// Assesment Section
* section[assessment]
  * ^label = "Assessment Section"
  * ^short = "Assessment Section"
  * code = $Loinc_CS#51848-0
  * entry 0..0
  * section 1..
    * text MS

// Plan Section
* section[plan]
  * ^label = "Plan Section"
  * ^short = "Plan Section"
  * code = $Loinc_CS#18776-5
  * entry 0..0
  * section 1..
    * text MS

// Additional Documentation Section
* section[additional]
  * ^label = "Additional Documentation Section"
  * ^short = "Additional Documentation Section"
  * code = $Loinc_CS#77599-9
  * entry 0..0
  * section 1..
    * text MS

Invariant: unique-article-section
Description: "同一記事グループ内に同じ種類のセクションを複数含めてはならない"
Severity: #error
Expression: """
  section.select(
    iif(
      extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo').exists(),
      extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo').value.ofType(integer).toString(),
      '1'
    )
    & '|'
    & code.coding.code
  ).isDistinct()
"""

Invariant: consistent-article-group-extension
Description: "記事グループ番号は対象セクションすべてに指定するか、すべて省略する"
Severity: #error
Expression: """
  section.extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo').empty()
  or
  section.all(extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo').exists())
"""
