CodeSystem: JP_ServiceRequest_OrderCategory_CS
Id: jp-servicerequest-ordercategory-cs
Title: "JP Core ServiceRequest Order Category CodeSystem"
Description: "JP Coreにて定義したオーダ種別コード"
* ^url = $JP_ServiceRequest_OrderCategory_CS
* ^status = #active
* ^experimental = false
* ^date = "2026-10-31"
* ^caseSensitive = true
* ^content = #complete
* ^copyright = "Copyright FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) 一般社団法人日本医療情報学会FHIR国内実装基盤研究会"

* #consultation "コンサルテーション"
* #counselling  "カウンセリング"
* #drug "薬剤"
  * #injection  "注射"
  * #prescription   "処方"
* #education    "教育"
  * #medication-counselling	"服薬指導"
  * #nutritionist-education	"栄養指導"
* #imaging  "画像"
  * #radiology  "放射線検査"
  * #RI "核医学検査"
* #laboratory   "検体検査"
  * #labratory-test "検体検査"
  * #microbiology "微生物学的検査"
  * #pathological-test	"病理検査"
  * #physiological-test	"生理検査"
* #nutrition    "食事"
* #procedure    "処置"
  * #anesthesia "麻酔"
  * #conditional-order	"条件付き指示"
  * #dental-procedure	"歯科処置"
  * #dialysis	"透析"
  * #endoscopy  "内視鏡検査"
  * #general-procedure	"処置"
  * #radiotherapy   "放射線治療"
  * #rehab	"リハビリテーション"
  * #surgery	"手術"
  * #transfusion	"輸血"
