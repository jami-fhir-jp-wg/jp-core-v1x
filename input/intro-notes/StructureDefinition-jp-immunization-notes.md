### 必須要素
JP Core Immunization リソースは、次の要素を持たなければならない。

- status
- vaccineCode
- patient
- occurrence[x]


### Extensions定義

JP Core Immunization リソースで使用される拡張は次の通りである。

#### JP Core Immunization独自で追加されたExtension

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
| DueDateOfNextDose | 次回接種予定日 | [JP_Immunization_DueDateOfNextDose] |dateTime|
| ManufacturedDate | 製造年月日 | [JP_Immunization_ManufacturedDate] |dateTime |
| CertificatedDate | 検定年月日 | [JP_Immunization_CertificatedDate] |dateTime |

#### 既存のExtensionの利用

既存のExtensionの利用はない。


### 用語定義

HL7 FHIRの基底規格では、ワクチンコードとして CVX コードが使われているが、日本ではHOTコードやYJコードで一通り使用されているワクチンが定義されているため、国内で利用する際の用語集としては HOTコードとYJコードを採用した。それ以外の用語集の利用を妨げるものではない。

|分類|名称|URI|
|---------|----|---------------------------|
|ワクチン|HOT9|http://medis.or.jp/CodeSystem/master-HOT9|
|ワクチン|HOT13|http://medis.or.jp/CodeSystem/master-HOT13|
|ワクチン|YJコード|http://capstandard.jp/iyaku.info/CodeSystem/YJ-code|
|対象疾患|MEDIS標準病名マスター病名交換用コード|http://medis.or.jp/CodeSystem/master-disease-exCode|

### 項目の追加
参考にしたワクチン関係の文書やAPIで扱われている項目に合わせ、以下の項目を追加した。

* 次回接種予定日（拡張「JP_Immunization_DueDateOfNextDose」を使用）
* 製造年月日（拡張「JP_Immunization_ManufacturedDate」を使用）
* 検定年月日（拡張「JP_Immunization_CertificatedDate」を使用）

## 利用方法

### Interaction一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/Immunization?identifier=http://myhospital.com/fhir/immunization\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/Immunization?patient=123456   |
| SHOULD           | patient,date | reference,date  | GET [base]/Immunization?patient=123456&date=eq2013-01-14 |
| MAY           | date,lot-number | date,string | GET [base]/Immunization?date=eq2013-01-14&lot-number=FF3620 |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるMedicationRequestの検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/Immunization?identifier={system|}[token]
   ```

   例：

   ```
   GET [base]/Immunization?identifier=http://myhospital.com/fhir/medication|1234567890
   ```

   指定された識別子に一致するImmunizationリソースを含むBundleを検索する。
   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるImmunizationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Immunization?patient=[id]
   GET [base]/Immunization?patient=[url]
   ```

   例：

   ```
   GET [base]/Immunization?patient=123456
   ```

   リソースIDが123456の患者のImmunizationリソースを含むBundleを検索する。

1. patient,date 検索パラメータを使用して、患者のリファレンス情報と接種日によるImmunizationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Immunization?patient=[id]&date=[date]
   GET [base]/Immunization?patient=[url]&date=[date]
   ```

   例：

   ```
   GET [base]/Immunization?patient=123456&date=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に服用するImmunizationリソースを含むBundleを検索する。


#### Operation一覧

JP Immunization リソースに対する操作は定義されていない。

### サンプル
このワクチン接種例では下記の内容をFHIRで表現する場合について解説する。

| 項目名 | 項目値 | 備考 |
| :--- | :--- | :--- |
| 接種ワクチン | コミナティ筋注 (182110901) |
| 対象疾患 | ＣＯＶＩＤ－１９ (S9VN) |
| 接種量 | 0.45mL |
| 接種部位 | Left arm (LA) |
| 接種実施者 | 大阪 一郎 |
| 接種日時 | 2021/07/01 10:30 |
| ロット番号 | 12345678 |

* [**新型コロナワクチン接種**][jp-immunization-example-1]

## 注意事項

### 記述の単位について
Immunizationはワクチンを vaccineCodeとして1つまでしか持つことしかできないので、ワクチン単位でImmunizationリソースを作成する。

### ワクチンの種類や製剤名の記述方法について
ワクチンの種類や製剤名は Immunization.vaccineCode要素にCodeableConcept型で記述する。ワクチンを識別するコードは、HOTコード（HOT13を推奨）ないしYJコードを使用する。

```json
"vaccineCode": {
  "coding":  [
    {
      "system": "http://medis.or.jp/CodeSystem/master-HOT13",
      "code": "1820201040101",
      "display": "インフルエンザHAワクチン「第一三共」1mL"
    }
  ]
}
```

### 接種年月日の記述方法について
ワクチンを接種した日は Immunization.occurrenceDateTime要素にdateTime型で記述する。日付での記述が難しい場合は、Immunization.occurrenceString要素にテキストで記述してもよい。

Immunization.occurrenceDateTime要素を使用した例：
```json
"occurrenceDateTime": "2022-03-02"
```

Immunization.occurrenceString要素を使用した例：
```json
"occurrenceString": "６才頃"
```

### 記録日時の記述方法について
ワクチン接種の情報を記録した日時は Immunization.recorded要素にdateTime型で記述する。

```json
"recorded": "2022-03-02T10:45:23+09:00"
```

### 接種場所の記述方法について
ワクチンの接種場所は Immunization.location要素にReference型でLocationリソースの参照情報を記述する。

```json
"location" : {
  "reference" : "Location/1234"
}
```

