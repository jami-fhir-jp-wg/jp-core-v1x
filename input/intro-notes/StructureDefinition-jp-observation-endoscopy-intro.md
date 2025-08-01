このプロファイルはObservationリソースに対して、内視鏡を使用して実施された検査のデータを送受信するための制約と拡張を定めたものである。
本プロファイルは、内視鏡を使用して実施された検査、治療の観察結果を記録、検索、および取得するために、Observationリソースを使用する際の、最低限の制約を記述したものである。Observationリソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- Patientリソースから指定された日時、期間の、内視鏡検査、治療による観察結果(診断、所見)の参照
- 内視鏡検査、治療による観察結果(診断、所見)の条件に合致する症例、または関連する他のリソース（Patientリソース、Observationリソース、Procedureリソース等）の参照

## スコープ

本プロファイルでは上記想定シナリオにて用いられるObservationの用途がスコープであり、特に内視鏡検査、治療による観察結果を取り扱う際に必要な要件を定義している。
内視鏡による観察結果を病変単位で表現するために、一つの情報項目を表現するObservationリソースを必要な情報項目数分用意し、それらを1つにグルーピングして扱う。
具体的には.hasMemberエレメントに対して関連する下位の本プロファイルを適用したObservationリソースを関連づけることでグルーピングを行う。
JP Core DiagnosticReport Endoscopyを用いて、大腸内視鏡検査レポートを表現する事例を以下に示す。
内視鏡検査レポートにおいて、診断情報は病変単位（1病変ー1レコード）で記載することが望まれている。
そのため検査レポート本体に相当するJP Core DiagnosticReport Endoscopy（第0層）に対し、

- 第1層 : 「病変単位の質的診断」
- 第2層 : 「病変単位の所見」

という情報要素を表現する本プロファイルを適用したObservationリソースを用意する。

### 例

| 病変 | 層 | 内容 |
| --- | ---- | ----| 
| 病変1 |  |  |
| |第1層|質的診断：腺腫|
| |第2層|所見1：大きさ 内視鏡的長径 4mm|
| ||所見2：肉眼型Is（無茎型）|
| 病変2 |  |  |
| |第1層|質的診断：鋸歯状病変 hyperplastic polyp|
| |第2層|所見1：大きさ 内視鏡的長径 5mm|
| ||所見2：肉眼型IIa（表面隆起型）|

<!-- 
![](observation_endoscopy_structure.png) -->
<img src="observation_endoscopy_structure.png" width="100%" alt="内視鏡Observationの構造"/>

## プロファイル定義

{% include markdown-link-references.md %}