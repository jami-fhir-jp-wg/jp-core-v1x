CodeSystem: JP_ServiceRequestOrderCategory_CS
Id: jp-servicerequest-ordercategory-cs
Title: "JP Core ServiceRequest Order Category CodeSystem"
Description: "ServiceRequestで表現するオーダの種別（処方、注射など）を示すコードシステム。オーダ種別ごとのServiceRequest派生プロファイルにおいて、ServiceRequest.categoryで使用する。"
* ^url = $JP_ServiceRequestOrderCategory_CS
* ^status = #active
* ^experimental = false
* ^date = "2026-10-04"
* ^caseSensitive = true
* ^content = #complete

* #prescription "処方" "処方オーダ（内服・外用など）"
* #injection "注射" "注射オーダ（注射・点滴・注入など）"
