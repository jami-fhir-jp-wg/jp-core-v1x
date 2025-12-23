# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview / プロジェクト概要

This is a **Japanese FHIR Implementation Guide (IG)** project for JP Core v1.x, a healthcare interoperability specification using FHIR R4.0.1. The project uses **FHIR Shorthand (FSH)** to author FHIR profiles, extensions, and terminology, which are compiled into FHIR resources and published as an HTML implementation guide.

### プロジェクトの目的と内容

このプロジェクトは、**日本医療情報学会 FHIR国内実装基盤研究会**が開発する**JP Core 実装ガイド**です。日本国内の医療情報システム間でのデータ交換を標準化するため、FHIR R4.0.1 をベースとした日本固有の実装仕様を定義しています。

#### 主な機能と目標

- **医療データの相互運用性確保**: 異なる医療機関・システム間での患者データ交換を標準化
- **日本の医療制度への対応**: 保険制度、診療報酬体系、医療従事者免許制度等に適合
- **国際標準との整合性**: FHIR 国際標準を基盤としつつ、日本の医療現場のニーズに対応
- **実装の統一化**: 全国の医療情報システムで共通利用できる標準プロファイルの提供

#### 定義されている主要なリソース

- **Administration（運営管理）**: 患者情報、組織、施設、医療従事者、保険情報等
- **Medication（薬剤）**: 処方、調剤、服薬管理、予防接種記録等
- **Diagnostic（診断）**: 検体検査、画像検査、バイタルサイン、身体所見、口腔診査等
- **Clinical（診療）**: アレルギー情報、病態、処置、家族歴等
- **Workflow（ワークフロー）**: サービスリクエスト等

#### 成果物

- **FHIR プロファイル**: 日本固有の制約を定義した FHIR リソース仕様
- **拡張（Extension）**: 日本特有のデータ項目を追加する拡張定義
- **用語集（Terminology）**: 日本の医療現場で使用されるコードシステムと値セット
- **実装ガイド**: 利用方法と実装例を示すドキュメント
- **検索パラメータ**: 日本の医療現場に特化した検索機能

#### 利用対象

- 医療情報システムベンダー
- 医療機関の情報システム部門
- 医療データ交換プラットフォーム開発者
- 医療情報標準化に関わる研究者・技術者

## Development Commands

### Initial Setup (run once)

```bash
# Download terminology server packages
bash _updateTx.sh        # Linux/Mac
_updateTx.bat           # Windows

# Download IG Publisher JAR
bash _updatePublisher.sh # Linux/Mac
_updatePublisher.bat    # Windows
```

### Build Commands

```bash
# Single build
bash _genonce.sh        # Linux/Mac
_genonce.bat           # Windows

# Continuous build (watches for changes)
bash _gencontinuous.sh  # Linux/Mac
_gencontinuous.bat     # Windows
```

### After Adding/Modifying Resources

When adding new resources or changing IDs/URLs, run these scripts to update cross-references:

```bash
sushi                                    # Compile FSH to FHIR resources
ruby script/markdownlink_creator.rb     # Update markdown links
ruby script/specialurls_creator.rb      # Update sushi-config.yaml special URLs
```

### Documentation Files

When creating profiles, add corresponding documentation:

- **`input/intro-notes/{ProfileName}-intro.md`**: Background and scope
- **`input/intro-notes/{ProfileName}-notes.md`**: Usage examples and implementation notes

## Architecture & Key Directories

```
jp-core-v1x/
├── input/                           # Main source directory
│   ├── fsh/                        # FHIR Shorthand source files
│   │   ├── aliases.fsh             # Common URL aliases
│   │   ├── profiles/               # FHIR profiles & extensions
│   │   ├── examples/               # Example instances
│   │   ├── terminologies/          # CodeSystems & ValueSets
│   │   ├── searchparameters/       # Custom search parameters
│   │   └── capabilitystatements/   # Server/client capabilities
│   ├── pagecontent/                # Markdown content for IG pages
│   ├── intro-notes/                # Profile documentation (-intro.md, -notes.md)
│   └── resources/                  # Additional FHIR resources
├── fsh-generated/                  # Generated FHIR resources (auto-generated)
├── output/                         # Generated IG website (not in git)
├── custom-template/                # Custom IG Publisher template
├── docs/                          # Development documentation
└── script/                        # Ruby utility scripts
```

## JP Core FSH Rules & Conventions

### Naming Conventions

