Instance: jp-medicationrequest-start-sp
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Start_SP"
* name = "JP_MedicationRequest_Start_SP"
* status = #active
* date = "2022-10-24"
* description = "MedicationRequestリソースをExtensionの服用期間の開始日で検索するパラメータを定義する。"
* code = #jp-medication-start
* base = #MedicationRequest
* type = #date
* expression = "MedicationRequest.dosageInstruction.extension('http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse').valuePeriod.start"
* xpath = "f:MedicationRequest/f:dosageInstruction/f:extension[@url='http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse']/f:valuePeriod/f:start"
* xpathUsage = #normal
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #ge
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap
