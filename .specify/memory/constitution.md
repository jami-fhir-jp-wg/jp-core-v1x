<!--
Sync Impact Report
- Version change: 1.1.1 → 1.1.2
- Modified principles:
  - II. Must Support 方針: 既存プロファイルの過渡期維持を明記
  - IV. FSH記述規則: インバリアントキー形式を実態に合わせ修正
    (jpcore-[abbrev]-[3digits] → jp-[type]-[descriptive-name])
- Modified sections:
  - 欠損データ処理: DataAbsentReason を将来目標（SHOULD）に変更
  - アーキテクチャパターン: Core Principles/適合性基準と
    重複する「用語バインディング」「設定より規約」を削除
- Templates requiring updates:
  - .specify/templates/plan-template.md: ✅ No changes needed
  - .specify/templates/spec-template.md: ✅ No changes needed
  - .specify/templates/tasks-template.md: ✅ No changes needed
- Follow-up TODOs: None
-->

# JP Core 実装ガイド Constitution

## Core Principles

### I. FHIR標準準拠 (FHIR Standard Compliance)

- FHIR R4.0.1 をベースとし、地域要件対応時も
  FHIR 標準を維持しなければならない
- JP Core プロファイルを基底 FHIR の代わりに参照しなければならない
  （例: `Reference(JP_Patient)` であって `Reference(Patient)` ではない）
- 外部コードシステム（LOINC, SNOMED CT 等）との統合時も
  FHIR 準拠性を確保する
- 推奨バインディング (Preferred) で柔軟性を保ちつつガイダンスを提供し、
  必須バインディング (Required) で重要データの値セットを強制する
- **最小制約原則**: JP Core プロファイルは相互運用性の「下限（floor）」を
  定義するものであり、「上限（ceiling）」ではない。サーバは定義以上の
  データを送信してよく、クライアントは未知の要素を拒否してはならない
  （modifier extension を除く）。ドメイン固有の追加要件は派生プロファイル
  で定義する

### II. Must Support 方針 (Must Support Policy)

**基本方針**: Must Support（MS）フラグは原則として付与しない。
ユースケースが明確に限定でき、臨床的正当性がある場合にのみ付与する。

- MS フラグの付与には、対象ユースケースと臨床的根拠の文書化が
  必須である
- MS フラグを付与する場合、以下の非対称義務を定義しなければならない:
  - **データ提供者（サーバ/送信者）**: 値が既知である場合、
    MS 要素を設定しなければならない（SHALL populate-if-known）
  - **データ利用者（クライアント/受信者）**: MS 要素を含む
    リソースインスタンスをエラーなく処理しなければならない
    （SHALL no-error）。MS 要素の表示または保存を行うべきである
    （SHOULD display/store）
- MS フラグのないプロファイルは、データ構造の定義と
  用語バインディングのみを規定する
- 各 MS 要素は、トレーサビリティマトリクスにより
  正当化するユースケースと紐づけなければならない
- **既存プロファイルの扱い**: 本方針策定以前に作成された
  プロファイルの既存 MS フラグはそのまま維持する。
  新規プロファイルから本方針を適用し、既存プロファイルは
  今後の見直し時に段階的に整理する

> **参考**: US Core, AU Core, UK Core, IPS の各国 Core IG が
> 非対称義務モデルを採用している。UK Core は臨床的正当性が
> 確認された場合のみ MS を付与する方針を採る。

### III. 命名規約 (Naming Conventions)

- **ID**: kebab-case 形式を使用する
  （例: `jp-patient`, `jp-medication-request-dispense-expected-count`）
- **名前**: PascalCase + アンダースコア形式を使用する
  （例: `JP_Patient`,
  `JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount`）
- **URL**: `http://jpfhir.jp/fhir/core/{ResourceType}/{Name}`
  パターンに従う
- **ファイル名**: PascalCase + アンダースコア + `.fsh` 拡張子を使用する
- **アーティファクト名**: FSH アーティファクト名と URL は英語を使用する。
  ドキュメント、説明、コメントは日本語を使用する

### IV. FSH記述規則 (FSH Authoring Rules)

- カーディナリティは `..1` を使用し `0..1` は使用しない。
  ゼロ固定要素は `..0` を使用する
- カーディナリティの変更（特に `..0` による要素削除）には
  臨床的安全性の観点から文書化された正当性を要する
