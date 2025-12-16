CodeSystem: JP_GenderedSiblingBirthOrder_CS
Id: jp-genderedsiblingbirthorder-cs
Title: "JP Core Gendered Sibling Birth Order CodeSystem"
Description: "社会学的・文化的な性別の同胞内出生順の名称を定義するCodeSystem。日本国内では、長女、長男、次女、次男など。性の多様性はtext要素に詳述（code要素は、#OTHER、#NOS）。外国人の場合、出身国の文化に基づく同胞内出生順の名称を表現するコードシステムを拡張することで対応できる。"
* ^url = $JP_GenderedSiblingBirthOrder_CS
* ^status = #active
* ^experimental = false
* ^date = "2025-12-01"
* ^content = #complete

* #GSBO1_M "長男"
* #GSBO1_F "長女"
* #GSBO2_M "次男"
* #GSBO2_F "次女"
* #GSBO3_M "三男"
* #GSBO3_F "三女"
* #GSBO4_M "四男"
* #GSBO4_F "四女"
* #GSBO5_M "五男"
* #GSBO5_F "五女"
* #GSBO6_M "六男"
* #GSBO6_F "六女"
* #GSBO7_M "七男"
* #GSBO7_F "七女"
* #GSBO8_M "八男"
* #GSBO8_F "八女"
* #GSBO9_M "九男"
* #GSBO9_F "九女"
* #GSBO10_M "十男"
* #GSBO10_F "十女"
* #GSBO_OTHER "その他（text要素に詳細を記載）"
* #GSBO_NOS "詳細不明(text要素に詳細を記載)"

// 備考: この CodeSystem は日本固有の社会学的・文化的表現を提供します。医学的に厳密な遺伝情報については、GA4GH等のプロファイルを参照してください。