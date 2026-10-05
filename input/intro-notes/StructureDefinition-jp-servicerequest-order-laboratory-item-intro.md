## スコープ

このプロファイルは、検体検査の依頼に含まれる個別の検査項目を表現する。

検査項目の粒度は、JLAC10（または JLAC11）の検査項目単位とする。結果として返される[JP_Observation_LabResult][JP_Observation_LabResult]と同じ粒度である。

## 依頼単位（Order Requesting）との関係

依頼者から見た依頼単位（生化学セットなど）は JP_ServiceRequest_OrderRequesting プロファイル（追加予定）で表現し、検査部門から見た検査項目単位は本プロファイルで表現する。

**JP Core では、依頼単位と個別検査項目との関係付けの方法を規定しない。** 関係付けが必要な場合は、本プロファイルを継承する個別仕様（ユースケースごとの実装ガイド）で定義する。参考までに、FHIR では子（個別検査項目）の `basedOn` から親（依頼単位）を参照する片方向の参照が一般的である。

依頼単位を送信せず、本プロファイルのインスタンスだけを並べて送信してもよい。例えば、依頼単位のコードが施設内のローカルコードしかない場合や、診療報酬上の包括（丸め）のために依頼単位を分解して送信する場合である。

## 依頼から検査結果までの流れ

1. 依頼者が検査を依頼し、個別検査項目ごとに本プロファイルのインスタンスを作成する
2. 検体を採取する。採取済みの検体に対する依頼では `specimen` から[JP_Specimen_Common][JP_Specimen_Common]を参照する。依頼時点で未採取の場合は、Specimen 側から ServiceRequest を参照する
3. 検査結果は[JP_Observation_LabResult][JP_Observation_LabResult]で報告し、その `basedOn` から本プロファイルのインスタンスを参照する

本プロファイルの `code` と JP_Observation_LabResult の `code` に同じコード体系（JLAC10）を使用すると、依頼と結果を突合しやすくなる。

## プロファイル定義

{% include markdown-link-references.md %}
