Instance: jp-medicationadministration-injection-medication-example-2
InstanceOf: JP_Medication
Title: "JP_Medication 後発医薬品"
Description: "後発医薬品"
Usage: #example
* status = #active
* ingredient[0].itemCodeableConcept = urn:oid:1.2.392.100495.20.2.74#107750602 "ソリタ－Ｔ３号輸液５００ｍＬ"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#HON "本"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#KAI "回"
* ingredient[+].itemCodeableConcept = urn:oid:1.2.392.100495.20.2.74#108010001 "アドナ注（静脈用）５０ｍｇ／１０ｍＬ"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#KAI "回"