- **IDs**: kebab-case (e.g., `jp-patient`, `jp-medication-request-dispense-expected-count`)
- **Names**: PascalCase with underscores (e.g., `JP_Patient`, `JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount`)
- **URLs**: `http://jpfhir.jp/fhir/core/{ResourceType}/{Name}`
- **Files**: PascalCase with underscores + `.fsh` extension

### Resource File Organization

- **Profiles/Extensions**: `input/fsh/profiles/{ProfileName}.fsh`
- **Examples**: `input/fsh/examples/JP_{Profile}_Example.fsh`
- **Terminologies**: `input/fsh/terminologies/{Name}.fsh`
- **Search Parameters**: `input/fsh/searchparameters/{Profile}_SP.fsh`

### Key FSH Rules

- Use `..1` instead of `0..1` for cardinality; use `..0` for zero-fixed elements
- Reference JP Core profiles instead of base FHIR (e.g., `Reference(JP_Patient)` not `Reference(Patient)`)
- Use camelCase for slice names (not kebab-case)
- Use Flag Rules notation (`element 1.. MS`) instead of `element mustSupport = true`
- Add `【詳細参照】` to `^short` when detailed descriptions are in `^definition`/`^comment`
- Japanese documentation is acceptable; use `【JP Core仕様】` prefix for JP-specific specifications
- For documentation: Use 常体 (declarative tone), 「、」and「。」punctuation, omit long vowel marks in katakana

## Configuration Files

- **`sushi-config.yaml`**: Main SUSHI configuration, IG metadata, dependencies, menu structure
- **`ig.ini`**: IG Publisher settings
- **`input/ignoreWarnings.txt`**: Validation warnings to suppress
- **`input/_resources/exp-params.json`**: Terminology expansion parameters

## Branch Strategy

- **`main`**: Production branch (リリース責任者 only)
- **`develop`**: Main development branch (develop 責任者+ permissions required)
- **Feature branches**: Follow naming conventions:
  - `feature/swg[1-6]-(description)` for single SWG work
  - `feature/swg[1-6]+-(description)` for multi-SWG work
  - `feature/ext-(description)` for non-SWG changes
- **Workflow**: Feature branch → PR to develop → develop → main (for releases)
- **Conflict resolution**: 先勝ちルール (first-win rule) - later merger resolves conflicts
- See `/docs/githubflow.md` for detailed Git workflow rules

## Build Dependencies

- **Node.js & SUSHI**: FSH compiler (`npm install -g fsh-sushi`)
- **Java 8/11/17**: For IG Publisher
- **Ruby**: For utility scripts and Jekyll site generation
- **Git**: Version control

## Validation & Quality Assurance

This is a specification project, not software. Validation occurs through:

- **FHIR resource validation** via IG Publisher
- **FSH syntax validation** via SUSHI
- **Terminology validation** via external servers (tx.fhir.org)
- **Build warnings management**: Monitor and minimize warnings in `input/ignoreWarnings.txt`
- **CI/CD validation**: Automatic builds on PR creation and merge

### Common Issues & Troubleshooting

- **Trailing spaces**: Cause validation warnings, remove them
- **Memory issues**: Increase Java heap size with `-Xmx12G` if builds fail
- **Network dependency**: Terminology validation requires internet connectivity
- **Simultaneous builds**: Use `[ci skip]` in commit messages to bypass CI when needed

## Internationalization

- Default language: Japanese (`ja`)
- Uses Japanese locale settings: `-Duser.language=ja -Duser.country=JP`
- All documentation can be in Japanese; English supplementation is optional

## External Dependencies

- **jpfhir-terminology.r4**: Version 1.3.0 (external terminology dependency)
- **FHIR R4.0.1**: Base FHIR version
- Various external CodeSystems (LOINC, SNOMED CT, etc.)

## Technologies Used / 使用技術

### 主要な開発技術スタック

#### プログラミング言語・マークアップ言語

- **FSH (FHIR Shorthand)**: FHIR プロファイル、拡張、用語集定義のためのドメイン固有言語
- **YAML**: 設定ファイル (sushi-config.yaml)
- **JSON**: FHIR リソース定義、設定ファイル、パッケージマニフェスト
- **XML**: XSLT 変換、HTML フラグメント
- **HTML/CSS**: カスタムテンプレートとスタイリング
- **JavaScript**: UI 拡張機能
- **Markdown**: ドキュメントとコンテンツページ
- **Ruby**: 自動化スクリプト (ファイル生成、URL 管理等)
- **Python**: URL 置換スクリプト
- **Bash/Batch**: ビルドスクリプト

