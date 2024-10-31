本プロファイルは、口腔診査結果の特定の欠損歯の処置後等の状態について、情報の登録や検索、取得のために、FHIR Observationリソースを使用するにあたっての、最低限の制約を記述したものである。 Observation リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- Patientリソースから指定された日時での口腔診査結果の特定の欠損歯の処置後等の状態の参照
- 関連する他のリソース（Observationリソースや、Patientリソース等）の参照

## スコープ

本プロファイルでは上記想定シナリオにて用いられるObservationの用途がスコープであり、特定の欠損歯の処置後等の状態を取り扱う際に、必要な要件を定義している。

## プロファイル定義

{% include markdown-link-references.md %}