### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。


Patient リソースは、次の要素を持たなければならない。

- identifier ：患者を識別するための識別子は必須要素であり、identifier.value が必ず存在しなければならない。また、identifierの名前空間を表すidentifier.systemも組み合わせて、医療機関固有の患者番号を表現することが一般的である。

### Extensions定義

JP Patient リソースで使用される拡張は次の通りである。

- [religion](http://hl7.org/fhir/StructureDefinition/patient-religion)

  - 患者の宗教を表す。

- [birthPlace](http://hl7.org/fhir/StructureDefinition/patient-birthPlace)

  - 患者の生誕地を表す。Address型を使って表現するため、すべての住所情報あるいは、都道府県名のみの情報(Address.state)だけを格納するということも可能である。

- [JP_Patient_Race](https://simplifier.net/jp-core-draftv1/jppatientrace)

  - 患者の人種に関する情報を表す。

#### 既存のExtensionの利用
- [NameRepresentationUse]("http://hl7.org/fhir/R4/extension-iso21090-en-representation.html")

  - 患者氏名(Patient.name)の漢字表記・カナ表記識別のために使用する。



### 用語定義


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Patient.gender.code<br>Patient.contact.gender.code | 患者の性別 | required          | [AdministrativeGender](http://hl7.org/fhir/valueset-administrative-gender.html) |
| Patient.marialStatus.CodeableConcept | 患者の婚姻関係の状況 | Extensible          | [MarialStatus](http://hl7.org/fhir/valueset-marital-status.html) |
| Patient.contact.relationship.CodeableConcept | 患者の連絡先(contact)との関係性 | Extensible          | [Patient Contact Relationship](http://hl7.org/fhir/valueset-patient-contactrelationship.html) |
| Patient.link.type.code | 別の患者リソースへのリンクに関するタイプ | Required          | [LinkType](http://hl7.org/fhir/valueset-link-type.html) |
| Patient.identifier.use | この識別子の目的を特定する | Required          | [IdentifierUse](http://hl7.org/fhir/valueset-identifier-use.html) |
| Patient.telecom.system | コンタクトポイントの通信方法に関する情報 | Required          | [ContactPointSystem](http://hl7.org/fhir/valueset-contact-point-system.html) |
| Patient.telecom.use | 家やオフィスなどコンタクトポイントのタイプに関する情報 | Required          | [ContactPointUse](http://hl7.org/fhir/valueset-contact-point-use.html) |
| Patient.address.use | 家やオフィスなど住所のタイプに関する情報 | Required          | [AddressUse](http://hl7.org/fhir/valueset-address-use.html) |
| Patient.addresss.type | 住所の種類 | Required          | [AddressType](http://hl7.org/fhir/valueset-address-type.html) |


### 制約一覧

制約はありません。

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
| SHALL            | identifier    | token  | GET [base]/Patient?identifier=http://myhospital.com/fhir/pid\|123456 |
| SHOULD            | name          | string | GET [base]/Patient?name=山田太郎                            |
| SHOULD           | birthdate,name | date,string  | GET [base]/Patient?birthdate=eq2013-01-14&name=山田太郎  |
| SHOULD           | birthdate,gender | date,code  | GET [base]/Patient?birthdate=eq2013-01-14&gender=male  |
| SHOULD           | birthdate,name,gender | date,string,code  | GET [base]/Patient?birthdate=eq2013-01-14&name=山田太郎&gender=male  |
| SHOULD           | name,phone | string,token  | GET [base]/Patient?name=山田太郎&phone=111-222-3333  |
| SHOULD           | name,address-postalcode | string,string  | GET [base]/Patient?name=山田太郎&address-postalcode=1234567  |
| MAY           | family,given,birthdate,gender,phone,address-postalcode | string,string,date,token,token,string  | GET [base]/Patient?family=山田&given=太郎&birthdate=eq2013-01-14&gender=male&phone=111-222-3333&address-postalcode=1234567  |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、患者番号/カルテ番号などの識別子によるPatientの検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/Patient?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Patient?identifier=http://myhospital.com/fhir/pid/us-npi|123456
   ```

   指定された識別子に一致するPatientリソースを含むBundleを検索する。


##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. name 検索パラメータを使用して、Patientの検索をサポートすることが望ましい（SHOULD）。name検索パラメータは、HumanNameの文字列フィールド（family、give、prefix、suffix、および/またはtextを含む）のいずれかに一致するPatientリソースを検索する。

   ```
   GET [base]/Patient?name={string}
   ```

   例：

   ```
   GET [base]/Patient?name=山田太郎
   ```



2. birthdate, name 検索パラメータを使用して、Patientの検索をサポートすることが望ましい（SHOULD）。name検索パラメータは、HumanNameの文字列フィールド（family、give、prefix、suffix、および/またはtextを含む）のいずれかに一致するPatientリソースを検索する。

   ```
   GET [base]/Patient?birthdate={date}&name={string}
   ```

   例：

   ```
   GET [base]/Patient?birthdate=2000-10-10&name=山田太郎
   ```


3. birthdate, gender 検索パラメータを使用して、Patientの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Patient?birthdate={date}&gender={code}
   ```

   例：

   ```
   GET [base]/Patient?birthdate=2000-10-10&gender=male
   ```

4. birthdate, name, gender 検索パラメータを使用して、Patientの検索をサポートすることが望ましい（SHOULD）。name検索パラメータは、HumanNameの文字列フィールド（family、give、prefix、suffix、および/またはtextを含む）のいずれかに一致するPatientリソースを検索する。

   ```
   GET [base]/Patient?birthdate={date}&name={string}&gender={code}
   ```

   例：

   ```
   GET [base]/Patient?birthdate=2000-10-10&name=山田太郎&gender=male
   ```

5. name, phone 検索パラメータを使用して、Patientの検索をサポートすることが望ましい（SHOULD）。name検索パラメータは、HumanNameの文字列フィールド（family、give、prefix、suffix、および/またはtextを含む）のいずれかに一致するPatientリソースを検索する。

   ```
   GET [base]/Patient?name={string}&phone={token}
   ```

   例：

   ```
   GET [base]/Patient?name=山田太郎&phone=0123456789
   ```

6. name, address-postalcode 検索パラメータを使用して、Patientの検索をサポートすることが望ましい（SHOULD）。name検索パラメータは、HumanNameの文字列フィールド（family、give、prefix、suffix、および/またはtextを含む）のいずれかに一致するPatientリソースを検索する。address-postalcodeはPatient.address.postalCode要素に対する検索パラメータであり、日本の住所表記における郵便番号をキーにして検索することを想定している。

   ```
   GET [base]/Patient?name={string}&address-postalcode={string}
   ```

   例：

   ```
   GET [base]/Patient?name=山田太郎&address-postalcode=1234567
   ```



##### オプション検索パラメータ

オプションとして次の検索パラメータをサポートすることができる。

1. 複合条件として、family,given,birthdate,gender,phone,address-postalcodename の各検索パラメータを複数指定したPatientの検索をサポートすることができる（MAY）。

   ```
   GET [base]/Patient??family={string}&given={string}&birthdate={date}&gender={token}&phone={token}&address-postalcode={string}
   ```

   例：

   ```
   GET [base]/Patient??family=山田&given=太郎&birthdate=eq2013-01-14&gender=male&phone=111-222-3333&address-postalcode=1234567
   ```

   family,given,birthdate,gender,phone,address-postalcodename の各検索パラメータに一致するPatientリソースを含むBundleを検索する。


##### 追加検索パラメータ 

JP Patientリソースに追加された検索パラメータはありません。

#### Operation一覧


JP Patient リソースに対して使用される操作は次の通りである。

- $everything：[base]/Patient/$everything , [base]/Patient/[id]/$everything

  - この操作が呼び出された場合、すべての患者の、あるいは指定された特定の[id]をもつPatientに関連した全てのリソースを返す。


##### $everything 操作

この操作は、この操作が呼び出された特定のPatientリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別された医療従事者のPatientコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```
http://hl7.jp/fhir/OperationDefinition/Patient-everything
```

```
URL: [base]/Patient/[id]/$everything
```

本操作は、べき等な操作である。

###### 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |



###### 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |



###### 例

リクエスト：単一のPatientに関連する全てのリソースを取得する。

```
GET [base]/Patient/p001/$everything
[some headers]
```

レスポンス：指定されたPatientに関連する全てのリソースを返す。


HTTP/1.1 200 OK
[other headers]

```json
    {
      "resourceType": "Bundle",
      "id": "example",
      "meta": {
        "lastUpdated": "2014-08-18T01:43:33Z"
      },
      "type": "searchset",
      "entry": [
        {
          "fullUrl": "http://example.org/fhir/Patient/p001",
          "resource": {
            "resourceType": "Patient",
            省略
          }
        }
      ]
    }  
```


### サンプル

```json
{
    "resourceType": "Patient",
    "address": [
      {
        "postalCode": "1600023",
        "text": "東京都新宿区"
      }
    ],
    "birthDate": "1970-01-01",
    "gender": "male",
    "identifier": [
      {
        "value": "1001"
      }
    ],
    "name": [
      {
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
            "valueCode": "IDE"
          }
        ],
        "use": "official",
        "text": "山田 太郎",
        "family": "山田",
        "given": [
          "太郎"
        ]
      },
      {
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation",
            "valueCode": "SYL"
          }
        ],
        "use": "official",
        "text": "ヤマダ タロウ",
        "family": "ヤマダ",
        "given": [
          "タロウ"
        ]
      }
    ],
    "telecom": [
      {
        "value": "0312345678"
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

