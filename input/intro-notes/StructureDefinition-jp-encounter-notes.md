

### 必須要素


次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

#### 必須

Encounter リソースは、次の要素を持たなければならない。

- status ：受診状況を示す。value set encounter-statusで定義された値から設定する必要がある。（planned/arrived/triaged/in-progress/onleave/finished/cancelled/entered-in-error/unknown）
- class : 受診分類を示す。value set ActEncounterCodeで定義された値から設定する必要がある。（AMB/EMER/FLD/HH/IMP/ACUTE/NONAC/OBSENC/PRENC/SS/VR）

#### Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### Extensions定義


JP Encounter リソースで使用される拡張は次の通りである。

- [Associated Encounter](https://www.hl7.org/fhir/extension-encounter-associatedencounter.html)

  - リソースで関連付けを定義しているプロパティが存在しないEncounterを参照するために利用する

    

### 用語定義




| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Encounter.status               | 現在の診療実施状況 | Required          | [EncounterStatus](https://www.hl7.org/fhir/valueset-encounter-status.html) |
| Encounter.statusHistory.status | 現在の診療実施状況 | Required          | [EncounterStatus](https://www.hl7.org/fhir/valueset-encounter-status.html) |
| Encounter.class | 診療実施分類 | Extensible          | [v3.ActEncounterCode](https://www.hl7.org/fhir/v3/ActEncounterCode/vs.html) |
| Encounter.classHistory.class | 過去の診療実施分類 | Extensible          | [v3.ActEncounterCode](https://www.hl7.org/fhir/v3/ActEncounterCode/vs.html) |
| Encounter.type | 診療の種別 | Example | [EncounterType](https://www.hl7.org/fhir/valueset-encounter-type.html) |
| Encounter.serviceType | 特定の診療の種別 | Example | [ServiceType](https://www.hl7.org/fhir/valueset-service-type.html) |
| Encounter.priority | 診療の優先順位 | Example | [v3.ActPriority](https://www.hl7.org/fhir/v3/ActPriority/vs.html) |
| Encounter.participant.type | 診療担当者の役割 | Extensible  | [ParticipantType](https://www.hl7.org/fhir/valueset-encounter-participant-type.html) |
| Encounter.reasonCode | 診療が行われる理由 | Preferred | [EncounterReasonCodes](https://www.hl7.org/fhir/valueset-encounter-reason.html) |
| Encounter.diagnosis.use | 診断の種類 | Preferred | [DiagnosisRole](https://www.hl7.org/fhir/valueset-diagnosis-role.html) |
| Encounter.hospitalization.admitSource | 入院した場所 | Preferred | [AdmitSource](https://www.hl7.org/fhir/valueset-encounter-admit-source.html) |
| Encounter.hospitalization.reAdmission | 再入院した理由 | Example | [v2.0092](https://www.hl7.org/fhir/v2/0092/index.html) |
| Encounter.hospitalization.dietPreference | 食事の事情 | Example |  [Diet](https://www.hl7.org/fhir/valueset-encounter-diet.html) |
| Encounter.hospitalization.specialCourtesy | 特別な作法 | Preferred |  [SpecialCourtesy](https://www.hl7.org/fhir/valueset-encounter-special-courtesy.html) |
| Encounter.hospitalization.specialArrangement | 特別待遇 | Preferred | [SpecialArrangements](https://www.hl7.org/fhir/valueset-encounter-special-arrangements.html) |
| Encounter.hospitalization.dischargeDisposition | 退院の判断 | Example | [DischargeDisposition](https://www.hl7.org/fhir/valueset-encounter-discharge-disposition.html) |
| Encounter.location.status | 場所の状態 | Required | [EncounterLocationStatus](https://www.hl7.org/fhir/valueset-encounter-location-status.html) |
| Encounter.location.physicalType | 実際の場所 | Example | [LocationType](https://www.hl7.org/fhir/valueset-location-physical-type.html) |



### 制約一覧

このプロファイルでは制約定義は行っていない。


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
| SHALL            | patient    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/us-npi\|123456  |
| SHALL            | date, patient    | token  | GET [base]/Encounter?date=http://hl7.org/fhir/sid/us-npi\20210415?patient=http://hl7.org/fhir/sid/us-npi\|123456  |
| SHOULD           | identifier    | token  | GET [base]/Encounter?identifier=http://hl7.org/fhir/sid/us-npi\|123456 |
| SHOULD           | class, patient    | token  | GET [base]/Encounter?class=http://hl7.org/fhir/sid/us-npi\EMER?patient=http://hl7.org/fhir/sid/us-npi\|123456  |
| SHOULD           | patient, type    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/us-npi\|123456?type=http://hl7.org/fhir/sid/us-npi\ADMS  |
| SHOULD           | patient, status    | token  | GET [base]/Encounter?patient=http://hl7.org/fhir/sid/us-npi\|123456?status=http://hl7.org/fhir/sid/us-npi\arrived  |

<span style="color: red;">★★コメント： この表に合致する形で以下の説明を記載していく必要があります。★★</span>

##### 必須検索パラメータ

次の検索パラメータはでサポートされるべきである。(SHALL)

必須検索パラメータ(SHALL)はありません。

##### 推奨検索パラメータ


次の検索パラメータをサポートすることが望ましい。(SHOULD)

1. identifier 検索パラメータを使用して、診察番号等の識別子によるEncounterの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Encounter?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/Encounter?identifier=http://hl7.org/fhir/sid/us-npi|123456
   ```

   指定された識別子に一致するEncounterリソースを含むBundleを検索する。
   

##### 追加検索パラメータ 

オプションとして次の検索パラメータをサポートすることができる。(MAY)

オプション検索パラメータ(MAY)はありません。

#### Operation一覧


JP Encounter リソースに対して使用される操作は次の通りである。

- $everything：[base]/Encounter/[id]/$everything

  - この操作が呼び出された特定のEncounterに関連する全ての情報を返す。
    

#### Operation 詳細

##### $everything 操作

この操作は、この操作が呼び出された特定のEncounterリソースに関連する全ての情報を返す。
応答は "searchset" タイプのBundleリソースである。

この操作の公式なURLは以下である。

```
http://hl7.org/fhir/OperationDefinition/Encounter-everything
```

URL: [base]/Encounter/[id]/$everything

本操作は、べき等な操作である。


###### 入力パラメータ
<!--
<span style="color: red;">http://www.hl7.org/fhir/encounter-operation-everything.html</span>
-->
| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |


###### 出力パラメータ
<!--
<span style="color: red;">http://www.hl7.org/fhir/encounter-operation-everything.html</span>
-->
| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |




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


```JSON
{
  "resourceType": "Encounter",
  "id": "587293",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2020-01-06T15:11:11.447+00:00",
    "source": "#tK0UvlqmgxxHWOc2"
  },
  "status": "finished",
  "class": {
    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code": "AMB"
  },
  "type": [ {
    "coding": [ {
      "system": "http://snomed.info/sct",
      "code": "410620009",
      "display": "Well child visit (procedure)"
    } ],
    "text": "Well child visit (procedure)"
  } ],
  "subject": {
    "reference": "Patient/587224",
    "display": "Jonathan639 Kassulke119"
  },
  "participant": [ {
    "individual": {
      "reference": "Practitioner/587226",
      "display": "Dr. Shirely692 Berge125"
    }
  } ],
  "period": {
    "start": "2016-05-08T03:08:24+02:00",
    "end": "2016-05-08T03:23:24+02:00"
  },
  "serviceProvider": {
    "reference": "Organization/587225",
    "display": "PCP15810"
  }
}
```



## 注意事項

Encounterリソースは、予定情報や予約の保存には使用されません。予約の保存にはAppointmentリソースを利用してください。FHIRでは、Appointmentは診察の日付を決定するのに利用されるのに対して、Encounterは実際に患者が来院して診察が実施されたことを表現します。
そのため、「計画済み」 status の Encounter は実際に発生する前の Encounter であり、診療行為が完了するまで更新されることが期待されます。


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