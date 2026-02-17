# 口腔診査品質基準 (Dental Examination Quality Standards)

> **出典**: `.specify/memory/constitution.md` v1.1.1 にて分離。
> 本ドキュメントはドメイン固有の品質基準と既知の問題を記録する。

## 主要な口腔診査アーティファクト

### コアプロファイル

- **`JP_DiagnosticReport_DentalOral`**: 口腔診査レポート
- **`JP_Observation_DentalOral_ToothExistence`**: 歯の有無・存在
- **`JP_Observation_DentalOral_ToothTreatmentCondition`**: 現存歯の処置状態
- **`JP_Observation_DentalOral_MissingToothCondition`**: 欠損歯の処置状態

### 拡張（Extension）

- **`JP_Observation_DentalOral_BodySiteStatus`**: 身体部位状態
- **`JP_Observation_DentalOral_BodyStructure`**: 歯の構造（歯面等）
- **`JP_Observation_DentalOral_ToothRoot`**: 歯根指定

### 用語集

- **13 の歯科固有 CodeSystem**: 歯式、処置状態、身体構造等
- **13 の対応 ValueSet**: 各 CodeSystem に対応

## 重大な構造的問題

### 1. 一貫性のないコンポーネントコーディング制約

```fsh
// MissingToothCondition - 問題: プライマリコードが使用不可
* component.code.coding[primary] ..1  // システム制約なし！

// ToothTreatmentCondition - 正常動作
* component.code.coding[primary] from JP_DentalPresentTeethObservation_VS
* component.code.coding[primary].system = $JP_DentalPresentTeethObservation_CS
```

**問題**: 欠損歯処置状態でシステム制約不足により
プライマリコードが適切に使用できない。

### 2. 相互参照関係の破綻

```fsh
// ToothExistenceは他を参照可能
* hasMember only Reference(
    JP_Observation_DentalOral_ToothTreatmentCondition or
    JP_Observation_DentalOral_MissingToothCondition)

// しかしMissingToothConditionは逆参照不可
* hasMember 0..0  // ブロック！
```

**問題**: 欠損歯処置状態が関連観察への逆参照不可で
論理的関係が破綻。

### 3. 一貫性のない value 要素使用

```fsh
// ToothExistence - value[x]を正しく使用
* value[x] from $JP_DentalFundamentalStatus_VS (required)

// ToothTreatmentCondition & MissingToothCondition - value[x]未使用
* value[x] only CodeableConcept
* insert SetDefinition(value[x],
    【JP Core仕様】component要素を利用して複数の結果を
    表現することを考慮しているため、本要素は使用しない)
```

**問題**: 一貫性のないデータモデリングアプローチにより
FHIR 準拠性と検索性が低下。

## 設計パターンの問題

### 4. 限定的な DiagnosticReport 統合

```fsh
// DiagnosticReportはToothExistenceのみ参照可能
* result only Reference(JP_Observation_DentalOral_ToothExistence)
```

**問題**: 診断レポートで処置状態や欠損歯観察を直接参照不可。

### 5. 拡張使用の一貫性欠如

```fsh
// ToothTreatmentConditionは豊富な拡張を持つ
* extension contains
    JP_Observation_DentalOral_ToothRoot named toothRoot 0..1 and
    JP_Observation_DentalOral_BodyStructure named bodyStructure ..*

// MissingToothConditionは拡張なし - 一貫性なし！
```

**問題**: 欠損歯処置状態に現存歯で利用可能な
歯面・構造拡張が欠如。

### 6. カテゴリコードシステムの問題

```fsh
// CodeSystemにDO-1-04カテゴリが不在
CodeSystem: JP_ObservationDentalCategory_CS
* #DO-1-01 "ToothExistence"
* #DO-1-02 "ToothTreatmentCondition"
* #DO-1-03 "MissingToothCondition"
// 不在: DO-1-04 for その他の口腔観察
```

**問題**: 新しい口腔観察タイプのカテゴリ拡張が制限されている。

## 用語集・データモデルの問題

### 7. 不完全な用語集カバレッジ

**不足している臨床概念:**

- 歯周評価コード（ポケット深度、動揺度、出血指数）なし
- 齲蝕リスク評価用語なし
- 疼痛評価スケールなし
- 顎関節（TMJ）評価コードなし
- 軟組織病理コードなし

### 8. 限定的な身体部位粒度

```fsh
// 現在: 歯レベルの身体部位のみ
* bodySite from JP_DentalBodySite_VS (preferred)

// 不足: 四分域、歯列弓、歯周部位粒度
```

**問題**: 歯周部位固有所見（近心、遠心、頬側、舌側）を表現不可。

### 9. 処置統合の欠如

**問題**: 口腔観察と処置間の明確な接続なし。

- 歯科固有処置プロファイル不在
- 歯科紹介用サービスリクエスト統合なし
- 治療計画機能なし

## 実装例の問題

### 10. 一貫性のない例データ

```fsh
// 例で欠損歯カテゴリなのにテキストが間違い
* category[third].coding.display = "MissingToothCondition"
* category.text = "現存歯の処置状態"
// 間違い！「欠損歯の処置状態」であるべき
```

### 11. 検証例の不足

**問題:**

- 複雑な多歯条件の例なし
- 全口腔診査例なし
- 無効な組み合わせのエラーハンドリング例なし

## アーキテクチャの問題

### 12. 特定標準への密結合

```fsh
// 日本歯科標準V1.02への密結合
// Copyright Japan Dental Association 日本歯科医師会
```

**問題**: 国際利用や発展する標準への拡張が困難。

### 13. 限定的なモジュラー性

**問題:**

- 新しい口腔観察タイプの追加が困難
- 拡張パターンが一貫して適用されていない
- 口腔観察の明確な継承階層なし

## 優先修正推奨事項

### 緊急（即座に修正）

1. MissingToothCondition プライマリコードの不足システム制約追加
2. 例のカテゴリテキスト不一致修正
3. 欠損歯と関連観察間の相互参照有効化

### 高優先度

1. 全口腔観察での value[x] 要素使用の標準化
2. MissingToothCondition プロファイルへの不足拡張追加
3. DiagnosticReport 結果参照の拡張

### 中優先度

1. 歯周評価用語集・プロファイル追加
2. 歯科処置統合作成
3. 歯周部位用身体部位粒度拡張
