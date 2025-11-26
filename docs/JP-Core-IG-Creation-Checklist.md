# FHIR JP Core 派生実装ガイド作成チェックリスト

FHIR 実装に慣れた読者が、JP Core をベースに実装ガイド（以下、IG）を組み立てる際に抜け漏れなく進められるよう整理したチェックリストです。
---

## 0. 方針決定
- [ ] (SHALL) **IG の立ち位置を明確化した**
  - 派生される IG 向け：後続 IG が再派生する前提で、制約やライセンスを緩めに設計する
  - 派生されない IG 向け：対象シナリオが固定で、必要に応じて強い制約や固定値を設定する

---

## 1. プロジェクト開始前の準備

### 1.1 スコープの明確化
- [ ] (SHALL) **対象領域・対象外領域をドキュメント化した**（例：在宅医療、透析、地域連携 等）
- [ ] (SHOULD) **対象のユースケースの整理および業務フローを定義した**（外来、入院、検査、処方など）

### 1.2 バージョン戦略
- [ ] (SHALL) **採用する JP Core バージョンを固定し、理由を記録した**
- [ ] (SHALL) **JP Core を採用せず、FHIR ベースを直接派生する場合、そのバージョンを明記した**（通常 4.0.1）
- [ ] (SHOULD) **追加で依存する国内外 IG を洗い出した**
---

## 2. 基本設定

### 2.1 ライセンスと表記
- [ ] (SHALL) **IGの著作権者・発行主体を明示した**
- [ ] (SHOULD) **IG 全体のライセンスを選定し、再利用条件を示した**
- [ ] (SHOULD) **FHIR® / HL7® 等の商標表記を適切に記載した**

### 2.2 `sushi-config.yaml`
- [ ] (SHALL) **id・canonical・name・title・version・status を一貫した命名規則で設定した**
- [ ] (SHALL) **publisher / contact / description / copyright を最新情報で記述した**
- [ ] (SHOULD) **license / jurisdiction / dependencies を必要に応じて補足した**

### 2.3 依存パッケージ
- [ ] (SHALL) **`dependencies` に JP Core / R4 Core などの固定バージョンを明記した**
- [ ] (SHOULD) **依存パッケージのライセンスと入手先を README 等に記載した**
``` markdown
<!--IGPublisherの場合、mdファイルに下記語句を記載することで依存関係情報が自動生成される。
ガイダンスページ等に記載することが望ましい-->
 {% include cross-version-analysis.xhtml %} 
 ```
---

## 3. 機能要件（アクタ / トランザクション / ユースケース）

### 3.1 ユースケース
- [ ] (SHOULD) **主要ユースケースシナリオを文章＋図で説明した**

### 3.2 アクタ定義
- [ ] (SHOULD) **全アクタを列挙し、役割・責務を表形式で整理した**
- [ ] (SHOULD) **アクタ相関図を掲載した**

### 3.3 トランザクション設計
- [ ] (SHOULD) **各トランザクションのリクエスト / レスポンス / OperationOutcome を記述した**
- [ ] (SHOULD) **HTTP ステータスと再送・エラー処理方針を定義した**

### 3.4 CapabilityStatement
- [ ] (SHOULD) **アクタ単位で CapabilityStatement を作成し、対応リソースを列挙した**
- [ ] (SHOULD) **必須/推奨/任意を `SHALL/SHOULD/MAY` で明示した**
- [ ] (SHOULD) **検索パラメータ(Search Parameter)・操作(Operation)についても同様に要件を定義した**

### 3.5 セキュリティ要件
- [ ] (SHOULD) **必要性に応じ、セキュリティ要件（OAuth、mTLS、署名 など）をドキュメント化した**

---
## 4. プロファイル設計
### 4.1 設計方針
- [ ] (SHALL) **既存 JP Core / International / 他 IG の再利用を優先している**
- [ ] (SHOULD) **Must Support 要素の送受信要件（実装期待値）をドキュメント化した**  
JP Core の定義をそのまま利用する場合は、その旨をドキュメントに記載する。

### 4.2 プロファイル定義
- [ ] (SHOULD) **JP Core プロファイルを親にして派生させた**（例：JP_Patient → 派生 Patient）
- [ ] (SHOULD) **Must Support・Cardinality・Binding 強度・制約を変更した場合、理由をプロファイル解説ページに記載した**
これらの定義は派生先で強める方向（例：`0..* → 1..*`、`preferred → required`）にしか変更できないため、注意すること。
- [ ] (SHOULD) **Slicing・Discriminator が正しく設定されているか検証した**

