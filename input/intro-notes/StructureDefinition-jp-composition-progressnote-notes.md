### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- status : 記録のステータス
- type : 記録の種別
- subject : 記録が書かれた対象の患者
- date : 記録の作成日時
- author : 記録の作成者
- title : 記録の人間向けのタイトル

### Extensions定義

本プロファイルで定義された拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
|イベント日時|記録/記事が書かれた対象の日時<br/>《リソース直下ないしsection.section配下》|[JP_Common_Department]|CodeableConcept|
|記事グループNo|記事グループの連番<br/>《section配下》|[JP_Common_GroupNo]|integer|
|記事順序|記事ごとの記載順序<br/>《section.section配下》|[JP_Composition_ItemSequence]|integer|
|記事入力日時|記事ごとの入力日時<br/>《section.section配下》|[JP_Composition_DataEnterDateTime]|dateTime|
|サムネイル画像|添付ファイルや添付画像のサムネイル画像<br/>《section.section配下》|[JP_Composition_ThumbnailImage]|Attachment|

### 使用するセクション
本プロファイルで参考にした [C-CDA on FHIR Progress Note](https://hl7.org/fhir/us/ccda/StructureDefinition-Progress-Note.html)　では多様なセクションが定義されているが、本プロファイルでは、そのうち以下のセクションを使用する。いずれもLOINCコードである。

| セクションコード | セクション名 | 用途 |
|------------|--------------|-----|
| 11450-4 | Problems Section | 対象プロブレム |
| 61150-9 | Subjective Section| S欄 |
| 61149-1 | Objective Section | O欄 |
| 51848-0 | Assessment Section | A欄 |
| 18776-5 | Plan of Treatment Section | P欄 |
| 77599-9 | Additional documentation | その他（フリー欄） |

### 制約一覧

本プロファイルで追加された制約は以下の通りである。

- type : ValueSet「[JP_Composition_ProgressNote_Type_VS]」 の使用を推奨する。経過記録の場合、LOINCコード「11506-3」(Progress note)となる。
- subject : 本プロファイルでは必須とする
- section : 上記「使用するセクション」で定義されたセクションに限定する

### 項目の追加

本プロファイルで追加された項目は以下の通りである。

* 版数（拡張「composition-clinicaldocument-versionNumber」を使用）：記録の版数
* 診療科（拡張「[JP_Common_Department]」を使用）：記録が書かれた診療科
* 記録種別（type要素、category要素を使用）：記録の種別
* イベント日時（拡張「[JP_Composition_EventDateTime]」を使用）：記録/記事が書かれた対象の日時。対象日時は通常date要素と同じになるが、事後入力によりdate要素と異なる場合に使用する。
* 対象患者（subject要素を使用）：記録の対象となった患者
* 入力日時（date要素を使用）：記録全体を入力した日時
* 入力者（author要素を使用）：記録全体を入力した医療従事者
* タイトル（title要素を使用）：記録全体のタイトル
* 記事グループNo（拡張「[JP_Composition_GroupNo]」を使用）：記事グループをまとめる連番
* 記事順序（拡張「[JP_Composition_ItemSequence]」を使用）：同一セクション内での記事の記録順序
* 記事入力日時（拡張「[JP_Composition_DataEnterDateTime]」を使用）：記事を入力した日時。記事の入力日時は通常date要素と同じになるが、確定後の追記によりdate要素と異なる場合に使用する。
* 記事入力者（section.section.authorを使用）：記事を入力した医療従事者
* 記事テキスト（section.section.textを使用）：記事のテキスト
* サムネイル画像（拡張「[JP_Composition_ThumbnailImage]」を使用）：添付ファイルや添付画像のサムネイル画像

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス    | パラメータ                   | 型         | 例                                                                                 |
| ---------------- | -------------------------- |  --------- | ---------------------------------------------------------------------------------- |
| SHALL            | identifier                 | token      | GET [base]/Compoisition?identifier=http://myhospital.com/fhir/Compoisition\|123 |
| SHOULD           | patient               | reference | GET [base]/Compoisition?patient=Patient/123                                  |
| MAY              | patient,type               | reference,token | GET [base]/Compoisition?patient=Patient/123&type=11506-3                                  |
| MAY              | patient,date         | reference,date | GET [base]/Compoisition?patient=Patient/123&date=ge2026-08-24             |
| MAY              | patient,type,date         | reference,token,date | GET [base]/Compoisition?patient=Patient/123&type=11506-3&date=ge2026-08-24 |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりCompoisitionを検索

   ```
   GET [base]/Compoisition?identifier={system|}[code]
   ```
   例：
   ```
   GET [base]/Compoisition?identifier=http://myhospital.com/fhir/Compoisition|123
   ```
   
   指定された識別子に一致するCompoisitionリソースを含むBundleを検索する。

##### 推奨検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートすることが推奨される（SHOULD）

1. 検索パラメータpatientを指定し、該当するすべてのCompoisitionを検索

   ```
   GET [base]/Compoisition?patient={reference}
   ```
   例：
   ```
   GET [base]/Compoisition?patient=Patient/123
   ```
   
   指定された患者のすべてのCompoisitionリソースを含むBundleを検索する。

##### 追加検索パラメータ

オプションとして次の検索パラメータをサポートすることができる（MAY）

1. 検索パラメータpatientとtypeを指定し、該当するすべてのCompoisitionを検索

      ```
      GET [base]/Compoisition?patient={reference}&type={type}
      ```
      例：
      ```
      GET [base]/Compoisition?patient=Patient/123&type=11506-3
      ```
   
      指定された患者および記録種別のすべてのCompoisitionを含むBundleを検索する。

2. 検索パラメータpatientとdateを指定し、該当するすべてのCompoisitionを検索

      * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
      * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]&...)
      
      ```
      GET [base]/Compoisition?patient={reference}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
      ```
      例：
      ```
      GET [base]/Compoisition?patient=Patient/123&date=ge2026-08-24
      ```
   
      指定された患者および入力日のすべてのCompoisitionを含むBundleを検索する。

