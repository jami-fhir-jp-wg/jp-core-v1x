# FHIR JP Core 派生実装ガイド作成チェックリスト

FHIR 実装に慣れた読者が、JP Core をベースに IG を組み立てる際に抜け漏れなく進められるように整理したチェックリストです。まずは共通章（0〜10）を順番に確認し、その後に派生方針に応じて章 11（さらに派生させる場合）または章 12（最終形で提供する場合）を追加で実施してください。

---

## 0. 方針決定
- [ ] (SHALL) **IG の立ち位置を明確化した**
  - 派生される IG 向け：後続 IG が再派生する前提で、制約やライセンスを緩めに設計する
  - 派生されない IG 向け：対象シナリオが固定で、必要に応じて強い制約や固定値を設定する
- [ ] (SHOULD) **どちらの追加チェック（章 11 / 章 12）を適用するか事前に宣言した**

---

## 1. プロジェクト開始前の準備

### 1.1 スコープの明確化
- [ ] (SHALL) **対象領域・対象外領域をドキュメント化した**（例：在宅医療、透析、地域連携 等）
- [ ] (SHALL) **対象業務フローを定義した**（外来、入院、検査、処方など）
- [ ] (SHOULD) **ユースケースを複数列挙し、優先度を付けた**

### 1.2 バージョン戦略
- [ ] (SHALL) **採用する JP Core バージョンを固定し、理由を記録した**
- [ ] (SHALL) **ベースとなる FHIR R4 バージョンを明記した**（通常 4.0.1）
- [ ] (SHOULD) **追加で依存する国内外 IG を洗い出した**

---

## 2. 基本設定

### 2.1 ライセンスと表記
- [ ] (SHALL) **著作権者・発行主体を明示した**
- [ ] (SHOULD) **IG 全体のライセンスを選定し、再利用条件を示した**
- [ ] (SHOULD) **FHIR® / HL7® 等の商標表記を適切に記載した**

### 2.2 `sushi-config.yaml`
- [ ] (SHALL) **id・canonical・name・title・version・status を一貫した命名規則で設定した**
- [ ] (SHALL) **publisher / contact / description / copyright を最新情報で記述した**
- [ ] (SHOULD) **license / jurisdiction / dependencies を必要に応じて補足した**

### 2.3 依存パッケージ
- [ ] (SHALL) **`dependencies` に JP Core / R4 Core などの固定バージョンを明記した**
- [ ] (SHOULD) **依存パッケージのライセンスと入手先を README 等に記載した**

---

## 3. アーキテクチャ設計（アクタ / トランザクション / ユースケース）

### 3.1 アクタ定義
- [ ] (SHALL) **全アクタを列挙し、役割・責務を表形式で整理した**
- [ ] (SHOULD) **Mermaid などでアクタ相関図を掲載した**

### 3.2 トランザクション設計
- [ ] (SHOULD) **各トランザクションのリクエスト/レスポンス/OperationOutcome を記述した**
- [ ] (SHOULD) **HTTP ステータスと再送・エラー処理方針を定義した**

### 3.3 ユースケース
- [ ] (SHOULD) **主要ユースケースシナリオを文章＋図で説明した**
- [ ] (SHOULD) **ユースケースとトランザクション・プロファイルの対応表を作成した**

### 3.4 CapabilityStatement
- [ ] (SHALL) **アクタ単位で CapabilityStatement を作成し、対応リソースを列挙した**
- [ ] (SHALL) **必須/推奨/任意を `SHALL/SHOULD/MAY` で明示した**
- [ ] (SHALL) **検索パラメータ・操作・セキュリティ要件を定義した**

---

## 4. プロファイル設計

### 4.1 設計方針
- [ ] (SHALL) **既存 JP Core / International / 他 IG の再利用を優先する指針を確認した**
- [ ] (SHOULD) **MS 要素の送受信要件（実装期待値）をドキュメント化した**
- [ ] (SHOULD) **セキュリティ要件（OAuth、mTLS など）を共通節にまとめた**

### 4.2 プロファイル定義
- [ ] (SHALL) **JP Core プロファイルを親にして派生させた**（例：JP_Patient → 派生 Patient）
- [ ] (SHOULD) **制約・Cardinality 変更の理由をプロファイル解説ページに記載した**
- [ ] (SHALL) **Must Support 要素と解釈を定義した**
- [ ] (SHOULD) **新規 Extension や ValueSet の必要性をレビュー記録に残した**
- [ ] (SHALL) **Slicing・Discriminator が正しく設定されているか検証した**
- [ ] (SHOULD) **`^slicing.rules = #open` など派生先拡張を阻害しない設計を維持した**

