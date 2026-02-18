# Quickstart: JP_Organization OID修正の検証

## 修正内容の確認

`input/fsh/profiles/JP_Organization.fsh` の以下3箇所を修正:

1. **L22-23** prefectureNo ^comment:
   `1.2.392.100495.20.3.21` → `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits`

2. **L25** organizationCategory ^comment:
   `1.2.392.100495.20.3.22` → `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationFeeScoreType`

3. **L215** PrefectureNo Extension ^comment:
   `1http://jpfhir.jp/...` → `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits`

## 検証手順

```bash
# 1. SUSHI コンパイル
sushi

# 2. エラーがないことを確認
# 成功時: "Profiles: X, Extensions: Y, ..." が表示される

# 3. (任意) IG Publisher でフルビルド
bash _genonce.sh    # Linux/Mac
_genonce.bat       # Windows

# 4. output/StructureDefinition-jp-organization.html で
#    コメントが正しい URL を表示していることを確認
```
