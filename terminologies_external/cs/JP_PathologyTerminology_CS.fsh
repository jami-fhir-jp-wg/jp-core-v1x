// Terminology for Pathology diagnosis

CodeSystem: JP_PathologyTerminology_CS
Id: jp-pathology-terminology-cs
Title: "JP Core Pathology Terminology CodeSystem"
Description: "日本の病理診断で使用される専門用語コードシステム"
* ^url = "http://jpfhir.jp/fhir/core/CodeSystem/JP_PathologyTerminology_CS"
* ^status = #active
* ^experimental = false
* ^date = "2025-08-14"
* ^caseSensitive = true
* ^content = #complete

// 組織診断コード
* #tissue-diagnosis "組織診断"
* #tissue-diagnosis.benign "良性病変"
* #tissue-diagnosis.malignant "悪性病変"
* #tissue-diagnosis.borderline "境界病変"
* #tissue-diagnosis.inflammatory "炎症性病変"
* #tissue-diagnosis.dysplasia "異形成"

// 細胞診断コード
* #cytology-diagnosis "細胞診断"
* #cytology-diagnosis.class1 "クラスI（正常）"
* #cytology-diagnosis.class2 "クラスII（炎症性変化）"
* #cytology-diagnosis.class3a "クラスIIIa（軽度異型）"
* #cytology-diagnosis.class3b "クラスIIIb（高度異型）"
* #cytology-diagnosis.class4 "クラスIV（悪性疑い）"
* #cytology-diagnosis.class5 "クラスV（悪性）"

// 形態学的診断
* #morphology "形態学的診断"
* #morphology.adenocarcinoma "腺癌"
* #morphology.squamous-cell-carcinoma "扁平上皮癌"
* #morphology.adenoma "腺腫"
* #morphology.polyp "ポリープ"
* #morphology.hyperplasia "過形成"

// 臓器別分類
* #organ "臓器別分類"
* #organ.lung "肺"
* #organ.breast "乳腺"
* #organ.stomach "胃"
* #organ.colon "大腸"
* #organ.liver "肝臓"
* #organ.pancreas "膵臓"
* #organ.prostate "前立腺"
* #organ.uterus "子宮"
* #organ.ovary "卵巣"
* #organ.thyroid "甲状腺"

// 標本の種類
* #specimen-type "標本種別"
* #specimen-type.biopsy "生検"
* #specimen-type.surgical "手術検体"
* #specimen-type.autopsy "剖検"
* #specimen-type.cytology "細胞診"
* #specimen-type.frozen "迅速診断"

// 染色方法
* #staining "染色方法"
* #staining.he "HE染色"
* #staining.pas "PAS染色"
* #staining.elastic "弾性線維染色"
* #staining.reticulin "好銀線維染色"
* #staining.immunohistochemistry "免疫組織化学"

// 取扱い
* #processing "検体処理"
* #processing.fixation "固定"
* #processing.embedding "包埋"
* #processing.sectioning "薄切"

// 診断確度
* #certainty "診断確度"
* #certainty.definitive "確定診断"
* #certainty.probable "疑い診断"
* #certainty.possible "可能性"
* #certainty.rule-out "除外診断"
