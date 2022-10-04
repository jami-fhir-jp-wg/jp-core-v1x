
### 必須要素

 本プロファイルで定義された必須項目はない。

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | name | string | GET [base]/Location?name=３南 |
| SHALL            | identifier | token | GET [base]/Location?identifier=http://myhospital.com/fhir/Locationid\|1234 |
| SHOULD           | address | string | GET [base]/Location?address=東京都文京区本郷７丁目３−１ |
| SHOULD           | address-city | string | GET [base]/Location?address-city=文京区 |
| SHOULD           | address-state | string | GET [base]/Location?address-state=東京都 |
| SHOULD           | address-postalcode | string | GET [base]/Location?address-postalcode=1130033 |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/Location?name=[string]
   ```

   例：

   ```
   GET [base]/Location?name=３南
   ```

   名前が一致するLocationリソースを含むBundleを取得する。

2. identifier 検索パラメータを使用して、ロケーションIDなどの識別子によるLocationの検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/Location?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Location?identifier=http://myhospital.com/fhir/Locationid|1234
   ```

   指定された識別子に一致するLocationリソースを含むBundleを取得する。


1. address 検索パラメータを使用して、住所テキストによる文字列検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/Location?address=[string]
   ```

   例：

   ```
   GET [base]/Location?address=東京都文京区本郷７丁目３−１
   ```

   住所文字列が一致するLocationリソースを含むBundleを取得する。

2. address-city 検索パラメータを使用して、住所の市町村名によるLocationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Location?address-city=[string]
   ```

   例：

   ```
   GET [base]/Location?address-city=文京区
   ```

   指定された住所の市町村名が一致するLocationリソースを含むBundleを取得する。


3. address-state 検索パラメータを使用して、住所の都道府県名によるLocationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Location?address-state=[string]
   ```

   例：

   ```
   GET [base]/Location?address-state=東京都
   ```

   指定された住所の都道府県名が一致するLocationリソースを含むBundleを取得する。

4. address-postalcode 検索パラメータを使用して、住所の郵便番号によるLocationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Location?address-postalcode=[string]
   ```

   例：

   ```
   GET [base]/Location?address-postalcode=1130033
   ```

   指定された住所の郵便番号が一致するLocationリソースを含むBundleを取得する。

##### 追加検索パラメータ 

追加検索パラメータは定義しない。

### サンプル
* [**診察室**][jp-location-example-examinationroom]
* [**手術室**][jp-location-example-ope]
* [**病棟**][jp-location-example-ward]

## その他、参考文献・リンク等

1. 退院時サマリー規約 [http://www.hl7.jp/library/item/HL7J-CDA-007.pdf](http://www.hl7.jp/library/item/HL7J-CDA-007.pdf)
1. 診療情報提供書規格 [http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf](http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf)
1. 特定健診情報ファイル仕様 [https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html)
1. SS-MIX2 標準化ストレージ 仕様書 Ver.1.2h [https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf](https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf)
1. ICSR E2B(R3) [https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html](https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html)

{% include markdown-link-references.md %}

