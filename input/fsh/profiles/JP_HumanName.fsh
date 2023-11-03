// ==============================
//   Profile 定義
// ==============================
Profile: JP_HumanName
Parent: HumanName
Id: jp-humanname
Title: "JP Core HumanName DataType"
Description: "このデータタイプはHumanName DataTypeに対して、患者データを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_HumanName"
* ^status = #active
* ^date = "2023-10-31"
* . ^short = "人の名前情報、その一部分と使い方"
* . ^definition = "識別のための人の名前情報"
* . ^comment = "名前が変更されたり、違っていると指摘されたり、コンテキストによって使われる名前が異なる場合がある。名前は、コンテキストに応じて重要性が異なるさまざまなタイプの部分に分割される場合があり、部分への分割は必ずしも重要ではない。個人名の場合、さまざまな部分に暗黙の意味が含まれている場合と含まれていない場合がある。さまざまな文化が名前の部分にさまざまな重要性を関連付けており、システムが世界中の名前の部分を気にする必要がある程度は大きく異なる。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $iso21090-EN-representation named nameRepresentationUse 0..1
* extension[nameRepresentationUse] ^definition = "名前の表現方法"
* extension[nameRepresentationUse] ^comment = "名前の文字起こし-表現方法（日本の名前など）。"
