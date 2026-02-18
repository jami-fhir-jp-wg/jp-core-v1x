# Implementation Plan: JP_Organization.fsh OID参照の修正

**Branch**: `921_JP_Organization._OID` | **Date**: 2026-02-18 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/921_JP_Organization._OID/spec.md`

## Summary

JP_Organization.fsh の extension コメント内に残存する OID 形式の
識別子（`1.2.392.100495.20.3.21`, `1.2.392.100495.20.3.22`）を
正規の FHIR URL に置換する。加えて Extension 定義内の誤字
（`1http://` → `http://`）を修正する。
修正対象は1ファイル3箇所のコメント文字列のみ。

## Technical Context

**Language/Version**: FSH (FHIR Shorthand)
**Primary Dependencies**: SUSHI (FSH コンパイラ)
**Storage**: N/A
**Testing**: SUSHI コンパイル + IG Publisher ビルド
**Target Platform**: FHIR IG (実装ガイド)
**Project Type**: FHIR 仕様プロジェクト
**Performance Goals**: N/A
**Constraints**: N/A
**Scale/Scope**: 1ファイル（JP_Organization.fsh）、3箇所の修正

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle | Status | Notes |
|---|---|---|
| I. FHIR標準準拠 | PASS | OID→URL 置換は FHIR 標準準拠を向上させる |
| II. Must Support 方針 | N/A | MS フラグの変更なし |
| III. 命名規約 | N/A | 名前・ID の変更なし |
| IV. FSH記述規則 | PASS | コメント修正のみ。構造変更なし |
| V. リソース組織化 | N/A | ファイル構成の変更なし |
| VI. 日本語化基準 | PASS | コメントは日本語で維持 |
| VII. アーキテクチャ設計原則 | PASS | 一貫性原則に合致（Extension 定義と Profile コメントの整合） |

**Gate Result**: ALL PASS - Phase 0 に進行可能

## Project Structure

### Documentation (this feature)

```text
specs/921_JP_Organization._OID/
├── plan.md              # This file
├── spec.md              # Feature specification
├── research.md          # Phase 0: URL verification results
└── checklists/
    ├── requirements.md  # Specification quality checklist
    └── oid-migration.md # OID migration requirements quality checklist
```

### Source Code (repository root)

```text
input/fsh/profiles/
└── JP_Organization.fsh  # 修正対象ファイル（3箇所）
```

**Structure Decision**: 既存ファイルの修正のみ。新規ファイルの作成なし。

## Complexity Tracking

> Constitution Check に違反なし。複雑性の正当化は不要。
