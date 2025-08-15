# JP Core 病理プロファイル開発計画

## 概要
本計画書は、JP Core v1.xにおける病理検査関連プロファイルの開発計画を定めたものである。
内視鏡プロファイルの構造を参考にし、日本の病理診断実務に適合したFHIRプロファイルを開発する。

## 背景と目的
- 日本における病理診断情報の標準化とデータ交換の促進
- JAHIS病理診断レポート構造化記述規約への準拠
- WSI（Whole Slide Imaging）を含む病理画像データの標準化対応
- 他の診療科システムとの相互運用性の確保

## 開発対象プロファイル

### 1. 主要プロファイル

#### 1.1 JP_DiagnosticReport_Pathology
- **親プロファイル**: JP_DiagnosticReport_Common
- **目的**: 病理診断レポート全体の管理
- **主要要素**:
  - 病理診断番号
  - 検体受付情報
  - 肉眼所見参照
  - 顕微鏡所見参照
  - 最終診断
  - 報告書PDF

#### 1.2 JP_Observation_Pathology
- **親プロファイル**: JP_Observation_Common
- **目的**: 病理所見・診断の記録
- **サブタイプ**:
  - 肉眼的所見（Gross Description）
  - 顕微鏡的所見（Microscopic Description）
  - 病理診断（Pathological Diagnosis）
  - 免疫染色結果
  - 分子病理学的検査結果

#### 1.3 JP_Specimen_Pathology
- **親プロファイル**: JP_Specimen_Common
- **目的**: 病理検体の詳細管理
- **主要要素**:
  - 検体採取情報
  - 固定液情報
  - 切り出し情報
  - ブロック番号
  - 標本番号
  - 染色方法

#### 1.4 JP_ImagingStudy_Pathology
- **親プロファイル**: ImagingStudy
- **目的**: WSI画像の管理
- **主要要素**:
  - WSI画像識別情報
  - スキャナー情報
  - 倍率情報
  - DICOM Pathology対応

#### 1.5 JP_Media_Pathology
- **親プロファイル**: Media
- **目的**: 病理画像メディアの管理
- **主要要素**:
  - 肉眼写真
  - 顕微鏡写真
  - キー画像
  - 注釈付き画像

### 2. 関連プロファイル（既存利用）
- JP_Patient
- JP_Practitioner（病理医）
- JP_Organization（病理部門）
- JP_Encounter
- JP_ServiceRequest（病理検査依頼）
- JP_Procedure（生検・手術）

## 実装における重要な考慮事項

### コード体系
1. **SNOMED CT**: 病理診断コード
2. **ICD-O-3**: 腫瘍形態コード
3. **JLAC10**: 臨床検査項目コード
4. **ローカルコード**: 施設固有の病理番号体系

### 必須項目と推奨項目
- **必須**: 患者情報、検体情報、診断日、診断医
- **推奨**: 臨床情報、肉眼所見、顕微鏡所見、免疫染色結果

### セキュリティとプライバシー
- 病理画像の匿名化
- アクセス権限管理
- 監査ログ

### 品質保証プロセス
各プロファイル作成時には以下のステップを実施：
1. **FSHファイル作成**
2. **sushiコマンド実行**
3. **エラー解消**
   - 文法エラーの修正
   - 参照エラーの解決
   - カーディナリティの調整
4. **エラーが0になるまで反復改善**
5. **警告の確認と対応**
   - 必要な警告のみ許容
   - 不要な警告は解消

### 最終IG Publisherビルド検証（Phase 3の最後に1回のみ実施）
時間がかかるため、全プロファイル完成後に1回のみ実施：
1. **Dockerビルド実行**
   ```bash
   cd docker
   docker compose up
   ```
2. **ビルド結果確認**
   - outputフォルダの生成確認
   - qa.html、qa-tx.htmlなどのQAファイル確認
3. **エラー対応**
   - outputフォルダ内のqa関連ファイルでエラー詳細確認
   - 必要に応じてプロファイル修正
   - 再度sushiでエラー0確認後、最終ビルド

## 開発フェーズ

### Phase 1: 基本プロファイル開発（3週間）
1. **プロファイル定義（FSH）**
   - JP_DiagnosticReport_Pathology
   - JP_Observation_Pathology
   - JP_Specimen_Pathology
