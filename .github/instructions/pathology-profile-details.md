# JP Core 病理プロファイル詳細設計

## 1. JP_DiagnosticReport_Pathology 詳細設計

### プロファイル概要
```
Profile: JP_DiagnosticReport_Pathology
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-pathology
Title: "JP Core DiagnosticReport Pathology Profile"
Description: "病理診断レポートのためのプロファイル"
```

### 主要要素
| 要素 | カーディナリティ | 型 | 説明 |
|------|-----------------|-----|------|
| identifier | 1..* | Identifier | 病理診断番号 |
| status | 1..1 | code | preliminary/final |
| category | 1..* | CodeableConcept | PAT（病理）固定 |
| code | 1..1 | CodeableConcept | 病理レポート種別 |
| subject | 1..1 | Reference(JP_Patient) | 患者参照 |
| encounter | 0..1 | Reference(JP_Encounter) | 受診情報 |
| effectiveDateTime | 1..1 | dateTime | 診断日時 |
| issued | 1..1 | instant | 報告書発行日時 |
| performer | 1..* | Reference(JP_Practitioner) | 病理医 |
| specimen | 1..* | Reference(JP_Specimen_Pathology) | 検体参照 |
| result | 0..* | Reference(JP_Observation_Pathology) | 所見参照 |
| imagingStudy | 0..* | Reference(JP_ImagingStudy_Pathology) | WSI参照 |
| media | 0..* | BackboneElement | キー画像 |
| conclusion | 0..1 | string | 診断結論（テキスト） |
| conclusionCode | 0..* | CodeableConcept | 診断コード |
| presentedForm | 0..1 | Attachment | 報告書PDF |

### 拡張
- 検体受付日時
- 切り出し日時
- 報告書承認者
- 追加報告フラグ

## 2. JP_Observation_Pathology 詳細設計

### プロファイル概要
```
Profile: JP_Observation_Pathology
Parent: JP_Observation_Common
Id: jp-observation-pathology
Title: "JP Core Observation Pathology Profile"
Description: "病理所見・診断のためのプロファイル"
```

### 観察タイプ別設計

#### 2.1 肉眼的所見（Gross Description）
| 要素 | 値 |
|------|-----|
| code | LOINC: 22634-0 |
| category | laboratory, pathology |
| valueString | 肉眼所見テキスト |
| bodySite | 採取部位 |
| method | 切り出し方法 |

#### 2.2 顕微鏡的所見（Microscopic Description）
| 要素 | 値 |
|------|-----|
| code | LOINC: 22635-7 |
| category | laboratory, pathology |
| valueString | 顕微鏡所見テキスト |
| component | 各種所見項目 |

#### 2.3 病理診断（Diagnosis）
| 要素 | 値 |
|------|-----|
| code | LOINC: 22637-3 |
| category | laboratory, pathology |
| valueCodeableConcept | SNOMED CT/ICD-O-3 |
| interpretation | 悪性度等 |

#### 2.4 免疫染色結果
| 要素 | 値 |
|------|-----|
| code | 各マーカーのLOINCコード |
| category | laboratory, pathology |
| valueCodeableConcept | 陽性/陰性/判定不能 |
| component | 染色強度、陽性率等 |

## 3. JP_Specimen_Pathology 詳細設計

### プロファイル概要
```
Profile: JP_Specimen_Pathology
Parent: JP_Specimen_Common
Id: jp-specimen-pathology
Title: "JP Core Specimen Pathology Profile"
Description: "病理検体管理のためのプロファイル"
```

### 主要要素
| 要素 | カーディナリティ | 型 | 説明 |
|------|-----------------|-----|------|
| identifier | 1..* | Identifier | 検体番号 |
| accessionIdentifier | 1..1 | Identifier | 受付番号 |
| status | 1..1 | code | available/unavailable |
| type | 1..1 | CodeableConcept | 検体種別 |
| subject | 1..1 | Reference(JP_Patient) | 患者参照 |
| receivedTime | 1..1 | dateTime | 検体受付日時 |
| parent | 0..* | Reference(Specimen) | 親検体参照 |
| collection | 1..1 | BackboneElement | 採取情報 |
| processing | 0..* | BackboneElement | 処理情報 |
| container | 0..* | BackboneElement | 容器情報 |

### 拡張
- ブロック番号
- 標本番号（スライド番号）
- 染色方法
- 固定液種類
- 固定時間
- 脱灰処理
- 切片厚

## 4. JP_ImagingStudy_Pathology 詳細設計

### プロファイル概要
```
Profile: JP_ImagingStudy_Pathology
Parent: ImagingStudy
Id: jp-imagingstudy-pathology
Title: "JP Core ImagingStudy Pathology Profile"
Description: "病理WSI画像管理のためのプロファイル"
```