3. 検索パラメータpatient, type, dateを指定し、該当するすべてのCompoisitionを検索

      * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
      * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]&...)

      ```
      GET [base]/Compoisition?patient={reference}&type={type}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
      ```
      例：
      ```
      GET [base]/Compoisition?patient=Patient/123&type=11506-3&date=ge2026-08-24
      ```
      ```
      GET [base]/Compoisition?patient=Patient/123&type=11506-3&date=ge2026-08-24
      ```
   
      指定された患者、記録種別、入力日のすべてのCompoisitionを含むBundleを検索する。

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**経過記録**][jp-composition-progressnote-example-1]

## 注意事項
### Compositionリソースの全体構造
本プロファイルにおけるCompositionリソースの全体構造を下図に示す。

<!-- ![](composition_progressnote_structure.svg) -->
<img src="composition_progressnote_structure.svg" style="display: block; width: 70%; height: auto; margin: 0; float:none;" alt="Compositionリソースの全体構造"/>
     

### 記録の種別について
記録の種別はtype要素を使用してCodeableConcept型で記述する。使用するコードは、ValueSet「[JP_Composition_ProgressNote_Type_VS]」を推奨するが、このValueSetにない場合には、それ以外のLOINCコードやローカルコードを使用してもよい。

category要素には、type要素と同じ値を指定することを推奨するが、多重度が「0..*」であるため、検索時に有用と思われるそれ以外の分類コードを追加指定してもよい。

### 対象プロブレムの記述方法について
記録の対象となったプロブレムがある場合、 「Problems Section」セクション（LOINCコード「11450-4」）で記述する。複数プロブレムを記載することが可能で、entry要素から対象プロブレムのConditionリソースを参照し、entry.display要素でプロブレム名を記載する。

「D#0　全体に関係 (医師)」と「D#1　ＲＳウイルス肺炎」の２つのプロブレムを対象とした場合のインスタンス例を示す。
```json
 "section": [ {
    "title": "Problems Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "11450-4",
        "display": "Problems Section"
      } ]
    },
    "entry": [ {
      "reference": "Condition/00000040.-3.0",
      "display": "D#0　全体に関係 (医師)"
    }, {
      "reference": "Condition/00000040.3.0",
      "display": "D#1　ＲＳウイルス肺炎"
    } ]
  } ]
```

