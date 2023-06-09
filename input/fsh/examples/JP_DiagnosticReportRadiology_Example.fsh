Instance: jp-diagnosticreport-radiology-example-1
InstanceOf: JP_DiagnosticReport_Radiology
Title: "JP Core DiagnosticReport Radiology Example 放射線読影レポート"
Description: "放射線読影レポート"
Usage: #example
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2><span title=\"Codes: {http://loinc.org 18748-4}\">Diagnostic imaging study</span> (<span title=\"Codes: {http://loinc.org LP29684-5}\">Radiology</span>, <span title=\"Codes: {http://dicom.nema.org/resources/ontology/DCM CT}\">Computed Tomography</span>) </h2><table class=\"grid\"><tr><td>Subject</td><td><b>山田 太郎</b> male, DoB: 1970-01-01 ( id:\u00a000000010)</td></tr><tr><td>When For</td><td>2008-06-17</td></tr><tr><td>Reported</td><td>2008-06-18 09:23:00+1000</td></tr><tr><td>Identifier:</td><td> id:\u00a0123456\u00a0(use:\u00a0USUAL)</td></tr></table><h3>Report Details</h3><p><b><big>【胸部造影CT】</big></b></p><p><b>依頼目的:</b></p><p>10月20日の単純写真でひだり肺に異常陰影あり。精査目的。</p><p><b>所見:</b></p><p>心拡大は無く、心嚢液も見られない。</p><p>胸部大動脈は蛇行があるも径は正常範囲内。ひだり椎骨動脈が大動脈弓より直接分岐している。大動脈壁に小さな石灰化がみられ軽微な動脈硬化性変化が見られる。</p><p>ひだり肺上葉に2.2 x 1.5 cm大の空洞性病変を認める(Image 31/110)。壁には充実性成分を含み不整な造影濃度を示す。みぎ肺上葉に気管支拡張を伴う線状影を認めるが、こちらは炎症性瘢痕として矛盾しない。気管には異常を認めず。肺尖部に炎症後変化と思われる胸膜肥厚は見られる。胸水は認めない。</p><p>腋窩，縦郭および肺門リンパ節の腫大は認めず。甲状腺は正常範囲。</p><p>スキャン範囲内の腹部には異常を認めず。骨病変も認めない。</p><p><b>インプレッション: </b></p><p>ひだり肺上葉の空洞性病変。 肺腺癌を疑う。みぎ肺上葉陳旧性炎症性瘢痕。</p></div>"
* identifier.use = #usual
* identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier.value = "123456"
* status = #final
* category[radiology] = $US_Loinc_CS#LP29684-5
* category[radiology_sub] = $dicom-ontology#CT
* code = $US_Loinc_CS#18748-4 "Diagnostic imaging study"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2008-06-17"
* issued = "2008-06-18T09:23:00+10:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* imagingStudy.display = "CHEST CT DICOM imaging study"
* imagingStudy = Reference(ImagingStudy/jp-imagingstudy-radiology-example-1)
* conclusion = "インプレッション: ひだり肺上葉の空洞性病変。 肺腺癌を疑う。みぎ肺上葉陳旧性炎症性瘢痕。"
* presentedForm.contentType = urn:ietf:bcp:13#application/pdf
* presentedForm.language = #ja
* presentedForm.data = "/9j/"
* presentedForm.title = "PDF Report"


// Instance: jp-diagnosticreport-radiology-example-2
// InstanceOf: JP_DiagnosticReport_Radiology
// Title: "JP Core DiagnosticReport Radiology Example 核医学レポート"
// Description: "核医学レポート"
// Usage: #example
// * identifier.use = #usual
// * identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
// * identifier.value = "123456"
// * status = #final
// * category[radiology] = $diagnostic-service-sectionid-cs#RAD
// * code.text = "核医学レポート"
// * subject = Reference(Patient/jp-patient-example-1)
// * effectiveDateTime = "2008-06-17"
// * issued = "2008-06-18T09:23:00+10:00"
// * performer = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
// * imagingStudy.display = "肺がんが見つかったため、転移状況確認のための検査を行なった"
// * conclusion = "検査結果を見る限り、明らかながんの転移は見つからなかった"
// * presentedForm.contentType = urn:ietf:bcp:13#image/jpeg
// * presentedForm.language = #ja
// * presentedForm.data = "/9j/"
// * presentedForm.title = "HTML Report"