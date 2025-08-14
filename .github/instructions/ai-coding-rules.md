# IGPublisher 生成AI コーディングルール

本文書は、IGPublisher（FHIR Implementation Guide Publisher）でソースコードを作成する際の生成AI向けのコーディングルールを定義します。

## 1. 基本原則

### 1.1 SOLID原則の適用
生成AIは以下のSOLID原則を遵守したコードを生成する必要があります：

- **単一責任の原則（SRP）**: 各プロファイル、エクステンション、バリューセットは単一の目的を持つべきです
- **開放閉鎖の原則（OCP）**: 既存の定義を変更せず、拡張によって機能を追加すべきです
- **リスコフの置換原則（LSP）**: 派生プロファイルは基底プロファイルと置換可能であるべきです
- **インターフェース分離の原則（ISP）**: 大きなプロファイルは小さな、目的特化したプロファイルに分割すべきです
- **依存性逆転の原則（DIP）**: 具体的な実装よりも抽象的な定義に依存すべきです

### 1.2 モジュール性とコード再利用
- 共通的な制約やルールはRuleSetとして定義し、再利用する
- 複雑なExtensionは小さな単位に分割して保守性を向上させる
- プロファイル間の依存関係を明確にし、循環参照を避ける

## 2. FHIR Shorthand (FSH) コーディングルール

### 2.1 命名規則（JP Coreガイドライン準拠）

#### ID命名規則
Kebab Case形式（小文字）を採用：
```fsh
// 正規表現: ([a-z]|[-])+
Profile: JP_Patient
Id: jp-patient

Extension: JP_Patient_Race_Extension  
Id: jp-patient-race-extension
```

#### Name命名規則
Pascal Case + アンダースコア区切り：
```fsh
// 正規表現: (([A-Z]+[a-z]*)+_)+([A-Z]+[a-z]*)+
Profile: JP_Patient
Extension: JP_Patient_Race_Extension
ValueSet: JP_Gender_VS
CodeSystem: JP_Gender_CS
```

#### URL形式
```fsh
// プロファイル・データタイプ
http://jpfhir.jp/fhir/core/StructureDefinition/{Name}

// エクステンション
http://jpfhir.jp/fhir/core/Extension/StructureDefinition/{Name}

// 用語集（共通利用のため）
http://jpfhir.jp/fhir/Common/CodeSystem/{Name}
```

### 2.2 ファイル構成とフォルダ規則

#### フォルダ構成
```
input/fsh/
├── capabilitystatements/     # CapabilityStatement用
├── examples/                # リソース例
├── others/                  # その他（DataType、Operation等）
├── profiles/                # Profile、Extension用
├── searchparameters/        # SearchParameter用
└── terminologies/           # ValueSet、CodeSystem、ConceptMap用
```

#### ファイル命名
```fsh
// Profile・Extension（1ファイル集約）
profiles/JP_Patient.fsh

// SearchParameter（1ファイル集約、_sp postfix必須）
searchparameters/JP_Patient_SP.fsh

// Example（1ファイル集約）
examples/JP_Patient_Example.fsh

// Terminology
terminologies/JP_Gender_CS.fsh
terminologies/JP_Gender_VS.fsh
```

### 2.3 FSHコード品質

#### コメント記載原則
```fsh
// ==============================
//   Profile 定義
// ==============================

Profile: JP_Patient
Id: jp-patient
// 以下のコメントは推奨されない例：
// * name 1..1  // 氏名は必須（自明なため不要）
// * 2024/01/01 追加（追加・更新コメントは避ける）

// 理解を深めるコメントのみ記載
* extension[race].valueCodeableConcept from JP_Race_VS (required)
  // 日本の人種分類に準拠。厚生労働省統計基準に基づく
```

#### カーディナリティの簡潔表記
```fsh
// Good - min値が0の場合は省略
* identifier ..1      // 0以上1以下
* name 1..1          // 1固定
* telecom 1..        // 1以上

// Bad - 冗長な表記
* identifier 0..1    // 0は省略すべき
```

