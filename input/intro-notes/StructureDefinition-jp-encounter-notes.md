
### 必須要素

Encounter リソースは、次の要素を持たなければならない。

- status ：受診状況を示す。value set encounter-statusで定義された値から設定する必要がある。  
（planned/arrived/triaged/in-progress/onleave/finished/cancelled/entered-in-error/unknown）
- class : 受診分類を示す。value set ActEncounterCodeで定義された値から設定する必要がある。  
（AMB/EMER/FLD/HH/IMP/ACUTE/NONAC/OBSENC/PRENC/SS/VR）

### Extensions定義

JP Encounter リソースで使用される拡張は次の通りである。

- [Associated Encounter](https://www.hl7.org/fhir/R4/extension-encounter-associatedencounter.html)

  - リソースで関連付けを定義しているプロパティが存在しないEncounterを参照するために利用する

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/Encounter?identifier=http://hl7.org/fhir/sid/jpsys\|123456 |
| SHOULD            | patient    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/jpsys\|123456  |
| SHOULD            | date, patient    | token  | GET [base]/Encounter?date=http://hl7.org/fhir/sid/jpsys\20210415?patient=http://hl7.org/fhir/sid/jpsys\|123456  |
| SHOULD           | class, patient    | token  | GET [base]/Encounter?class=http://hl7.org/fhir/sid/jpsys\EMER?patient=http://hl7.org/fhir/sid/jpsys\|123456  |
| SHOULD           | patient, type    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/jpsys\|123456?type=http://hl7.org/fhir/sid/jpsys\ADMS  |
| SHOULD           | patient, status    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/jpsys\|123456?status=http://hl7.org/fhir/sid/jpsys\arrived  |

##### 必須検索パラメータ

次の検索パラメータをサポートすることが望ましい。(**SHOULD**)

1. identifier 検索パラメータを使用して、診察番号等の識別子によるEncounterの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/Encounter?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Encounter?identifier=http://hl7.org/fhir/sid/jpsys|123456
   ```

   指定された識別子に一致するEncounterリソースを含むBundleを検索する。

#### Operation一覧

JP Encounter リソースに対して使用される操作は次の通りである。

- $everything：[base]/Encounter/[id]/$everything
  - この操作が呼び出された特定のEncounterに関連する全ての情報を返す

#### Operation 詳細

##### $everything 操作

この操作は、この操作が呼び出された特定のEncounterリソースに関連する全ての情報を返す。
応答は "searchset" タイプのBundleリソースである。

この操作の公式なURLは以下である。

```
https://hl7.org/fhir/R4/operation-encounter-everything.html
```

URL: [base]/Encounter/[id]/$everything

本操作は、べき等な操作である。

###### 入力パラメータ

| 名前   | 多重度 | 型      | 説明                                                         |
| ------ | ------ | ------- | ------------------------------------------------------------ |
| _since | 0..1   | instant | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer | Bundleの1ページに含まれるリソース件数を指定。                |

###### 出力パラメータ

| 名前   | 多重度 | 型     | 説明                                                         |
| ------ | ------ | ------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 例

リクエスト：単一のEncounterに関連する全てのリソースを取得する。

```
GET [base]/Encounter/example/$everything
[some headers]
```

レスポンス：指定されたEncounterに関連する全てのリソースを返す。

```
HTTP/1.1 200 OK
[other headers]

{
  "resourceType": "Bundle",
  "id": "p001",
  "meta": {
    "lastUpdated": "2020-01-06T15:11:11.447+00:00"
  },
  "type": "searchset",
  "entry": [
    {
      "fullUrl": "http://example.org/fhir/Encounter/p001",
      "resource": {
        "resourceType": "Encounter",

          ・・・

       },
    }
  ]
}  
```

### サンプル
* [**クリニック来院**][jp-encounter-example-1]

## 注意事項

Encounterリソースは、予定情報や予約の保存には使用されない。予約の保存にはAppointmentリソースを利用すること。FHIRでは、Appointmentは診察の日付を決定するのに利用されるのに対して、Encounterは実際に患者が来院して診察が実施されたことを表現する。
そのため、「計画済み」 status の Encounter は実際に発生する前の Encounter であり、診療行為が完了するまで更新されることが期待される。

## その他、参考文献・リンク等

1. 退院時サマリー規約 [http://www.hl7.jp/library/item/HL7J-CDA-007.pdf](http://www.hl7.jp/library/item/HL7J-CDA-007.pdf)
1. 診療情報提供書規格 [http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf](http://www.hl7.jp/intro/std/HL7J-CDA-005.pdf)
1. 特定健診情報ファイル仕様 [https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000165280.html)
1. SS-MIX2 標準化ストレージ 仕様書 Ver.1.2h [https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf](https://www.jami.jp/jamistd/docs/SS-MIX2/h/SS-MIX2_StndrdStrgSpecVer.1.2h.pdf)
1. ICSR E2B(R3) [https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html](https://www.pmda.go.jp/int-activities/int-harmony/ich/0093.html)

{% include markdown-link-references.md %}