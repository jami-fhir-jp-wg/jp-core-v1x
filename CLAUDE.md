# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Conventions & Principles**: See `.specify/memory/constitution.md` for naming conventions, FSH authoring rules, architecture patterns, branch strategy, and quality standards.

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

## Configuration Files

- **`sushi-config.yaml`**: Main SUSHI configuration, IG metadata, dependencies, menu structure
- **`ig.ini`**: IG Publisher settings
- **`input/ignoreWarnings.txt`**: Validation warnings to suppress
- **`input/_resources/exp-params.json`**: Terminology expansion parameters

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
- **専門 FHIRツール**: FSH + IG Publisher による標準準拠開発
- **堅牢な CI/CD**: GitHub Actions による自動化パイプライン
- **日本語カスタマイズ**: 医療制度対応テンプレート・用語集
- **多言語サポート**: 日本語ロケール設定 (ja_JP)
- **品質保証**: 自動バリデーション・警告管理システム
