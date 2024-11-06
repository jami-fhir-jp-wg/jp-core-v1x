Instance: jp-observation-radiology-findings-example-1
InstanceOf: JP_Observation_Radiology_Findings
Title: "JP Core Observation Radiology Findings Example 画像診断報告書（所見）"
Description: "画像診断報告書（所見）"
Usage: #example
* status = #final
//* basedOn only Reference(ServiceRequest)
//* partOf only Reference(JP_ImagingStudy_Radiology)
* category = $JP_SimpleObservationCategory_CS#imaging "Imaging"
* category.text = "Imaging"
//* code = $Loinc_CS#18782-3  "Radiology Study observation (narrative)" (exactly)
* code = $Loinc_CS#18782-3 "Radiology Study observation (narrative)"
* subject = Reference(Patient/jp-patient-example-1)
* valueString = "心拡大は無く、心嚢液も見られない。\\n 胸部大動脈は蛇行があるも径は正常範囲内。ひだり椎骨動脈が大動脈弓より直接分岐している。大動脈壁に小さな石灰化がみられ軽微な動脈硬化性変化が見られる。\\n ひだり肺上葉に2.2 x 1.5 cm大の空洞性病変を認める(Image 31/110)。壁には充実性成分を含み不整な造影濃度を示す。みぎ肺上葉に気管支拡張を伴う線状影を認めるが、こちらは炎症性瘢痕として矛盾しない。気管には異常を認めず。肺尖部に炎症後変化と思われる胸膜肥厚は見られる。胸水は認めない。\\n 腋窩，縦郭および肺門リンパ節の腫大は認めず。甲状腺は正常範囲。\\n スキャン範囲内の腹部には異常を認めず。骨病変も認めない。"
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* issued = "2021-10-19T10:00:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
//* derivedFrom only Reference(JP_ImagingStudy_Radiology)
//* encounter = Reference(Encounter/jp-encounter-example-1)