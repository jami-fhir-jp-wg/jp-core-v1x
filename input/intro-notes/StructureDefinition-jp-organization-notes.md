
### 必須要素

次のデータ項目は必須（データが存在しなければならない）これらは、人間が読めるように簡単に説明しています。プロファイル固有の指針と例も提供されている。以下の正式なプロファイル定義では，正式な概要，定義，および用語の要件が示されている。

Organization リソースは、次の要素を持たなければならない。

- identifier ： 
- status of the organization : 
- name ： 
- list of contact information ：
- Endpoint information : 

### Extensions定義

JP Oraganization リソースで使用される拡張は次の通りである。

- [JP_OrganizationCategory](https://simplifier.net/jp-core-draftv1/jporganizationcategory)

  - 点数表コード１桁（医科１、歯科２）の情報を表す。

- [JP_OrganizationNo](https://simplifier.net/jp-core-draftv1/jporganizationno)

  - 保険医療機関番号７桁を表す。

- [JP_PrefectureNo](https://simplifier.net/jp-core-draftv1/jpprefectureno)

  - 都道府県番号2桁を表す。



### 用語定義


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Organization.type | 組織の分類 | Example | [OrgazationalType](https://www.hl7.org/fhir/valueset-organization-type.html) |
| Organization.contact.purpose | 連絡する目的 | Extensible　| [ContactEntityType](https://www.hl7.org/fhir/valueset-contactentity-type.html) |



### 制約一覧

| id       | レベル | 位置              | 説明                                                         | 式                                                           |
| -------- | ------ | -----------------| ------------------------------------------------------------ | ------------------------------------------------------------ |
| jp-org-1 | Rule   | (base) | 組織は、少なくとも一つ場合によっては複数の名前または識別子を持たなければならない | (identifier.count() + name.count()) > 0|
|  jp-org-2 |  Rule |Organization.address | 組織の住所に「ホーム」を使用することはできない | where(use = 'home').empty() |
| jp-org-3 | Rule| Organization.telecom | 組織のtelecomに「ホーム」を使用することはできない | where(use = 'home').empty()

### その他

 Organization.identifierには、以下のOraganization(組織)に関連したidentifier(ID情報)を格納できるようスライシングによる定義が追加されている。

| スライシング定義名 | 目的 | 指定方法 |
| ---------------- | ---------------- | ---------------- |   
| MedicalInstitutionCode | 医療機関コードを格納する | identifier.system = "http://jpfhir.jp/fhir/Common/CodeSystem/insurance-medical-institution-no" を指定し、医療機関コード(10桁)を同valueに格納する。*7桁医療機関コードは異なるURIとなるので注意すること。  |
| InsurerNumber | 健康保険組合などの保険者の保険者番号を表現する | identifier.system = "urn:oid:1.2.392.100495.20.3.61" を指定し、保険者番号を同valueに格納する。 |


## 利用方法

### インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |


### OperationおよびSearch Parameter 一覧



### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD            | identifier    | token  | GET [base]/Organization?identifier=12345|
| SHOULD            | name          | string | GET [base]/Organization?name=Health                            |
| SHOULD           | address | string  | GET [base]/Organization?address=Arbor

#### 必須検索パラメータ
必須検索パラメータ（SHALL）は特にない。

### 推奨検索パラメータ


次の検索パラメータをサポートすることが望ましい。

1. identifier 検索パラメータを使用して、識別子によるOrganizationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Organization?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Organization?identifier=http://hl7.org/fhir/sid/us-npi|123456
   ```

   指定された識別子に一致するOrganizationリソースを含むBundleを検索する。
   
2. name 検索パラメータを使用して、言語コードによるOrganizationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Organization?name={string}
   ```

   例：

   ```
   GET [base]/Organization?name=Health
   ```

3. address 検索パラメータを使用して、addressによるOrganizationの検索をサポートすることが望ましい（SHOULD）。

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

```json
    { 
      "resourceType" : "Organization",
      "identifier":  [
         {
            "system": "urn:oid:1.2.392.100495.20.3.21",
            "value": "13"
         },
         {
            "system": "urn:oid:1.2.392.100495.20.3.22",
            "value": "1"
         },
         {
            "system": "urn:oid:1.2.392.100495.20.3.23",
            "value": "9999999"
         }
       ],
      "name": "太郎花子クリニック",
      "address":  [
         {
            "line":  [
                    "東京都文京区向丘３−２−１"
                ],
                "city": "文京区",
                "state": "東京都",
                "country": "JPN"
         }
        ]
    }
```

## 注意事項
連絡先情報は2箇所に記載がある。1つはOrganization自体にあり、一般的な公的組織の連絡先として使用される。もう1つはContactEntity構造を使用した場所であり、特定の目的のために連絡を受けるように組織が指定した人物や関係者に連絡を取るために使用される。
## その他、参考文献、リンク等

・退院時サマリー規約
http://www.hl7.jp/library/item/HL7J-CDA-007.pdf

・診療情報提供書規格
http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf

・特定健診情報ファイル仕様
https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html

・SS-MIX2 標準化ストレージ 仕様書 Ver.1.2f
http://www.jami.jp/jamistd/docs/SS-MIX2/f/SS-MIX2_StndrdStrgSpecVer.1.2f.pdf

・ICSR E2B(R3)
https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html