### 4.3 拡張機能 (Extension)
- [ ] (SHALL) **既存 Extension の再利用を優先している**
- [ ] (SHOULD) **新規 Extension 作成時は JP Core / 他 IG に同様の定義が無いことを確認した**
- [ ] (SHOULD) **Extension の URL / status / context / description / copyright を正しく設定した**
- [ ] (SHOULD) **Extension の Value[x] に適切な DataType を使用した**
- [ ] (SHOULD) **Extension で ValueCode / ValueCoding / ValueCodeableConcept を用いる場合、対象 ValueSet を Binding した**
---

## 5. 用語・コード体系

### 5.1 用語の採用
- [ ] (SHALL) **JLAC / HOT / 厚労省コード等の国内標準との整合性を確認した**
- [ ] (SHALL) **JP Core 既存 ValueSet / CodeSystem に定義されているものを利用している**
- [ ] (SHALL) **国内では包括的な SNOMED CT ライセンスが無い点を踏まえ、DICOM / IPS など明示的に許可された範囲内であることを明記した**
- [ ] (SHALL) **IGが利用している用語の出典を明示した**
``` markdown
<!--IGPublisherの場合、mdファイルに下記語句を記載することで著作権一覧（IPStatement)が自動生成される。
ガイダンスページ等に記載することが望ましい-->
{% include ip-statements.xhtml %}
 ```

### 5.2 ValueSet
- [ ] (SHALL) **既存 ValueSet の再利用を優先している**
- [ ] (SHALL) **URL / status / copyright を正しく設定した**
- [ ] (SHOULD) **単一コードのみの ValueSet 指定は避け、複数コードを含む ValueSet と固定値等で代替している**
- [ ] (SHOULD) **Binding の強度は `required` / `extensible` / `preferred` / `example` から要件に応じて選択している**  
Binding 強度も派生先では強める方向（例：`preferred` → `required`）にしか変更できないため、注意すること。

### 5.3 CodeSystem
- [ ] (SHALL) **既存 CodeSystem で表現できない範囲のみ新規作成した**
- [ ] (SHALL) **URL / status / content / copyright を正しく設定した**
- [ ] (SHOULD) **各コードに display / definition / designation（翻訳）を付与した**

---
## 6. ドキュメント作成

### 6.1 必須ページ
- [ ] (SHALL) **トップページで IG 目的・適用範囲・主要成果物を明記した**
- [ ] (SHOULD) **ユースケース / アクタ / トランザクション の各章を整備した**
- [ ] (SHOULD) **各プロファイルの説明ページを用意し、利用方法と制約理由を記載した**
- [ ] (SHOULD) **ライセンス / 著作権 / 依存関係 / 更新履歴 に関するページを作成した**

---
## 7. サンプルとテスト
### 7.1 サンプル
- [ ] (SHOULD) **各プロファイルに少なくとも 1 つの Instance を作成し、Title / Description を付与した**
- [ ] (SHOULD) **主要ユースケースをカバーするサンプルセットを `input/fsh/examples/` に配置した**

### 7.2 テスト
- [ ] (SHALL) **FSH 生成物を FHIR Validator で package ファイルを指定して検証し、エラー 0 を確認した**
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
- [ ] (MAY) **HL7 Japan WG 等に外部レビューの必要性を確認した**
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

### 継承よりもコンポジション（集約・包含）を優先する
- [ ] (SHOULD) **可能な限り派生よりもコンポジションを利用している**  
FHIRの構造として多重派生は実現できないため、拡張性を考慮してコンポジションを優先する。
COMMONやBASEクラスに相当する基底プロファイルの作成はなるべく避け、必要に応じてExtensionやBackboneElement、要素となっているDataTypeを派生することで包含関係を表現する。

### 拡張性の確保
- [ ] (SHOULD) **過度な多重度の強制（例：`* → 1 → 0` などの数量縮小）や固定値を控え、派生先拡張を阻害しない**
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

**本チェックリストは、JP Core 派生 IG を高品質かつ拡張性の高い状態でリリースするためのガードレールです。各項目を確認し、必要に応じて作業ログやドキュメントへのリンクを残してください。**

