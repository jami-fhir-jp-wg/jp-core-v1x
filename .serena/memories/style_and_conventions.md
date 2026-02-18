# Style and Conventions

## Naming Conventions
- **ID**: kebab-case (`jp-patient`, `jp-medication-request-dispense-expected-count`)
- **Name**: PascalCase + underscore (`JP_Patient`, `JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount`)
- **URL**: `http://jpfhir.jp/fhir/core/{ResourceType}/{Name}`
- **File**: PascalCase + underscore + `.fsh` extension
- **Artifact names**: English. Documentation/comments: Japanese.

## FSH Authoring Rules
- Cardinality: use `..1` not `0..1`. Zero-fix: `..0`
- Slice names: camelCase (not kebab-case)
- Slicing: default `#open` (`^slicing.rules = #open`)
- Flag Rules syntax: `element 1.. MS` (not `mustSupport = true`)
- `^short` with details: append `【詳細参照】`
- JP Core specific: prefix with `【JP Core仕様】`
- Invariant keys: `jp-[type]-[descriptive-name]`

## Must Support Policy
- MS flags: 原則不要 (not required by default)
- Only with clear use case + clinical justification
- Existing profiles: maintain current MS flags as-is
- New profiles: follow new policy

## Japanese Language
- Default language: ja (Japanese)
- Style: 常体 (assertive)
- Punctuation: 「、」and「。」
- Katakana: omit long vowel marks

## Documentation Per Profile
- `input/intro-notes/{ProfileName}-intro.md` (background, scope)
- `input/intro-notes/{ProfileName}-notes.md` (usage examples, implementation notes)
