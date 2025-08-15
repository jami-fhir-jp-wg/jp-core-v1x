{% include markdown-link-references.md %}

### 利用方法

#### 必須要素の説明

**identifier**
- Study Instance UIDを設定
- DICOM規格に準拠したUID形式
- 検査単位で一意に識別

**status**
- WSI画像検査のステータス
- "available"（利用可能）を基本とする
- アーカイブ済みの場合は"entered-in-error"以外を使用

**modality**
- "SM" (Slide Microscopy)を必須で指定
- 病理WSIを示すDICOMモダリティコード

**subject**
- 患者情報への参照
- JP_Patientプロファイルを参照

**started**
- WSIスキャン開始日時
- スキャナーでのスキャン開始時刻を記録

**series**
- WSI画像のシリーズ情報
- 染色毎に別シリーズとして管理

#### 推奨要素の説明

**endpoint**
- DICOMwebエンドポイント情報
- WADO-RS/WADO-URIでのアクセスURL
- 認証情報を含むEndpointリソースを参照

**description**
- WSI検査の概要説明
- スキャン条件、目的等を記載

**interpreter**
- WSIを診断した病理医
- JP_Practitionerプロファイルを参照

### 注意事項

#### シリーズの管理
- 1つのStudyに複数のSeriesを含むことが可能
- 各Seriesは異なる染色法を表す
- Series内に複数の倍率画像をInstanceとして格納

#### 検体との関連付け
- series.specimenで必ず検体情報を参照
- 検体のブロック番号、標本番号との対応を明確に

#### アクセス制御
- WSI画像へのアクセス権限を適切に管理
- エンドポイントでの認証・認可を実装

### サンプル

#### 複数染色のWSI検査

```json
{
  "resourceType": "ImagingStudy",
  "id": "wsi-pathology-example-1",
  "meta": {
    "profile": [
      "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Pathology"
    ]
  },
  "identifier": [
    {
      "system": "urn:dicom:uid",
      "value": "urn:oid:1.2.392.200036.9116.2.2024.1234567"
    }
  ],
  "status": "available",
  "modality": [
    {
      "system": "http://dicom.nema.org/resources/ontology/DCM",
      "code": "SM",
      "display": "Slide Microscopy"
    }
  ],
  "subject": {
    "reference": "Patient/patient-example-1"
  },
  "started": "2024-01-15T14:00:00+09:00",
  "numberOfSeries": 2,
  "numberOfInstances": 6,
  "description": "胃生検標本のWSIスキャン",
  "series": [
    {
      "uid": "1.2.392.200036.9116.2.2024.1234567.1",
      "number": 1,
      "modality": {
        "system": "http://dicom.nema.org/resources/ontology/DCM",
        "code": "SM"
      },
      "description": "HE染色",
      "numberOfInstances": 3,
      "specimen": [
        {
          "reference": "Specimen/specimen-pathology-example-1"
        }
      ],
      "started": "2024-01-15T14:00:00+09:00",
      "instance": [
        {
          "uid": "1.2.392.200036.9116.2.2024.1234567.1.1",
          "sopClass": {
            "system": "urn:ietf:rfc:3986",
            "code": "urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6"
          },
          "number": 1,
          "title": "20x magnification"
        },
        {
          "uid": "1.2.392.200036.9116.2.2024.1234567.1.2",
          "sopClass": {
            "system": "urn:ietf:rfc:3986",
            "code": "urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6"
          },
          "number": 2,
          "title": "40x magnification"
        }
      ]
    },
    {
      "uid": "1.2.392.200036.9116.2.2024.1234567.2",
      "number": 2,
      "modality": {
        "system": "http://dicom.nema.org/resources/ontology/DCM",
        "code": "SM"
      },
      "description": "Immunostaining - H. pylori",
      "numberOfInstances": 1,
      "specimen": [
        {
          "reference": "Specimen/specimen-pathology-example-1"
        }
      ],
      "started": "2024-01-15T14:30:00+09:00",
      "instance": [
        {
          "uid": "1.2.392.200036.9116.2.2024.1234567.2.1",
          "sopClass": {
            "system": "urn:ietf:rfc:3986",
            "code": "urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6"
          },
          "number": 1,
          "title": "40x magnification"
        }
      ]
    }
  ],
  "endpoint": [
    {
      "reference": "Endpoint/dicomweb-endpoint-1"
    }
  ]
}
```

### 用語定義

| 用語 | 定義 |
|------|------|
| WSI | Whole Slide Imaging（バーチャルスライド） |
| Study | DICOMにおける検査単位 |
| Series | Study内の画像グループ |
| Instance | 個々の画像ファイル |
| SOP Class | Service-Object Pair Class |
| DICOMweb | WebベースのDICOMアクセスプロトコル |
| WADO | Web Access to DICOM Objects |
| モダリティ | 画像取得装置の種類 |

### 拡張の利用

#### JP_ImagingStudy_Pathology_ScannerInfo
スキャナー情報を管理する拡張。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_ImagingStudy_Pathology_ScannerInfo",
    "extension": [
      {
        "url": "manufacturer",
        "valueString": "Scanner Manufacturer Inc."
      },
      {
        "url": "model",
        "valueString": "WSI Scanner Model X"
      },
      {
        "url": "magnification",
        "valueDecimal": 40
      }
    ]
  }
]
```

### DICOMwebアクセス

#### WADO-RSでの取得例
```
GET [base]/studies/1.2.392.200036.9116.2.2024.1234567/series/1.2.392.200036.9116.2.2024.1234567.1/instances
```

#### WADO-URIでの取得例
```
GET [base]?requestType=WADO&studyUID=1.2.392.200036.9116.2.2024.1234567&seriesUID=1.2.392.200036.9116.2.2024.1234567.1
```

### 実装上の考慮事項

#### パフォーマンス
- WSI画像は大容量（数GB）になる可能性
- タイル分割、ピラミッド構造での管理
- ストリーミング配信の検討

#### ストレージ
- 長期保存のためのアーカイブ戦略
- 圧縮方式の選定（可逆/非可逆）
- バックアップとリストア手順