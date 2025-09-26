{% include markdown-link-references.md %}

### 概要

本プロファイルは、病理WSI（Whole Slide Imaging）画像情報を記述するためのImagingStudyリソースの日本国内における実装ガイドである。
WSIはガラススライド標本全体をデジタル化した画像であり、バーチャルスライドとも呼ばれる。

### 背景および想定シナリオ

#### 背景
近年、病理診断のデジタル化が進み、WSI技術が普及している。WSIには以下の利点がある：
- **遠隔診断**: 地理的制約を越えた診断が可能
- **コンサルテーション**: 専門家への相談が容易
- **教育**: 教育用コンテンツとしての活用
- **AI診断支援**: 画像解析AIとの連携
- **アーカイブ**: 長期保存と検索性の向上

日本では、2022年から保険診療でのデジタル病理画像に基づく病理診断が認められるようになった。

#### 想定シナリオ

**シナリオ1：病理診断のデジタル化**
- 染色されたガラススライドをWSIスキャナーでスキャン
- DICOM形式で保存、PACSで管理
- 病理医がビューアで診断

**シナリオ2：複数染色のWSI管理**
- HE染色、免疫染色等複数の染色標本
- 同一検体の異なる染色をシリーズとして管理
- 診断レポートから関連WSIを参照

**シナリオ3：遠隔コンサルテーション**
- 地方病院から専門病院へWSIを送信
- 専門家が遠隔で診断
- 診断結果をFHIRで送信

### スコープ

#### 対象
- 病理WSI画像の管理情報
- DICOM形式のWSIデータ
- 複数染色のシリーズ管理
- スキャナー情報、スキャン条件

#### 対象外
- 画像データ本体（エンドポイントで参照）
- キー画像（JP_Media_Pathologyで管理）
- 診断結果（JP_DiagnosticReport_Pathologyで管理）

### プロファイル定義における必須要素と推奨要素

| 要素 | 必須/推奨 | 説明 |
|-----|----------|------|
| identifier | 必須 | Study Instance UID |
| status | 必須 | ステータス |
| modality | 必須 | "SM"（Slide Microscopy）固定 |
| subject | 必須 | 患者参照 |
| started | 必須 | スキャン開始日時 |
| numberOfSeries | 必須 | シリーズ数 |
| numberOfInstances | 必須 | インスタンス数 |
| series | 必須 | シリーズ情報 |
| series.uid | 必須 | Series Instance UID |
| series.modality | 必須 | "SM" |
| series.specimen | 必須 | 検体参照 |
| description | 推奨 | 検査の説明 |
| endpoint | 推奨 | DICOMwebエンドポイント |

### 他のプロファイルとの関係

- **JP_DiagnosticReport_Pathology**: 診断レポートからimagingStudy要素で参照
- **JP_Specimen_Pathology**: series.specimen要素で検体を参照
- **JP_Media_Pathology**: キー画像を別途管理
- **JP_Patient**: subject要素で患者を参照
- **JP_Practitioner**: interpreter要素で病理医を参照

### WSIデータの管理

#### DICOMモダリティ
- モダリティコード: "SM" (Slide Microscopy)
- VL Whole Slide Microscopy Image Storageを使用
- SOP Class UID: 1.2.840.10008.5.1.4.1.1.77.1.6

#### シリーズ構成
```
Study (検査単位)
├─ Series 1 (HE染色)
│  ├─ Instance 1 (低倍率画像)
│  ├─ Instance 2 (中倍率画像)
│  └─ Instance 3 (高倍率画像)
├─ Series 2 (免疫染色A)
│  └─ Instance 1
└─ Series 3 (免疫染色B)
   └─ Instance 1
```

#### スキャナー情報の管理
拡張を使用してスキャナー情報を記録：
- 製造元
- モデル名
- スキャン倍率

### アクセス方法

#### DICOMweb
- WADO-RS: RESTful WebサービスでのWSI取得
- WADO-URI: URIベースでのWSI取得
- STOW-RS: WSIのアップロード

#### エンドポイント設定
```json
"endpoint": [
  {
    "reference": "Endpoint/dicomweb-wsi-endpoint"
  }
]
```

### セキュリティ考慮

- 患者情報の匿名化
- アクセス制御の実装
- 監査ログの記録
- 暗号化通信の使用