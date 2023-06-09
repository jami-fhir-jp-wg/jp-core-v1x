
### 必須要素

次のデータ項目は必須（**SHALL**）である。

- status : レポートの状態・進捗状況
- code : レポートの種別
  （画像診断レポート交換手順ガイドライン「5.1 レポート種別コード」に記載されているLOINCコード(18748-4) "Diagnostic imaging study" を指定）
- category : カテゴリとモダリティを表すコード
  （Radiology(LP29684-5)を第一コードとし、モダリティを示すDICOMコードを第二コードとして指定する。第二コードは複数のモダリティを許容するため、複数のコードの指定が想定される。）
  
### MustSupport

次のデータは送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

- _text : レポートの所見を含むnarrativeデータ
- basedOn : レポートあるいは画像検査のServiceRequest
- subject : 患者リソース(Patient)への参照。殆どの場合存在するが、緊急検査等で患者リソースが確定していない場合が想定される
- effectiveDateTime : レポート作成日時
- issued : レポート確定日時
- performer : Practitionerでレポートの関係者（作成者、読影者、確定者など）を列挙
- resultInterpreter : Practitionerでレポート確定者を示す
- imagingStudy : 診断の対象となる画像
- link : キーイメージの参照先
- conclusion : 診断の結果、impression
- presentedForm : レポート本体（全体のイメージあるいは所見等のテキスト）

imagingStudyエレメントはCardinalityが0..*で 0 が許容されているが、放射線レポートでは画像が必ず存在することから、検査実施後には必須（複数の可能性もあり）である。

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 注意事項

### Text