#### MustSupportの適切な使用
```fsh
// Flag Rules形式を推奨
* name 1.. MS        // 推奨
* name.family MS     // 推奨

// 非推奨形式
* name mustSupport = true    // 非推奨
```

### 2.4 データタイプと制約

#### 適切な型制約
```fsh
// choice要素の制約
* value[x] only Quantity or CodeableConcept

// Reference制約（JP Coreプロファイルを優先）
* subject only Reference(JP_Patient)  // Good
* subject only Reference(Patient)     // Bad（FHIRベースは避ける）

// 既存のバインディングより厳格な制約
* status from JP_ObservationStatus_VS (required)  // extensibleからrequiredに強化
```

#### 日本固有の考慮事項
```fsh
// 日本の実装に特化した制約
* extension contains jp-patient-kanaName named kanaName 0..1 MS
  * ^short = "患者氏名（カナ）"
  * ^definition = "患者の氏名をカタカナで表現。全角カタカナを使用すること。"

// 既存のCore定義から日本向けに調整
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier contains 
    medicalRecordNumber 0..1 MS and
    insuranceCardNumber 0..1 MS
```

### 2.5 バリューセットとコードシステム

#### 外部コードシステムの適切な参照
```fsh
ValueSet: JP_MedicationCode_VS
Id: jp-medication-code-vs
* ^copyright = "本バリューセットには第三者の著作権により保護された内容が含まれる可能性があります。利用前に適切なライセンスを確認してください。"
* include codes from system $JP_MedicationCode_MEDIS
  // MEDIS標準マスタ等の外部コードシステムを使用する場合は著作権情報を明記
```

#### コードシステムのOID管理
```fsh
// NamingSystemでOIDとURLの対応を明記
Instance: jp-medicationcode-namingsystem
InstanceOf: NamingSystem
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.403.1"
* uniqueId[+].type = #uri
* uniqueId[=].preferred = true
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.403.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = "http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationCodeHOT9_CS"
```

## 3. Markdownドキュメント記載ルール

### 3.1 文体統一
- **常体（である調）を使用**: 「〜である」「〜する」
- **句読点**: 「、」「。」を使用
- **カタカナ語**: 語尾の長音は省略（サーバ、コンピュータ、ユーザ）
- **口語体**: 平明で理解しやすい表現を使用

### 3.2 プロファイル説明文書の構造

#### intro.mdファイル
```markdown
# プロファイル名

<!-- 概要 -->
本プロファイルは、[対象領域]における[用途]のために、FHIR [リソース名] リソースを使用する際の制約を定義したものである。

## 背景および想定シナリオ
本プロファイルは以下のユースケースを想定している：
- [ユースケース1]
- [ユースケース2]

## スコープ
### 対象
- [対象となる項目]

### 対象外
- [対象外の項目]
```

#### notes.mdファイル
```markdown
### 必須要素
次の要素は必須またはMust Supportである：
- element1: [説明]
- element2: [説明]

### Extensions定義
本プロファイルで定義された拡張：

| 拡張名 | 説明 | URL | 値の型 |
|--------|------|-----|--------|
| extension1 | 説明 | URL | 型 |

### 注意事項
#### 実装時の注意点
- [重要な実装上の注意]

#### 相互運用性
- [他システムとの連携時の注意点]
```

### 3.3 JP Core固有の記載事項

#### FHIR BASEとの差異の明記
```fsh
* identifier ^comment = "患者を一意に識別するための識別子。【JP Core仕様】日本の医療制度に対応するため、保険者番号や被保険者番号等の識別子を含む。"
```

#### 詳細説明への誘導
```fsh
* ^short = "都道府県番号、点数表コード、医療機関コードを組み合わせた施設識別コード。【詳細参照】"
```

#### HTMLタグの適切な使用
```markdown
<!-- Good: XHTML形式 -->
<br/>
<p/>

<!-- Bad: 非XHTML形式 -->
<br>
<p>

<!-- Markdownリンク推奨 -->
[リンクテキスト](URL)
```

## 4. エラーハンドリングとバリデーション

