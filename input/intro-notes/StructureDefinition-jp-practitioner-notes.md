
### 必須要素

 本プロファイルで定義された必須項目はない。

### Extensions定義

 本プロファイルで使用される拡張は次の通りである。

#### 既存のExtensionの利用

- [nameRepresentationUse](https://hl7.org/fhir/R4/extension-iso21090-en-representation.html)
  - 医療従事者氏名(Practitioner.name)の漢字表記・カナ表記識別のために使用する

### その他

 Practitioner.qualificationには、以下の医療従事者のqualification(資格)を格納できるようスライシングによる定義が追加されている。

| スライシング定義名 | 目的 | 指定方法 |
| ---------------- | ---------------- | ---------------- |   
| narcoticPrescriptionLicenseNumber | 麻薬施用者免許番号を表現する | qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.32.1[都道府県番号]" を指定し、麻薬取扱免許番号を同valueに格納する。<br/> [都道府県番号](https://www.mhlw.go.jp/topics/2007/07/dl/tp0727-1d.pdf)  |
| MedicalRegistrationNumber | 医籍登録者番号を表現する | qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.31" を指定し、医籍登録者番号を同valueに格納する。 |

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/Practitioner?identifier=urn:oid:1.2.392.100495.20.3.41.11312345670\|789 |
| SHALL            | name          | string | GET [base]/Practitioner?name=山田                            |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、医療従事者番号などの識別子によるPractitionerの検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/Practitioner?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Practitioner?identifier=urn:oid:1.2.392.100495.20.3.41.11312345670|123456
   ```

   指定された識別子(identifier)に一致するPractitionerリソースを含むBundleを検索する。

   

2. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/Practitioner?name=[string]
   ```

   例：

   ```
   GET [base]/Practitioner?name=山田
   ```

   名前（姓:family、名:given、またはテキスト:text）が一致するPractitionerリソースを含むBundleを検索する。

##### 推奨検索パラメータ

推奨検索パラメータ(**SHOULD**)は定義しない。

### サンプル

* [**女性医師 麻薬施用者番号あり**][jp-practitioner-example-female-1]
* [**女性看護師**][jp-practitioner-example-female-2]
* [**男性医師**][jp-practitioner-example-male-1]
* [**男性看護師**][jp-practitioner-example-male-2]

## その他、参考文献・リンク等

1. 退院時サマリー規約 [http://www.hl7.jp/library/item/HL7J-CDA-007.pdf](http://www.hl7.jp/library/item/HL7J-CDA-007.pdf)
1. 診療情報提供書規格 [http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf](http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf)
1. 特定健診情報ファイル仕様 [https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html)
1. SS-MIX2 標準化ストレージ 仕様書 Ver.1.2h [https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf](https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf)
1. ICSR E2B(R3) [https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html](https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html)

{% include markdown-link-references.md %}