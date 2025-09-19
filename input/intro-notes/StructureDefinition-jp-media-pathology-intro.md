{% include markdown-link-references.md %}

### 概要

本プロファイルは、病理検査で取得または使用される画像に関わる情報を記述するためのMediaリソースの日本国内における実装ガイドである。
病理診断における重要なキー画像、肉眼写真、顕微鏡写真等の管理に使用される。

### 背景および想定シナリオ

#### 背景
病理診断では、以下のような画像が重要な役割を果たす：
- **肉眼写真**: 手術材料や大きな検体の肉眼的記録
- **顕微鏡写真**: 診断の根拠となる重要な所見
- **キー画像**: 診断レポートに添付される代表的画像
- **特殊染色画像**: 免疫染色、特殊染色の結果
- **蛍光画像**: 蛍光免疫染色の結果

これらの画像は、診断の根拠、教育資料、コンサルテーション等に活用される。

#### 想定シナリオ

**シナリオ1：肉眼写真の記録**
- 手術で摘出された臓器の肉眼写真撮影
- 切り出し面の記録
- 診断レポートへの添付

**シナリオ2：顕微鏡キー画像**
- 診断の根拠となる重要所見の撮影
- 複数倍率での撮影
- 診断レポートやカンファレンスでの使用

**シナリオ3：免疫染色結果の記録**
- 各種マーカーの免疫染色結果
- 染色強度、分布パターンの記録
- 診断の補助情報としての活用

### スコープ

#### 対象
- 病理検査で取得される全ての画像種別
- 肉眼写真、顕微鏡写真、蛍光画像等
- キー画像、教育用画像
- 動画もサポート

#### 対象外
- WSI全体の管理（JP_ImagingStudy_Pathologyで管理）
- 診断レポート（JP_DiagnosticReport_Pathologyで管理）
- 観察結果（JP_Observation_Pathologyで管理）

### プロファイル定義における必須要素と推奨要素

| 要素 | 必須/推奨 | 説明 |
|-----|----------|------|
| status | 必須 | メディアのステータス |
| type | 必須 | "image"または"video" |
| modality | 推奨 | 画像取得方法 |
| subject | 必須 | 患者参照 |
| created[x] | 必須 | 画像作成日時 |
| bodySite | 必須 | 採取部位 |
| deviceName | 必須 | 撮影装置名 |
| content | 必須 | 画像コンテンツ |
| note | 必須 | 撮影条件等のコメント |
| partOf | 推奨 | 診断レポートへの参照 |
| operator | 推奨 | 撮影者 |

### 他のプロファイルとの関係

- **JP_DiagnosticReport_Pathology**: partOf要素で診断レポートを参照
- **JP_ImagingStudy_Pathology**: WSI全体との関連付け
- **JP_Specimen_Pathology**: 画像の対象検体を参照
- **JP_Patient**: subject要素で患者を参照
- **JP_Practitioner**: operator要素で撮影者を参照

### 画像種別ごとの実装ガイド

#### 肉眼写真（Gross Photograph）
```
modality: "gross-photo"
deviceName: "デジタルカメラ"
note: "検体切り出し面、スケール付き"
```

#### 顕微鏡写真（Microscopic Photograph）
```
modality: "microscopic-photo"
deviceName: "顕微鏡カメラシステム"
拡張: magnification (40, 100, 400等)
拡張: stainMethod (HE, PAS, 免疫染色等)
note: "撮影倍率、染色法"
```

#### 蛍光画像（Fluorescence Image）
```
modality: "immunofluorescence"
deviceName: "蛍光顕微鏡"
拡張: stainMethod (蛍光標識種類)
note: "励起波長、蛍光フィルター"
```

### 画像フォーマットと保存

#### サポート形式
- JPEG: 一般的な写真
- PNG: 高品質画像
- TIFF: 非圧縮画像
- DICOM: 医用画像形式

#### content要素の使用
```json
"content": {
  "contentType": "image/jpeg",
  "url": "http://example.org/pathology/images/gross-photo-1.jpg",
  "size": 2048000,
  "title": "胃切除標本肉眼写真"
}
```

### セキュリティとアクセス制御

#### アクセス制御
- 画像へのアクセス権限管理
- 役割ベースのアクセス制御
- 監査ログの記録

#### プライバシー保護
- 患者情報の適切な匿名化
- 教育目的使用時の同意取得
- ウォーターマークの考慮

### 教育・研究目的での活用

#### 教育用画像
- 典型的な病理所見の記録
- ティーチングファイルとしての活用
- メタデータによる検索可能性

#### 研究用データ
- 画像解析のためのデータセット
- AI学習用データ
- 適切な倫理審査と同意取得