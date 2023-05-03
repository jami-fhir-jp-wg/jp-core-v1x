ValueSet: JP_DiagnosticReportCategory_VS
Id: jp-diagnosticreportcategory-vs
Title: "JP Core Diagnostic Report Category ValueSet"
Description: "DiagnosticReportカテゴリ 値セット"
* ^url = $JP_DiagnosticReportCategory_VS
* ^status = #active
* ^experimental = false
* ^date = "2023-04-18"
//* include  $US_Loinc_CS#LP29684-5 "放射線"
//* include  $US_Loinc_CS#LP7839-6 "病理"
//* include  $US_Loinc_CS#LP7796-8 "内視鏡"
//* include  $US_Loinc_CS#LP29693-6 "検体検査"
//* include  $US_Loinc_CS#LP29708-2 "循環器"
//* include  $US_Loinc_CS#LP31795-1 "歯科口腔"
//* include  $US_Loinc_CS#LP7819-8 "微生物検査"


* include codes from system $US_Loinc_CS2 where concept = #LP29684-5 "放射線"
* include codes from system $US_Loinc_CS2 where concept = #LP7839-6 "病理"
* include codes from system $US_Loinc_CS2 where concept = #LP7796-8 "内視鏡"
* include codes from system $US_Loinc_CS2 where concept = #LP29693-6 "検体検査"
* include codes from system $US_Loinc_CS2 where concept = #LP29708-2 "循環器"
* include codes from system $US_Loinc_CS2 where concept = #LP31795-1 "歯科口腔"
* include codes from system $US_Loinc_CS2 where concept = #LP7819-8 "微生物検査"


