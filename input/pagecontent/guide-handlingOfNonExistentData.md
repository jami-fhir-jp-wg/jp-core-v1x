FHIRではリソース内に要素が存在している場合に、中身がまったくない「空の入れ物（オブジェクト）」を作ることはできない。
具体的には、リソース（患者情報や検査結果といった情報のまとまり）の中に何らかの要素（例えば「患者さんの名前」や「検査日」といった個別のデータ項目）を記述する場合、その要素には必ず以下のいずれかの情報が含まれている必要がある。

1. 要素の種類に応じた具体的なデータ

例えば、「患者さんの名前」という要素であれば、実際の名前の文字列（例: "山田 太郎"）が入っている、といった具合であり、要素が持つべき何らかの値（プロパティ）が必要になる。

1. 1つ以上の「拡張（extension）」

標準で定義されていない情報を追加するための特別な仕組みである「拡張」が、少なくとも1つ設定されている。

特に文字列（string型）として扱われるデータ項目（例：自由記述のメモなど）は、以下のルールがあるため、いずれかの理由によって実データを渡すことができない場合に空文字にて回避することができない。

* 値として、文字が一つも含まれない「空っぽの文字列」（例: "" のような状態）を使用することはできない。
* もし文字列のデータ項目を記述するならば、必ず1文字以上の実際の文字を含んでいる必要がある。
  （これらのルールは、FHIR仕様の 2.6.2 JSON Representation of Resources, 2.6.1 XML Representation of Resources, および 2.24.0.1 Primitive Types に基づいています。）

そのためデータが入手できない、わからないなどの場合に対処するために、[Data Absent Reason拡張](https://www.hl7.org/fhir/R4/extension-data-absent-reason.html)を用いて、データが欠損している理由を表現することが検討すること。


実装ガイド作成時に、多重度を1以上やMust Supportの付与を変更した場合は、欠損値の対処方法についてのルールをあらかじめ定めることを推奨する。

JP Coreにおいて多重度が設定された場合のルール以下のようになる。

JP Core の検索要求するクライアント(Requester)およびサーバ(Responder)は以下の要求を満たすこと (**SHALL**)。

### クライアント(Requester)
---
#### 実装ガイドに準拠するクライアントは、Cardinalityが1以上が付与された要素を含むリソースを受信した場合、エラーを発生させたりアプリケーションを失敗させることなく、それらの値を処理することができなければならない (**SHALL**)。

 **例)**
Readインタラクションの応答として、Cardinalityが１以上の 要素であるPatient.maritalStatus を含むPatient リソースを受信した場合、
要求者はその値をエラーなく処理しなければならない。

```json
 {
    "resourceType": "Patient",
    ...
    "maritalStatus": {
        "coding": [{
            "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
            "code": "M",
            "display": "Married"
        }]
    },
    ...
}
```

#### 実装ガイドに準拠するクライアントは、欠損データであることを宣言した Cardinalityが1以上のデータ要素を含むリソースインスタンスを処理できなければならない (**SHALL**)。
 **例)**
Patient.birthDateの値に欠損情報が付与されているリソースを、要求者は処理できなければならない。なお、birthDateはdate型というprimitive typeであり、そのextensionは"_"を先頭につけたプロパティに対して設定される([2.6.2.3 JSON representation of primitive elements](https://www.hl7.org/fhir/R4/json.html#primitive))。

```json
{
    "resourceType " : "Patient",
    ...
    "_birthDate ": {
        "extension" : [{
            "url " : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
        }]
    },
    ...
} 
```

### サーバ(Responder)
---

#### 要素の値を保持している場合
JP Core 実装ガイドに準拠するサーバは、当該要素の値を保持している場合には、要求された検索結果のリソースのデータ要素として含めることができるべきである (**SHOULD**)。


#### 要素の値を保持していない場合

##### その要素のCardinalityが0を含む場合
JP Core 実装ガイドに準拠するサーバは、Cardinalityが0を含む要素の値を保持していない場合、そのデータ要素の項目を省略してもよい (**MAY**)。

 **例)**

Patient.telecomが欠損している場合…telecom要素は含まなくてよい。

```json
{
    "resourceType" : "Patient",
    ...
    "name" : [{"family" : "Yamada", "given" : [ "Taro" ] }],
    "gender" : "male",
    ...
}
```

##### その要素のCardinalityが1以上の場合
JP Core実装ガイドのサーバは、Cardinalityが1以上の要素の値を保持していない場合、次のように、データの欠損理由を指定しなければならない (**SHALL**)。

###### 非コード化要素の場合
非コード化値の場合： Data Absent Reason拡張を使用して、欠損理由を送
信できなければならない (**SHALL**) 。

 **例)**
患者の生年月日が不明なため、Patient.birthDateに値を保持していない場合（Patient.birthDateが必須 MustSupport）、Data Absent Reason 拡張を使用して、欠損理由（＝不明）を示す。なお、birthDateはdate型というprimitive typeであり、そのextensionは"_"を先頭につけたプロパティに対して設定される([2.6.2.3 JSON representation of primitive elements](https://www.hl7.org/fhir/R4/json.html#primitive))。

```json
{
    "resourceType " : "Patient",
    ...
    "_birthDate ": {
        "extension" : [{
            "url " : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
        }]
    },
    ...
} 
```
###### コード化データ要素(CodeableConceptデータ型、または、code データ型)の場合

  a)  そのコード化要素のバインディング強度が、example, preferred, extensible のいずれかの場合

i. コード化値の代替となる文字情報を持っている場合は、文字データのみを使用する。

 **例)**
 Patient.maritalStatus が必須要素の場合で、Patient.maritalStatus のコード値はわからないが、「既婚」という文字情報は持っている場合、CodeableConcept の text を使用する。

```json
{
    "resourceType" : "Patient",
    ...
    "maritalStatus": {
        "text" : "既婚"
    },
    ...
},

```

ii. コード化値の代替となる文字情報がない場合、バリューセットの中に例外値を表現するコードがあればその値を使用する。

 **例)**バリューセットに含まれる例外値を表現するコードを使用（ValueSet marital-statusには、不明な状態を表すコード[UNK]を含んでいるため、UNKを使用する）
```json
{
    "resourceType" : "Patient",
    ...
    "maritalStatus": {
        "coding": [{
            "system":"http://terminology.hl7.org/CodeSystem/v3-NullFlavor",
            "code": "UNK",
            "display": "unknown"
        }]
    },
    ...
}
```

iii. コード化値の代替となる文字情報がなく、バリューセットの中に例外値を表現するコードが無い場合、[DataAbsentReason]コード体系から、適切な概念コードを使用する。

**例)** Patient.communication.language の値が、患者に確認していないため不明の場合、Data Absent Reason拡張より「not-asked」を使用する。※Patient.communication.language は現状のJP Core Patientプロファイル案では必須ではないため、例示のためのみに使用した。

```json
{
    "resourceType" : "Patient",
    ...
    "communication": [{
        "language":{
            "extension": [{
                    "url " : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
                    "valueCode" : "not-asked",
                    "display": "Not asked"
            }]
        }
    }],
    ...
}
```


 b)そのコード化要素のバインディング強度が required の場合
 
 そのバリューセット内に含まれる例外値を表すコードを使用する。

 **例)** Patient.genderの値が不明の場合、 バリューセットAdministrativeGender に含まれる例外値を表すコード「unknown」を使用する。※Patient.genderは現状のJP Core Patientプロファイル案では必須ではないため、例示のために使用した。

```json
{
    "resourceType" : "Patient",
    ...
    "gender": "unknown",
    ...
}
```
