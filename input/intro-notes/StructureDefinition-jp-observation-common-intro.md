## 背景および想定シナリオ
Observationリソースに対する主な用途は以下の通り。
- 体重、血圧、体温などのバイタルサイン
- 血糖値や推定GFRなどの検体検査結果
- 骨密度や胎児測定値などの画像検査結果
- 腹部圧痛などの臨床所見（※）
- 目の色など、個人的な特徴
- 喫煙歴、社会歴、家族支援、認知状態など

※ 臨床所見と疾患の境界は、医療オントロジの課題となる。一般的なガイドについては、[Observationリソースの境界](https://www.hl7.org/fhir/R4/observation.html#bnr)および[Conditionリソースの境界](https://www.hl7.org/fhir/R4/condition.html#bnr)のセクションを参照のこと。

## スコープ
Observation（検査、観察）はヘルスケアの中心的な要素であり、診断の補助、進行状況のモニタリング、基準とパターンの決定、人口統計的特性の把握に使用される。ほとんどのObservationは、メタデータを含む単純な名前/値のペアとなる。一部のObservationは、他のObservationを論理的にグループ化したり、複数の要素から構成される場合もある。

DiagnosticReport（検査レポート）リソースは一連の検査の臨床/ワークフローの文脈を定義する。ObservationリソースはDiagnosticReportから参照されることで、検査、画像、その他の臨床および診断データから表現されるレポートを形作る。

## プロファイル定義

{% include markdown-link-references.md %}