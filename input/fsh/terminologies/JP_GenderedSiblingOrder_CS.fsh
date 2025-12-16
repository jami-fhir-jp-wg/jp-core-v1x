CodeSystem: JP_GenderedSiblingOrder_CS
Id: jp-genderedsiblingorder-cs
Title: "JP Core Gendered Sibling Order CodeSystem"
Description: "社会学的・文化的な性別の同胞内出生順の名称を定義するCodeSystem。日本国内では、長女、長男、次女、次男など。性の多様性はtext要素に詳述（code要素は、#OTHER、#NOS）。外国人の場合、出身国の文化に基づく同胞内出生順の名称を表現するコードシステムを拡張することで対応できる。"
* ^url = $JP_GenderedSiblingOrder_CS
* ^status = #active
* ^experimental = false
* ^date = "2025-12-01"
* ^content = #complete

* #GSO1_M "長男"
* #GSO1_F "長女"
* #GSO2_M "次男"
* #GSO2_F "次女"
* #GSO3_M "三男"
* #GSO3_F "三女"
* #GSO4_M "四男"
* #GSO4_F "四女"
* #GSO5_M "五男"
* #GSO5_F "五女"
* #GSO6_M "六男"
* #GSO6_F "六女"
* #GSO7_M "七男"
* #GSO7_F "七女"
* #GSO8_M "八男"
* #GSO8_F "八女"
* #GSO9_M "九男"
* #GSO9_F "九女"
* #GSO10_M "十男"
* #GSO10_F "十女"
* #OTHER "その他（.textで詳細を記載）"
* #NOS "不明時(.textで詳細を記載)"

// 備考: この CodeSystem は日本固有の社会学的・文化的表現を提供します。医学的に厳密な遺伝情報については、GA4GH等のプロファイルを参照してください。