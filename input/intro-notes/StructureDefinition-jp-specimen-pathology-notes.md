{% include markdown-link-references.md %}

### 利用方法

#### 必須要素の説明

**identifier**
- 検体を一意に識別する番号
- 病理部門内での検体管理番号を設定
- ブロック番号、標本番号なども含む

**type**
- 検体の種類を示すコード
- SNOMED CTコードを使用（組織、細胞診等）
- 複数のコードシステムを併用可能

**subject**
- 検体の提供者（患者）への参照
- JP_Patientプロファイルを参照

#### 推奨要素の説明

**accessionIdentifier**
- 病理受付番号
- 検査室で付与される一意の受付番号
- 複数検体が同一受付番号を持つ場合あり

**status**
- 検体の現在の状態
- "available"（利用可能）、"unavailable"（利用不可）等
- 検体の品質や保管状態を反映

**receivedTime**
- 病理部門で検体を受け取った日時
- TAT（Turn Around Time）管理に重要

**collection**
- 検体採取に関する情報
- 採取日時、採取者、採取方法、採取部位等

**processing**
- 検体処理に関する情報
- 固定、包埋、薄切、染色等の処理内容
- 処理日時、処理条件を記録

### 注意事項

#### 検体管理の階層構造
- 1つの受付番号に複数の検体が存在可能
- 1つの検体から複数のブロックが作成可能
- 1つのブロックから複数の標本（スライド）が作成可能
- 拡張を使用してブロック番号、標本番号を管理

#### 検体の品質管理
- 固定条件（固定液種類、固定時間）の記録
- 不適切検体のフラグ管理
- 再検査の可否情報

#### 検体のトレーサビリティ
- 採取から診断までの全工程を追跡可能に
- 各処理ステップの実施者、日時を記録
- 保管場所の情報を管理

### サンプル

#### 生検検体の例

```json
{
  "resourceType": "Specimen",
  "id": "specimen-pathology-biopsy-1",
  "meta": {
    "profile": [
      "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Specimen_Pathology"
    ]
  },
  "identifier": [
    {
      "system": "http://example.org/pathology/specimen-id",
      "value": "SP-2024-00123-A1"
    }
  ],
  "accessionIdentifier": {
    "system": "http://example.org/pathology/accession-id",
    "value": "PATH-2024-00123"
  },
  "status": "available",
  "type": {
    "coding": [
      {
        "system": "http://snomed.info/sct",
        "code": "119376003",
        "display": "Tissue specimen"
      }
    ],
    "text": "胃生検組織"
  },
  "subject": {
    "reference": "Patient/patient-example-1"
  },
  "receivedTime": "2024-01-15T09:00:00+09:00",
  "collection": {
    "collector": {
      "reference": "Practitioner/endoscopist-1"
    },
    "collectedDateTime": "2024-01-15T08:30:00+09:00",
    "method": {
      "coding": [
        {
          "system": "http://snomed.info/sct",
          "code": "129314006",
          "display": "Biopsy"
        }
      ]
    },
    "bodySite": {
      "coding": [
        {
          "system": "http://snomed.info/sct",
          "code": "69695003",
          "display": "Stomach"
        }
      ],
      "text": "胃体部小彎"
    }
  },
  "processing": [
    {
      "description": "10%中性緩衝ホルマリン固定",
      "procedure": {
        "coding": [
          {
            "system": "http://snomed.info/sct",
            "code": "430864009",
            "display": "Tissue fixation"
          }
        ]
      },
      "timeDateTime": "2024-01-15T09:30:00+09:00"
    },
    {
      "description": "パラフィン包埋",
      "procedure": {
        "coding": [
          {
            "system": "http://snomed.info/sct",
            "code": "430863003",
            "display": "Embedding"
          }
        ]
      },
      "timeDateTime": "2024-01-15T10:00:00+09:00"
    }
  ],
  "container": [
    {
      "identifier": [
        {
          "value": "Block-A1"
        }
      ],
      "description": "パラフィンブロック A1",
      "type": {
        "text": "パラフィンブロック"
      }
    }
  ],
  "note": [
    {
      "text": "内視鏡所見：発赤、びらんあり。H. pylori感染疑い。"
    }
  ]
}
```

### 用語定義

| 用語 | 定義 |
|------|------|
| 検体 | 診断のために採取された組織や細胞 |
| 受付番号 | 病理部門で付与される一意の管理番号 |
| ブロック | パラフィンに包埋された検体 |
| 標本/スライド | ガラススライドに載せた薄切切片 |
| 固定 | 組織の自己融解を防ぐ処理 |
| 包埋 | 組織をパラフィンに埋め込む処理 |
| 薄切 | ブロックを薄く切る処理 |
| 染色 | 組織を観察しやすくするための色素処理 |
| TAT | Turn Around Time（検査所要時間） |

### 拡張の利用

#### JP_Specimen_Pathology_BlockNumber
ブロック番号を管理するための拡張。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_BlockNumber",
    "valueString": "A1"
  }
]
```

#### JP_Specimen_Pathology_SlideNumber
標本番号（スライド番号）を管理するための拡張。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_SlideNumber",
    "valueString": "A1-1"
  }
]
```

#### JP_Specimen_Pathology_SpecialHandling
特殊処理情報を管理するための拡張。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_SpecialHandling",
    "valueCodeableConcept": {
      "coding": [
        {
          "code": "frozen-section",
          "display": "凍結切片"
        }
      ]
    }
  }
]
```