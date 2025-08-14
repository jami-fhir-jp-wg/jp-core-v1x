# 病理診断プロファイル構造図

病理診断レポートと病理所見のデータ構造は以下のように組織されています：

```
JP_DiagnosticReport_Pathology（病理診断レポート）
├── category: LP29708-2 (Pathology)
├── subject: JP_Patient
├── performer: JP_Practitioner（病理医）
├── specimen: JP_Specimen（検体情報）
├── result: JP_Observation_Pathology（病理観察結果）
│   ├── 第1層: 最終診断
│   │   ├── code: 22634-0 (Final diagnosis)
│   │   ├── value: 診断名（テキスト＋コード）
│   │   └── hasMember: 下位所見への参照
│   └── 第2層: 個別所見
│       ├── 肉眼所見
│       │   ├── code: 22636-5 (Gross observation)
│       │   └── value: 肉眼的所見
│       ├── 組織所見
│       │   ├── code: 22637-3 (Microscopic observation)
│       │   ├── method: HE染色等
│       │   └── value: 組織学的所見
│       ├── 特殊染色所見
│       │   ├── code: 22637-3 (Microscopic observation)
│       │   ├── method: 特殊染色方法
│       │   └── component: 複数の染色結果
│       └── 免疫組織化学所見
│           ├── code: 22637-3 (Microscopic observation)
│           ├── method: 免疫組織化学
│           └── component: 複数のマーカー結果
├── imagingStudy: JP_ImagingStudy_Pathology（DICOM画像）
│   ├── modality: GM (General Microscopy)
│   ├── series: 染色法別のシリーズ
│   │   ├── HE染色シリーズ
│   │   ├── 特殊染色シリーズ
│   │   └── 免疫染色シリーズ
│   └── instance: 個別画像インスタンス
├── media: JP_Media_Pathology（Non-DICOM画像）
│   ├── type: image
│   ├── modality: GM (General Microscopy)
│   ├── view: 染色方法
│   ├── subject: Patient or Specimen
│   └── content: 実際の画像データ
├── conclusion: テキストによる要約診断
├── conclusionCode: コード化された診断
└── presentedForm: PDF等のレポート本体
```

## 関連リソース

- **JP_Patient**: 対象患者情報
- **JP_Practitioner**: 病理医・技師情報
- **JP_Specimen**: 検体情報（重要）
- **JP_Encounter**: 関連する受診情報
- **JP_Condition**: 関連する疾患情報
- **JP_Procedure**: 生検等の手技情報

## 用語体系

- **JP_PathologyTerminology_CS**: 病理診断用語コードシステム
- **LOINC**: 国際的な検査・観察コード
- **DICOM**: 画像関連の標準用語

この構造により、病理診断の複雑な階層構造と多様な所見を体系的に表現できます。
