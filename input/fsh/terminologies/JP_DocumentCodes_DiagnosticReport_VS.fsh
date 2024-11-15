ValueSet: JP_DocumentCodes_DiagnosticReport_VS
Id: jp-documentcodes-diagnosticreport-vs
Title: "JP Core Document Codes DiagnosticReport ValueSet"
Description: "Document Codes DiagnosticReport 値セット"
* ^url = $JP_DocumentCodes_DiagnosticReport_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-11-18"

* include codes from system $JP_DocumentCodes_CS where concept descendent-of #47045-0



//  以下削除予定
// //* $Loinc_CS#LP29684-5 "放射線"
// // * $JP_DocumentCodes_CS#47045-0 "報告書"
// * $JP_DocumentCodes_CS#28010-7 "心電図報告書"
// * $JP_DocumentCodes_CS#12132-7 "超音波検査報告書"
// * $JP_DocumentCodes_CS#18759-1 "スパイロメトリー検査報告書"
// * $JP_DocumentCodes_CS#58477-1 "肺機能検査報告書"
// * $JP_DocumentCodes_CS#76641-0 "脳神経検査報告書"
// * $JP_DocumentCodes_CS#77199-8 "PWV-CABI-ABI 報告書"
// * $JP_DocumentCodes_CS#18745-0  "心カテ報告書"
// * $JP_DocumentCodes_CS#18748-4 "画像検査報告書"
// * $JP_DocumentCodes_CS#39712-5 "心筋血流 SPECT 検査報告書"
// * $JP_DocumentCodes_CS#39650-7 "心臓核医学検査報告書"
// * $JP_DocumentCodes_CS#11526-1 "病理検査報告書"
// * $JP_DocumentCodes_CS#47526-9 "細胞診報告書"
// * $JP_DocumentCodes_CS#18743-5 "剖検報告書"
// * $JP_DocumentCodes_CS#47048-4 "IVR 報告書"
// * $JP_DocumentCodes_CS#59281-6 "心エコー報告書"
// * $JP_DocumentCodes_CS#59282-4 "ストレス心エコー報告書"
// * $JP_DocumentCodes_CS#77198-0 "動脈硬化検査報告書"
// * $JP_DocumentCodes_CS#75218-8 "研究報告書"
// * $JP_DocumentCodes_CS#18747-6 "CT 検査報告書"
// * $JP_DocumentCodes_CS#18755-9 "MRI 検査報告書"
// * $JP_DocumentCodes_CS#18751-8 "上部消化管内視鏡報告書"
// * $JP_DocumentCodes_CS#18746-8 "下部消化管内視鏡報告書"
// * $JP_DocumentCodes_CS#28018-0 "小腸内視鏡報告書"
// * $JP_DocumentCodes_CS#28016-4 "ERCP 報告書"
// * $JP_DocumentCodes_CS#18744-3 "気管支鏡検査報告書"
// * $JP_DocumentCodes_CS#19805-1 "内視鏡検査報告書"
// * $JP_DocumentCodes_CS#55750-4 "医療安全報告書"
// * $JP_DocumentCodes_CS#51896-9 "感染症報告書"
// * $JP_DocumentCodes_CS#18758-3 "PET 検査報告書"
// * $JP_DocumentCodes_CS#17787-3 "核医学検査報告書"
// * $JP_DocumentCodes_CS#53576-5 "検診・健診報告書"
// * $JP_DocumentCodes_CS#11502-2 "検体検査報告書"
// * $JP_DocumentCodes_CS#18725-2 "微生物学的検査報告書"
// * $JP_DocumentCodes_CS#32453-3 "口腔診査報告書"