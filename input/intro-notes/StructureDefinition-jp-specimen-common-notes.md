### 必須要素

検体を一意に識別し、検査結果と関連づけるためには、実運用上、次の項目の記述が推奨される。

- identifier: 施設内で検体を一意に識別する外部識別子
- accessionIdentifier: 検査部門で採番された識別子
- status: 検体の状態
- type: 検査材料の種類
- subject: 検体の由来（通常は患者への参照）
- receivedTime: 検体を受領した、または処理を開始した日時
- collection.collected[x]: 検体採取日時

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token      | GET [base]/Specimen?identifier=http://myhospital.com/fhir/specimen\|123 |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（**SHALL**）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりSpecimenを検索

   ```
   GET [base]/Specimen?identifier={system|}[token]
   ```
   例：
   ```
   GET [base]/Specimen?identifier=http://myhospital.com/fhir/specimen|123
   ```

   指定された識別子に一致するSpecimenリソースを含むBundleを検索する。

##### 推奨検索パラメータ

本プロファイルでサポートが推奨される（SHOULD）検索パラメータはない。

##### 追加検索パラメータ

本プロファイルでオプションとしてサポートすることができる（MAY）検索パラメータは定義していない。なお、FHIR R4 の Specimen が定義する基底検索パラメータについては[Specimen - Search Parameters](http://hl7.org/fhir/R4/specimen.html#search)を参照のこと。

##### オプション検索パラメータ

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**検体材料（血液）**][jp-specimen-example-2]
* [**検体材料（尿）**][jp-specimen-example-1]
* [**検体材料（喀痰）**][jp-specimen-example-3]

## 注意事項

- 本プロファイルはFHIR US Core R4を基本としている。FHIR US Core R5ではContainerの構造が変わるため、将来 JP Coreの基本となるUS Coreバージョンが変わった際は注意が必要である。

{% include markdown-link-references.md %}