### 主要要素
| 要素 | カーディナリティ | 型 | 説明 |
|------|-----------------|-----|------|
| identifier | 1..* | Identifier | Study Instance UID |
| status | 1..1 | code | available |
| modality | 1..* | Coding | SM (Slide Microscopy) |
| subject | 1..1 | Reference(JP_Patient) | 患者参照 |
| started | 0..1 | dateTime | スキャン開始日時 |
| numberOfSeries | 1..1 | unsignedInt | シリーズ数 |
| numberOfInstances | 1..1 | unsignedInt | 画像数 |
| procedureReference | 0..1 | Reference(JP_Procedure) | 関連手技 |
| series | 1..* | BackboneElement | シリーズ情報 |

### シリーズ要素
- uid: Series Instance UID
- modality: SM固定
- description: 染色法、倍率等
- numberOfInstances: タイル画像数
- specimen: Reference(JP_Specimen_Pathology)
- started: スキャン日時
- instance: 個々の画像情報

### 拡張
- スキャナー機種
- スキャン倍率
- フォーカススタック数
- カラープロファイル

## 5. JP_Media_Pathology 詳細設計

### プロファイル概要
```
Profile: JP_Media_Pathology
Parent: Media
Id: jp-media-pathology
Title: "JP Core Media Pathology Profile"
Description: "病理画像メディア管理のためのプロファイル"
```

### 主要要素
| 要素 | カーディナリティ | 型 | 説明 |
|------|-----------------|-----|------|
| identifier | 0..* | Identifier | 画像ID |
| status | 1..1 | code | completed |
| type | 1..1 | CodeableConcept | image/video |
| modality | 0..1 | CodeableConcept | 撮影モダリティ |
| subject | 1..1 | Reference(JP_Patient) | 患者参照 |
| createdDateTime | 1..1 | dateTime | 撮影日時 |
| operator | 0..1 | Reference(JP_Practitioner) | 撮影者 |
| reasonCode | 0..* | CodeableConcept | 撮影理由 |
| bodySite | 0..1 | CodeableConcept | 撮影部位 |
| device | 0..1 | Reference(Device) | 撮影機器 |
| content | 1..1 | Attachment | 画像データ |

### 画像タイプ別設定
- 肉眼写真: type=gross-image
- 顕微鏡写真: type=microscopic-image
- 注釈付き画像: type=annotated-image
- WSIサムネイル: type=wsi-thumbnail

## 6. ターミノロジー設計

### CodeSystem
```
CodeSystem: JP_PathologyObservationType_CS
- gross-description: 肉眼的所見
- microscopic-description: 顕微鏡的所見
- pathological-diagnosis: 病理診断
- immunohistochemistry: 免疫染色
- molecular-pathology: 分子病理

CodeSystem: JP_PathologySpecimenType_CS
- biopsy: 生検
- surgical: 手術検体
- cytology: 細胞診
- autopsy: 剖検

CodeSystem: JP_PathologyStainMethod_CS
- HE: ヘマトキシリン・エオジン染色
- PAS: PAS染色
- EVG: エラスチカ・ワンギーソン染色
- MT: マッソン・トリクローム染色
```

### ValueSet
```
ValueSet: JP_PathologyDiagnosis_VS
- SNOMED CTの病理診断用語
- ICD-O-3形態コード
- ローカル診断コード

ValueSet: JP_PathologyBodySite_VS
- 病理採取部位コード
- 解剖学的部位

ValueSet: JP_ImmunohistochemistryMarker_VS
- 免疫染色マーカー一覧
```

## 7. サンプルシナリオ

### シナリオ1: 胃生検病理診断
1. 内視鏡で胃生検実施
2. 検体を病理部門に提出
3. 肉眼所見記載
4. HE染色標本作成
5. 顕微鏡診断
6. 免疫染色（必要時）
7. 診断レポート作成

### シナリオ2: 手術検体病理診断
1. 手術で臓器摘出
2. 検体を病理部門に提出
3. 肉眼所見・切り出し
4. 複数ブロック作成
5. 各ブロックから標本作成
6. 顕微鏡診断
7. 追加染色（必要時）
8. WSIスキャン
9. 診断レポート作成

## 8. 実装上の注意点

### データ整合性
- 検体番号の一意性確保
- ブロック・標本番号の管理
- 親子検体の関係性維持

### パフォーマンス
- WSI画像の参照方法（DICOMweb等）
- 大量の画像データの扱い
- キャッシュ戦略

### セキュリティ
- 病理画像のアクセス制御
- 個人情報の匿名化
- 監査ログの記録

### 相互運用性
- 既存病理システムとのマッピング
- 電子カルテとの連携
- 地域医療連携での利用