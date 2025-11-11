このセクションでは、本 Implementation Guide で使用されるすべてに共通する重要な定義、解釈、および要件の概要を説明する。

### JP Core の紹介

---

本 Implementation Guide は、HL7®FHIR® 標準を元に日本国内で患者データにアクセスするための最小限の適合性要件を定めたものである。日本国内での基底 Implementation Guide となることから、「JP Core Implementation Guide」(以下 JP Core)と命名する。  
日本国内の医療情報相互運用性規格としては HL7v2.5 規格があるが、FHIR は HL7v2.5 への後方互換性を有していないことから、JP Core も完全な後方互換性は備えていない。  
JP Core は「日本医療情報学会FHIR国内実装基盤研究会」において検討を行っているものである
（現時点において日本 HL7 協会が承認するものではないため、実装や利用は全て自己責任で行なうこと。）

### SHALL,SHOULD/SHOULD NOT,MAY 定義

---

| 要求レベル     | 定義                                                                                                                                             |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| **SHALL**      | 実装する際に必ず満たさなければならない。                                                                                                         |
| **SHALL NOT**  | 実装する際に満たしてはならない。                                                                                                                 |
| **SHOULD**     | 実装する際に考慮すべきベストプラクティスまたは推奨事項であり、それを選択しない場合にはその意味をよく理解し、慎重に検討してからである必要がある。 |
| **SHOULD NOT** | 実装すべきでない非推奨事項であり、それを選択する場合にはその意味をよく理解し、慎重に検討してからである必要がある。                               |
| **MAY**        | 実装のためのオプションで、含めることも省略することもできる。                                                                                     |

### 実装ガイド定義

#### 利用している FHIR バージョン情報 (Cross Version Analysis)

{% include cross-version-analysis.xhtml %}

#### 依存関係 (Dependency Table)

{% include dependency-table.xhtml %}

#### グローバル公開している定義 (Globals Table)

{% include globals-table.xhtml %}

#### 知的財産権に関する記述（IP Statements）

{% include ip-statements.xhtml %}

**IP Statements に関する注意事項**
本 IP Statement は IG Publisher にて機械的に出力されたものである。SNOMED については JP Core としては利用しておらず、FHIR BASE の定義による影響を受けていることに注意すること。
Note that this IP Statement is mechanically output by IG Publisher, and that SNOMED is not used as JP Core, but is affected by the definition of FHIR BASE.

### 機械翻訳文章

リソースの項目説明文には、FHIR Base の説明を機械による自動翻訳したものが含まれている。そのため意味が分かりにくい翻訳や丁寧語の文体の文章が混ざっている。

### 質問先

---

メール：Ｏｆｆｉｃｅ＠ＨＬ７ＦＨＩＲ．ＪＰ

（文字はすべて半角に変えること）

### 主体

---

日本医療情報学会 FHIR 国内実装基盤研究会

https://jpfhir.jp/
