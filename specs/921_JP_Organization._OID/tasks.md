# Tasks: JP_Organization.fsh OID参照の修正

**Input**: Design documents from `/specs/921_JP_Organization._OID/`
**Prerequisites**: plan.md (required), spec.md (required), research.md, quickstart.md

**Tests**: Not requested. Test tasks are omitted.

**Organization**: Single user story (US1) with 3 edits in 1 file + compilation verification.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1)
- Include exact file paths in descriptions

---

## Phase 3: User Story 1 - OID参照をURL参照に修正 (Priority: P1) MVP

**Goal**: JP_Organization.fsh の extension コメント内に残存する OID 形式の識別子を正規の FHIR URL に置換し、誤字を修正する

**Independent Test**: `sushi` コマンドでコンパイルし、エラーなく完了することを確認。生成される IG ページで正しい URL が表示されることを確認する。

### Implementation for User Story 1

- [x] T001 [US1] Replace OID `1.2.392.100495.20.3.21` with URL `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits` in prefectureNo ^comment (L22-23) in input/fsh/profiles/JP_Organization.fsh
- [x] T002 [US1] Replace OID `1.2.392.100495.20.3.22` with URL `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationFeeScoreType` in organizationCategory ^comment (L25) in input/fsh/profiles/JP_Organization.fsh
- [x] T003 [US1] Fix typo `1http://jpfhir.jp/...` to `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits` in PrefectureNo Extension ^comment (L215) in input/fsh/profiles/JP_Organization.fsh
- [x] T004 [US1] Verify SUSHI compilation succeeds without errors by running `sushi` command
- [x] T005 [US1] Verify JP_Organization.fsh no longer contains OID references `1.2.392.100495.20.3.21` or `1.2.392.100495.20.3.22`, and that replacement URLs match aliases-jpcore.fsh definitions (`$JP_PrefectureNumber_CS`, `$JP_MedicalFeeScoreType_CS`)

**Checkpoint**: All 3 OID references replaced with correct URLs. SUSHI compilation passes.

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 3 (US1)**: No setup or foundational dependencies. Can start immediately.

### Within User Story 1

- T001, T002, T003 は同一ファイルを編集するため順次実行する
- T004 depends on T001, T002, T003 completion (compilation verification)
- T005 depends on T001, T002, T003 completion (OID absence verification)

### Parallel Opportunities

- T001, T002, T003 は同一ファイルのため並列不可。T004, T005 も T001-T003 完了後に実行する

---

## Execution Example: User Story 1

```bash
# 同一ファイルのため順次実行:
Task: "Replace OID 1.2.392.100495.20.3.21 in prefectureNo ^comment in input/fsh/profiles/JP_Organization.fsh"
Task: "Replace OID 1.2.392.100495.20.3.22 in organizationCategory ^comment in input/fsh/profiles/JP_Organization.fsh"
Task: "Fix typo 1http:// in PrefectureNo Extension ^comment in input/fsh/profiles/JP_Organization.fsh"

# 編集完了後に検証:
Task: "Run sushi compilation and verify no errors"
Task: "Verify no remaining OID references and URL correctness against aliases-jpcore.fsh"
```

---

## Implementation Strategy

### MVP (User Story 1 Only)

1. Apply 3 comment edits (T001-T003)
2. Verify compilation (T004)
3. Verify OID removal (T005)
4. **DONE** - Single user story, single phase

---

## Notes

- All edits are comment-only changes (`^comment` metadata) - no structural or behavioral impact
- Replacement URLs verified against `aliases-jpcore.fsh` and `namingsystems.fsh` (see research.md)
- Files NOT modified: `namingsystems.fsh`, `aliases-jpcore.fsh`, `guide-urlmap.md` (OIDs there are legitimate references)
- The word "OID" in comment text is preserved per spec assumptions
