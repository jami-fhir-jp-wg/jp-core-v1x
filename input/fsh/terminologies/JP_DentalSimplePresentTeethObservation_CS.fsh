CodeSystem: JP_DentalSipmlePresentTeethObservation_CS
Id: jp-dental-simple-presentteeth-observation-cs
Title: "JP Core Dental SimplePresentTeethObservation CodeSystem"
Description: "JP Coreにて定義した歯科のObservationリソースに関する現存歯の観察結果コード（簡易版）"
* ^url = $JP_DentalSimplePresentTeethObservation_CS
* ^status = #active
* ^experimental = false
* ^date = "2025-07-30"
* ^caseSensitive = true
* ^content = #complete
* ^copyright = "Copyright Japan Dental Association 日本歯科医師会 & FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) 一般社団法人日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG"
// 口腔診査標準コード仕様 V1.02 を元とし、用語の選択ならびに用語表記の一部をFHIR日本実装検討WGにて改変
* #TD-2-01 "現在歯【現在歯／】（残存歯）（状態不明）（レセプト表記略称名がＧ又はＰの場合）"
* #TD-2-02 "現在歯【健全歯／】（治療痕なし）"
* #TD-2-03 "現在歯【健全歯（シーラント：シ）】"
* #TD-2-04 "現在歯【要観察歯ＣＯ】"
* #TD-2-05 "現在歯【要観察歯（サホライド：サ）】"
* #TD-2-06 "現在歯【未処置歯Ｃ】（治療中を含む）"
* #TD-2-07 "現在歯【未処置歯（サホライド：サ）】"
* #TD-2-08 "現在歯（残根上義歯）残根、Ｃ４（未処置歯）"
* #TD-2-09 "現在歯（残根上義歯）根面板等（処置歯）"
* #TD-2-10 "現在歯【処置歯○】（ブリッジＢｒ支台を含む）"
* #TD-2-11 "現在歯【要注意乳歯×】"
* #TD-2-12 "現在歯【現在歯／】（上記以外、何か情報あり）"
* #TD-2-13 "現在歯（死後脱落（歯槽窩あり））、又は（死後脱落の疑い（歯槽窩あり））"
* #TD-2-30 "半埋伏歯（ＨＲＴ）"
* #TD-2-31 "半埋伏歯（ＨＲＴ）（水平）"
* #TD-2-32 "埋伏歯（ＲＴ）（詳細不明）"
* #TD-2-33 "埋伏歯（ＲＴ）（水平）"
* #TD-2-34 "埋伏歯（完全）（ＣＲＴ）"
* #TD-2-35 "水平埋伏智歯（ＨＩＴ）"
* #TD-2-36 "未萌出歯"
* #TD-2-37 "萌出途中"