# Feature Specification: JP_Organization.fsh OID参照の修正

**Feature Branch**: `921_JP_Organization._OID`
**Created**: 2026-02-18
**Status**: Implemented
**Input**: GitHub Issue #921 - JP_Organization.fsh の extension コメントに OID 記載が残っている

## User Scenarios & Testing *(mandatory)*

### User Story 1 - OID参照をURL参照に修正 (Priority: P1)

JP_Organization プロファイルの extension コメントに古い OID 形式の
識別子が残っており、実装者が誤った system 値を使用する恐れがある。
コメント内の OID を正しい FHIR URL に置換し、実装ガイドの
正確性を確保する。

**Why this priority**: コメント内の誤った識別子は実装者の混乱を招き、
相互運用性に影響を与える可能性がある。

**Independent Test**: JP_Organization.fsh をビルドし、生成される
IG のページで正しい URL が表示されることを確認する。

**Acceptance Scenarios**:

1. **Given** JP_Organization.fsh の extension[prefectureNo] ^comment に
   OID `1.2.392.100495.20.3.21` が記載されている、
   **When** コメントを修正する、
   **Then** URL `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits`
   に置換されている
2. **Given** JP_Organization.fsh の extension[organizationCategory] ^comment に
   OID `1.2.392.100495.20.3.22` が記載されている、
   **When** コメントを修正する、
   **Then** URL `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationFeeScoreType`
   に置換されている
3. **Given** JP_Organization_PrefectureNo Extension 定義の ^comment に
   誤字 `1http://jpfhir.jp/...` が存在する、
   **When** コメントを修正する、
   **Then** `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits`
   に修正されている

---

### Edge Cases

- NamingSystem 定義（`namingsystems.fsh`）内の OID は公式な
  OID-to-URL マッピングであるため変更しない
- `aliases-jpcore.fsh` 内の OID コメントは参考情報であるため変更しない
- `guide-urlmap.md` 内の OID-URL 対応表は参照文書であるため変更しない

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Profile セクション（L22-23）の prefectureNo コメントで
  OID `1.2.392.100495.20.3.21` を URL
  `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits`
  に置換しなければならない
- **FR-002**: Profile セクション（L25）の organizationCategory コメントで
  OID `1.2.392.100495.20.3.22` を URL
  `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationFeeScoreType`
  に置換しなければならない
- **FR-003**: Extension 定義セクション（L215）の PrefectureNo コメントで
  誤字 `1http://jpfhir.jp/...` を
  `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits`
  に修正しなければならない
- **FR-004**: 修正後の SUSHI コンパイルが成功しなければならない

### Key Entities

- **JP_Organization Profile**: 組織情報プロファイル（修正対象）
- **JP_Organization_PrefectureNo Extension**: 都道府県番号拡張（修正対象）
- **JP_Organization_InsuranceOrganizationCategory Extension**: 点数表コード拡張（コメントのみ修正）

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: JP_Organization.fsh 内に OID 形式（`1.2.392.100495.20.3.21`、
  `1.2.392.100495.20.3.22`）の直接参照が存在しない
- **SC-002**: 修正後の URL が aliases-jpcore.fsh の公式 URL 定義と一致する
- **SC-003**: SUSHI コンパイルがエラーなく完了する
- **SC-004**: 生成される IG ページで正しい URL が表示される

## Assumptions

- コメント内の「OID」という用語はそのまま維持する
  （既存の Extension 定義セクションの慣行と一致させるため）
- NamingSystem、aliases、guide-urlmap の OID 記載は正当な
  参照情報であり修正対象外とする
