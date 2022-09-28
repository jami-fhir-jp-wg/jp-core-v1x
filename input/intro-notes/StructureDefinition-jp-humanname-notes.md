## 人名表記に関する説明

### 表記分類

JP_HumanNameは名前の表記分類として[iso21090-EN-representation extension](http://hl7.org/fhir/R4/extension-iso21090-en-representation.html)を0..1の多重度にて拡張として割り当てている。具体的な表記分類に利用されるコードは[valueset-name-v3-representation](http://hl7.org/fhir/R4/valueset-name-v3-representation.html)のValueSetにて３つのコードが指定されている。

  - IDE ： 表意文字  
  日本語の氏名では、主に漢字氏名に相当するエリアになる。漢字を利用していない氏名についてはひらがなやカタカナ、アルファベットも可能であるが全角を利用すること。
  - SYL ： 表音文字  
  全角カタカナで記載する。
  - ABC ： アルファベット  
  日本語の氏名の場合、主にローマ字を割り当てる。ローマ字の記述方法には、ヘボン式と訓令式があるが現在決まりはないが、一般にはヘボン式のほうが利用されることが多い。このエリアを検索等に利用する場合には、規則を決めておくことをお勧めする。

### iso21090-EN-representation extensionの多重度

JP Coreでは国外ベンダを考慮し、[iso21090-EN-representation extension](http://hl7.org/fhir/R4/extension-iso21090-en-representation.html)の拡張は多重度0を許容している。実装ガイド作成の際は、アプリケーションの実装等やデータ収集の精度を考慮した上で多重度を決定すること。

### textの区切り文字

textには氏名全体を結合し格納する。family、given等の各組み合わせる時の区切り文字は検索時の利便性を考慮し、「半角スペース」で統一する(**SHALL**)。

### 表記分類ごと記述

| code | 説明 | text | family | given |
|:--- |:--- |:--- |:--- |:--- |
| IDE | 表意文字 | 山田 太郎 | 山田 | 太郎 |
| SYL | 表音文字 | ヤマダ タロウ | ヤマダ | タロウ |
| ABC | アルファベット | YAMADA TARO | YAMADA | TARO |


### リソースでの記述例
``` json
 "name" : [
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
          "valueCode" : "IDE"
        }
      ],
      "use" : "usual",
      "text" : "山田 太郎",
      "family" : "山田",
      "given" : [
        "太郎"
      ]
    },
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
          "valueCode" : "SYL"
        }
      ],
      "use" : "usual",
      "text" : "ヤマダ タロウ",
      "family" : "ヤマダ",
      "given" : [
        "タロウ"
      ]
    },
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
          "valueCode" : "ABC"
        }
      ],
      "use" : "usual",
      "text" : "YAMADA TARO",
      "family" : "YAMADA",
      "given" : [
        "TARO"
      ]
    }
  ]

```