#### コア開発ツール

- **SUSHI (FSH Sushi)**: FSH ファイルを FHIR JSON リソースに変換するコンパイラ
- **HL7 FHIR IG Publisher**: 公式 FHIR 実装ガイド生成ツール
- **Java JDK (8/11/17)**: IG Publisher 実行に必要
- **Node.js**: SUSHI 実行環境
- **Ruby**: Jekyll とカスタムスクリプト実行環境

#### Web フレームワーク・ライブラリ

- **Jekyll**: 静的サイト生成ツール (ドキュメント生成)
- **Liquid Templating**: Jekyll のテンプレートエンジン
- **Custom IG Template**: 日本語対応カスタムテンプレート

#### バージョン管理・CI/CD

- **Git/GitHub**: ソースコード管理・コラボレーション
- **GitHub Actions**: 自動ビルド・デプロイメント
- **Ubuntu Latest**: CI/CD 実行環境
- **GitHub Pages**: 静的サイトホスティング

#### 外部依存・標準規格

- **HL7 FHIR R4.0.1**: ベースとなる医療情報交換標準
- **jpfhir-terminology.r4 (v1.3.0)**: 日本固有用語集パッケージ
- **tx.fhir.org**: HL7 用語検証サーバー
- **MEDIS**: 日本の医療コードシステム
- **レセプトコード**: 日本の診療報酬請求コード
- **JLAC**: 日本臨床検査医学会コード

#### 特殊ツール・ユーティリティ

- **FHIR Package Manager**: 依存関係解決
- **Terminology Validation**: 用語検証システム
- **XSLT 変換**: アーティファクト要約生成
- **シンボリックリンク管理**: 正規 URL-ファイルマッピング
- **アーカイブ管理**: TAR/GZIP 配布パッケージ作成

### 開発環境要件

- **OS**: Windows, Linux (Ubuntu), macOS 対応
- **メモリ**: 12GB 推奨 (Java heap: -Xmx12G)
- **ネットワーク**: 用語検証サーバー接続用インターネット環境
- **ストレージ**: FHIR パッケージキャッシュ用 (~/.fhir directory)

### 技術的特徴

- **モダン Web 技術**: Jekyll + 静的サイト生成
- **専門 FHIR툭ール**: FSH + IG Publisher による標準準拠開発
- **堅牢な CI/CD**: GitHub Actions による自動化パイプライン
- **日本語カスタマイズ**: 医療制度対応テンプレート・用語集
- **多言語サポート**: 日本語ロケール設定 (ja_JP)
- **品質保証**: 自動バリデーション・警告管理システム

## Architecture Patterns / アーキテクチャパターン

### 主要なアーキテクチャ設計原則

#### 階層アーキテクチャパターン (Layered Architecture)

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

#### モジュラー組織パターン (Modular Organization)

- **関心の分離**: ディレクトリ構造による明確な責任分担
- **FSH ファイル**: リソースタイプ・機能別組織化
- **外部用語集**: コア定義からの分離
- **サンプル**: プロファイル定義からの独立

### FHIR 固有の設計パターン

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

#### 拡張アーキテクチャパターン (Extension Architecture)

- **構造化拡張**: 複雑な下位拡張を持つパターン
- **単純拡張**: 基本データ用の単一値拡張
- **文脈拡張**: 特定プロファイル専用拡張

```fsh
* extension contains
    JP_Patient_Race named race ..* and
    JP_Organization_PrefectureNo named prefectureNo ..1
```

#### 用語バインディングパターン (Terminology Binding)

- **推奨バインディング (Preferred)**: 柔軟性を保ちつつガイダンス提供
- **必須バインディング (Required)**: 重要データの値セット強制
- **外部コードシステム統合**: 日本の医療用語集対応

#### スライシングパターン (Slicing Pattern)

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

#### 設定より規約 (Convention over Configuration)

- **ID**: kebab-case 形式 (`jp-patient`)
- **名前**: Pascal_Case + アンダースコア (`JP_Patient`)
- **URL**: 一貫した名前空間パターン
- **ファイル**: 名前ベース組織化

### 再利用性パターン

#### エイリアス管理パターン (Alias Management)

```fsh
// aliases.fsh - 標準FHIRエイリアス
Alias: $Patient = http://hl7.org/fhir/StructureDefinition/Patient

// aliases-jpcore.fsh - JP Core固有エイリアス
Alias: $JP_Patient = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient
```