- スライス名は camelCase を使用する（kebab-case ではない）
- **スライシングは原則オープン**とする（`^slicing.rules = #open`）。
  クローズドスライシングには明示的な正当性の文書化を要する
- Flag Rules 記法を使用する（`element 1.. MS`）。
  `element mustSupport = true` は使用しない
- `^short` に詳細説明がある場合は `【詳細参照】` を付与する
- JP Core 固有仕様には `【JP Core仕様】` プレフィックスを使用する
- インバリアント制約には標準化されたキー形式を使用する:
  `jp-[種別]-[記述的名前]`（例: `jp-inv-local-patientid`,
  `jp-org-dept-identifier-local-system`）。
  各インバリアントには重大度（error/warning）、人間可読な説明、
  FHIRPath 式を含めなければならない

### V. リソース組織化 (Resource Organization)

- **プロファイル・拡張**: `input/fsh/profiles/{ProfileName}.fsh`
- **サンプル**: `input/fsh/examples/JP_{Profile}_Example.fsh`
- **用語集**: `input/fsh/terminologies/{Name}.fsh`
- **検索パラメータ**: `input/fsh/searchparameters/{Profile}_SP.fsh`
- プロファイル作成時は対応ドキュメントを追加しなければならない:
  - `input/intro-notes/{ProfileName}-intro.md`: 背景と範囲
  - `input/intro-notes/{ProfileName}-notes.md`: 使用例と実装ノート

### VI. 日本語化基準 (Internationalization Standards)

- デフォルト言語は日本語（`ja`）とする
- ドキュメントは常体（断定調）を使用する
- 句読点は「、」と「。」を使用する
- カタカナの長音記号は省略する
- 全ドキュメントは日本語で記述可能とし、英語補足は任意とする

### VII. アーキテクチャ設計原則 (Architecture Design Principles)

1. **一貫性 (Consistency)**: 命名規約・ルールセットにより
   一貫性を強制する
2. **拡張性 (Extensibility)**: 新プロファイル・拡張の容易な追加を
   可能にする
3. **保守性 (Maintainability)**: 関心の分離と自動化ツールにより
   保守性を確保する
4. **国際化 (Localization)**: 拡張・用語集により日本医療制度との
   統合を実現する
5. **標準準拠 (Compliance)**: 地域要件対応時も FHIR 標準を維持する
6. **自動化 (Automation)**: 包括的 CI/CD により手作業を削減し
   エラーを防止する

## 適合性・データ品質基準 (Conformance & Data Quality Standards)

### 欠損データ処理 (Missing Data Handling)

データが欠損している場合の処理は、要素のカーディナリティと
バインディング強度の組み合わせにより決定する。

> **注記**: DataAbsentReason 拡張は現時点では JP Core で
> 未採用である。以下は将来的な採用目標（SHOULD）として記載する。

| 状況 | 処理方法 |
|---|---|
| 任意要素（0..*）、データ不明 | 要素を省略する |
| 必須非コード要素、データ不明 | DataAbsentReason 拡張に `unknown` を使用するべきである（SHOULD） |
| 必須コード要素、extensible/preferred | テキストのみ利用可能ならテキストを使用する。ValueSet に `unknown` 概念があれば使用する。なければ DataAbsentReason `unknown` を使用するべきである（SHOULD） |
| 必須コード要素、required バインディング | ValueSet に `unknown` 概念があれば使用する。なければリソースは非適合となる |

**安全上重要なデータカテゴリ**（アレルギー、服薬、傷病名等）では、
情報の不在をリソース内で明示的に表明しなければならない
（例: 「既知のアレルギーなし」）。`section.emptyReason` による
表現のみでは不十分である。

> **参考**: US Core の欠損データ決定木、IPS の明示的不在表明要件
> に基づく。

### 拡張ガバナンス (Extension Governance)

JP Core 固有の拡張を作成する前に、以下の3段階の確認を
行わなければならない:

1. **基底 FHIR 要素の確認**: FHIR R4.0.1 の既存要素で
   要件を満たせないか確認する
2. **HL7 共通拡張の確認**: HL7 が公開する共通拡張
   （FHIR Extensions Pack）に該当するものがないか確認する
3. **他国 Core IG の確認**: 他国の Core IG（US Core, AU Core,
   UK Core 等）で同様の課題が解決されていないか確認する