2. **ドキュメント作成**
   - 各プロファイルのintro/notes作成
   - プロファイル説明文書
3. **基本サンプル作成**
   - 各プロファイルの最小サンプル

### Phase 2: 画像関連プロファイル開発（2週間）
1. **プロファイル定義（FSH）**
   - JP_ImagingStudy_Pathology
   - JP_Media_Pathology
2. **ドキュメント作成**
   - 各プロファイルのintro/notes作成
   - 画像管理ガイド
3. **画像サンプル作成**
   - WSIサンプル
   - メディアサンプル

### Phase 3: サンプルデータと検証（2週間）
1. **包括的サンプルデータ作成**
   - 胃生検病理診断サンプル（Example_1）
   - 大腸内視鏡生検サンプル（Example_2）
   - 手術検体（胃癌）サンプル（Example_3）
   - 肺癌手術検体サンプル（Example_4）
   - 細胞診サンプル（Example_5）
   - 術中迅速診断サンプル（Example_6）
2. **プロファイル間の整合性確認**
   - 相互参照の検証
   - データ整合性チェック
3. **SUSHI検証**
   - sushiコマンド実行
   - エラー解消（エラーが0になるまで修正）
   - 警告の最小化
4. **最終IG Publisherビルド（Phase 3最後に1回のみ）**
   - dockerフォルダでdocker compose up実行
   - outputフォルダのQAファイル確認
   - エラー対応と最終調整

### Phase 4: ドキュメント整備とレビュー（1週間）
1. **実装ガイド作成**
   - 全体概要ドキュメント
   - データマッピングガイド
   - 移行ガイド
2. **intro-notesファイル完成**
   - StructureDefinition-jp-diagnosticreport-pathology-intro.md
   - StructureDefinition-jp-diagnosticreport-pathology-notes.md
   - StructureDefinition-jp-observation-pathology-intro.md
   - StructureDefinition-jp-observation-pathology-notes.md
   - StructureDefinition-jp-specimen-pathology-intro.md
   - StructureDefinition-jp-specimen-pathology-notes.md
   - StructureDefinition-jp-imagingstudy-pathology-intro.md
   - StructureDefinition-jp-imagingstudy-pathology-notes.md
   - StructureDefinition-jp-media-pathology-intro.md
   - StructureDefinition-jp-media-pathology-notes.md
3. **ページコンテンツ更新**
   - group-diagnostic.mdへの追加
   - index.mdの更新

## 成果物
1. **FSHファイル（プロファイル定義）**
   - input/fsh/profiles/配下の5プロファイル
   - input/fsh/terminologies/配下のCodeSystem/ValueSet
   - input/fsh/searchparameters/配下の検索パラメータ
2. **サンプルインスタンス**
   - input/fsh/examples/JP_DiagnosticReport_Pathology_Example.fsh（6例以上）
   - input/fsh/examples/JP_Observation_Pathology_Example.fsh（各種所見タイプ）
   - input/fsh/examples/JP_Specimen_Pathology_Example.fsh（各種検体タイプ）
   - input/fsh/examples/JP_ImagingStudy_Pathology_Example.fsh（WSI例）
   - input/fsh/examples/JP_Media_Pathology_Example.fsh（各種画像例）
3. **実装ガイドドキュメント**
   - input/intro-notes/配下の10ファイル（各プロファイルintro/notes）
   - input/pagecontent/配下の更新ファイル
4. **バリデーションルール**
   - invariant定義
   - 必須項目チェック
5. **テスト結果報告書**
   - バリデーション結果
   - 警告対応記録

## リスクと対策
- **リスク**: 既存システムとの互換性
  - **対策**: 段階的移行パスの提供
- **リスク**: コード体系の不一致
  - **対策**: マッピングテーブルの提供
- **リスク**: WSI標準の変更
  - **対策**: DICOM WG26との連携

## 参考資料
- JAHIS病理診断レポート構造化記述規約 Ver.2.0
- JAHIS病理・臨床細胞DICOM画像データ規約 Ver.3.1
- IHE Anatomic Pathology Technical Framework
- DICOM Supplement 145 (Whole Slide Imaging)
- 日本病理学会 病理診断ガイドライン

## 今後の検討事項
- AI診断支援結果の記録方法
- デジタルパソロジーワークフローの標準化
- 遠隔病理診断への対応
- ゲノム医療との連携