---

## 5. 用語・コード体系

### 5.1 標準用語の採用
- [ ] (SHALL) **JP Core 既存 ValueSet / CodeSystem を最優先で利用した**
- [ ] (SHOULD) **MEDIS / JLAC / 厚労省コード等の国内標準との整合性を確認した**

### 5.2 ValueSet
- [ ] (SHALL) **既存 ValueSet 再利用可否を調査し、結果を記録した**
- [ ] (SHOULD) **新規 ValueSet は重複を避け、複数プロファイルで共有した**
- [ ] (SHOULD) **外部用語（LOINC等）のライセンス記述を追加した**
- [ ] (SHALL) **国内では包括的な SNOMED CT ライセンスが無いことを踏まえ、DICOM / IPS など明示的に許可された範囲以内でのみ利用することを確認した**

### 5.3 CodeSystem
- [ ] (SHALL) **既存 CodeSystem で表現できない範囲のみ新規作成した**
- [ ] (SHALL) **URL / status / content / copyright を正しく設定した**
- [ ] (SHOULD) **各コードに display / definition / designation（翻訳）を付与した**

---

## 6. ドキュメント作成

### 6.1 必須ページ
- [ ] (SHALL) **トップページで IG 目的・適用範囲・主要成果物を明記した**
- [ ] (SHOULD) **アクタ / トランザクション / ユースケースの各章を整備した**
- [ ] (SHALL) **各プロファイルの説明ページを用意し、利用方法と制約理由を記載した**
- [ ] (SHOULD) **ライセンス / Dependencies / Release Notes ページを作成した**

---

## 7. サンプルとテスト

### 7.1 サンプル
- [ ] (SHOULD) **各プロファイルに少なくとも 1 つの Instance を作成し、Title/Description を付与した**
- [ ] (SHOULD) **主要ユースケースをカバーするサンプルセットを `input/fsh/examples/` に配置した**

### 7.2 テスト
- [ ] (SHALL) **FSH 生成物を FHIR Validator で検証し、エラー 0 を確認した**
- [ ] (SHALL) **JP Core 適合性チェックを実施した**
- [ ] (SHOULD) **CapabilityStatement に沿ったシナリオテストを実施した**

---

## 8. 品質管理

### 8.1 IG Publisher / Sushi
- [ ] (SHOULD) **Sushi 警告を解消し、不可避な警告は理由を記録した**
- [ ] (SHOULD) **QA レポートの WARNING/ERROR をレビューし、対応方針を残した**
- [ ] (SHALL) **deprecated 要素や未使用定義を排除した**

### 8.2 エディトリアルチェック
- [ ] (SHALL) **命名規則・ID・title の整合性を確認した**
- [ ] (SHOULD) **description / narrative を充実させ、用語表記を統一した**
- [ ] (SHOULD) **外部リンク切れを検査し、メタデータ（publisher/contact 等）を最新化した**

---

## 9. 公開準備
### 9.1 リポジトリ整備（推奨）
- [ ] (SHOULD) **FSH / sushi-config.yaml などビルド可能なソース一式を公開した**
- [ ] (SHOULD) **バージョン管理リポジトリ（GitHub 等）と LICENSE / .gitignore を整備した**
- [ ] (SHOULD) **README にライセンス・依存関係・ビルド手順を記載した**

### 9.2 公開サイト
- [ ] (SHOULD) **静的サイトホスティング環境（GitHub Pages 等）を確保した**
- [ ] (SHOULD) **公開 URL を `sushi-config.yaml` / README に記載した**

### 9.3 パッケージ公開（推奨）
- [ ] (SHOULD) **`package.json` の name / version / description / author / license / dependencies を最新状態に保った**
- [ ] (MAY) **FHIR パッケージレジストリ登録を検討し、必要なら申請した**

### 9.4 レビューとフィードバック
- [ ] (SHOULD) **技術・臨床・セキュリティ観点の内部レビューを実施した**
- [ ] (MAY) **HL7 Japan WG 等に外部レビューを依頼した**
- [ ] (MAY) **パブコメを実施し、反映結果を記録した**

