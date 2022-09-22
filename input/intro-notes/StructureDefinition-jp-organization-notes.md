
### 必須要素

JP Core Organization リソースで定義された必須要素はない。

### Extensions定義

JP Core Organization リソースで使用される拡張は次の通りである。

- [JP_OrganizationCategory][JP_Organization_InsuranceOrganizationCategory]

  - 点数表コード１桁（医科１、歯科２）の情報を表す。

- [JP_OrganizationNo][JP_Organization_InsuranceOrganizationNo]

  - 保険医療機関番号７桁を表す。

- [JP_PrefectureNo][JP_Organization_PrefectureNo]

  - 都道府県番号2桁を表す。

### その他

 Organization.identifierには、以下のOrganization(組織)に関連したidentifier(ID情報)を格納できるようスライシングによる定義が追加されている。

| スライシング定義名 | 目的 | 指定方法 |
| ---------------- | ---------------- | ---------------- |   
| MedicalInstitutionCode | 医療機関コードを格納する | identifier.system = "http://jpfhir.jp/fhir/Common/CodeSystem/insurance-medical-institution-no" を指定し、医療機関コード(10桁)を同valueに格納する。*7桁医療機関コードは異なるURIとなるので注意すること。  |
| InsurerNumber | 健康保険組合などの保険者の保険者番号を表現する | identifier.system = "urn:oid:1.2.392.100495.20.3.61" を指定し、保険者番号を同valueに格納する。 |

### 医療機関コード

医療機関コードは10桁の数値で表現され、以下の記載様式を取る。

- 最初の2桁 全国地方公共団体コードの都道府県コード（ISO 3166-2:JP）
  - 都道府県ごとの番号。
- 3桁目 点数表番号
  - 医科は「1」。歯科は「3」。
    - したがって、同一の病院または診療所に医科と歯科が併存する場合にはそれぞれ別のコードが与えられる。そのため、レセプトコンピュータでは一医療機関に対して医科と歯科の両方のコードを設定できるようになっている。ちなみに処方箋は発行されないが、「4」は調剤、「5」は老人保健施設、「6」は訪問看護ステーションである。
  - 下7桁 医療機関コード
    - 地区（2桁）+番号（4桁）+チェックディジット（1桁）で構成される。
- 7桁の医療機関コードについて
  - 各地域を所管する厚生労働省の地方支分部局である地方厚生局のホームページ等で確認できる
  - 医療機関コードを持たない場合、「[9]＋当該施設の電話番号下 9 桁」を医療機関コードとして、その先頭に１をつけた11桁とする。


## 利用方法

### OperationおよびSearch Parameter 一覧

### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD           | identifier    | token  | GET [base]/Organization?identifier=12345|
| SHOULD           | name          | string | GET [base]/Organization?name=Health                            |
| SHOULD           | address | string  | GET [base]/Organization?address=Arbor

#### 必須検索パラメータ
必須検索パラメータ（**SHALL**）は特にない。

### 推奨検索パラメータ


次の検索パラメータをサポートすることが望ましい。

1. identifier 検索パラメータを使用して、識別子によるOrganizationの検索をサポートすることが望ましい（**SHOULD**）。

   ```
   GET [base]/Organization?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Organization?identifier=http://hl7.org/fhir/sid/jpsys|123456
   ```

   指定された識別子に一致するOrganizationリソースを含むBundleを検索する。
   
2. name 検索パラメータを使用して、言語コードによるOrganizationの検索をサポートすることが望ましい（**SHOULD**）。

   ```
   GET [base]/Organization?name={string}
   ```

   例：

   ```
   GET [base]/Organization?name=Health
   ```

3. address 検索パラメータを使用して、addressによるOrganizationの検索をサポートすることが望ましい（**SHOULD**）。

   ```
   GET [base]/Organization?address=[string]
   ```

   例：

   ```
   GET [base]/Organization?address=Arbor
   ```

### オプション検索パラメータ
オプション検索パラメータ（MAY）は特にない。   

### Operation一覧
Operationは特にない。

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