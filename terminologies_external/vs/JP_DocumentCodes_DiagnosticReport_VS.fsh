ValueSet: JP_DocumentCodes_DiagnosticReport_VS
Id: jp-documentcodes-diagnosticreport-vs
Title: "JP Core Document Codes DiagnosticReport ValueSet"
Description: "Document Codes DiagnosticReport 値セット"
* ^url = $JP_DocumentCodes_DiagnosticReport_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-12-30"
* ^copyright = "Copyright JED-Project、JAHIS、日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG  
This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995+, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* include codes from system $JP_DocumentCodes_CS where concept descendent-of #47045-0
