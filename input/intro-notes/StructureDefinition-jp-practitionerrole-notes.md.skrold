
### 必須要素

 本プロファイルで定義された必須項目はない。

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/PractitionerRole?identifier=http://myhospital.com/fhir/PractitionerRoleid\|1234 |
| SHOULD            | specialty    | token  | GET [base]/PractitionerRole?specialty=http://nucc.org/provider-taxonomy\|208D0000X |
| SHOULD            | practitioner    | token  | GET [base]/PractitionerRole?practitioner.identifier=http://myhospital.com/fhir/Practitionerid\|97860456 |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、職種IDなどの識別子によるPractitionerRoleの検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/PractitionerRole?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/PractitionerRole?identifier=http://myhospital.com/fhir/PractitionerRoleid|1234
   ```

   指定された識別子に一致するPractitionerRoleリソースを含むBundleを検索する。

 

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. specialty 検索パラメータを使用して、医療者の特定の専門性によるPractitionerRoleの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/PractitionerRole?specialty={system|}[code]
   ```

   例：

   ```
   GET [base]/PractitionerRole?specialty=http://nucc.org/provider-taxonomy|208D0000X
   ```

   指定された医療者の特定の専門性に一致するPractitionerRoleリソースを含むBundleを検索する。

   

2. practitioner 検索パラメータを使用して、医療者の名前と識別子によるPractitionerRoleの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/PractitionerRole?practitioner={Type/}[id]
   ```

   例：

   ```
   1.GET [base]/PractitionerRole?practitioner.identifier=http://myhospital.com/fhir/Practitionerid|97860456&_include=PractitionerRole:practitioner&_include=PractitionerRole?endpoint
   2.GET [base]/PractitionerRole?practitioner.name=山田&_include=PractitionerRole:practitioner&_include=PractitionerRole?endpoint
   ```

   practitioner.nameまたはpractitioner.identifierの連結パラメータに一致するPractitionerRoleリソースを含むBundleを検索する。PractitionerRole.practitionerとPractitionerRole.endpointの_include検索をサポートすることが望ましい。（**SHOULD**）


##### 追加検索パラメータ 

追加検索パラメータは定義しない。

### サンプル

* [**精神科外来サービス担当**][jp-practitionerrole-example-1]

## 注意事項

PractitionerRoleには、ここで定義されているlocationに住所が含まれているため、addressは存在しない。
これにより、複数のリソースにaddressの値を重複させる必要がなくなる。

## その他、参考文献・リンク等

1. 退院時サマリー規約 [http://www.hl7.jp/library/item/HL7J-CDA-007.pdf](http://www.hl7.jp/library/item/HL7J-CDA-007.pdf)
1. 診療情報提供書規格 [http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf](http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf)
1. 特定健診情報ファイル仕様 [https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html)
1. SS-MIX2 標準化ストレージ 仕様書 Ver.1.2h [https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf](https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf)
1. ICSR E2B(R3) [https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html](https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html)

{% include markdown-link-references.md %}
