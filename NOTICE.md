# NOTICE — 著作権と第三者用語の取り扱い

本リポジトリ（HL7 FHIR JP Core 実装ガイド）の成果物は、原則として **[CC0 1.0 Universal](./LICENSE)（パブリックドメイン提供）** で提供されます。

ただし、CC0 が適用されるのは **一般社団法人日本医療情報学会 FHIR 国内実装基盤研究会（JAMI）が著作権を有する部分のみ** です。本実装ガイドには、第三者が権利を有するコード体系・用語（CodeSystem / ValueSet）が含まれており、それらは **各権利者の利用条件に従う** 必要があります。CC0 はこれら第三者の用語には及びません。

## CC0 が適用される範囲

- JP Core が独自に定義した Profile / Extension / SearchParameter
- JP Core が独自に定義したコード体系・値セット（例：`JP_MedicationSubstitutionProhibitionReason_CS`、心電図関連の JAMI 独自コード 等）
- ガイダンス・解説等の文書（`input/pagecontent/`、`input/intro-notes/` ほか）
- ビルドスクリプトおよび設定ファイル

## 第三者が権利を有する主な用語（CC0 の対象外）

各リソースの `copyright` 要素にも個別に明記しています。利用にあたっては各権利者の条件を確認してください。

| 用語・コード体系 | 権利者 | 例 |
|---|---|---|
| 身体計測コード | MEDIS-DC（一般財団法人 医療情報システム開発センター） | `JP_ObservationBodyMeasurementCode_CS` |
| 歯科口腔診査コード群 | 日本歯科医師会（Japan Dental Association）＆ JAMI | `JP_Dental*_CS`、`JP_ObservationDentalCategory_CS` |
| LOINC（心電図成分コード等） | Regenstrief Institute, Inc. / LOINC Committee | `JP_ObservationElectrocardiogramComponentCode_VS` |
| 内視鏡・放射線コード | JED-Project、JAHIS、JAMI | `JP_ObservationEndoscopyCode_VS`、`JP_ObservationRadiologyCode_VS` ほか |
| レセプト電算 傷病名・転帰区分 | 社会保険診療報酬支払基金 | `JP_ConditionDiseaseOutcomeReceipt_CS` ほか |
| HL7 表 0241 | HL7 Japan | `HL70241`（`JP_ConditionDiseaseOutcomeHL70241_CS`） |
| モダリティ | DICOM® / NEMA（商標） | `JP_DICOMModality_VS` |

> 上記以外にも、FHIR BASE 由来の用語や外部参照（LOINC、SNOMED CT 等）が含まれます。`guide-precautions.md`（利用上の注意事項 ＞ 用語ライセンス）も併せて参照してください。

## HL7 FHIR 本体由来の翻訳について

本実装ガイドには HL7 FHIR R4 本体の記述を翻訳・引用した箇所が含まれます。HL7 FHIR 仕様本体は CC0 で提供されているため、その翻訳物を CC0 で提供することと矛盾しません。

## 著作権表示

Copyright 一般社団法人日本医療情報学会 FHIR 国内実装基盤研究会
(FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI))
