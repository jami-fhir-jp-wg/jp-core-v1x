ValueSet: JP_DocumentCodes_Endscopy_VS
Id: jp-DocumentCodes-Endscopy-vs
Title: "JP Core Document Codes Endscopy ValueSet"
Description: "Document Codes Endscopy 値セット"
* ^url = $JP_DocumentCodes_Endscopy_VS
* ^status = #active
* ^experimental = false
* ^date = "2023-04-18"

* include codes from system JP_DocumentCodes_CS where concept = #18751-8 "上部消化管内視鏡報告書"
* include codes from system JP_DocumentCodes_CS where concept = #18746-8 "下部消化管内視鏡報告書"
* include codes from system JP_DocumentCodes_CS where concept = #28018-0 "小腸内視鏡報告書"
* include codes from system JP_DocumentCodes_CS where concept = #28016-4 "ERCP 報告書"
* include codes from system JP_DocumentCodes_CS where concept = #18744-3 "気管支鏡検査報告書"
* include codes from system JP_DocumentCodes_CS where concept = #19805-1 "内視鏡検査報告書"