上記いずれも該当しない場合にのみ、JP Core 固有の拡張を作成する。
新規拡張には「拡張正当性文書」（対象要件、検討した代替案、
採用理由）を含めなければならない。

> **参考**: UK Core の3段階拡張ガバナンスポリシーに基づく。

### 用語バインディング戦略 (Terminology Binding Strategy)

| バインディング強度 | 適用基準 |
|---|---|
| **required** | FHIR 標準で義務付けられている場合、または相互運用性が絶対に必要な場合のみ |
| **extensible** | JP Core 固有 ValueSet のデフォルト |
| **preferred** | 大規模または発展途上のコードシステム（MEDIS, レセプトコード, JLAC 等） |
| **example** | 参考目的のみ。個別判断で使用する |

- jpfhir-terminology を用語集の単一権威ソースとして管理する
- 各バインディング強度の選択理由を文書化する

> **参考**: UK Core のデフォルト extensible 方針、
> CH Core の集中用語管理に基づく。

### 適合性パス (Conformance Paths)

JP Core は以下の2つの適合性パスを定義する:

1. **プロファイルのみ（Profile Only）**: データ表現にプロファイルを
   使用するが、RESTful インタラクションは規定しない。
   メッセージング、文書交換、バルクデータ等に適用する
2. **プロファイル＋インタラクション（Profile + Interaction）**:
   プロファイルに加え、RESTful API の適合性を規定する。
   CapabilityStatement による検索パラメータ・操作の宣言を含む

> **参考**: US Core, AU Core が採用する二重適合性パスに基づく。

### Contained リソース方針 (Contained Resources Policy)

Contained リソースは、参照先コンテンツが独立して存在しない
場合にのみ使用する（例: MedicationRequest 内の Medication）。
Contained リソースおよび参照元リソースの双方が、適用される
JP Core プロファイルに適合しなければならない。

> **参考**: AU Core の Contained リソース方針に基づく。

## アーキテクチャパターン (Architecture Patterns)

### 階層アーキテクチャ (Layered Architecture)

```
基盤層 (Foundation Layer)
├── 外部用語集・標準FHIRベースリソース
コアプロファイル層 (Core Profile Layer)
├── JP Core基底プロファイル (JP_Patient, JP_Organization等)
専門プロファイル層 (Specialized Profile Layer)
├── ドメイン固有プロファイル (検査、薬剤、口腔診査等)
拡張層 (Extension Layer)
├── 日本の医療要件対応カスタム拡張
設定層 (Configuration Layer)
└── ビルド・デプロイメント設定
```

### モジュラー組織 (Modular Organization)

- **関心の分離**: ディレクトリ構造による明確な責任分担
- **FSH ファイル**: リソースタイプ・機能別に組織化する
- **外部用語集**: コア定義から分離する
- **サンプル**: プロファイル定義から独立させる

### FHIR固有パターン

#### プロファイル継承階層 (Profile Inheritance Hierarchy)

```fsh
// 基底プロファイルパターン
Profile: JP_DiagnosticReport_Common
Parent: DiagnosticReport

// 専門プロファイルパターン
Profile: JP_DiagnosticReport_LabResult
Parent: JP_DiagnosticReport_Common

Profile: JP_DiagnosticReport_DentalOral
Parent: JP_DiagnosticReport_Common
```

#### 拡張アーキテクチャ (Extension Architecture)

- **構造化拡張**: 複雑な下位拡張を持つパターン
- **単純拡張**: 基本データ用の単一値拡張
- **文脈拡張**: 特定プロファイル専用拡張

```fsh
* extension contains
    JP_Patient_Race named race ..* and
    JP_Organization_PrefectureNo named prefectureNo ..1
```

#### スライシング (Slicing Pattern)

```fsh
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains first 1..1 and second 1..1 and third 1..1
```

### コード組織化パターン

#### 単一責任原則 (Single Responsibility Principle)

```
input/fsh/
├── aliases.fsh                    # 名前空間管理
├── profiles/                      # プロファイル定義専用
├── examples/                      # インスタンス例専用
├── terminologies/                 # 用語集専用
├── searchparameters/              # 検索機能専用
└── capabilitystatements/          # システム能力専用
```

### 再利用性パターン

#### エイリアス管理 (Alias Management)

