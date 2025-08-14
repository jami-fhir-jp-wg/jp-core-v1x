このプロファイルはObservationリソースに対して、病理診断による観察結果を記録、検索、および取得するために、Observationリソースを使用する際の、最低限の制約を記述したものである。Observationリソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 病理診断の結果（組織診断、細胞診断）の保存
- Patientリソースから指定された日時、期間の、病理診断に対して記述された観察結果の参照
- 病理診断の所見の条件に合致する症例の参照
- 病理診断による最終診断の記録
- 肉眼所見、組織所見、特殊染色所見の記録
- 免疫組織化学所見の記録

## スコープ

本プロファイルでは上記想定シナリオにて用いられるObservationの用途がスコープであり、病理診断による観察結果を取り扱う際に必要な要件を定義している。

病理診断では診断の他に様々な所見が記述されるが、これらは個別のObservationリソースとして表現される。したがって、原則として検査レポート本体に相当するJP Core DiagnosticReport Pathologyの.resultエレメントには以下のような観察結果を表すJP Core Observation Pathologyが含まれることになる：

- 最終診断（Final Diagnosis）
- 肉眼所見（Gross Findings）
- 組織所見（Microscopic Findings）
- 特殊染色所見（Special Stain Findings）
- 免疫組織化学所見（Immunohistochemistry Findings）

具体的には.hasMemberエレメントに対して関連する下位の本プロファイルを適用したObservationリソースを関連づけることでグルーピングを行う。

JP Core DiagnosticReport Pathologyを用いて、病理診断レポートを表現する事例を以下に示す。

病理診断レポートにおいて、診断情報は検体単位（1検体－1レコード）で記載することが望ましい。そのため検査レポート本体に相当するJP Core DiagnosticReport Pathology（第0層）に対し、

- 第1層：「最終診断」
- 第2層：「肉眼所見」、「組織所見」、「特殊染色所見」、「免疫組織化学所見」

という情報要素を表現する本プロファイルを適用したObservationリソースを用意する。

### 例

| 層 | 内容 |
| ---- | ----|
| 第1層 | 最終診断：Adenocarcinoma, moderately differentiated |
| 第2層 | 肉眼所見：腫瘤は境界明瞭で、割面は白色充実性 |
| | 組織所見：腺管構造を示す中分化型腺癌 |
| | 特殊染色：PAS染色陽性 |
| | 免疫組織化学：CK7陽性、CK20陰性 |

<!-- 
![](observation_pathology_structure.png) -->
<img src="observation_pathology_structure.png" width="100%" alt="病理診断レポートと病理所見のデータ構造"/>

## プロファイル定義

[プロファイル定義を参照][JP_Observation_Pathology]
