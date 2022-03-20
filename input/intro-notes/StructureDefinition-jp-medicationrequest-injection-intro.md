<br/>

このプロファイルは注射、注入の薬剤処方（以下、「注射処方」）をMedicationRequestリソースを使用して表現する。注射処方は指示する項目、使用する用語集、プロセスなどにおいて諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での注射関連規格として利用されているJAHIS 注射データ交換規約 Ver 2.1CおよびSS-MIX2 Ver.1.2gを参考にした。
以下、このプロファイルのMedicationRequestリソースを「JP Core MedicationRequest Injectionリソース」と呼ぶ。

## 背景および想定シナリオ
このプロファイルは、以下のようなユースケースを想定している。

- 電子カルテから特定の患者の注射オーダ情報を検索する
- 退院時サマリや診療情報提供書において注射の投薬情報を記述する
- 各種検査レポートや診断レポートにおいて注射の投薬情報を記述する
- SS-MIX2のOMP-02(注射オーダ)メッセージやJAHIS注射データ交換規約に準拠した注射オーダメッセージをJSONに変換する

## スコープ
<h3>対象</h3>

このプロファイルの対象は注射、注入の一般的な薬剤処方を電子的に連携するためのメッセージを記述することである。

<h3>対象としないこと</h3>

このプロファイルは注射、注入の薬剤に関するものであり、内服、外用の薬剤については対象としない。内服、外用の薬剤は、指示の仕方や指示する項目が注射、注入とは大きく異なるため、別のプロファイルとして記述することとする。

また、このプロファイルのMedicationRequestリソースは薬剤の指示（オーダー）に関するものであり、調剤や払い出し、実施記録は対象としない。それぞれ、MedicationDispense, MedicationAdministrationが対応するリソースである。

## 関連するプロファイル
JP Core MedicationRequest Injection リソースは、以下のリソースから直接参照される。

- JP Core MedicationDispenseリソース
- JP Core MedicationAdministrationリソース
- JP Core DiagnosticReportリソース
- JP Core Observationリソース

JP Core MedicationRequest Injection リソースは、以下のリソースを直接参照する。

- JP Core Patientリソース
- JP Core Encounterリソース
- JP Core Practitionerリソース
- JP Core PractitionerRoleリソース
- JP Core Organizationリソース
- JP Core Coverageリソース
- JP Core Medicationリソース

## プロファイル定義