### 9.5 保守計画
- [ ] (SHOULD) **問い合わせ窓口・Issue 管理方針・リリースサイクルを公開した**

---

## 10. 共通の重要な設計原則（再確認）

### DRY 原則
- [ ] (SHALL) **定義の重複を避け、共通 Extension / ValueSet / CodeSystem を一元管理している**
- [ ] (SHOULD) **再利用可能なリソースをモジュール化し、参照ガイドラインを提示した**

### 既存資産の活用
- [ ] (SHALL) **JP Core・国際版・他 IG の再利用可能なアーティファクトを確認済みである**
- [ ] (SHALL) **新規作成時は既存調査の記録を残している**

### 拡張性の確保
- [ ] (SHOULD) **過度な 0..0 や固定値を控え、派生先拡張を阻害しない**
- [ ] (SHOULD) **Extension slicing を基本 open とし、閉じる場合は理由を記述した**

### ライセンスとコンプライアンス
- [ ] (SHALL) **すべての構成要素のライセンス・帰属表示を明記した**
- [ ] (SHALL) **依存関係と第三者権利を README / ドキュメントに整理した**

---

## 11. 派生される実装ガイド向け追加チェック

後続 IG 作者がさらに再利用しやすいよう、余白とガバナンスを提供する。

- [ ] (SHOULD) **レイヤー構造（JP Core → 本 IG → 派生先）と責務分担を図解した**
- [ ] (SHOULD) **拡張ポリシー・命名規則・`^slicing.rules = #open` の扱いを authoring guide に明文化した**
- [ ] (SHALL) **派生先が再利用しづらいライセンスを使用していないか確認し、CC BY 4.0 / Apache 2.0 等の許諾を明記した**
- [ ] (SHOULD) **Cardinality / Binding / 固定値を最小限に保ち、緩和理由を説明した**
- [ ] (SHOULD) **Must Support の解釈（送受信期待、例外処理）を文章化した**
- [ ] (SHOULD) **共通 Extension / ValueSet をモジュール化し、再利用手順を提示した**
- [ ] (SHOULD) **バージョニングと破壊的変更ポリシーを `package-list.json`・リリースノートに記載した**
- [ ] (MAY) **派生先向けテンプレートや CI 設定（GitHub Actions 等）を公開した**

---

## 12. 派生されない実装ガイド向け追加チェック

本 IG を最終形として提供する場合に、運用側で必要となる厳密な定義を確認する。

- [ ] (SHOULD) **固定値・必須値 (`fixed[x]` / `pattern[x]`) を確定させ、範囲外データを排除した**
- [ ] (SHOULD) **Cardinality / Binding を強化し、運用必須要件を明示した**
- [ ] (SHOULD) **不要エレメントに `0..0` を設定し、Interpretation 差異を排除した**
- [ ] (SHOULD) **Extension 追加ポリシーを閉じる（あるいは承認プロセスを定義する）ことを決定した**
- [ ] (SHOULD) **主要ユースケースごとの完全なサンプルを整備し、手順を説明した**
- [ ] (SHOULD) **接続相手・通信方式（REST / Message / Batch 等）を明文化した**
- [ ] (SHOULD) **ローカルガバナンス（変更申請窓口、改訂サイクル、教育計画）を提示した**

---

## 13. チェックリスト完了確認

- [ ] (SHALL) **すべての SHALL 項目にチェックが付いた**
- [ ] (SHOULD) **SHOULD 項目を可能な限り実践した**
- [ ] (SHALL) **設計原則（章 10）を満たしている**
- [ ] (SHOULD) **ドキュメント・サンプル・テスト・QA が完了している**
- [ ] (SHOULD) **公開準備（章 9）と保守計画が整っている**

---

## 14. 参考リンク

- [FHIR JP Core 実装ガイド](https://jpfhir.jp/fhir/core/)
- [HL7 FHIR R4 仕様](http://hl7.org/fhir/R4/)
- [FHIR Shorthand (FSH) 仕様](https://build.fhir.org/ig/HL7/fhir-shorthand/)
- [IG Publisher ドキュメント](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
- [IHE プロファイル](https://www.ihe.net/)

---

**本チェックリストは、JP Core 派生 IG を高品質かつ拡張性の高い状態でリリースするためのガードレールです。各項目を確認し、必要に応じて作業ログやドキュメントへのリンクを残してください。**

```

```