### 4.1 インバリアント（制約）の定義
```fsh
Invariant: jp-patient-name-rule
Description: "患者の氏名は family または given のいずれかが必須"
Severity: #error
Expression: "family.exists() or given.exists()"

// プロファイルでの適用
* name obeys jp-patient-name-rule
```

### 4.2 制約の論理的順序
```fsh
// Good: 型制約を先に定義
* value[x] only Quantity
* value[x].unit = "mg"

// Bad: 型が不明な状態での制約
* value[x].unit = "mg"  // value[x]の型が不明
* value[x] only Quantity
```

## 5. パフォーマンスと保守性

### 5.1 RuleSetによる共通化
```fsh
RuleSet: CommonExtensionContext(resource)
* ^context[+].type = #element
* ^context[=].expression = "{resource}"

// 使用例
Extension: JP_Patient_Religion
* insert CommonExtensionContext(Patient)
* insert CommonExtensionContext(RelatedPerson)
```

### 5.2 適切なスライシング
```fsh
// 明確な判別子を使用
* identifier ^slicing.discriminator[0].type = #pattern
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open

* identifier contains
    medicalRecord 0..1 MS and
    insuranceNumber 0..* MS
```

## 6. 国際化・多言語対応

### 6.1 翻訳ルール
- **HL7 FHIR R4.0.1から変更のない翻訳は原則不要**
- 日本固有の概念や要素のみ日本語での説明を追加
- 既存の国際的な用語は原則として英語のまま保持

### 6.2 用語の統一
```fsh
// 正式表記を統一
* ^publisher = "一般社団法人 日本医療情報学会"  // 正式名称
* ^description = "JP Core Patient プロファイル"  // 表記統一
```

## 7. セキュリティとプライバシー

### 7.1 個人情報の取り扱い
```fsh
// 機密性の高い要素への注意喚起
* extension[religion] ^comment = "宗教情報は要配慮個人情報に該当する。取り扱いには十分注意すること。"
```

### 7.2 セキュリティラベル
```fsh
// セキュリティ要件がある場合
* meta.security from JP_SecurityLabel_VS (extensible)
```

## 8. テストとバリデーション

### 8.1 例示データの作成
```fsh
Instance: JP_Patient_Example_1
InstanceOf: JP_Patient
Title: "患者例1（一般的なケース）"
Description: "一般的な外来患者の例"
Usage: #example
* identifier[medicalRecord].value = "12345"
* identifier[medicalRecord].system = "http://www.example.com/patient"
* name.family = "田中"
* name.given = "太郎"
* gender = #male
* birthDate = "1980-01-01"
```

### 8.2 バリデーション確認項目
生成したFSHコードは以下を確認すること：
1. SUSHI実行時エラーがないこと
2. IG Publisher実行時エラーがないこと  
3. 生成されたJSONが有効なFHIRリソースであること
4. 定義したInvariantが正しく動作すること

## 9. 生成AI特有の注意事項

### 9.1 コード生成時の確認事項
- 既存のプロファイルとの整合性を確認
- 命名規則の完全遵守
- 不必要な複雑化を避ける
- ドキュメント生成の自動化対応

### 9.2 継続的改善
- 新しいFHIRバージョンへの対応準備
- JP Coreプロファイルの進化への対応
- 実装者からのフィードバック反映

## 10. ツール使用時の推奨事項

### 10.1 開発環境
- Visual Studio Code + FSH拡張機能の使用推奨
- 定期的なSUSHI/IG Publisherバージョン更新
- Git管理による変更履歴の保持

### 10.2 品質管理
```bash
# 定期的な品質チェック
sushi .                          # FSH→JSON変換
ruby script/markdownlink_creator.rb  # リンク更新
ruby script/specialurls_creator.rb   # URL更新
```

---

**重要**: 本ルールは日本の医療情報システムにおけるFHIR実装を前提としています。他国の実装や国際的な用途では適切な調整が必要です。

**バージョン**: 1.0  
**最終更新**: 2025年8月  
**適用対象**: JP Core v1.x, FHIR R4.0.1