### 製造会社の記述方法について
ワクチンの製造会社は Immunization.manufacturer要素にReference型でOrganizationリソースの参照情報を記述する。

```json
"manufacturer" : {
  "reference" : "Organization/1234"
}
```

### ワクチンのロット番号の記述方法について
ワクチンのロット番号は Immunization.lotNumber要素にstring型で記述する。

```json
"lotNumber" : "FF3620"
```

### 接種部位の記述方法について
ワクチンの接種部位は Immunization.site要素に CodeableConcept型で記述する。部位を識別するコードにはJAMI処方・注射オーダ標準用法規格(外用部位コード) を推奨する

```json
"site": {
  "coding":  [
    {
      "system": "http://jami.jp/CodeSystem/MedicationBodySiteExternal"
      "code": "74L",
      "display": "左上腕"
    }
  ]
}
```

### 接種量の記述方法について
ワクチンの接種量は Immunization.doseQuantity要素にSimpleQuantity型で記述する。全体の容量をUCUM("http://unitsofmeasure.org")を使用してmL単位で指定する。

```json
"doseQuantity": {
  "value": 1,
  "unit": "mL",
  "system": "http://unitsofmeasure.org",
  "code": "mL"
}
```

### 接種実施者の記述方法について
ワクチンの接種実施者 Immunization.performer.actor要素にReference型でPractitionerリソースの参照情報を記述する。Immunization.performer.functionにはValueSet "http://hl7.org/fhir/ValueSet/immunization-function"から"AP" (Administering Provider)を指定する。

```json
"performer": [
  {
    "function": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0443",
          "code": "AP",
          "display": "Administering Provider"
        }
      ]
    },
    "actor": {
      "reference": "Practitioner/1234"
    }
  }
]
```

### 接種を行わなかった理由の記述方法について
ワクチン接種を行わなかった理由を記述したい場合は、Immunization.statusReason要素にCodeableConcept型で記述する。適当な標準コードが整備されていないため、ローカルコードを定義するか、CodeableConcept.text要素にテキストとして記述する。

```json
"statusReason": [
  {
    "text": "37.5℃以上の発熱があったため。"
  }
]
```

### 予防接種の種類、効果のある疾患の記述方法について
ワクチン接種により感染や重症化を予防できる疾患（記録によっては「予防接種の種類」と呼ばれることもある）は、Immunization.protocolApplied.targetDisease要素にCodeableConcept型で記述する。使用する用語集としては、「診療情報提供書HL7FHIR記述仕様 第1版」などでも採用されている
MEDIS標準病名マスターの病名交換用コード("http://medis.or.jp/CodeSystem/master-disease-exCode")を推奨する。

```json
"protocolApplied": [
  {
    "targetDisease": [
      {
        "coding": [
          {
            "system": "http://medis.or.jp/CodeSystem/master-disease-exCode",
            "code": "ES0L",
            "display": "インフルエンザ"
          }
        ]
      }
    ] 
  }
]
```

### ワクチン接種の回数の記述方法について
ワクチン接種の回数はImmunization.protocolApplied.doseNumberPositiveInt要素にpositiveInt型で記述する。

```json
"protocolApplied": [
  {
    "doseNumberPositiveInt": 2
  }
]
```

### 次回接種予定日の記述方法について
次回のワクチン接種予定日は既存のImmunization要素では記述ができないため、Immunizationリソースに対する拡張「DueDateOfNextDose」を使用してdate型で記述する。extension.urlには"http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Immunization_DueDateOfNextDose"を指定する。

```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Immunization_DueDateOfNextDose",
    "valueDate": "2022-04-02"
  }
]
```

### 製造年月日、検定年月日
ワクチンの製造年月日、検定年月日はいずれも既存のImmunization要素では記述ができないため、Immunizationリソースに対する拡張「ManufacturedDate」「CertificatedDate」をそれぞれ使用してdate型で記述する。extension.urlにはそれぞれ"http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Immunization_ManufacturedDate"、"http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Immunization_CertificatedDate"を指定する。

```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Immunization_ManufacturedDate",
    "valueDate": "2021-10-14"
  },
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Immunization_CertificatedDate",
    "valueDate": "2021-10-18"
  }
]
```


## その他、参考文献・リンク等
1. HL7, FHIR Immunization Resource, [https://hl7.org/fhir/R4/Immunization.html](https://hl7.org/fhir/R4/Immunization.html)
1. 母子手帳（厚生労働省令，P51), [https://www.mhlw.go.jp/content/000622161.pdf](https://www.mhlw.go.jp/content/000622161.pdf)
1. ワクチン接種記録システム(VRS), [https://cio.go.jp/sites/default/files/uploads/documents/vrs_announcement_210430a_att1.pdf](https://cio.go.jp/sites/default/files/uploads/documents/vrs_announcement_210430a_att1.pdf)
1. 予防接種台帳, [https://www.mhlw.go.jp/content/10906000/000588379.pdf](https://www.mhlw.go.jp/content/10906000/000588379.pdf)
1. マイナポータル, [https://myna.go.jp/html/api/selfinfo/R4-6/B-084_R4-6.xlsx](https://myna.go.jp/html/api/selfinfo/R4-6/B-084_R4-6.xlsx)
1. 新型コロナワクチン接種証明書アプリ, [https://www.digital.go.jp/policies/vaccinecert/faq_06](https://www.digital.go.jp/policies/vaccinecert/faq_06)
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, [http://www2.medis.or.jp/hcode/](http://www2.medis.or.jp/hcode/)
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, [http://www.jami.jp/jamistd/ssmix2.php](http://www.jami.jp/jamistd/ssmix2.php)

{% include markdown-link-references.md %}