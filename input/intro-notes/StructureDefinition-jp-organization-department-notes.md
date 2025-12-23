
### 必須要素

本プロファイルでは、以下の要素を必須としている。

- Organization.type: 診療科・部門であることを示すため、`dept`コードの設定が必須

### 診療科識別子（identifier）

診療科の識別子は以下の2つのパターンで指定できる。両方を併用することを推奨する。

#### 1. 医療機関固有の診療科コード（ローカルコード）

医療機関が独自に定義した診療科コードを使用する場合：

- system: `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/{医療機関識別OID番号}`
- 医療機関識別OID番号は、医療機関コード（10桁）の先頭に1をつけた11桁とする
- 例：医療機関コード「1312345670」の場合、systemは `http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/11312345670`

#### 2. SS-MIX2標準診療科コード

SS-MIX2で定義された標準診療科コードを使用する場合：

- system: `http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment`
- SS-MIX2標準診療科コードの値を設定する（例：01=内科、03=循環器内科、07=整形外科など）

### 診療科コード（type）

Organization.typeには以下の2種類のコードを設定する：

1. **必須**: `http://terminology.hl7.org/CodeSystem/organization-type#dept`
   - この組織が部門・診療科であることを示す固定値

2. **推奨**: SS-MIX2診療科コード（`http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment`）
   - 診療科の種類を示すコード（例：01=内科、16=整形外科）
   - 2桁または3桁のコードを使用

診療科名称は医療機関ごとに異なることが多いため、以下の表現方法を組み合わせて使用することを推奨する：

- Organization.name: 医療機関固有の診療科名称（例：「第一内科」「消化器腫瘍外科」）
- Organization.type: SS-MIX2診療科コード等の標準コード
- Organization.type.text: 診療科名称のテキスト表現

### 所属医療機関の参照

診療科は通常、医療機関に所属するため、Organization.partOf要素で親組織（医療機関）を参照することを推奨する。

以下は、ローカルコードとSS-MIX2コードの両方を使用した診療科の例である：

```json
{
  "resourceType": "Organization",
  "identifier": [
    {
      "system": "http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationRequestDepartment/11312345670",
      "value": "CARD-001"
    },
    {
      "system": "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment",
      "value": "03"
    }
  ],
  "type": [
    {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/organization-type",
          "code": "dept"
        },
        {
          "system": "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment",
          "code": "03",
          "display": "循環器内科"
        }
      ]
    }
  ],
  "name": "循環器内科",
  "partOf": {
    "reference": "Organization/hospital-001",
    "display": "健康第一病院"
  }
}
```

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/Organization?identifier=12345|
| SHOULD           | name          | string | GET [base]/Organization?name=内科                            |
| SHOULD           | type          | token  | GET [base]/Organization?type=dept |
| SHOULD           | partof        | reference | GET [base]/Organization?partof=Organization/hospital-001 |

##### 診療科固有の検索例

1. 診療科タイプでの検索

   ```
   GET [base]/Organization?type=http://terminology.hl7.org/CodeSystem/organization-type|dept
   ```

2. SS-MIX2診療科コードでの検索

   ```
   GET [base]/Organization?type=http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment|01
   ```

3. 所属医療機関での検索

   ```
   GET [base]/Organization?partof=Organization/hospital-001
   ```

4. 診療科識別子での検索

   ```
   GET [base]/Organization?identifier=http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment|03
   ```

### サンプル

* [**循環器内科（両方のコード使用）**][jp-organization-department-example-01]
* [**内科診療科（ローカルコード使用）**][jp-organization-department-example-02]
* [**整形外科診療科（SS-MIX2コード使用）**][jp-organization-department-example-03]

## 注意事項

- 診療科名称は医療法施行規則に規定されている「標榜診療科」を超えて、医療機関ごとに独自の名称を持つことが多い
- 同じ医師が外来と入院で異なる診療科に所属するケースなど、所属マトリックスが複雑になる場合がある
- 診療科情報を使用する際は、用途（診療報酬請求、患者管理、統計等）に応じて適切な表現方法を選択すること
- 相互運用性を高めるため、ローカルコードとSS-MIX2標準コードの両方を設定することを推奨する

## その他、参考文献、リンク等

1. 厚生労働省医政局、広告可能な標榜診療科名の改訂について、医政発 第0331042号、2008年、[https://www.mhlw.go.jp/topics/bukyoku/isei/kokokukisei/dl/koukokukanou.pdf](https://www.mhlw.go.jp/topics/bukyoku/isei/kokokukisei/dl/koukokukanou.pdf)
1. 診療科区分、[https://www.mhlw.go.jp/topics/2009/05/dl/tp0521-1a_0053.pdf](https://www.mhlw.go.jp/topics/2009/05/dl/tp0521-1a_0053.pdf)
1. SS-MIX2 標準化ストレージ 仕様書 Ver.1.2h [https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf](https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf)

{% include markdown-link-references.md %}
