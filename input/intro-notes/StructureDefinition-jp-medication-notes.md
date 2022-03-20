### 必須要素
次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

MedicationRequest リソースは、次の要素を持たなければならない。
- status : ステータスは必須であり、JP Coreでは"active"に固定される。
- ingredient.itemCodeableConcept : 医薬品の識別情報であり、JP Coreでは必須である。
- ingredient.strength : 医薬品の投与量であり、JP Coreでは必須である。

Medicationリソースでは、次の要素をサポートしなければならない。
- ingredient.itemCodeableConcept : 医薬品の識別情報
- ingredient.strength : 医薬品の投与量

### Extensions定義
Medication リソースで使用される拡張は次の通りである。

#### JP Medication 独自で追加されたExtension

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|RP内薬剤番号|RP内の薬剤の連番を格納する拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication_Ingredient_DrugNo|integer|
|力価区分|投与量が製剤単位か成分単位かを格納する拡張|http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication_atIngredientStrength_StrengthType|CodeableConcept|

#### 既存のExtensionの利用

既存のExtensionで利用するものはない。

### 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS注射データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 ver 2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|	urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|剤形|MERIT-9(剤形)|http://jpfhir.jp/ePrescription/CodeSystem/merit9-form|
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|電子処方箋HL7 FHIR仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|

Medicationの各要素のバインディングは以下の通りである。

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Medication.ingredient.itemCodeableConcept | 医薬品の識別情報 | prefered | HOT7,HOT9,HOT13,YJコード |
| Medication.ingredient.strength.numerator.code | 成分量単位 | prefered | MERIT-9(単位) |
| Medication.ingredient.strength.denominator.code | １回 | prefered | MERIT-9(単位) |

### 制約一覧
Medication リソースは、以下の制約を満たさなければならない。
- status : JP Coreでは"active"に固定される。

Medicationリソースは、以下の制約を満たさなければならない。
- ingredient.strength.denominator.value : "1"に固定される。
- ingredient.strength.denominator.unit : "回"に固定される。
- ingredient.strength.denominator.system : "urn:oid:1.2.392.100495.20.2.101"に固定される。
- ingredient.strength.denominator.code : "KAI"に固定される。

### 項目の追加
日本国内の電子カルテシステムでの注射オーダの運用に合わせ、以下の項目を追加した。

* 薬剤番号（拡張「JP_MedicationDrugNo」を使用）
* ⼒価区分の追加（拡張「JP_MedicationStrengthType」を使用）

## 利用方法

Medication リソースは単体として用いられないため、検索などはMedicationRequestなどの一部として行われる。

### サンプル

[MedicationRequest(注射)](https://simplifier.net/guide/jpfhirjp/MedicationRequest2)や[MedicationDispense(注射)](https://simplifier.net/guide/jpfhirjp/MedicationDispense2)、[MedicationAdministration(注射)](https://simplifier.net/guide/jpfhirjp/MedicationAdministration2)を参照すること。

### 各種コメントの記述方法

Medicationリソースを参照する上位のリソースに記述される。

## その他、参考文献・リンク等
1. HL7, FHIR MedicationRequest Resource, http://hl7.org/fhir/medicationrequest.html
1. HL7, FHIR Medication Resource, http://hl7.org/fhir/medication.html
1. HL7, FHIR BodyStructure Resource, http://hl7.org/fhir/bodystructure.html
1. 保健医療福祉情報システム工業会, JAHIS 注射データ交換規約 Ver.2.1C, https://www.jahis.jp/standard/detail/id=590
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.2, https://www.jahis.jp/standard/detail/id=725
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, https://www.jahis.jp/standard/detail/id=590
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, http://www2.medis.or.jp/hcode/
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, http://www.jami.jp/jamistd/ssmix2.php
