{% include markdown-link-references.md %}

### 利用方法

#### 必須要素の説明

**status**
- レポートのステータスを表す
- "preliminary"（作成中）、"final"（確定）、"amended"（修正）等を使用
- 病理診断の確定状態を明確に示す

**category**
- 病理レポートであることを示すため、LOINCコード"LP7839-6"（病理）を必ず指定
- 複数のcategoryを指定可能だが、病理を示すcategoryは必須

**subject**
- 患者情報への参照を必ず含める
- JP_Patientプロファイルを参照

**specimen**  
- 病理検査では検体情報が必須
- JP_Specimen_Pathologyプロファイルを参照
- 複数検体の場合は複数のspecimen要素を使用

#### 推奨要素の説明

**identifier**
- 施設内で病理診断を一意に識別する番号
- 病理診断番号、受付番号等を格納

**effectiveDateTime**
- 病理診断が確定した日時
- 臨床的に意味のある日時を記録

**performer**
- 病理診断を行った病理医の情報
- 複数の病理医が関与した場合は複数指定可能

**result**
- 肉眼所見、顕微鏡所見、免疫染色結果等の個別の観察結果
- JP_Observation_Pathologyプロファイルを参照

**conclusion**
- 最終的な病理診断をテキストで記載
- 診断の要約や総合所見を含む

### 注意事項

#### データの整合性
- specimen要素で参照する検体と、result要素で参照する観察結果の検体は一致している必要がある
- 複数の検体がある場合、どの所見がどの検体に対応するか明確にする

#### ステータス管理
- "preliminary"から"final"への変更は、診断が確定したことを意味する
- "amended"は既に確定したレポートの修正版であることを示す
- ステータスの変更履歴は別途管理することを推奨

#### 画像との関連付け
- WSI画像がある場合はimagingStudy要素で参照
- キー画像はmedia要素で参照
- 画像へのアクセス権限に注意

### サンプル

#### 基本的な病理診断レポート

```json
{
  "resourceType": "DiagnosticReport",
  "id": "pathology-example-1",
  "meta": {
    "profile": [
      "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Pathology"
    ]
  },
  "identifier": [
    {
      "system": "http://example.org/pathology/report-id",
      "value": "PATH-2024-00123"
    }
  ],
  "status": "final",
  "category": [
    {
      "coding": [
        {
          "system": "http://loinc.org",
          "code": "LP7839-6",
          "display": "病理"
        }
      ]
    }
  ],
  "code": {
    "coding": [
      {
        "system": "http://loinc.org",
        "code": "60568-3",
        "display": "Pathology Synoptic report"
      }
    ]
  },
  "subject": {
    "reference": "Patient/patient-example-1"
  },
  "effectiveDateTime": "2024-01-15T10:30:00+09:00",
  "issued": "2024-01-15T16:00:00+09:00",
  "performer": [
    {
      "reference": "Practitioner/pathologist-example-1"
    }
  ],
  "specimen": [
    {
      "reference": "Specimen/specimen-pathology-example-1"
    }
  ],
  "result": [
    {
      "reference": "Observation/pathology-gross-example-1",
      "display": "肉眼所見"
    },
    {
      "reference": "Observation/pathology-micro-example-1",
      "display": "顕微鏡所見"
    }
  ],
  "conclusion": "胃体部小弯：慢性胃炎、H. pylori陽性",
  "conclusionCode": [
    {
      "coding": [
        {
          "system": "http://snomed.info/sct",
          "code": "235653009",
          "display": "Helicobacter pylori associated chronic gastritis"
        }
      ]
    }
  ]
}
```

### 用語定義

| 用語 | 定義 |
|------|------|
| 病理診断 | 組織や細胞を顕微鏡で観察して行う診断 |
| 肉眼所見 | 検体を肉眼で観察した所見 |
| 顕微鏡所見 | 顕微鏡で観察した所見 |
| 免疫染色 | 抗原抗体反応を利用した染色法 |
| WSI | Whole Slide Imaging（バーチャルスライド） |
| ブロック | パラフィンに包埋された検体 |
| 標本 | ガラススライドに載せた薄切切片 |