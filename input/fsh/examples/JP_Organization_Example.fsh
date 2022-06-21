Instance: jp-organization-example-payer
InstanceOf: JP_Organization
Title: "JP Core Organization 国民健康保険組合"
Description: "国民健康保険組合"
Usage: #example
* type = http://terminology.hl7.org/CodeSystem/organization-type#pay "Payer"
* name = "国民健康保険組合"

Instance: jp-organization-example-Clinic
InstanceOf: JP_Organization
Title: "JP Core Organization クリニック"
Description: "クリニック"
Usage: #example
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.21"
* identifier[=].value = "13"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.22"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.23"
* identifier[=].value = "9999999"
* name = "太郎花子クリニック"
* address.line = "東京都文京区向丘３−２−１"
* address.city = "文京区"
* address.state = "東京都"
* address.country = "JPN"
