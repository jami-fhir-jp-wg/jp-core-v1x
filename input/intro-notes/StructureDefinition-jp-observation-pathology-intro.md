{% include markdown-link-references.md %}

### 概要

本プロファイルは、病理検査における観察結果（肉眼所見、顕微鏡所見、診断等）を記述するためのObservationリソースの日本国内における実装ガイドである。
病理診断レポートの個々の所見を構造化して記録し、診断の根拠となる情報を管理する。

### 背景および想定シナリオ

#### 背景
病理診断では、以下のような複数の観察が行われる：
- **肉眼的所見**: 検体の大きさ、色調、性状等の肉眼的観察
- **顕微鏡的所見**: HE染色等による組織学的観察
- **免疫染色結果**: 特定マーカーの発現状況
- **分子病理学的検査**: 遺伝子変異等の解析結果
- **最終診断**: 総合的な病理診断

これらの観察結果を構造化して記録することで、診断の根拠を明確にし、データの二次利用を可能にする。

#### 想定シナリオ

**シナリオ1：胃生検の病理所見**
- 肉眼所見：3mm大の粘膜片
- 顕微鏡所見：慢性炎症細胞浸潤、腸上皮化生
- 免疫染色：H. pylori陽性
- 診断：慢性胃炎

**シナリオ2：肺癌手術検体の所見**
- 肉眼所見：3.5cm大の腫瘤
- 顕微鏡所見：腺癌、中分化型
- 免疫染色：TTF-1陽性、CK7陽性
- 診断：肺腺癌、pT2aN1M0

### スコープ

#### 対象
- 病理検査における全ての観察結果
- 肉眼所見、顕微鏡所見、免疫染色、分子病理、診断
- 定性的・定量的な観察結果

#### 対象外
- 検査オーダ情報（ServiceRequestで管理）
- レポート全体の管理（JP_DiagnosticReport_Pathologyで管理）
- 画像データ本体（JP_Media_Pathologyで管理）

### プロファイル定義における必須要素と推奨要素

| 要素 | 必須/推奨 | 説明 |
|-----|----------|------|
| status | 必須 | 観察結果のステータス |
| category | 必須 | "laboratory"および"pathology" |
| code | 必須 | 観察項目のコード |
| subject | 必須 | 患者参照 |
| effectiveDateTime | 推奨 | 観察日時 |
| value[x] | 推奨 | 観察結果 |
| specimen | 推奨 | 検体参照 |
| performer | 推奨 | 観察実施者（病理医） |
| method | 条件付き | 染色法等の方法 |
| bodySite | 条件付き | 採取部位 |

### 他のプロファイルとの関係

- **JP_DiagnosticReport_Pathology**: 親となる診断レポートから参照される
- **JP_Specimen_Pathology**: specimen要素で検体情報を参照
- **JP_Patient**: subject要素で患者を参照
- **JP_Practitioner**: performer要素で病理医を参照

### 観察タイプ別の実装ガイド

#### 肉眼的所見（Gross Description）
```
code: LOINC 22634-0 "Pathology report gross observation"
valueString: 所見のテキスト記述
```

#### 顕微鏡的所見（Microscopic Description）
```
code: LOINC 22635-7 "Pathology report microscopic observation"
valueString: 所見のテキスト記述
method: 染色法（HE染色等）
```

#### 免疫染色結果
```
code: 各マーカーのLOINCコード
valueCodeableConcept: 陽性/陰性/判定不能
component: 染色強度、陽性率等の詳細
```

#### 病理診断
```
code: LOINC 22637-3 "Pathology report final diagnosis"
valueCodeableConcept: SNOMED CTまたはICD-O-3コード
valueString: 診断のテキスト記述（コード化困難な場合）
```