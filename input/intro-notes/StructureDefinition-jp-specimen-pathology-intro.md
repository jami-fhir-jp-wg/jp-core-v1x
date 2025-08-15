{% include markdown-link-references.md %}

### 概要

本プロファイルは、病理検査における検体情報を記述するためのSpecimenリソースの日本国内における実装ガイドである。
病理診断の基礎となる検体の採取から処理、管理までの情報を構造化して記録する。

### 背景および想定シナリオ

#### 背景
病理検査における検体管理は以下のプロセスを含む：
- **検体採取**: 生検、手術材料、細胞診等の採取
- **検体受付**: 病理部門での受付と番号付与
- **検体処理**: 固定、包埋、薄切、染色等の処理
- **ブロック・標本管理**: パラフィンブロックとガラススライドの管理
- **保管**: 長期保管と検索可能な管理

検体の適切な管理は、診断の正確性と追加検査の可能性を確保するために重要である。

#### 想定シナリオ

**シナリオ1：内視鏡生検検体**
- 胃内視鏡で3か所から生検
- 各検体を個別に管理（部位情報付き）
- 各検体から複数の標本作成

**シナリオ2：手術材料検体**
- 肺葉切除標本
- 複数のブロック作成（腫瘍部、断端等）
- 各ブロックから複数の染色標本作成

**シナリオ3：細胞診検体**
- 喀痰、尿、体腔液等の液状検体
- 遠心分離等の処理
- 塗抹標本の作成

### スコープ

#### 対象
- 病理検査のための全ての検体種別
- 組織検体、細胞診検体、術中迅速検体
- 検体採取から処理、保管までの情報
- ブロック・標本の管理情報

#### 対象外
- 検査結果（JP_Observation_Pathologyで管理）
- 診断レポート（JP_DiagnosticReport_Pathologyで管理）
- 画像データ（JP_ImagingStudy_Pathology、JP_Media_Pathologyで管理）

### プロファイル定義における必須要素と推奨要素

| 要素 | 必須/推奨 | 説明 |
|-----|----------|------|
| identifier | 必須 | 検体管理番号 |
| accessionIdentifier | 推奨 | 病理受付番号 |
| status | 推奨 | 検体の状態 |
| type | 必須 | 検体の種類 |
| subject | 必須 | 患者参照 |
| receivedTime | 推奨 | 検体受付日時 |
| collection | 推奨 | 採取情報 |
| processing | 推奨 | 処理情報 |
| container | 推奨 | 容器情報 |
| note | 推奨 | 備考 |

### 他のプロファイルとの関係

- **JP_DiagnosticReport_Pathology**: 診断レポートから参照される
- **JP_Observation_Pathology**: 観察結果から参照される
- **JP_ImagingStudy_Pathology**: WSI画像から参照される
- **JP_Patient**: subject要素で患者を参照
- **JP_Practitioner**: 採取者、処理者を参照
- **JP_Procedure**: 採取手技を参照

### 検体種別ごとの実装ガイド

#### 組織検体（Tissue Specimen）
```
type: SNOMED CT 119376003 "Tissue specimen"
collection.method: 生検、手術等の採取方法
processing.procedure: 固定、包埋、薄切等の処理
拡張: ブロック番号、標本番号
```

#### 細胞診検体（Cytology Specimen）
```
type: SNOMED CT 119361006 "Cytology specimen"
collection.bodySite: 採取部位
processing.procedure: 遠心分離、塗抹等
container.type: 液状検体容器等
```

#### 術中迅速検体（Frozen Section）
```
type: SNOMED CT 430861009 "Frozen section specimen"
processing.timeDateTime: 凍結処理時刻
note: 迅速診断の緊急度
```

### 検体管理の注意点

#### 検体識別
- 病理受付番号による一意の識別
- ブロック番号、標本番号による階層的管理
- バーコード等による自動識別の活用

#### トレーサビリティ
- 採取から診断までの全工程の記録
- 処理日時、実施者の記録
- 保管場所の管理

#### 品質管理
- 固定条件、処理条件の記録
- 不適切検体の識別とフラグ管理
- 再検査可能性の評価