DiagnosticReportのドメインリソースの一つであるtextエレメントに見読可能な[narrative](https://www.hl7.org/fhir/R4/narrative.html)データとしてレポートの所見を中心とした情報を格納する。依頼情報や患者基本情報などを含んだレポート全体のデータは別途presentedFormエレメントに保持されるが、ここではPDF等のバイナリが保存される。よってレポート内容の見読性と検索性を担保するためにtextエレメントに保存されたデータが利用され、ここはxhtmlである事が求められる。

(DiagnosticReportのResourceType直下に現れる。text以外のDomainResourceの詳細については[こちら](https://www.hl7.org/fhir/R4/domainresource.html)を参照のこと）

### Identifier

Identifier のデータタイプはオーダ依頼者であるPlacerあるいはオーダの実施者であるFiller（HL7 Version 2 Messaging Standardにて'Placer'あるいは'Filler'として知られている）によって割り当てられた識別子を区別するために利用されるtypeエレメントを持っている。typeエレメントは以下の様に利用する。

#### Placerの場合

```json
{
  "identifier":[{
    "type":{
      "coding":{
        "system":"http://terminology.hl7.org/CodeSystem/v2-0203",
        "code":"PLAC"
      },
      "text":"Placer Identifier"
    },
    "system":"http://abc-hospital.local/fhir/PlacerIdentifier",
    "value":"2345234234234"
  }]
}
```

#### Fillerの場合

```json
{
  "identifier":[{
    "type":{
      "coding":{
        "system":"http://terminology.hl7.org/CodeSystem/v2-0203",
        "code":"FILL"
      },
      "text":"Filler Identifier"
    },
    "system":"http://abc-hospital.local/fhir/FillerIdentifier",
    "value":"567890"
  }]
}
```

DiagnosticReport_Radiology リソースではtypeエレメントを明示する際にはオーダ番号やレポート番号が格納される可能性がある点に留意して対応することが重要である。

### 時間の指定

このプロファイルのリソースでは、effective[x]エレメントにはレポート作成時間を[dateTime](https://www.hl7.org/fhir/R4/datatypes.html#dateTime)で格納する。

### 関連するObservation

DiagnosticReport.resultエレメントには関連する検体検査計測値などをしめすObservationリソースを含むことができる。

### 参照画像

ImagingStudyやmediaは多少オーバーラップするが、使用される目的が異なる。用途に応じて使い分けること。DiagnosticReportではDICOM画像への参照としてImagingStudyが利用され、キー画像としてmediaが参照される。

### 診断報告書のステータス 

- 診断レポートを使用するアプリケーションでは、更新された (改訂された) レポートに注意を払い、取り消されたレポートが適切に処理されるようにする必要がある。
- 診断レポートを提供するアプリケーションの場合、レポートはすべての個々のデータ項目が確定あるいは追加され最終的なものになるまで、ステータスを「final」としてはならない。
- 以前の最終リリース後にレポートが取り下げられた場合は、ステータスコードを「entered-in-error (入力済みエラー)」という概念に置き換え、結論/コメント(提供されている場合)およびテキスト(_text)の説明に「このレポートは取り下げられました」などの記述を追加して、DiagnosticReportおよび関連するObservationを撤回する必要がある。撤回の理由をテキストで明示しても良い。

### レポートの内容

典型的には放射線レポートはnarrativeな構成でのレポートが作成される。DiagnosticReport_Radiologyでは標準的なnarrativeリソースの表現としてXHTMLやrich text表現として（典型的にはPDF）がpresentedFormに指定される。

Conclusionやコード化された診断結果は各々がレポートを構成する小さなデータであるが、これらはpresentedFormに保持されるnarrativeなデータ内に含まれると同時に、本リソースのエレメントに複製されなければならない（**SHOULD**)。

診断レポートの所見などnarrativeなデータはDiagnosticReportのドメインリソースとして定義されているtextにも保持すること。presentedFormとの内容の重複は許容されている。presentedFormはbase64のバイナリであるため、DiagnosticReportのtextが検索性の担保に利用される．また、見読性も同時に保たれる。

診断レポートの分野はAIによる診断補助やレポートの構造化を含め様々な変革がもたらされている。そのため、上記仕様は現時点でのリソース展開の例示であり、将来的に変更される可能性がある。

## 利用方法

#### 検索パラメータ

本プロファイルで再定義された検索パラメータの一覧である。[DiagnosticReport共通の検索パラメータ][JP_DiagnosticReport_Common]が利用されるが、重複するものについては以下の定義に従うこと。

| コンフォーマンス | パラメータ | 型 | 説明 | 表現型 |　例　|
| --- | --- | --- | --- | --- | --- |
| MAY | based-on | reference | オーダ情報への参照 | DiagnosticReport.basedOn ([ServiceRequest](https://hl7.org/fhir/R4/servicerequest.html)) | GET [base]/DiagnosticReport?ServiceRequest/12345 |
| MAY | category | token | レポート種別 | DiagnosticReport.category ([ValueSet]()) <br/> 第1コードは LP29684-5 (Radiology 固定) <br/>第2コード以下は複数のコードを許容し、DICOMモダリティコードが格納される | GET [base]/DiagnosticReport?category=LP29684-5&category=CT |
| MAY | code | token | レポート全体を示すコード | DiagnosticReport.code [LOINC 18748-4](https://loinc.org/18748-4/)(固定) | GET [base]/DiagnosticReport?code=18748-4 |
| MAY | media | reference | キー画像への参照 | DiagnosticReport.media.link ([Media](https://www.hl7.org/fhir/R4/media.html)) | GET [base]/DiagnosticReport?media/12345 |

なお、検索パラメータは複合的に利用できる。詳細は[Search - Chained parameters](https://www.hl7.org/fhir/R4/search.html#chaining)を参照すること。

#### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるDiagnosticReportの検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/DiagnosticReport?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/DiagnosticReport?identifier=http://myhospital.com/fhir/medication|1234567890
   ```

   指定された識別子に一致するDiagnosticReportリソースを含むBundleを検索する。
 
### サンプル

* [**放射線読影レポート**][jp-diagnosticreport-radiology-example-1]

## その他、参考文献・リンク等

本プロファイルそのものの定義には影響しないが、レポートの標準化に関し以下の情報が参考となる。presentedForm に収容するレポートのコンテンツを作成するレポーティングシステムにおいて、標準化に関する参考資料となる。

1. [RadReport][RadReport] - 放射線レポートテンプレート
1. [RadLex radiology lexicon][RadLex radiology lexicon] - 放射線科語彙集
1. [RadElement][RadElement] - 放射線関連共通データエレメント
1. [IHE Radiology Technical Framework][IHE Radiology Technical Framework] - 放射線関連テクニカルフレームワーク（放射線レポートおよびレポートテンプレートの取り扱いに関する仕様が含まれている）

{% include markdown-link-references.md %}
{% include external-link-reference.md %}
