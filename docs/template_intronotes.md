# JP Core 各種リソース説明用 Markdownファイル編集ルール

## 1. 概要
```ruby
(project root)
├─...
├─fsh-generated #sushiの出力フォルダ
│  ├─...
│  ├─resources #fsh→jsonに変換されたリソースファイル格納フォルダ
├─...
└─input #入力フォルダ
   ├─...
   ├─intro-notes #profileの前後説明文(-intro.md, -notes.md)
   └─...
```
リソース定義ファイル(json)より生成される説明用htmlファイルに対して、その前後に独自の説明文書を挟むことができる。前後に差し込むには特定の命名規則によるMarkdownファイルを作ることにより可能となる。<br/>


| 文書 | 差込位置 | ファイル名称 | フォルダ |
|---|:---:|---|---|
|紹介文書| 前 |  {リソースファイル名}-intro.md |input/intro-notes|
|注意文書| 後 |  {リソースファイル名}-notes.md |input/intro-notes|

sushiでコンパイルすると、fsh-generated/resources配下に変換されたリソース定義ファイルが出力されます。その中より対象となるリソースファイル名称を見つけ出し、ファイル名を特定します。


```
# JP Patientの例

# リソース紹介文書Markdownファイル名称
(project root)/input/intro-notes/StructureDefinition-JP-Patient-intro.md

# リソース注意文書Markdownファイル名称
(project root)/input/intro-notes/StructureDefinition-JP-Patient-notes.md
```

## 2. 記載例
## 2.1. 紹介文書ファイル(-intro.md)の記載例
``` Markdown
<!--プロファイル定義全般の概略記載します-->

本プロファイルは、医療従事者に関する情報の登録や検索、取得のために 、FHIR Practitioner リソースを使用するにあたっての、最低限の制約を記述したものである。Practitioner リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ
<!--想定しているユースケースを記述します-->
本プロファイルは、以下のようなユースケースを想定している。

- 氏名または医籍登録番号による医療従事者の検索

- 他のリソースからの医療従事者情報の参照（例：Patientリソースの generalPractitionerで参照される患者の主治医や、Encounterリソースのparticipantで参照される診察の担当医）

## スコープ
<!--対象としているスコープ／対象としないスコープについて記載します-->
医療（ヘルスケア）の提供、及び、ヘルスケア関連サービスに、直接的、または、間接的に係わる全ての人を表す。本リソースに含まれる医療従事者の例を示す（ただし、この一覧に限定されない）。

- 医師、歯科医師、薬剤師
- 看護師、保健師、医療クラーク
- 助産師、栄養士、心理士
- 臨床検査技師、放射線技師
- 臨床工学技士、義肢装具士
- 医療事務者（受付担当者）

元となるPatientリソース同様に、本プロファイルは友人や親戚、隣人のケアをする個人のように、正式な責任を持たずに医療に関与する個人を表現するために使用してはならない。それらの情報は、患者の関係者として RelatedPerson リソースを使用して表現されるべきである。

Practitioner リソースは、ヘルスケアサービスの提供組織を代表し、複数の患者のために行動する個人に対して使用される。一方で、RelatedPerson リソースは、特定の組織に関連づけられておらず、特定の患者に関係する個人を表現するために使用される。

PractitionerRole リソースは、医療従事者が、特定の組織において与えられている役割の詳細を表す。特定の施設に関係しない資格や識別子（例：医籍番号や麻薬施用者免許証番号）は、Practitioner リソースに記録することが望ましい。一方で、特定の施設における医療従事者の識別子や役割（例：特定の医療機関における医療従事者ID）は、施設を表すOrganizationリソースとあわせて PractitionerRole リソースに記録することが望ましい。

## プロファイル定義
<!-- プロファイルの定義について説明を行います。下の例はPatientプロファイル -->

```


