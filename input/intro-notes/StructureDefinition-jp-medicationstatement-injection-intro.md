本プロファイルは患者に投与された注射薬剤の記録をMedicationStatementリソースを使用して表現する。
以下、本プロファイルのMedicationStatementリソースを「JP Core MedicationStatement Injectionリソース」と呼ぶ。

MedicationStatementリソースをプロファイルに組み込んだ先行事例として、以下2つのHL7FHIR記述仕様が存在しており、JP Coreとして利用できる仕様については可能な限り取り入れるようにした。ただし、拡張のURLは新たにJP Coreの命名規則に基づいて命名している。
- [診療情報提供書 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/eReferralFHIR_v1x.pdf)
- [退院時サマリー HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/eDischargeSummaryFHIR_v1x.pdf)

## 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- 各種医療文書、及び他施設への提供文書に、患者の注射薬剤投与情報を記録する
- 紹介元の医療機関や、患者自身（またはその家族等）から提供された、患者の注射薬剤投与情報を記録する

## スコープ
<h3>対象</h3>

本プロファイルの対象は注射薬剤の投与情報を電子的に連携するためのメッセージを記述することである。

<h3>対象としないこと</h3>

本プロファイルは注射薬剤に関するものであり、内服・外用薬剤については対象としない。内服・外用薬剤は、指示の仕方や指示する項目が注射とは大きく異なるため、別のプロファイルとして記述することとする。

また、医療従事者によって管理されている投与実施の記録は、MedicationAdministrationが対応リソースとなるため、MedicationStatementは使用しない。

## プロファイル定義