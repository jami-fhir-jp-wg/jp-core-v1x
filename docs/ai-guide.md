# 生成AI活用ガイド

本プロジェクト（JP Core 実装ガイド）では、生成AIを活用した仕様駆動開発を採用している。
本ガイドでは、開発に使用するツール群の概要とセットアップ手順を説明する。

## 概要

本プロジェクトの生成AI活用は、以下の3つの要素で構成される。

1. **SpecKit** — 仕様駆動開発フレームワーク
2. **生成AIエンジン** — Claude（推奨）または MCP 対応エージェント
3. **Serena MCP サーバ** — LSP ベースの意味論的コード解析

---

## SpecKit（仕様駆動開発フレームワーク）

### 目的

SpecKit は、自然言語による要件定義から実装までを段階的に進める仕様駆動開発フレームワークである。
`.specify/` ディレクトリに格納されたテンプレートとスクリプトで構成され、
8つのスラッシュコマンドにより仕様→実装パイプラインを提供する。

### ワークフロー

SpecKit の基本ワークフローは以下の順序で実行する。

```
specify → clarify → plan → tasks → implement
```

1. **specify** — 自然言語から仕様書（spec.md）を生成する
2. **clarify** — 仕様の曖昧性を検出・解決する
3. **plan** — 実装計画（plan.md）と調査結果（research.md）を生成する
4. **tasks** — タスクリスト（tasks.md）を生成する
5. **implement** — タスクを順次実行し、ソースコードを生成する

### コマンド一覧

