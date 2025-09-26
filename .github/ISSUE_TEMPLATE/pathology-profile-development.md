---
name: 病理プロファイル開発タスク
about: JP Core病理プロファイルの開発に関するIssue
title: '[Pathology] '
labels: enhancement, pathology, profile
assignees: ''

---

## JP Core 病理プロファイル開発 Issue

### 背景
日本の病理診断業務に適合したFHIRプロファイルを開発し、病理診断情報の標準化とデータ交換を促進する。

### 目的
- JAHIS病理診断レポート構造化記述規約に準拠したプロファイルの作成
- WSI（Whole Slide Imaging）を含む病理画像データの標準化
- 他診療科システムとの相互運用性の確保

---

## 📋 開発タスクリスト

### Phase 1: 基本プロファイル開発

#### JP_DiagnosticReport_Pathology
- [ ] プロファイル定義（FSH）作成
- [ ] 必須要素の定義
  - [ ] 病理診断番号（identifier）
  - [ ] カテゴリー（pathology固定）
  - [ ] 検体参照（specimen）
  - [ ] 所見参照（result）
  - [ ] 診断結論（conclusion/conclusionCode）
- [ ] 拡張の検討
  - [ ] 検体受付日時
  - [ ] 切り出し日時
  - [ ] 報告書承認者
- [ ] サンプルインスタンス作成
- [ ] ドキュメント作成（intro/notes）

#### JP_Observation_Pathology
- [ ] プロファイル定義（FSH）作成
- [ ] 観察種別の定義
  - [ ] 肉眼的所見
  - [ ] 顕微鏡的所見
  - [ ] 病理診断
  - [ ] 免疫染色結果
  - [ ] 分子病理学的検査
- [ ] コード体系の定義
  - [ ] SNOMED CT対応
  - [ ] ICD-O-3対応
  - [ ] ローカルコード対応
- [ ] サンプルインスタンス作成
- [ ] ドキュメント作成（intro/notes）

#### JP_Specimen_Pathology
- [ ] プロファイル定義（FSH）作成
- [ ] 検体管理要素の定義
  - [ ] 検体種別
  - [ ] 採取部位
  - [ ] 採取方法
  - [ ] 固定液
- [ ] 拡張の定義
  - [ ] ブロック番号
  - [ ] 標本番号
  - [ ] 染色方法
  - [ ] 切り出し情報
- [ ] サンプルインスタンス作成
- [ ] ドキュメント作成（intro/notes）

### Phase 2: 画像関連プロファイル開発

#### JP_ImagingStudy_Pathology
- [ ] プロファイル定義（FSH）作成
- [ ] WSI要素の定義
  - [ ] Study/Series/Instance構造
  - [ ] モダリティ（SM: Slide Microscopy）
  - [ ] SOPクラス対応
- [ ] メタデータの定義
  - [ ] スキャナー情報
  - [ ] 倍率情報
  - [ ] 染色情報参照
- [ ] サンプルインスタンス作成
- [ ] ドキュメント作成（intro/notes）

#### JP_Media_Pathology
- [ ] プロファイル定義（FSH）作成
- [ ] メディアタイプの定義
  - [ ] 肉眼写真
  - [ ] 顕微鏡写真
  - [ ] 注釈付き画像
- [ ] メタデータの定義
  - [ ] 撮影条件
  - [ ] 倍率
  - [ ] 染色法
- [ ] サンプルインスタンス作成
- [ ] ドキュメント作成（intro/notes）

### Phase 3: 統合とテスト

#### 統合テスト
- [ ] プロファイル間参照の検証
- [ ] 必須項目の充足性確認
- [ ] カーディナリティの妥当性確認
- [ ] コード体系の整合性確認

#### サンプルシナリオ作成
- [ ] 生検病理診断シナリオ
- [ ] 手術検体病理診断シナリオ
- [ ] 細胞診シナリオ
- [ ] 術中迅速診断シナリオ

#### バリデーション
- [ ] FHIR Validatorによる検証
- [ ] プロファイル適合性テスト
- [ ] サンプルデータの妥当性確認

### Phase 4: ドキュメント整備

#### 実装ガイド
- [ ] プロファイル概要
- [ ] 使用方法
- [ ] データマッピングガイド
- [ ] 移行ガイド

#### ValueSet/CodeSystem
- [ ] 病理診断用語集
- [ ] 検体種別コード
- [ ] 染色方法コード
- [ ] 所見記載用語

#### 補足資料
- [ ] FAQ作成
- [ ] トラブルシューティングガイド
- [ ] ベストプラクティス

---

## 📊 進捗管理

### マイルストーン
- [ ] M1: 基本プロファイル完成（3週間）
- [ ] M2: 画像プロファイル完成（2週間）
- [ ] M3: 統合テスト完了（2週間）
- [ ] M4: ドキュメント完成（1週間）

### 成果物チェックリスト
- [ ] FSHファイル一式
- [ ] サンプルインスタンス
- [ ] 実装ガイドドキュメント
- [ ] テスト結果報告書
- [ ] ValueSet/CodeSystem定義

---

## 🔗 関連リンク
- [開発計画書](pathology-development-plan.md)
- [JAHIS病理診断レポート構造化記述規約](https://www.jahis.jp/)
- [DICOM Pathology](https://dicom.nema.org/dicom/dicomwsi/)
- [IHE Anatomic Pathology](https://www.ihe.net/resources/technical-frameworks/)

---

## 📝 備考
- 内視鏡プロファイルの構造を参考に実装
- JAHIS規約との整合性を重視
- 段階的な実装とテストを実施

---

## 🏷️ ラベル
- `enhancement`: 機能追加
- `pathology`: 病理関連
- `profile`: プロファイル開発
- `documentation`: ドキュメント作成
- `testing`: テスト関連