## 2.1. 注意文書ファイル(-notes.md)の記載例
```markdown
### 必須要素
(必須要素についての説明を行います）

<!--★★コメント ： 現状のJP Practitioner プロファイルの定義には、必須要素もMust Supportも定義されていないため、例示として示します。★★-->

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

Practitioner リソースは、次の要素を持たなければならない。
- name ：医療従事者の氏名は必須であり、name.text が必ず存在しなければならない。

Practitionerリソースは、次の要素をサポートしなければならない。
- identifier： 医籍登録番号が利用可能な場合、サポートされなければならない。

### Extensions定義
<!--拡張を行った場合、ここに説明を記載します-->

<!--★★コメント ： JP Core Practitionerプロファイルで定義された拡張はないため例示します。拡張定義の詳細は、別ドキュメントに記述される想定です。★★-->

JP Practitioner プロファイルで使用される拡張は次の通りである。

- animalSpecies
  - 動物をつかったヘルスケアサービスの提供を行う場合（例：がん探知犬）、動物の種を表す。

## 利用方法
（OperationやSearch Parameter中心に記載を行います。）

### Interaction一覧
| Conformance | Interactions |
| ---- | ---- | 
| SHALL | search-type, read |
| SHOULD | vread, history-instance |
| MAY | create, update, patch, delete, history-type |

##### 必須検索パラメータ
次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、医籍登録番号などの識別子によるPractitionerの検索をサポートしなければならない（SHALL）。
    ```
    GET [base]/Practitioner?identifier={system|}[code]
    ```
   例：
    ```
    GET [base]/Practitioner?identifier=http://hl7.org/fhir/sid/us-npi|123456
    ```
   指定された識別子に一致するPractitionerリソースを含むBundleを検索する。


2. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（SHALL）。
    ```
    GET [base]/Practitioner?name=[string]
    ```
   例：
    ```
    GET [base]/Practitioner?name=山田
    ```
   名前（姓、名、またはテキスト）が一致するPractitionerリソースを含むBundleを検索する。

##### 推奨検索パラメータ
次の検索パラメータをサポートすることが望ましい。

1. communication 検索パラメータを使用して、医療従事者が使用する言語コードによるPractitionerの検索をサポートすることが望ましい（SHOULD）。
    ```
    GET [base]/Practitioner?communication={system|}[code]
    ```
   例：
    ```
    GET [base]/Practitioner?communication=urn:ietf:bcp:47|jp
    ```
   使用言語が指定された言語コードと一致するPractitionerリソースを含むBundleを検索する。

##### 追加検索パラメータ 
<!--★★コメント： US-Coreでは 基底以外の追加検索パラメータ（基底プロパティまたは拡張(Extension)に対する検索パラメータの両方を含む）についての記載がありませんが、必要と思われたので追加しました。内容は例示です。★★-->

1. qualification-identifier検索パラメータを使用して、資格識別子によるPractitionerの検索をサポートしなければならない（SHALL）。
    ```
    GET [base]/Practitioner?qualification-identifier={system|}{value}
    ```
   例：
    ```
    GET [base]/Practitioner?qualification-identifier=http://example.org/UniversityIdentifier|12345
    ```
   指定された識別子と資格識別子が一致するPractitionerリソースを含むBundleを検索する。

2. jp-core-ethnicity検索パラメータを使用して、民族性によるPractitionerの検索をサポートすることが望ましい（SHOULD）。
    ```
    GET [base]/Practitioner?jp-core-ethnicity={system|}{code}
    ```
   例：
    ```
    GET [base]/Practitioner/?jp-core-ethnicity=http:example.org/ethnicity|abc
    ```

   指定された民族コードと民族性が一致するPractitionerリソースを含むBundleを検索する。

#### Operation一覧
<!--★★コメント： Practitionerに対するOperationは定義されていないため、例示します。内容の妥当性は考慮していません。★★-->

JP Practitioner プロファイルに対して使用される操作は次の通りである。
- $everything：[base]/Practitioner/[id]/$everything
  - この操作が呼び出された特定のPractitionerに関連する全ての情報を返す。

#### Operation 詳細
<!--★★コメント：内容は、例示であり、妥当性は考慮していません。★★-->

#####  $everything 操作
この操作は、この操作が呼び出された特定のPractitionerリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別された医療従事者のPractitionerコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。
    ```
    http://hl7.jp/fhir/OperationDefinition/Practitioner-everything
    ```
URL: [base]/Practitioner/[id]/$everything
本操作は、べき等な操作である。

###### 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| ＿since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| ＿type  | 0..＊ | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| ＿count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |

###### 出力パラメータ
| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 例
リクエスト：単一のPractitionerに関連する全てのリソースを取得する。
    ```
    GET [base]/Practitioner/p001/$everything
    [some headers]
    ```
レスポンス：指定されたPractitionerに関連する全てのリソースを返す。

    ```http
    HTTP/1.1 200 OK
    [other headers]

    {
      "resourceType": "Bundle",
      "id": "example",
      "meta": {
        "lastUpdated": "2014-08-18T01:43:33Z"
      },
      "type": "searchset",
      "entry": [
        {
          "fullUrl": "http://example.org/fhir/Practitioner/p001",
          "resource": {
            "resourceType": "Practitioner",
    　　　　　・・・

　　    　 },
        }
    ]
    }  
    ```



### サンプル

<!--★★コメント：例示します。★★</span>-->
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

### サンプル
[外来患者１](http:xxxxx.json.html)
[入院患者１](http:yyyyy.json.html)

## 注意事項
(全体に対する注意事項等、その他の部分について記載します。）

医療従事者の資格は、組織や役割に関係なく医療従事者によって取得されたものであり、特定の組織（Organization）または場所（Location）で、資格に関連する役割を実行することが許可または認可されていることを意味するものではないことに注意する。


## その他、参考文献・リンク等
```

## 3. markdownファイル記載時の注意事項

### 全般
* 先頭` # `マークは章・節・句の自動採番の対象となる。動きを理解した上で利用すること。
* 最終的にはコンパイル後の画面を見て確認すること。
* 前回までにあった先頭のテーブルは自動生成するようになったため記載扶養

### 紹介文書
* `###`を利用するとプロファイル定義の章番号がずれてしまうため`<h3>title</h3>`として記述すること。不具合解消時には修正すること。

