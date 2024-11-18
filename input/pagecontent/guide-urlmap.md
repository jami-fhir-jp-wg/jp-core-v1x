### URIに指定する形式について

#### OID形式からURL形式への移行
FHIR実装ガイドで採用している「CodeSystem」や「Identifierに対するSystem値」に対するURIについて、可能なものからOID形式からURL形式への移行を進めている。URL形式がWebにおける標準的な識別子であり、相互運用性やアクセシビリティの向上に寄与するためである。OID形式は、新規OIDの発行や管理のわかりにくさ、人間の可読性と解釈の難しさやWebとの親和性など課題が残っている。URL形式への移行により、これらの課題を解消し、よりオープンで柔軟なシステム構築が可能となる。

現時点ではURL形式の利用は必須ではなく、NamingSystemリソースへのOID形式の記載もしてあるOIDについても許容している。これは、既存システムとの互換性を維持し、円滑な移行を促すためである。しかし、一般のFHIRライブラリはNamingSystemリソースの内容まで参照していないことが一般的である。そのため、ライブラリを利用する実装者は、NamingSystemリソースを参照し、必要に応じてOID形式への一括変換などの工夫を行う必要がある。具体的には、NamingSystemリソースに定義されたOIDとURLの対応関係に基づき、ライブラリが処理するデータのURIを適切に変換することで、システム間の相互運用性を確保できる。

将来的なFHIR実装ガイドの改訂においては、URL形式の利用を必須とする方向で検討を進める予定である。そのため、新規システムの構築においては、可能な限りURL形式を採用することが推奨される。


#### URL形式への変更を行った際の注意事項
FHIRにおけるOID形式からURL形式への変更は、既存システムに以下の影響を与える。

* **システムの識別子参照箇所の修正が必要である。**  OIDを利用してリソースを参照していた箇所は、URLを用いた参照に修正が必要である。これはコードシステム、バリューセット、拡張定義、プロファイルなど、様々な箇所で発生する可能性がある。
* **一部のレガシーシステムとの互換性に問題が生じる可能性がある。**  OIDのみをサポートする古いシステムとの互換性に問題が生じる可能性があるため、移行期間においては両方の形式に対応する必要がある場合もある。
* **データマイグレーションが必要となる場合がある。**  既存データにOID形式で格納された識別子がある場合は、URL形式への変換が必要となる。

これらの影響は、既存システムの規模、複雑さ、およびFHIRの統合度合いによって異なる。変更の影響を最小限に抑えるためには、綿密な計画、適切なテスト、および段階的な移行が重要である。

#### OID形式とURL形式に関するマップ表
JP Core使用欄に＊がある行は、本IGで使用されるコード表になる。

