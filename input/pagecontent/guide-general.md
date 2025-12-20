このセクションでは、本Implementation Guideで使用されるすべてに共通する重要な定義、解釈、および要件の概要を説明する。

### JP Coreの紹介
---
本Implementation Guideは、HL7®FHIR®標準を元に日本国内で患者データにアクセスするための最小限の適合性要件を定めたものである。日本国内での基底Implementation Guideとなることから、「JP Core Implementation Guide」(以下JP Core)と命名する。  
日本国内の医療情報相互運用性規格としてはHL7v2.5規格があるが、FHIRはHL7v2.5への後方互換性を有していないことから、JP Coreも完全な後方互換性は備えていない。  
JP Coreは「JAMI NeXEHRS課題研究会（正式名：次世代健康医療記録システム共通プラットホーム研究会）」に設置された「HL7 FHIR日本実装検討WG」において検討を行っているものである
（現時点において日本HL7協会が承認するものではないため、実装や利用は全て自己責任で行なうこと。）

### SHALL,SHOULD/SHOULD NOT,MAY定義
---

| 要求レベル | 定義 |
| ---- | ---- |
| **SHALL** | 実装する際に必ず満たさなければならない。 |
| **SHALL NOT** | 実装する際に満たしてはならない。 |
| **SHOULD** | 実装に考慮すべきベストプラクティスまたは推奨事項であり、それを選択しない場合にはその意味をよく理解し、慎重に検討してからである必要がある。
| **SHOULD NOT** | 実装に考慮すべきでない事項であり、それを選択する場合にはその意味をよく理解し、慎重に検討してからである必要がある。 |
| **MAY** | 実装のためのオプションで、含めることも省略することもできる。 |


### 実装ガイド定義
#### 利用しているFHIRバージョン情報 (Cross Version Analysis)

{% include cross-version-analysis.xhtml %}

#### 依存関係  (Dependency Table)

{% include dependency-table.xhtml %}

#### グローバル公開している定義 (Globals Table)

{% include globals-table.xhtml %}

#### 知的財産権に関する記述（IP Statements）

{% include ip-statements.xhtml %}

**IP Statementsに関する注意事項**
本IP StatementはIG Publisherにて機械的に出力されたものである。SNOMEDについてはJP Coreとしては利用しておらず、FHIR BASEの定義による影響を受けていることに注意すること。
Note that this IP Statement is mechanically output by IG Publisher, and that SNOMED is not used as JP Core, but is affected by the definition of FHIR BASE.

### 機械翻訳文章
リソースの項目説明文には、FHIR Baseの説明を機械による自動翻訳したものが含まれている。そのため意味が分かりにくい翻訳や丁寧語の文体の文章が混ざっている。

### 質問先
---
メール：Ｏｆｆｉｃｅ＠ＨＬ７ＦＨＩＲ．ＪＰ

（文字はすべて半角に変えること）

### 主体
---
NeXEHRS研究会 HL7FHIR日本実装検討WG

https://jpfhir.jp/