ValueSet: JP_DocumentCodes_DiagnosticReport_VS
Id: jp-documentcodes-diagnosticreport-vs
Title: "JP Core Document Codes DiagnosticReport ValueSet"
Description: "Document Codes DiagnosticReport 値セット"
* ^url = $JP_DocumentCodes_DiagnosticReport_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-11-18"

* include codes from system $JP_DocumentCodes_CS where concept descendent-of #47045-0