#### ルールセットパターン (Ruleset Pattern)

```fsh
RuleSet: SetDefinition(name, definition)
* {name} ^short = "{definition}"
* {name} ^definition = "{definition}"

// 使用例
* insert SetDefinition(identifier, 患者を識別するための識別子)
```

#### 基底プロファイル戦略 (Base Profile Strategy)

- **共通基底**: `JP_DiagnosticReport_Common`で共通制約定義
- **専門化**: ドメイン固有プロファイルで追加制約
- **拡張合成**: 複数プロファイル間での拡張再利用

### ビルド・デプロイメントパターン

#### CI/CD パイプラインアーキテクチャ

```yaml
workflow:
  - FSHコンパイル (SUSHI)
  - FHIR IG生成 (IG Publisher)
  - 多環境デプロイメント
  - 自動テスト・バリデーション
```

#### 設定管理パターン (Configuration Management)

- **集中設定**: `sushi-config.yaml`による単一真実源
- **環境固有設定**: ビルド時のバージョン置換
- **依存関係管理**: GitHub Actions による外部パッケージ統合

### コンテンツ生成パターン

#### テンプレートベース生成 (Template-Based Generation)

- **カスタム Jekyll テンプレート**: 一貫したページレイアウト
- **日本語適応**: 言語・文化対応テンプレート
- **ナビゲーション拡張**: 利用性向上

#### 自動相互参照生成 (Automated Cross-Reference)

- **Ruby スクリプト**: Markdown リンク生成
- **URL 自動マッピング**: 正規 URL 管理
- **シンボリックリンク作成**: ファイルシステム統合

### アーキテクチャ設計原則

1. **一貫性 (Consistency)**: 命名規約・ルールセットによる強制
2. **拡張性 (Extensibility)**: 新プロファイル・拡張の容易な追加
3. **保守性 (Maintainability)**: 関心の分離・自動化ツール
4. **国際化 (Localization)**: 拡張・用語集による日本医療制度統合
5. **標準準拠 (Compliance)**: 地域要件対応時の FHIR 標準維持
6. **自動化 (Automation)**: 包括的 CI/CD による手作業削減・エラー防止

このアーキテクチャは、標準化と日本の医療要件のバランスを取った、成熟した本番対応 FHIR 実装ガイドを表しています。関心の分離、再利用性、保守性の優れた原則を実証しており、他の FHIR IG 開発者にとって学習・適応すべき価値ある設計となっています。

## Dental Examination Artifacts Analysis / 口腔診査関連アーティファクト分析

### 主要な口腔診査アーティファクト

#### コアプロファイル

- **`JP_DiagnosticReport_DentalOral`**: 口腔診査レポート
- **`JP_Observation_DentalOral_ToothExistence`**: 歯の有無・存在
- **`JP_Observation_DentalOral_ToothTreatmentCondition`**: 現存歯の処置状態
- **`JP_Observation_DentalOral_MissingToothCondition`**: 欠損歯の処置状態

#### 拡張（Extension）

- **`JP_Observation_DentalOral_BodySiteStatus`**: 身体部位状態
- **`JP_Observation_DentalOral_BodyStructure`**: 歯の構造（歯面等）
- **`JP_Observation_DentalOral_ToothRoot`**: 歯根指定

#### 用語集

- **13 の歯科固有 CodeSystem**: 歯式、処置状態、身体構造等
- **13 の対応 ValueSet**: 各 CodeSystem に対応

### 🚨 重大な構造的問題

#### **1. 一貫性のないコンポーネントコーディング制約**

```fsh
// MissingToothCondition - 問題: プライマリコードが使用不可
* component.code.coding[primary] ..1  // システム制約なし！

// ToothTreatmentCondition - 正常動作
* component.code.coding[primary] from JP_DentalPresentTeethObservation_VS
* component.code.coding[primary].system = $JP_DentalPresentTeethObservation_CS
```

**問題**: 欠損歯処置状態でシステム制約不足によりプライマリコードが適切に使用できない。

#### **2. 相互参照関係の破綻**

```fsh
// ToothExistenceは他を参照可能
* hasMember only Reference(JP_Observation_DentalOral_ToothTreatmentCondition or
                         JP_Observation_DentalOral_MissingToothCondition)

// しかしMissingToothConditionは逆参照不可
* hasMember 0..0  // ブロック！
```

**問題**: 欠損歯処置状態が関連観察への逆参照不可で論理的関係が破綻。

