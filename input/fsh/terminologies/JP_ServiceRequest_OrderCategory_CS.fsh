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

* insert AddJpDesignation(consultation,コンサルテーション)
* insert AddJpDesignation(counselling,カウンセリング)
* insert AddJpDesignation(drug,薬剤)
* insert AddJpDesignation2(drug,injection,注射)
* insert AddJpDesignation2(drug,prescription,処方)
* insert AddJpDesignation(education,教育)
* insert AddJpDesignation2(education,medication-counselling,服薬指導)
* insert AddJpDesignation2(education,nutritionist-education,栄養指導)
* insert AddJpDesignation(imaging,画像)
* insert AddJpDesignation2(imaging,radiology,放射線検査)
* insert AddJpDesignation2(imaging,RI,核医学検査)
* insert AddJpDesignation(laboratory,検体検査)
* insert AddJpDesignation2(laboratory,labratory-test,検体検査)
* insert AddJpDesignation2(laboratory,microbiology,微生物学的検査)
* insert AddJpDesignation2(laboratory,pathological-test,病理検査)
* insert AddJpDesignation2(laboratory,physiological-test,生理検査)
* insert AddJpDesignation(nutrition,食事)
* insert AddJpDesignation(procedure,処置)
* insert AddJpDesignation2(procedure,anesthesia,麻酔)
* insert AddJpDesignation2(procedure,conditional-order,条件付き指示)
* insert AddJpDesignation2(procedure,dental-procedure,歯科処置)
* insert AddJpDesignation2(procedure,dialysis,透析)
* insert AddJpDesignation2(procedure,endoscopy,内視鏡検査)
* insert AddJpDesignation2(procedure,general-procedure,処置)
* insert AddJpDesignation2(procedure,radiotherapy,放射線治療)
* insert AddJpDesignation2(procedure,rehab,リハビリテーション)
* insert AddJpDesignation2(procedure,surgery,手術)
* insert AddJpDesignation2(procedure,transfusion,輸血)
