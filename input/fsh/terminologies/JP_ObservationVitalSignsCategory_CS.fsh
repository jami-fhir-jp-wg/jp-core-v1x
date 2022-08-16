CodeSystem: JP_ObservationVitalSignsCategory_CS
Id: jp-observation-vitalsigns-category-cs
Title: "JP Core Observation VitalSigns Category"
Description: "Observation（バイタルサイン）で使用する分類のコード"
* ^url = $JP_ObservationVitalSignsCategory_CS
* ^status = #draft
* ^caseSensitive = true
* ^valueSet = $JP_ObservationVitalSignsCategory_VS
* ^content = #complete

// コード体系をどうするのか。
// TODO: 利用にはMEDISへの連絡が必要
// 看護実践用語標準マスターの概要＜看護行為編＞Ver. 3. 6
* #respiratory-function "呼吸機能"
* #constrained-respiration "努力呼吸"
* #respiratory-abnormality "呼吸異常"
* #pulsation "動悸"
* #arrhythmia "不整脈"
* #ecg-waveform "心電図波形"
* #cardiac-function "心機能"
* #blood-pressure "血圧"
* #body-surface-skin-temperature "体表面皮膚温"
* #signs-symptoms "徴候・症状"
* #sleep "睡眠"
* #disorientation "失見当識"
* #consciousness-evaluation "意識評価"
* #disturbance-of-consciousness "意識障害"
* #fetal-cardiac-function "胎児心機能"
* #temperature "体温"
* #pulse-rate "脈拍数"
* #artery-palpating "動脈触知"
* #ventilation "換気"
* #fetal-condition "胎児の状態"
* #tracheal-breath-sound "気管呼吸音"
* #alveolar-breath-sound "肺胞呼吸音"
