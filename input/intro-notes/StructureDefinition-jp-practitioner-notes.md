
### 必須要素


次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

JP Practitioner リソースには、必須要素はありません。

  
### Extensions定義

JP Practitioner リソースで使用される拡張は次の通りである。

#### 既存のExtensionの利用

- [NameRepresentationUse]("http://hl7.org/fhir/R4/extension-iso21090-en-representation.html")

  - 医療従事者氏名(Practitioner.name)の漢字表記・カナ表記識別のために使用する。

### 用語定義



| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Practitioner.gender.code | 医療従事者の性別 | required          | [AdministrativeGender](http://hl7.org/fhir/valueset-administrative-gender.html) |
| Practitioner.communication | 医療従事者の使用できる言語 | Preferred, but limited to ALLLanguage          | [CommonLanguages](http://hl7.org/fhir/valueset-languages.html) |



### 制約一覧


制約はありません。


### その他

 Practitioner.qualificationには、以下の医療従事者のqualification(資格)を格納できるようスライシングによる定義が追加されている。

| スライシング定義名 | 目的 | 指定方法 |
| ---------------- | ---------------- | ---------------- |   
| DrugUserQualification | 麻薬施用者免許番号を表現する | qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.32.[都道府県番号]" を指定し、麻薬取扱免許番号を同valueに格納する。<br> [都道府県番号](https://www.mhlw.go.jp/topics/2007/07/dl/tp0727-1d.pdf)  |
| MedicalRegistrationNumber | 医籍登録者番号を表現する | qualification.identifier.system = "urn:oid:1.2.392.100495.20.3.31" を指定し、医籍登録者番号を同valueに格納する。 |



## 利用方法

### インタラクション一覧


| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |



### OperationおよびSearch Parameter 一覧


#### Search Parameter一覧


| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/Practitioner?identifier=http://myhospital.com/fhir/drid\|789 |
| SHALL            | name          | string | GET [base]/Practitioner?name=山田                            |


##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、医療従事者番号などの識別子によるPractitionerの検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/Practitioner?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Practitioner?identifier=http://myhospital.com/fhir/drid|123456
   ```

   指定された識別子(identifier)に一致するPractitionerリソースを含むBundleを検索する。

   

2. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/Practitioner?name=[string]
   ```

   例：

   ```
   GET [base]/Practitioner?name=山田
   ```

   名前（姓:family、名:given、またはテキスト:text）が一致するPractitionerリソースを含むBundleを検索する。

   

##### 推奨検索パラメータ

推奨検索パラメータ(SHOULD)はありません。


##### オプション検索パラメータ 

オプション検索パラメータ(MAY)はありません。

#### Operation一覧

Operationはありません。

### サンプル

```JSON
{
  "resourceType": "Practitioner",
  "id": "example",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>神奈川　花子</li><li>カナガワ　ハナコ</li><li>麻薬施用者免許番号：4-321</li></ul></div>"
  },
  "name": [
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
          "valueCode": "IDE"
        }
      ],
      "text": "神奈川花子",
      "family": "神奈川",
      "given": [
        "花子"
      ]
    },
    {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
          "valueCode": "SYL"
        }
      ],
      "text": "カナガワハナコ",
      "family": "カナガワ",
      "given": [
        "ハナコ"
      ]
    }
  ],
  "qualification": [
    {
      "identifier": [
        {
          "system": "urn:oid:1.2.392.100495.20.3.32.13",
          "value": "4-321"
        }
      ],
      "code": {
        "Coding": [
          {
            "system": "http://hl7.jp/fhir/ePrescription/certificate",
            "code": "NarcoticsPractitioner"
          }
        ]
      }
    }
  ]
}
```



## 注意事項

注意事項はありません。

## その他、参考文献・リンク等

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

