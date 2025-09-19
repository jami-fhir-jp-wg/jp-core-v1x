{% include markdown-link-references.md %}

### 利用方法

#### 必須要素の説明

**status**
- メディアのステータス
- 通常は"completed"を指定
- 画像が利用可能な状態を示す

**type**
- メディアの種類
- "image"（静止画）または"video"（動画）
- 病理では主に"image"を使用

**subject**
- 患者情報への参照
- JP_Patientプロファイルを参照

**created[x]**
- 画像が作成された日時
- 撮影日時を記録

**bodySite**
- 画像の対象となる解剖学的部位
- 検体採取部位や撮影部位を示す

**deviceName**
- 画像を生成した装置名
- カメラ名、顕微鏡名、スキャナー名等

**content**
- 画像の実際のコンテンツまたは参照
- URL、Base64エンコードデータ等

**note**
- 画像についてのコメント
- 撮影条件、染色法、倍率等の情報

#### 推奨要素の説明

**modality**
- 画像取得方法
- 肉眼写真、顕微鏡写真、WSI等を示すコード

**partOf**
- 関連する診断レポートまたは手技
- JP_DiagnosticReport_Pathologyを参照

**operator**
- 画像を撮影した者
- 技師、病理医等の情報

### 注意事項

#### 画像フォーマット
- JPEG、PNG、TIFF等の一般的な形式をサポート
- 高解像度画像の場合はファイルサイズに注意
- 圧縮率と画質のバランスを考慮

#### メタデータの記録
- 染色方法は拡張を使用して記録
- 撮影倍率は拡張を使用して記録
- 検体ラベル情報は拡張を使用して記録

#### アクセス制御
- 画像へのアクセスURLは適切に保護
- 認証・認可の実装を推奨
- 一時URLの使用も検討

### サンプル

#### 顕微鏡写真の例

```json
{
  "resourceType": "Media",
  "id": "pathology-microscopic-photo-1",
  "meta": {
    "profile": [
      "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Media_Pathology"
    ]
  },
  "identifier": [
    {
      "system": "http://example.org/pathology/media-id",
      "value": "MEDIA-2024-00123-01"
    }
  ],
  "status": "completed",
  "type": "image",
  "modality": {
    "coding": [
      {
        "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_PathologyMediaModality_CS",
        "code": "microscopic-photo",
        "display": "顕微鏡写真"
      }
    ]
  },
  "subject": {
    "reference": "Patient/patient-example-1"
  },
  "createdDateTime": "2024-01-15T14:30:00+09:00",
  "operator": [
    {
      "reference": "Practitioner/pathologist-1"
    }
  ],
  "bodySite": {
    "coding": [
      {
        "system": "http://snomed.info/sct",
        "code": "69695003",
        "display": "Stomach"
      }
    ],
    "text": "胃体部小彎"
  },
  "deviceName": "Olympus BX53 顕微鏡カメラシステム",
  "height": 2048,
  "width": 2560,
  "content": {
    "contentType": "image/jpeg",
    "url": "http://example.org/pathology/images/microscopic-00123-01.jpg",
    "size": 1536000,
    "title": "HE染色 400倍"
  },
  "note": [
    {
      "text": "HE染色、対物レンズ40倍、慢性炉症細胞浸潤と腸上皮化生を認める"
    }
  ],
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_Magnification",
      "valueDecimal": 400
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_StainMethod",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_PathologyStainMethod_CS",
            "code": "he-stain",
            "display": "HE染色"
          }
        ]
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_SpecimenLabel",
      "extension": [
        {
          "url": "blockNumber",
          "valueString": "A1"
        },
        {
          "url": "slideNumber",
          "valueString": "A1-1"
        }
      ]
    }
  ],
  "partOf": [
    {
      "reference": "DiagnosticReport/pathology-report-1"
    }
  ]
}
```

### 用語定義

| 用語 | 定義 |
|------|------|
| 肉眼写真 | 肉眼で観察した検体の写真 |
| 顕微鏡写真 | 顕微鏡で撮影した組織像 |
| キー画像 | 診断の根拠となる重要な画像 |
| 倍率 | 顕微鏡の拡大率 |
| 染色法 | 組織を染める方法 |
| WSI | Whole Slide Imaging |

### 拡張の利用

#### JP_Media_Pathology_Magnification
撮影倍率を記録する拡張。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_Magnification",
    "valueDecimal": 100
  }
]
```

#### JP_Media_Pathology_StainMethod
染色方法を記録する拡張。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_StainMethod",
    "valueCodeableConcept": {
      "coding": [
        {
          "code": "pas-stain",
          "display": "PAS染色"
        }
      ]
    }
  }
]
```

#### JP_Media_Pathology_SpecimenLabel
検体ラベル情報を記録する拡張。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_SpecimenLabel",
    "extension": [
      {
        "url": "blockNumber",
        "valueString": "B2"
      },
      {
        "url": "slideNumber",
        "valueString": "B2-3"
      }
    ]
  }
]
```

### 実装上の考慮事項

#### ストレージ
- 画像ファイルの長期保存戦略
- サムネイル画像の生成と管理
- クラウドストレージの活用

#### パフォーマンス
- 画像配信のCDN活用
- 適切なキャッシュ戦略
- レスポンシブ画像の提供

#### 標準化
- DICOM形式への変換考慮
- メタデータの統一的管理
- 国際標準への準拠