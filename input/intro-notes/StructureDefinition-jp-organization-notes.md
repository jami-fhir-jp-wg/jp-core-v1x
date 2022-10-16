
### 必須要素

 本プロファイルで定義された必須項目はない。

### Extensions定義

 本プロファイルで使用される拡張は次の通りである。

- [JP_OrganizationCategory][JP_Organization_InsuranceOrganizationCategory]

  - 点数表コード１桁の情報を表す

- [JP_OrganizationNo][JP_Organization_InsuranceOrganizationNo]

  - 保険医療機関番号７桁を表す

- [JP_PrefectureNo][JP_Organization_PrefectureNo]

  - 都道府県番号2桁を表す

### その他

 Organization.identifierには、以下のOrganization(組織)に関連したidentifier(ID情報)を格納できるようスライシングによる定義が追加されている。

| スライシング定義名 | 目的 | 指定方法 |
| ---------------- | ---------------- | ---------------- |   
| medicalInstitutionCode | 医療機関コードを格納する | identifier.system = "http://jpfhir.jp/fhir/core/CodeSystem/insurance-medical-institution-no" を指定し、医療機関コード(10桁)を同valueに格納する。*医療機関コード(7桁)は異なるURIとなるので注意すること。  |
| insurerNumber | 健康保険組合などの保険者の保険者番号を表現する | identifier.system = "urn:oid:1.2.392.100495.20.3.61" を指定し、保険者番号を同valueに格納する。 |

## 医療機関コード（１０桁）

JP Coreでの医療機関コード（１０桁）のエリアに格納する値を説明する。  
保険医療施設以外の利用等も考慮しているため、正式な医療機関コード（１０桁）の説明でないことに注意すること。

### 保険医療機関・保険薬局の場合
医療機関コードは10桁の数値で表現され、以下の記載様式を取る。
```
 都道府県コード（２桁） + 点数表番号（１桁） + 医療機関コード（７桁）
```

- 都道府県コード（ISO 3166-2:JP）：２桁  
全国地方公共団体コードにより都道府県ごとに割り当てられた番号、左詰ゼロを含む２桁で記載される。

- 点数表番号：１桁  
  医科は「1」、歯科は「3」、調剤「4」、訪問看護ステーション「6」が割り当たる。  
  同一の病院または診療所に医科と歯科が併存する場合など１施設にあたり２つ以上のコードが割り振られるケースが存在する。施設の主要な役割に応じて単一の点数表番号を割り当てることが望ましい(**SHOULD**)。派生する実装ガイドの利用用途（例えば診療報酬点数に関係するデータ収集など）によっては１施設に複数コードを扱わないといけないケースも存在する。１施設に対し複数の医療機関コードを扱う場合にはシステム上の考慮が多くなる点について注意が必要である。ストレージ上は１医療機関コードとしデータ出力時にコードを変換するなど、ＦＨＩＲサーバが複雑にならないような検討を行なうこと。
- 医療機関コード（７桁）：７桁  
  コードの内部構成は、```都市区番号（２桁）＋医療機関等番号（４桁）＋検証番号（１桁）``` となっている。

  医療機関番号等は、「医科」、「歯科」は医療機関番号、「調剤薬局」は保険薬局コード、「訪問看護ステーション」はステーションコードが該当する。

### 保険医療機関を除く特定健診・特定保健指導機関の場合
健診等機関コード（１０桁）を利用する。
```
都道府県コード(２桁) + 区分コード(１桁) + 機関コード（７桁）
```

- 都道府県コード（ISO 3166-2:JP）：２桁  
保険医療機関の説明に同じ。
- 区分コード：１桁  
保険医療機関に該当しない特定健診・特定保健指導機関は「2」固定となる。ちなみに保険医療機関の場合は「1」であるが、該当しないため利用しない。
- 機関コード（７桁）：７桁  
特定健診・特定保健指導機関コードを割り当てる。

### 上記に該当しない施設の場合

「[9]＋当該施設の電話番号下９桁」を医療機関コードとして代用する。

## 利用方法

### OperationおよびSearch Parameter 一覧

### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/Organization?identifier=12345|
| SHOULD           | name          | string | GET [base]/Organization?name=Health                            |
| SHOULD           | address | string  | GET [base]/Organization?address=Arbor

#### 必須検索パラメータ

1. identifier 検索パラメータを使用して、識別子によるOrganizationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Organization?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Organization?identifier=http://hl7.org/fhir/sid/jpsys|123456
   ```

   指定された識別子に一致するOrganizationリソースを含むBundleを検索する。
   
### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. name 検索パラメータを使用して、言語コードによるOrganizationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Organization?name={string}
   ```

   例：

   ```
   GET [base]/Organization?name=Health
   ```

2. address 検索パラメータを使用して、addressによるOrganizationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Organization?address=[string]
   ```

   例：

   ```
   GET [base]/Organization?address=Arbor
   ```

### オプション検索パラメータ

 本プロファイルで追加定義されたオプション検索パラメータはない。

### サンプル  

* [**太郎花子クリニック**][jp-organization-example-clinic]
* [**健康第一病院**][jp-organization-example-hospital]
* [**ひまわり健康保険組合**][jp-organization-example-payer]

## 注意事項
連絡先情報は2箇所に記載がある。1つはOrganization自体にあり、一般的な公的組織の連絡先として使用される。もう1つはContactEntity構造を使用した場所であり、特定の目的のために連絡を受けるように組織が指定した人物や関係者に連絡を取るために使用される。

## その他、参考文献、リンク等

1. 退院時サマリー規約 [http://www.hl7.jp/library/item/HL7J-CDA-007.pdf](http://www.hl7.jp/library/item/HL7J-CDA-007.pdf)
1. 診療情報提供書規格 [http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf](http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf)
1. 特定健診情報ファイル仕様 [https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html)
1. SS-MIX2 標準化ストレージ 仕様書 Ver.1.2h [https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf](https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf)
1. ICSR E2B(R3) [https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html](https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html)

{% include markdown-link-references.md %}