### 記事テキストの記述方法について
C-CDA on FHIRのProgress Noteでは、セクションごとのインスタンスは最大１個に制限されている一方、日本の電子カルテシステムの実装では複数の記事が記載できる場合がある。そこで、本プロファイルでは、セクションごとのインスタンスは最大１個に制限しつつ、常にサブセクション（section.section要素）を使用して記事を記述し、サブセクションを複数許すことで複数の記事を記述できるようにする。（後述するように、複数の記事グループがある場合は例外とする。）

なお、記事テキストは、サブセクションのtext.div要素にXHTML形式で記述する。

O欄に複数の記事を記載した場合のインスタンス例を示す。
```json
  "section": [ {
    "title": "Objective Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "61149-1",
        "display": "Objective Section"
      } ]
    },
    "section": [ {
      "entry": [ {
        "reference": "DocumentReference/00000040.20240819.110720.Z999.1.20.000.-3.O00.0"
      } ]
    }, {
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>下肺野の過膨張や肺炎の影が見られ、ウイルス性の肺炎と思われる。</p><p/></div>"
      }
    }, {
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>【検体検査結果】</p><p>生化学Ａ,糖・有機酸,尿定量（新尿）,尿一般,血液一般 採取日時：2024-08-19 </p><p>総蛋白                         4.7</p><p>TP(その他)                     0.5</p><p><b>ALB                     H 41</b></p><p>C3                             </p><p/></div>"
      }
    } ]
  } ]
```

### 記録の版数の記述方法について
記録の版数を記述するには、FHIRで定義されている「composition-clinicaldocument-versionNumber」拡張を使用して、string型で記述する。url要素の値は「http://hl7.org/fhir/StructureDefinition/composition-clinicaldocument-versionNumber」とする。版数の形式は実装依存とし、本プロファイルでは規定しない。

版数「2」の場合のインスタンス例を示す。
```json
  "extension": [ {
    "url": "http://hl7.org/fhir/StructureDefinition/composition-clinicaldocument-versionNumber",
    "valueString": "2"
  } ]
```

### 診療科の記述方法について
記録を記載した診療科は、Compositionリソースの標準的な要素では記述が難しいため、JP Coreで定義されている「[JP_Common_Department]」拡張を使用してCodeabacleConcept型で記述する。使用する標準コードはSS-MIX2診療科コードを推奨する。

診療科が「内科」の場合のインスタンス例を示す。
```json
  "extension": [ {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department",
    "valueCodeableConcept": {
      "coding": [ {
        "system": "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment",
        "code": "01",
        "display": "内科"
      } ]
    }
  } ]
```

### イベント日時の記述方法について
イベント日時は、記録/記事が書かれた対象の日時のことで、通常date要素と同じ値になるはずであるが、いわゆる事後入力によりdate要素と異なる値になる場合には、拡張「[JP_Composition_EventDateTime]」を使用してdateTime型で記述する。

イベント日時が「2026-08-19 11:00:00」の場合のインスタンス例を示す。
```json
  "extension": [ {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_EventDateTime",
    "valueDateTime": "2026-08-19T11:00:00+09:00"
  } ],
```

### 入力日時の記述方法について
記録全体の入力日時は、date要素を使用してdateTime型で記述する。

入力日時が「2026-08-19 11:00:02」の場合のインスタンス例を示す。
```json
  "date": "2026-08-19T11:00:02+09:00"
```

### 入力者の記述方法について
記録全体の入力者は、author要素を使用して、Reference型で入力者を記述したPractitioner等のリソースを参照する。

入力者が「Practitioner/1234567」の場合のインスタンス例を示す。
```json
  "author": [ {
    "reference": "Practitioner/1234567"
  } ]
```

### タイトルの記述方法について
タイトルは必須要素であるtitle要素を使用して、string型で記述する。本プロファイルでは、「経過記録」など記録種別の名称を記載することを推奨するが、記録ごとのタイトルがあればそれを記載してもよい。

タイトルが「経過記録」の場合のインスタンス例を示す。
```json
  "title": "経過記録"
```

