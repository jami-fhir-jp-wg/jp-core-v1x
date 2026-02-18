# OID Migration Requirements Quality Checklist: JP_Organization OID参照修正

**Purpose**: PR レビュー用。OID→URL 置換の仕様記述が完全・明確・一貫しているかを検証する
**Created**: 2026-02-18
**Feature**: [spec.md](../spec.md)

## Requirement Completeness

- [x] CHK001 修正対象の全箇所（3箇所）が FR として個別に定義されているか？ [Completeness, Spec §FR-001〜FR-003]
- [x] CHK002 修正対象外のファイル（namingsystems.fsh, aliases-jpcore.fsh, guide-urlmap.md）が明示的に除外されているか？ [Completeness, Spec §Edge Cases]
- [x] CHK003 置換後の URL の正当性根拠（aliases-jpcore.fsh, NamingSystem とのマッピング）が文書化されているか？ [Completeness, research.md]
- [x] CHK004 SUSHI コンパイル成功が要件として明記されているか？ [Completeness, Spec §FR-004]

## Requirement Clarity

- [x] CHK005 各 FR で置換前の文字列（OID）と置換後の文字列（URL）が正確に記載されているか？ [Clarity, Spec §FR-001〜FR-003]
- [x] CHK006 L215 の誤字修正（`1http://` → `http://`）の原因が説明されているか？ [Clarity, research.md §L215]
- [x] CHK007 コメント内の「OID」という用語をそのまま維持する方針が明記されているか？ [Clarity, Spec §Assumptions]
- [x] CHK008 修正対象の行番号が正確に特定されているか？（L22-23, L25, L215） [Clarity, Spec §FR-001〜FR-003]

## Requirement Consistency

- [x] CHK009 Profile セクション（L22-23）と Extension 定義セクション（L214-215）の prefectureNo コメントで同一の URL が指定されているか？ [Consistency, Spec §FR-001 vs §FR-003]
- [x] CHK010 置換後の URL が Extension 定義セクション内の既存の正しい参照（L175-176 の MedicationFeeScoreType）と整合しているか？ [Consistency, research.md]
- [x] CHK011 spec.md の Acceptance Scenarios と FR の記述が矛盾なく対応しているか？ [Consistency, Spec §User Story 1 vs §Requirements]

## Acceptance Criteria Quality

- [x] CHK012 各成功基準（SC-001〜SC-004）が客観的に測定可能か？ [Measurability, Spec §Success Criteria]
- [x] CHK013 SC-001（OID 不在確認）の検証対象ファイルが明確に限定されているか？ [Measurability, Spec §SC-001]
- [x] CHK014 SC-002（URL 一致確認）の比較先（aliases-jpcore.fsh）が具体的に指定されているか？ [Measurability, Spec §SC-002]

## Scenario Coverage

- [x] CHK015 同一 OID が他のプロファイルファイルにも残存していないことの確認範囲が定義されているか？ [Coverage, research.md §影響範囲]
- [x] CHK016 Extension 定義セクション内の organizationCategory コメント（L175-176）が既に正しいことが確認されているか？ [Coverage, research.md]

## Edge Case Coverage

- [x] CHK017 修正対象外ファイルの OID が「正当な参照」である理由が文書化されているか？ [Edge Case, Spec §Edge Cases, research.md §影響範囲]
- [x] CHK018 将来的に同様の OID 残存が発生しないための予防策が検討されているか？ [Edge Case, Gap] ※本 Issue のスコープ外。予防策の記載なしだが許容

## Notes

- 焦点: Issue #921 の OID→URL 置換仕様の品質検証
- 深度: Standard
- 用途: PR レビュー時のゲートチェック
- 既存の `requirements.md` チェックリストは仕様全般の品質を対象としており、本チェックリストは OID 移行固有の要件品質に特化している
