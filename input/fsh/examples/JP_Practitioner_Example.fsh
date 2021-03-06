Instance: jp-practionner-example-female-1
InstanceOf: JP_Practitioner
Title: "JP Core Practionner 医師女性１"
Description: "医師女性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "東京 春子"
* name[=].family = "東京"
* name[=].given = "春子"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "トウキョウ ハルコ"
* name[=].family = "トウキョウ"
* name[=].given = "ハルコ"
* gender = #female

Instance: jp-practionner-example-female-2
InstanceOf: JP_Practitioner
Title: "JP Core Practionner 看護師女性１"
Description: "看護師女性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "福岡 花子"
* name[=].family = "福岡"
* name[=].given = "花子"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "フクオカ ハナコ"
* name[=].family = "フクオカ"
* name[=].given = "ハナコ"
* gender = #female


Instance: jp-practionner-example-male-1
InstanceOf: JP_Practitioner
Title: "JP Core Practionner 医師男性１"
Description: "医師男性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "大阪 一郎"
* name[=].family = "大阪"
* name[=].given = "一郎"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "オオサカ イチロウ"
* name[=].family = "オオサカ"
* name[=].given = "イチロウ"
* gender = #male

Instance: jp-practionner-example-male-2
InstanceOf: JP_Practitioner
Title: "JP Core Practionner 看護師男性１"
Description: "看護師男性"
Usage: #example
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].text = "愛知 太郎"
* name[=].family = "愛知"
* name[=].given = "太郎"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].text = "アイチ タロウ"
* name[=].family = "チバ"
* name[=].given = "タロウ"
* gender = #male