### 記事順序の記述方法について
同一のSOAP種別に複数の記事があるとサブセクション(section.section)が複数並ぶことになるが、その並び順を明示したい場合、サブセクションの「[JP_Composition_ItemSequence]」拡張を使用して、同一SOAP種別内での記事の記録順序をinteger型で記述する。

記事順序を明示した場合のインスタンス例を示す。
```json
  "section": [ {
    "title": "Objective Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "61149-1",
        "display": "Objective Section"
      } ]
    },
    "section": [ {
      "extension": [ {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_ItemSequence",
        "valueInteger": 1
      } ],
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>臥床がちに過ごす。顔色不良。バイタルは著変無し。本日心内受診予定であったが、混んでいたため、明日に変更となる。</p></div>"
      }
    }, {
      "extension": [ {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_ItemSequence",
        "valueInteger": 2
      } ],
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>ﾊﾟｯﾁﾃｽﾄ施行する。25日判定とする。掻痒感出現時は伝えるように話す。</p></div>"
      }
    }, {
      "extension": [ {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_ItemSequence",
        "valueInteger": 3
      } ],
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>尿混濁あるため〇〇Ｄｒよりﾊﾟﾝｽﾎﾟﾘﾝの処方あり。</p></div>"
      }
    } ]
  } ]
```

### 記事入力日時の記述方法について
記事ごとの入力日時は通常date要素と同じ値になるが、確定後の追記によりdate要素と異なる値となる場合がある。その場合、サブセクションの「[JP_Composition_DataEnterDateTime]」拡張を使用して、dateTime型で記述する。

下記はO欄の一部の記事のみ入力日時が異なる場合のインスタンス例を示す。
```json
  "date": "2024-08-19T11:00:02+09:00",
  "author": [ {
    "reference": "Practitioner/1234567"
  } ],
  "section": [ {
    "title": "Objective Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "61149-1",
        "display": "Objective Section"
      } ]
    },
    "section": [ {
      "entry": [ {
        "reference": "DocumentReference/00000040.20240819.110720.Z999.1.20.000.-3.O00.0"
      } ]
    }, {
      "extension": [ {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime",
        "valueDateTime": "2024-08-19T11:07:20+09:00"
      } ],
      "author": [ {
        "reference": "Practitioner/1000231"
      } ],
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>下肺野の過膨張や肺炎の影が見られ、ウイルス性の肺炎と思われる。</p><p/></div>"
      }
    }, {
      "extension": [ {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime",
        "valueDateTime": "2024-08-19T11:00:02+09:00"
      } ],
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>【検体検査結果】</p><p>生化学Ａ,糖・有機酸,尿定量（新尿）,尿一般,血液一般 採取日時：2024-08-19 </p><p>総蛋白                         4.7</p><p>TP(その他)                     0.5</p><p><b>ALB                     H 41</b></p><p>C3                             </p><p/></div>"
      }
    } ]
  } ]
```

### 記事入力者の記述方法について
記事ごとの入力者は通常記録全体の入力者であるauthor要素の値と同じになるが、確定後の追記で異なる医療従事者が入力した場合は異なる値になる。そのような場合、サブセクションのauthor要素を使用して記事ごとの入力者を記述する。

インスタンス例については、前節の記事入力日時を参照のこと。

### 添付ファイル、添付画像とそのサムネイル画像の記述方法について
記事に張り付けた添付ファイルや添付画像は、DocumentReferenceリソースを使用して記述し、サブセクションのentry要素から参照することとする。DocumentReferenceでの記述方法は本プロファイルでは規定しない。

また、添付ファイルや添付画像のサムネイル画像を記述するには、サブセクションの「[JP_Composition_ThumbnailImage]」拡張を使用して、Attachment型で記述する。画像データはdata要素にBase64でエンコードしたテキストとしてセットし、そのMIMEタイプをcontentType要素にセットする。