```fsh
// aliases.fsh - 標準FHIRエイリアス
Alias: $Patient = http://hl7.org/fhir/StructureDefinition/Patient

// aliases-jpcore.fsh - JP Core固有エイリアス
Alias: $JP_Patient = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient
```

#### ルールセット (Ruleset Pattern)

```fsh
RuleSet: SetDefinition(name, definition)
* {name} ^short = "{definition}"
* {name} ^definition = "{definition}"

// 使用例
* insert SetDefinition(identifier, 患者を識別するための識別子)
```

#### 基底プロファイル戦略 (Base Profile Strategy)

- **共通基底**: `JP_DiagnosticReport_Common` で共通制約を定義する
- **専門化**: ドメイン固有プロファイルで追加制約を定義する
- **拡張合成**: 複数プロファイル間で拡張を再利用する

### ビルド・デプロイメントパターン

#### CI/CDパイプライン

```yaml
workflow:
  - FSHコンパイル (SUSHI)
  - FHIR IG生成 (IG Publisher)
  - 多環境デプロイメント
  - 自動テスト・バリデーション
```

#### 設定管理 (Configuration Management)

- **集中設定**: `sushi-config.yaml` による単一真実源
- **環境固有設定**: ビルド時のバージョン置換
- **依存関係管理**: GitHub Actions による外部パッケージ統合

### コンテンツ生成パターン

#### テンプレートベース生成

- **カスタム Jekyll テンプレート**: 一貫したページレイアウト
- **日本語適応**: 言語・文化対応テンプレート
- **ナビゲーション拡張**: 利用性向上

#### 自動相互参照生成

- **Ruby スクリプト**: Markdown リンク生成
- **URL 自動マッピング**: 正規 URL 管理
- **シンボリックリンク作成**: ファイルシステム統合

## ドメイン固有仕様 (Domain-Specific Standards)

ドメイン固有の品質基準・既知の問題は以下の個別ドキュメントに記録する:

- **口腔診査**: [`.specify/memory/domain/diagnostics/dental.md`](.specify/memory/domain/diagnostics/dental.md)

## Governance

### Git運用規約 (Git Workflow Rules)

- **`main`**: Production ブランチ（リリース責任者のみ操作可能）
- **`develop`**: メイン開発ブランチ
  （develop 責任者以上の権限が必要）
- **Feature ブランチ命名規約**:
  - `feature/swg[1-6]-(description)`: 単一 SWG 作業
  - `feature/swg[1-6]+-(description)`: 複数 SWG 作業
  - `feature/ext-(description)`: 非 SWG 変更
- **ワークフロー**: Feature branch → PR to develop → develop → main
- **コンフリクト解決**: 先勝ちルール
  （後からマージする側が解決する）
- 詳細は `/docs/githubflow.md` を参照

### 成熟度プロセス (Maturation Process)

プロファイルおよび拡張は以下の成熟度レベルを経て進行する:

| レベル | 名称 | 要件 |
|---|---|---|
| 0 | **Draft** | 初期提案。SWG 内での議論段階 |
| 1 | **Trial Use** | SWG 承認済み。1件以上のパイロット実装実績を要する |
| 2 | **Normative** | 3件以上の実装実績と相互運用性テスト結果を要する |

- 成熟度レベルの昇格には、実装実績の文書化と
  該当 SWG の承認が必要である
- Normative レベルのアーティファクトへの破壊的変更は
  MAJOR バージョンアップを要する

> **参考**: US Core の5段階成熟プロセス、UK Core の
> Clinical and Technical Assurance に基づく。

### 改定手続き (Amendment Procedure)

- 本 Constitution は全ての開発活動に優先する
- 改定にはドキュメント化、承認、移行計画が必要である
- 全 PR・レビューは本 Constitution への準拠を検証しなければならない
- 複雑性は正当な理由がある場合にのみ許容される
- 実行時の開発ガイダンスは `CLAUDE.md` を参照する

### バージョニング方針 (Versioning Policy)

- セマンティックバージョニング（MAJOR.MINOR.PATCH）を使用する
  - **MAJOR**: 原則の削除・再定義等、後方互換性のない
    ガバナンス変更
  - **MINOR**: 新規原則・セクションの追加、または
    重要な指針の拡充
  - **PATCH**: 文言修正、誤字修正、意味に影響しない改善

**Version**: 1.1.2 | **Ratified**: 2026-02-17 | **Last Amended**: 2026-02-17
