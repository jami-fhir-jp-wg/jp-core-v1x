# Research: JP_Organization OID→URL 置換の検証

## 置換 URL の正当性検証

### OID 1.2.392.100495.20.3.21 → PrefectureNo-2digits

- **Decision**: `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits`
- **Rationale**: `aliases-jpcore.fsh` L216 で
  `$JP_PrefectureNumber_CS` として定義済み。
  NamingSystem でも OID-URL マッピングが確認済み。
  Extension 定義セクション（L214-215）も同一 URL を使用
  （ただし先頭に誤字 `1` が付加されている）。
- **Alternatives considered**: なし（公式マッピングが一意に確定）

### OID 1.2.392.100495.20.3.22 → MedicationFeeScoreType

- **Decision**: `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationFeeScoreType`
- **Rationale**: `aliases-jpcore.fsh` L162 で
  `$JP_MedicalFeeScoreType_CS` として定義済み。
  NamingSystem でも OID-URL マッピングが確認済み。
  Extension 定義セクション（L175-176）も同一 URL を既に使用中。
- **Alternatives considered**: なし（公式マッピングが一意に確定）

### L215 誤字 `1http://` の確認

- **Decision**: 先頭の `1` を削除し `http://jpfhir.jp/...` に修正
- **Rationale**: `1` は以前の OID 値 `1.2.392...` から URL への
  不完全な置換の残骸と推測される。同一 Extension の
  valueCoding バインディング（L218）は
  `JP_PrefectureNumber_VS` を正しく参照しており、
  URL 自体は正しい。
- **Alternatives considered**: なし（明確な誤字）

## 影響範囲の確認

| ファイル | OID 出現 | 対応 |
|---|---|---|
| `JP_Organization.fsh` L22-23 | `1.2.392.100495.20.3.21` | **修正対象** |
| `JP_Organization.fsh` L25 | `1.2.392.100495.20.3.22` | **修正対象** |
| `JP_Organization.fsh` L215 | `1http://...` (誤字) | **修正対象** |
| `aliases-jpcore.fsh` L162, L216 | コメント内 OID | 参照情報。変更不要 |
| `namingsystems.fsh` L374-392 | OID 定義 | 公式マッピング。変更不要 |
| `guide-urlmap.md` L71-72 | OID-URL 対応表 | 参照文書。変更不要 |

## NEEDS CLARIFICATION の解決

なし。全置換値が aliases-jpcore.fsh と NamingSystem から一意に確定。
