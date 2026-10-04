// ==============================
//   Profile 定義
// ==============================
Profile: JP_ServiceRequest_Order_Medication_Requesting
Parent: JP_ServiceRequest_Common
Id: jp-servicerequest-order-medication-requesting
Title: "JP Core ServiceRequest Order Medication Requesting Profile"
Description: "このプロファイルはJP_ServiceRequest_Commonプロファイルから派生したもので、処方オーダおよび注射オーダのヘッダー情報（オーダ単位の依頼情報）を表現するための制約を記述したものである。個々の薬剤の処方・注射指示はJP_MedicationRequestまたはJP_MedicationRequest_Injectionで表現する。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_Order_Medication_Requesting"
* ^status = #active
* ^date = "2026-10-04"
* . ^short = "処方・注射オーダのヘッダー情報"
* . ^definition = "処方オーダおよび注射オーダのヘッダー情報（オーダ単位の依頼情報）を表現するServiceRequestリソース。"

// category
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.ordered = false
* category contains
    orderCategory 1..1 and
    medicationCategory ..*
* category ^short = "サービスリクエストの分類【詳細参照】"
* category ^definition = "検索、分類、表示の目的でサービスを分類するコード。【JP Core仕様】オーダ種別（処方／注射）を必須とし、処方区分または注射区分を任意で指定する。"

* category[orderCategory] ^short = "オーダ種別（処方／注射）【詳細参照】"
* category[orderCategory] ^definition = "オーダ種別を示すコード。【JP Core仕様】JP_ServiceRequestOrderCategory_VSから、処方オーダの場合は「prescription」（処方）、注射オーダの場合は「injection」（注射）を指定する。"
* category[orderCategory] from $JP_ServiceRequestOrderCategory_VS (required)
* category[orderCategory].coding 1..
* category[orderCategory].coding.system 1..
* category[orderCategory].coding.system = $JP_ServiceRequestOrderCategory_CS (exactly)
* category[orderCategory].coding.code 1..

* category[medicationCategory] ^short = "処方区分／注射区分【詳細参照】"
* category[medicationCategory] ^definition = "処方区分または注射区分を示すコード。【JP Core仕様】オーダ種別が「prescription」（処方）の場合は処方区分を、「injection」（注射）の場合は注射区分を指定する。"
* category[medicationCategory] ^comment = "【JP Core仕様】JP_MedicationRequestおよびJP_MedicationRequest_Injectionのcategoryと同じコード体系（MERIT-9処方オーダ表7、JAHIS処方データ交換規約JHSP0007表、JAHIS注射データ交換規約JHSI0001表）を使用する。処方区分の例：外来処方（OHP）、院外処方（OHO）、入院処方（IHP）、定期処方（ORD）、臨時処方（XTR）、退院処方（DCG）、持参薬処方（BDP）。注射区分の例：定時処方（FTP）、至急処方（EMP）、事後処方（PFP）、頓用処方（OTP）。複数の観点（例：入院処方かつ定期処方）を表す場合は繰り返して指定する。処方区分と注射区分のどちらを指定するかはオーダ種別に従い、本プロファイルでは制約しない。"
* category[medicationCategory] from $JP_MedicationCategory_VS (required)