#### **3. 一貫性のない value 要素使用**

```fsh
// ToothExistence - value[x]を正しく使用
* value[x] from $JP_DentalFundamentalStatus_VS (required)

// ToothTreatmentCondition & MissingToothCondition - value[x]未使用
* value[x] only CodeableConcept
* insert SetDefinition(value[x], 【JP Core仕様】component要素を利用して複数の結果を表現することを考慮しているため、本要素は使用しない)
```

**問題**: 一貫性のないデータモデリングアプローチにより FHIR 準拠性と検索性が低下。

### 🔧 設計パターンの問題

#### **4. 限定的な DiagnosticReport 統合**

```fsh
// DiagnosticReportはToothExistenceのみ参照可能
* result only Reference(JP_Observation_DentalOral_ToothExistence)
```

**問題**: 診断レポートで処置状態や欠損歯観察を直接参照不可。

#### **5. 拡張使用の一貫性欠如**

```fsh
// ToothTreatmentConditionは豊富な拡張を持つ
* extension contains
    JP_Observation_DentalOral_ToothRoot named toothRoot 0..1 and
    JP_Observation_DentalOral_BodyStructure named bodyStructure ..*

// MissingToothConditionは拡張なし - 一貫性なし！
```

**問題**: 欠損歯処置状態に現存歯で利用可能な歯面・構造拡張が欠如。

#### **6. カテゴリコードシステムの問題**

```fsh
// CodeSystemにDO-1-04カテゴリが不在
CodeSystem: JP_ObservationDentalCategory_CS
* #DO-1-01 "ToothExistence"
* #DO-1-02 "ToothTreatmentCondition"
* #DO-1-03 "MissingToothCondition"
// 不在: DO-1-04 for その他の口腔観察
```

**問題**: 新しい口腔観察タイプのカテゴリ拡張が制限されている。

### 📊 用語集・データモデルの問題

#### **7. 不完全な用語集カバレッジ**

**不足している臨床概念:**

- 歯周評価コード（ポケット深度、動揺度、出血指数）なし
- 齲蝕リスク評価用語なし
- 疼痛評価スケールなし
- 顎関節（TMJ）評価コードなし
- 軟組織病理コードなし

#### **8. 限定的な身体部位粒度**

```fsh
// 現在: 歯レベルの身体部位のみ
* bodySite from JP_DentalBodySite_VS (preferred)

// 不足: 四分域、歯列弓、歯周部位粒度
```

**問題**: 歯周部位固有所見（近心、遠心、頬側、舌側）を表現不可。

#### **9. 処置統合の欠如**

**問題**: 口腔観察と処置間の明確な接続なし。

- 歯科固有処置プロファイル不在
- 歯科紹介用サービスリクエスト統合なし
- 治療計画機能なし

### 🔍 実装例の問題

#### **10. 一貫性のない例データ**

```fsh
// 例で欠損歯カテゴリなのにテキストが間違い
* category[third].coding.display = "MissingToothCondition"
* category.text = "現存歯の処置状態"  // 間違い！「欠損歯の処置状態」であるべき
```

#### **11. 検証例の不足**

**問題:**

- 複雑な多歯条件の例なし
- 全口腔診査例なし
- 無効な組み合わせのエラーハンドリング例なし

### 🏗️ アーキテクチャの問題

#### **12. 特定標準への密結合**

```fsh
// 日本歯科標準V1.02への密結合
// Copyright Japan Dental Association 日本歯科医師会
```

**問題**: 国際利用や発展する標準への拡張が困難。

#### **13. 限定的なモジュラー性**

**問題:**

- 新しい口腔観察タイプの追加が困難
- 拡張パターンが一貫して適用されていない
- 口腔観察の明確な継承階層なし

### 🎯 優先修正推奨事項

#### **緊急（即座に修正）:**

1. MissingToothCondition プライマリコードの不足システム制約追加
2. 例のカテゴリテキスト不一致修正
3. 欠損歯と関連観察間の相互参照有効化

#### **高優先度:**

1. 全口腔観察での value[x]要素使用の標準化
2. MissingToothCondition プロファイルへの不足拡張追加
3. DiagnosticReport 結果参照の拡張

#### **中優先度:**

1. 歯周評価用語集・プロファイル追加
2. 歯科処置統合作成
3. 歯周部位用身体部位粒度拡張

これらの問題は口腔診査機能を大幅に制限し、開発者を混乱させ相互運用性を低下させる一貫性のない実装パターンを作成しています。