| コマンド | 目的 | 出力 |
|---------|------|------|
| `/speckit.specify` | 自然言語から仕様書を生成 | spec.md |
| `/speckit.clarify` | 仕様の曖昧性を検出・解決 | spec.md 更新 |
| `/speckit.plan` | 実装計画を生成 | plan.md、research.md |
| `/speckit.tasks` | タスクリストを生成 | tasks.md |
| `/speckit.implement` | タスクを実行 | ソースコード |
| `/speckit.checklist` | 品質チェックリストを生成 | checklists/*.md |
| `/speckit.analyze` | アーティファクト間整合性分析 | 分析レポート |
| `/speckit.constitution` | プロジェクト憲法の管理 | constitution.md |

詳細は [SpecKit リポジトリ](https://github.com/nicholasgriffintn/speckit) を参照。

### 前提条件

SpecKit を利用するには以下のツールが必要である。

- **Claude Code**（推奨）または MCP 対応の AIエージェント
- **Git** — ブランチ管理に使用する

> **注記**: SpecKit の内部スクリプトは PowerShell で記述されているが、
> Claude Code が自動的に実行するため、ユーザーが PowerShell を
> 直接操作する必要はない。Claude Code の実行環境に PowerShell
> ランタイム（pwsh）が含まれていれば動作する。

### セットアップ

1. プロジェクトをクローンする（未実施の場合）

   ```bash
   git clone https://github.com/jami-fhir-jp-wg/jp-core-v1x.git
   cd jp-core-v1x
   ```

2. `.specify/` ディレクトリの確認

   プロジェクトルートに `.specify/` ディレクトリが存在することを確認する。
   このディレクトリには SpecKit のテンプレート、スクリプト、設定ファイルが格納されている。

   ```bash
   ls .specify/
   ```

   `.specify/` ディレクトリが存在しない場合は、`develop` ブランチから最新を取得する。

   ```bash
   git checkout develop
   git pull origin develop
   ```

3. Claude Code をインストールし、プロジェクトディレクトリで起動する

   ```bash
   claude
   ```

### 基本的な使用方法

SpecKit を使用した典型的な開発フローを以下に示す。

#### 1. 仕様書の作成

自然言語で機能の説明を入力し、仕様書を生成する。

```
/speckit.specify 患者リソースに新しい拡張を追加する
```

生成された仕様書は `specs/<番号>-<機能名>/spec.md` に保存される。

#### 2. 仕様の明確化

生成された仕様の曖昧な箇所を検出し、対話的に解決する。

```
/speckit.clarify
```

#### 3. 実装計画の作成

仕様に基づいて実装計画を生成する。

```
/speckit.plan
```

`plan.md`（実装計画）と `research.md`（技術調査結果）が生成される。

#### 4. タスクリストの生成

実装計画からタスクリストを生成する。

```
/speckit.tasks
```

#### 5. 実装の実行

タスクリストに従って実装を実行する。

```
/speckit.implement
```

#### 補助コマンド

- `/speckit.analyze` — 仕様書・計画・タスク間の整合性を分析する
- `/speckit.checklist` — PR レビュー用の品質チェックリストを生成する

---

## 生成AIエンジン

### 推奨エンジン: Claude

本プロジェクトでは [Claude](https://claude.ai/) を推奨AIエンジンとして採用している。
プロジェクトルートの `CLAUDE.md` が Claude Code 向けのガイダンスとして構成されており、
SpecKit のコマンドも Claude Code 上での実行を前提に設計されている。

CLI ツールとして [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) を使用する。

#### Claude Code のインストール

Claude Code のインストール方法は公式ドキュメントを参照。

- [Claude Code セットアップガイド](https://docs.anthropic.com/en/docs/claude-code/getting-started)

インストール後、プロジェクトディレクトリで `claude` コマンドを実行すると、
`CLAUDE.md` のガイダンスが自動的に読み込まれる。

---

## MCP サーバ（Serena）

### 概要

本プロジェクトの MCP サーバ設定は、プロジェクトルートの **`.mcp.json`** で一元管理する。
MCP 対応エージェント（Claude Code、GitHub Copilot、Cursor 等）は、起動時に `.mcp.json` を
自動的に読み込むため、ユーザーによる個別の MCP 設定は不要である。

### Serena について

[Serena](https://github.com/oraios/serena) は、LSP（Language Server Protocol）ベースの意味論的コード解析を提供する MCP サーバである。
プロジェクトのコード構造を解析し、AIエージェントに対してシンボル検索、定義参照、
型情報などの高度なコードインテリジェンスを提供する。

主な機能:

- シンボル定義の検索と参照
- プロジェクト構造の意味論的解析
- ファイル間の依存関係の把握
- コードナビゲーション支援

`--context claude-code` フラグにより、Claude Code の組み込みツールとの機能重複を回避する。

### `.mcp.json` の設定内容

本プロジェクトには以下の `.mcp.json` が既に設定されている。

```json
{
  "mcpServers": {
    "serena": {
      "command": "uvx",
      "args": [
        "--from", "git+https://github.com/oraios/serena",
        "serena", "start-mcp-server",
        "--context", "claude-code",
        "--project", "."
      ]
    }
  }
}
```

> **重要**: MCP サーバの追加・変更は `.mcp.json` のみで管理する。
> 個別のエージェント設定やグローバル設定は使用しない。

### 前提条件

Serena を利用するには **uv / uvx**（Python パッケージランナー）が必要である。

| 環境 | インストール方法 |
|------|-----------------|
| **Linux** | `curl -LsSf https://astral.sh/uv/install.sh \| sh` |
| **macOS** | `curl -LsSf https://astral.sh/uv/install.sh \| sh` または `brew install uv` |
| **Windows** | `powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 \| iex"` |

詳細は [uv 公式ドキュメント](https://docs.astral.sh/uv/getting-started/installation/) を参照。

### 動作確認

1. uv/uvx がインストールされていることを確認する

   ```bash
   uvx --version
   ```

2. AIエージェントを起動する（例: Claude Code）

   ```bash
   claude
   ```

   起動時に `.mcp.json` が読み込まれ、Serena MCP サーバが自動的にロードされる。
   Serena のツール（`list_dir`、`find_symbol` 等）が利用可能になっていれば設定は完了である。

### 環境別の注意事項

| 環境 | 注意事項 |
|------|---------|
| **Linux** | uv のインストール後、シェルの PATH 設定を確認する（`~/.local/bin` が PATH に含まれること） |
| **macOS** | Homebrew 経由でもインストール可能: `brew install uv` |
| **Windows** | パスに日本語が含まれる場合は文字化けに注意する |

Serena の詳細は [Serena リポジトリ](https://github.com/oraios/serena) を参照。
