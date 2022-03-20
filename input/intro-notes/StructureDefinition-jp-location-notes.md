
### 必須要素

JP Core Location リソースで定義された必須要素は特にありません。



  

### Extensions定義


JP Core Location リソースで定義された拡張は特にありません。


    

### 用語定義




| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| Location.status | 所在場所のステータス | Required          | [LocationStatus](http://hl7.org/fhir/valueset-location-status.html) |
| Location.operationalStatus | 所在場所の運用ステータス（通常、ベッド/部屋のみ） | Preferred          | [v2 BED STATUS](http://hl7.org/fhir/v2/0116/index.html) |
| Location.mode | リソースインスタンスが特定の場所を表すか、場所のクラスを表すかを示すモード | Required          | [LocationMode](http://hl7.org/fhir/valueset-location-mode.html) |
| Location.type | 実行される機能のタイプ | Extensible          | [V3 Value SetServiceDeliveryLocationRoleType](http://hl7.org/fhir/v3/ServiceDeliveryLocationRoleType/vs.html) |
| Location.physicalType | 所在場所の物理的な形、例えば建物、部屋、車両、道路 | Example          | [Location type](http://hl7.org/fhir/valueset-location-physical-type.html) |
| Location.hoursOfOperation.daysOfWeek | 開始時刻と終了時刻の間に利用可能な曜日 | Required          | [DaysOfWeek](http://hl7.org/fhir/valueset-days-of-week.html) |



### 制約一覧

制約はありません。



## 利用方法

### インタラクション一覧

<span style="color: red;">★★コメント ： 説明のための例示です。内容の妥当性は考慮していません。★★</span>



| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |



### OperationおよびSearch Parameter 一覧



<span style="color: red;">★★コメント ： サンプルを例示します。説明のための例示であり内容の妥当性は考慮していません。表の形式はテンプレートにあわせましたが、Search Parameter については、US-Coreを参考に、下に書いたような説明や例を追加したため、一覧の表は不要ではないでしょうか。US-Coreにも一覧表はありません。★★</span>





#### Search Parameter一覧



| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | name    | string  | GET [base]/Location?name=３南 |
| SHALL            | address          | string | GET [base]/Location?address=〒113-0033東京都文京区本郷７丁目３−１                            |
| SHOULD           | address-city | stringn  | GET [base]/Location?address-city=文京区    |
| SHOULD           | 
address-state | stringn  | GET [base]/Location?
address-state=東京都    |
| SHOULD           | address-postalcode | stringn  | GET [base]/Location?address-postalcode=1130033    |





##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/Location?name=[string]
   ```

   例：

   ```
   GET [base]/Location?name=３南
   ```

   名前が一致するLocationリソースを含むBundleを取得する。

   

2. address 検索パラメータを使用して、住所テキストによる文字列検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/Location?address=[string]
   ```

   例：

   ```
   GET [base]/Location?address=〒113-0033東京都文京区本郷７丁目３−１
   ```

   住所文字列が一致するLocationリソースを含むBundleを取得する。

   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. address-city 検索パラメータを使用して、住所の市町村名によるLocationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Location?address-city=[string]
   ```

   例：

   ```
   GET [base]/Location?address-city=文京区
   ```

   指定された住所の市町村名が一致するLocationリソースを含むBundleを取得する。


2. address-state 検索パラメータを使用して、住所の都道府県名によるLocationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Location?address-state=[string]
   ```

   例：

   ```
   GET [base]/Location?address-state=東京都
   ```

   指定された住所の都道府県名が一致するLocationリソースを含むBundleを取得する。


3. address-postalcode 検索パラメータを使用して、住所の郵便番号によるLocationの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/Location?address-postalcode=[string]
   ```

   例：

   ```
   GET [base]/Location?address-postalcode=1130033
   ```

   指定された住所の郵便番号が一致するLocationリソースを含むBundleを取得する。



##### 追加検索パラメータ 

追加検索パラメータはありません。



#### Operation一覧

Locationに対するOperationは定義されていません。



### サンプル




```JSON
{
  "resourceType": "Location",
  "id": "2",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">バーガー緊急医療センター, 南ウィング, 2階, 神経放射線科　手術室　1</div>"
  },
  "identifier": [
    {
      "value": "B1-S.F2.1.00"
    }
  ],
  "status": "suspended",
  "operationalStatus": {
    "system": "http://terminology.hl7.org/CodeSystem/v2-0116",
    "code": "H",
    "display": "清掃中"
  },
  "name": "南ウィング　神経放射線科　手術室1",
  "alias": [
    "南ウィング　神経放射線科　手術室5",
    "メインウィング　神経放射線科　手術室2"
  ],
  "description": "Old South Wing, Neuro Radiology Operation Room 1 on second floor",
  "mode": "instance",
  "type": [
    {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
          "code": "RNEU",
          "display": "神経放射線科ユニット"
        }
      ]
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "2329"
    }
  ],
  "physicalType": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code": "ro",
        "display": "部屋"
      }
    ]
  },
  "managingOrganization": {
    "reference": "Organization/f001"
  },
  "partOf": {
    "reference": "Location/1"
  }
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