|使用|コード名称|OID形式（旧）|URL形式（新）|
|----|----|----|----|
|	＊	|	JAMI SSMIX2診療科コード表	|	urn:oid:1.2.392.200250.2.2.2	|	http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment	|
|	＊	|	JAMI用法コード表ー１６桁バージョン	|	urn:oid:1.2.392.200250.2.2.20.20	|	http://jami.jp/CodeSystem/MedicationUsage	|
|	＊	|	JAMI用法コード表ー８桁補足用法コード	|	urn:oid:1.2.392.200250.2.2.20.22	|	http://jami.jp/CodeSystem/MedicationUsageAdditional	|
|	＊	|	JAMI用法コード表ー基本用法コード１桁	|	urn:oid:1.2.392.200250.2.2.20.30	|	http://jami.jp/CodeSystem/MedicationMethodBasicUsage	|
|		|	JAMI用法コード表ーイベント用法コード３桁	|	urn:oid:1.2.392.200250.2.2.20.31	|	http://jami.jp/CodeSystem/MedicationEventTriggered	|
|	＊	|	JAMI用法コード表ー外用部位コード表３桁	|	urn:oid:1.2.392.200250.2.2.20.32	|	http://jami.jp/CodeSystem/MedicationBodySiteExternal	|
|		|	JAMI用法コード表ー投与経路区分コード２桁（基本用法コード１桁と詳細区分コード１桁を連結）	|	urn:oid:1.2.392.200250.2.2.20.40	|	http://jami.jp/CodeSystem/MedicationMethodDetailUsage	|
|		|	JAMI用法コード表ー内服用法詳細区分コード１桁	|	urn:oid:1.2.392.200250.2.2.20.41	|	http://jami.jp/CodeSystem/MedicationMethodDetailOral	|
|		|	JAMI用法コード表ー外用用法詳細区分コード１桁	|	urn:oid:1.2.392.200250.2.2.20.42	|	http://jami.jp/CodeSystem/MedicationMethodDetailExternal	|
|		|	JAMI用法コード表ー注射用法詳細区分コード１桁	|	urn:oid:1.2.392.200250.2.2.20.43	|	http://jami.jp/CodeSystem/MedicationMethodDetailInjection	|
|		|	JAMI用法コード表ー注入用法詳細区分コード１桁	|	urn:oid:1.2.392.200250.2.2.20.44	|	http://jami.jp/CodeSystem/MedicationMethodDetailPouring	|
|		|	JAMI用法コード表ー時間的要素・機器区分コード1桁	|	urn:oid:1.2.392.200250.2.2.20.45	|	http://jami.jp/CodeSystem/MedicationMethodDetailDeviceInjection	|
|		|	JAMI用法コード表ー１２桁バージョン（実証実験用）	|	urn:oid:1.2.392.200250.2.2.21	|	http://jami.jp/CodeSystem/MedicationUsage-12digits	|
|       |	JAMI医薬品調剤指示コード	|	urn:oid:1.2.392.200250.2.2.30.10	|	http://jami.jp/CodeSystem/DrugDispensePreparationMethod	|
|	＊	|	MEDISー病名マスター病名管理番号	|	urn:oid:1.2.392.200119.4.101.2	|	http://medis.or.jp/CodeSystem/master-disease-keyNumber	|
|	＊	|	MEDISー病名マスター病名交換用コード	|	urn:oid:1.2.392.200119.4.101.6	|	http://medis.or.jp/CodeSystem/master-disease-exCode	|
|	＊	|	MEDISー病名マスター修飾語管理番号	|	urn:oid:1.2.392.200119.4.201.2	|	http://medis.or.jp/CodeSystem/master-disease-modKeyNumber	|
|		|	MEDISー病名マスター修飾語交換用コード	|	urn:oid:1.2.392.200119.4.201.5	|	http://medis.or.jp/CodeSystem/master-disease-modExCode	|
|		|	MEDISー医薬品基準番号（ＨＯＴ１３）	|	urn:oid:1.2.392.200119.4.402.1	|	http://medis.or.jp/CodeSystem/master-HOT13	|
|	＊	|	MEDISー医薬品基準番号（ＨＯＴ９）	|	urn:oid:1.2.392.200119.4.403.1	|	http://medis.or.jp/CodeSystem/master-HOT9	|
|		|	MEDISー医薬品処方用番号（ＨＯＴ７）	|	urn:oid:1.2.392.200119.4.403.2	|	http://medis.or.jp/CodeSystem/master-HOT7	|
|	＊	|	MEDISー臨床検査コードまとめ表「17桁コード表」	|	urn:oid:1.2.392.200119.4.504	|	http://medis.or.jp/CodeSystem/master-JLAC10-17digits	|
|		|	MEDISー看護⾏為テーブル（基本看護実践標準用語）	|	urn:oid:1.2.392.200119.4.704	|	http://medis.or.jp/CodeSystem/master-nursingAction-16digits	|
|		|	MEDISー看護観察テーブル（観察名称管理番号（コード））	|	urn:oid:1.2.392.200119.4.804	|	http://medis.or.jp/CodeSystem/master-nursingObservationKeyCode	|
|		|	厚生労働省WHO-ICD10-2013年版3桁コード	|		|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/ICD10-2013-3digits	|
|		|	厚生労働省WHO-ICD10-2013年版全桁コード	|		|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/ICD10-2013-full	|
|		|	電子処方箋管理サービスー処方用法マスタ	|		|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationUsage_ePrescription	|
|		|	医薬品成分コード（電子カルテ共有サービス）	|		|	関係者調整中	|
|		|	以下は厚労省処方箋CDA記述仕様第1版に収載の表	|		|		|
|		|	剤形区分コード	|	urn:oid:1.2.392.100495.20.2.21	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationForm	|
|	＊	|	力価区分コード	|	urn:oid:1.2.392.100495.20.2.22	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationIngredientStrengthStrengthType	|
|	＊	|	後発品変更不可コード	|	urn:oid:1.2.392.100495.20.2.41	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationSubstitutionProhibittedCategory	|
|		|	残薬確認指示コード	|	urn:oid:1.2.392.100495.20.2.42	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/RequestCheckRemainingMedicine	|
|	＊	|	診療科コード	|	urn:oid:1.2.392.100495.20.2.51	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment	|
|	＊	|	保険種別コード	|	urn:oid:1.2.392.100495.20.2.61	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/InsuranceMajorCategory	|
|		|	被保険者区分コード	|	urn:oid:1.2.392.100495.20.2.62	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/InsuredPersonCategory	|
|		|	患者一部負担コード	|	urn:oid:1.2.392.100495.20.2.63	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationInsuredPersonClass	|
|   ＊	|	個別医薬品コード（YJ コード）リスト	|	(urn:oid:1.2.392.100495.20.2.73)	|	http://capstandard.jp/iyaku.info/CodeSystem/YJ-code	|
|   ＊	|	規格別薬剤成分コード（注：YJコードの末尾3桁をZZZとした）|	なし	|	http://capstandard.jp/CodeSystem/KikakubetsuYakuzaiSeibun	|
|		|	HOT コード（9 桁）	|	(urn:oid:1.2.392.100495.20.2.74)	|	MEDISー医薬品基準番号（ＨＯＴ９）を参照	|
|		|	一般名処方マスタ	|	urn:oid:1.2.392.100495.20.2.81	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationGeneralOrderCode	|
|	＊	|	医薬品単位略号	|	urn:oid:1.2.392.100495.20.2.101	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationUnitMERIT9Code	|
|	＊	|	都道府県番号	|	urn:oid:1.2.392.100495.20.3.21	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits	|
|	＊	|	点数表番号	|	urn:oid:1.2.392.100495.20.3.22	|	http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationFeeScoreType	|
|	＊	|	医療機関コード	|	urn:oid:1.2.392.100495.20.3.23	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicalOrganizationID	|
|	＊	|	医籍登録番号	|	urn:oid:1.2.392.100495.20.3.31	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/medicalRegistrationNumber	|
|	＊	|	保険者番号	|	urn:oid:1.2.392.100495.20.3.61	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/InsurerNumber	|
|		|	被保険者証記号	|	urn:oid:1.2.392.100495.20.3.62	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/InsuredPersonSymbol	|
|		|	被保険者証番号	|	urn:oid:1.2.392.100495.20.3.63	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/InsuredPersonNumber	|
|		|	被保険者証番号-枝番	|		|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/InsuredPersonSubnumber	|
|		|	公費負担者番号	|	urn:oid:1.2.392.100495.20.3.71	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/PublicPayerNumber	|
|		|	公費受給者番号	|	urn:oid:1.2.392.100495.20.3.72	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/PublicInsuredPersonNumber	|
|	＊	|	RP番号	|	urn:oid:1.2.392.100495.20.3.81	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumber	|
|	＊	|	RP内の順序を示す連番	|	urn:oid:1.2.392.100495.20.3.82	|	http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex	|
|		|	処方箋 ID	|	urn:oid:1.2.392.100495.20.3.11.y　枝番仕様あり	|	URL表記は使用しない	|
|		|	調剤結果 ID	|	urn:oid:1.2.392.100495.20.3.12.y　枝番仕様あり	|	URL表記は使用しない	|
|		|	麻薬施用者免許番号	|	urn:oid:1.2.392.100495.20.3.32.y　枝番仕様あり	|	URL表記は使用しない	|
|		|	薬剤師名簿登録番号	|	urn:oid:1.2.392.100495.20.3.33.y　枝番仕様あり	|	URL表記は使用しない	|
|		|	医師を特定する ID	|	urn:oid:1.2.392.100495.20.3.41.x　枝番仕様あり	|	URL表記は使用しない	|
|		|	歯科医師を特定する ID	|	urn:oid:1.2.392.100495.20.3.42.x　枝番仕様あり	|	URL表記は使用しない	|
|		|	薬剤師を特定する ID	|	urn:oid:1.2.392.100495.20.3.43.x　枝番仕様あり	|	URL表記は使用しない	|
|		|	患者を特定する ID	|	urn:oid:1.2.392.100495.20.3.51.x　枝番仕様あり	|	URL表記は使用しない	|