添付画像本体とサムネイル画像のインスタンス例を示す。（サムネイル画像の画像データは先頭部分のみ）
```json
  "section": [ {
    "title": "Objective Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "61149-1",
        "display": "Objective Section"
      } ]
    },
    "section": [ {
      "extension": [ {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_ThumnailImage",
        "valueAttachment": {
          "contentType": "image/jpeg",
          "data": "/9j/4AAQSkZJRgABAQAAAQABAAD/..."
        }
      } ],
      "entry": [ {
        "reference": "DocumentReference/00000040.20240819.110720.Z999.1.20.000.-3.O00.0"
      } ]
    } ]
  } ]
```

### 複数の記事グループの記述方法について
本プロファイルでは、１つの記録の中に対象プロブレムおよびSOAP形式の記事のセット（以下、「記事グループ」と呼ぶ）が複数存在する場合に対応する。そのような場合には、記事グループごとに１から始まる連番を振り、各セクションについて「[JP_Composition_GroupNo]」拡張を使用してその連番を記述することで、どの記事グループに属するかを識別できるようにする。記事グループが１つしかない場合はこの拡張は省略することができる。

なお、トップレベルのセクションのインスタンスは、記事グループ、セクションコードごとに最大１個までに制限されることに注意する。

記事グループが２つあるインスタンス例を示す。
```json
  "section": [ {
    "extension": [ {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo",
      "valueInteger": 1
    } ],
    "title": "Problems Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "11450-4",
        "display": "Problems Section"
      } ]
    },
    "entry": [ {
      "reference": "Condition/00000040.-3.0",
      "display": "D#0　全体に関係 (医師)"
    } ]
  }, {
    "extension": [ {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo",
      "valueInteger": 1
    } ],
    "title": "Objective Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "61149-1",
        "display": "Objective Section"
      } ]
    },
    "section": [ {
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>臥床がちに過ごす。顔色不良。バイタルは著変無し。本日心内受診予定であったが、混んでいたため、明日に変更となる。</p></div>"
      }
    } ]
  },{
    "extension": [ {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo",
      "valueInteger": 2
    } ],
    "title": "Problems Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "11450-4",
        "display": "Problems Section"
      } ]
    },
    "entry": [ {
      "reference": "Condition/00000040.3.0",
      "display": "D#1　ＲＳウイルス肺炎"
    } ]
  },{
    "extension": [ {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_GroupNo",
      "valueInteger": 2
    } ],
    "title": "Objective Section",
    "code": {
      "coding": [ {
        "system": "http://loinc.org",
        "code": "61149-1",
        "display": "Objective Section"
      } ]
    },
    "section": [ {
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>ﾊﾟｯﾁﾃｽﾄ施行する。25日判定とする。掻痒感出現時は伝えるように話す。</p></div>"
      }
    }, {
      "text": {
        "status": "additional",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>尿混濁あるため〇〇Ｄｒよりﾊﾟﾝｽﾎﾟﾘﾝの処方あり。</p></div>"
      }
    } ]
  } ]
```

## その他、参考文献・リンク等

1. C-CDA on FHIR Progress Note [https://hl7.org/fhir/us/ccda/StructureDefinition-Progress-Note.html](https://hl7.org/fhir/us/ccda/StructureDefinition-Progress-Note.html)
2. JAHIS地域医療連携における経過記録構造化記述規約 Ver.1.0 [https://www.jahis.jp/files/user/04_JAHIS%20standard/17-007_JAHIS%E5%9C%B0%E5%9F%9F%E5%8C%BB%E7%99%82%E9%80%A3%E6%90%BA%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E7%B5%8C%E9%81%8E%E8%A8%98%E9%8C%B2%E6%A7%8B%E9%80%A0%E5%8C%96%E8%A8%98%E8%BF%B0%E8%A6%8F%E7%B4%84Ver.1.0.pdf](https://www.jahis.jp/files/user/04_JAHIS%20standard/17-007_JAHIS%E5%9C%B0%E5%9F%9F%E5%8C%BB%E7%99%82%E9%80%A3%E6%90%BA%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E7%B5%8C%E9%81%8E%E8%A8%98%E9%8C%B2%E6%A7%8B%E9%80%A0%E5%8C%96%E8%A8%98%E8%BF%B0%E8%A6%8F%E7%B4%84Ver.1.0.pdf)

{% include markdown-link-references.md %}
