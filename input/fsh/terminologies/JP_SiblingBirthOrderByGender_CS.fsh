CodeSystem: JP_SiblingBirthOrderByGender_CS
Id: jp-siblingbirthorderbygender-cs
Title: "JP Core Sibling Birth Order By Gender CodeSystem"
Description: "同胞内における性別の出生順名称を定義するCodeSystem。日本国内では、長女、長男、次女、次男など。性の多様性は、コード\"#SBO_OTHER\"を適用し、text要素に詳述。国際化対応は、designationにより出身国の用語を追加定義することで表現可能。"
* ^url = $JP_SiblingBirthOrderByGender_CS
* ^status = #active
* ^experimental = false
* ^date = "2025-12-01"
* ^content = #complete

* #SBO1_M "長男"
* #SBO1_F "長女"
* #SBO2_M "次男"
* #SBO2_F "次女"
* #SBO3_M "三男"
* #SBO3_F "三女"
* #SBO4_M "四男"
* #SBO4_F "四女"
* #SBO5_M "五男"
* #SBO5_F "五女"
* #SBO6_M "六男"
* #SBO6_F "六女"
* #SBO7_M "七男"
* #SBO7_F "七女"
* #SBO8_M "八男"
* #SBO8_F "八女"
* #SBO9_M "九男"
* #SBO9_F "九女"
* #SBO10_M "十男"
* #SBO10_F "十女"
* #SBO_OTHER "その他（text要素に詳細を記載）"
* #SBO_NOS "詳細不明(text要素に詳細を記載)"

// ===== English designations =====
* #SBO1_M ^designation[+].language = #en
* #SBO1_M ^designation[=].value = "Eldest son"
* #SBO1_F ^designation[+].language = #en
* #SBO1_F ^designation[=].value = "Eldest daughter"

* #SBO2_M ^designation[+].language = #en
* #SBO2_M ^designation[=].value = "Second son"
* #SBO2_F ^designation[+].language = #en
* #SBO2_F ^designation[=].value = "Second daughter"

* #SBO3_M ^designation[+].language = #en
* #SBO3_M ^designation[=].value = "Third son"
* #SBO3_F ^designation[+].language = #en
* #SBO3_F ^designation[=].value = "Third daughter"

* #SBO4_M ^designation[+].language = #en
* #SBO4_M ^designation[=].value = "Fourth son"
* #SBO4_F ^designation[+].language = #en
* #SBO4_F ^designation[=].value = "Fourth daughter"

* #SBO5_M ^designation[+].language = #en
* #SBO5_M ^designation[=].value = "Fifth son"
* #SBO5_F ^designation[+].language = #en
* #SBO5_F ^designation[=].value = "Fifth daughter"

* #SBO6_M ^designation[+].language = #en
* #SBO6_M ^designation[=].value = "Sixth son"
* #SBO6_F ^designation[+].language = #en
* #SBO6_F ^designation[=].value = "Sixth daughter"

* #SBO7_M ^designation[+].language = #en
* #SBO7_M ^designation[=].value = "Seventh son"
* #SBO7_F ^designation[+].language = #en
* #SBO7_F ^designation[=].value = "Seventh daughter"

* #SBO8_M ^designation[+].language = #en
* #SBO8_M ^designation[=].value = "Eighth son"
* #SBO8_F ^designation[+].language = #en
* #SBO8_F ^designation[=].value = "Eighth daughter"

* #SBO9_M ^designation[+].language = #en
* #SBO9_M ^designation[=].value = "Ninth son"
* #SBO9_F ^designation[+].language = #en
* #SBO9_F ^designation[=].value = "Ninth daughter"

* #SBO10_M ^designation[+].language = #en
* #SBO10_M ^designation[=].value = "Tenth son"
* #SBO10_F ^designation[+].language = #en
* #SBO10_F ^designation[=].value = "Tenth daughter"

* #SBO_OTHER ^designation[+].language = #en
* #SBO_OTHER ^designation[=].value = "Other (specify in text)"

* #SBO_NOS ^designation[+].language = #en
* #SBO_NOS ^designation[=].value = "Unknown (specify in text)"