## このプロファイルで追加した制約

基本プロファイルである[JP Core ServiceRequest Common プロファイル][JP_ServiceRequest_Common]に対して、次の制約を追加している。

| 要素 | 制約 | 理由 |
| --- | --- | --- |
| identifier | 1.. | 検査項目単位で一意に識別する必要があるため |
| category | 1.. かつ laboratory スライス 1..1 | 検体検査の依頼であることを判別できるようにするため。[JP_Observation_LabResult][JP_Observation_LabResult]の category と揃えている |
| intent | order 固定 | intent はオーダの種類を表す要素であり、依頼単位と検査項目の区別には使わないため |
| code | 1.. | 依頼内容を示さないサービスリクエストは意味をなさないため |
| code | `JP_ObservationLabResultCode_VS`（preferred） | [JP_Observation_LabResult][JP_Observation_LabResult]の code と同じ値セットを使用し、依頼と結果を突合しやすくするため |
| code.coding | 1.. | 標準コードまたはローカルコードのいずれかは必ず設定するため。[JP_Observation_LabResult][JP_Observation_LabResult]と揃えている |
| code.text | 1.. | 標準コードとローカルコードで表示名が異なる場合があり、共通の表示名が必要なため |
| subject | 1.. かつ Reference([JP_Patient][JP_Patient]) のみ | 検体検査の対象は患者に限られるため |

## 主な要素の指定方法

| 要素 | 指定方法 |
| --- | --- |
| identifier | 依頼オーダ番号に検査項目を識別する情報を組み合わせる。[JP_Observation_LabResult][JP_Observation_LabResult]の identifier の生成規則を参考にする |
| status | 依頼が確定していれば `active`。取消は `revoked`、完了は `completed` |
| intent | `order` |
| category | [JP Core Simple Observation Category CodeSystem][JP_SimpleObservationCategory_CS]の `laboratory`。施設固有の区分を追加してもよい |
| priority | 下表を参照 |
| code | JLAC10（または JLAC11）とローカルコード。いずれか一方は必須 |
| code.text | 検査項目の名称（「γ-GTP」など） |
| subject | 対象患者（[JP_Patient][JP_Patient]） |
| encounter | 依頼時の受診（入院・外来の区別、診療科など） |
| occurrence[x] | 検体採取の予定日時。未定なら設定せず、決まった時点で更新する |
| authoredOn | 依頼日時 |
| requester | 依頼者（依頼医など） |
| performerType | 検査を実施する部門や職種（「検体検査部門」など） |
| performer | 検査を実施する組織や担当者。外注検査の委託先など |
| reasonCode | 検査目的と依頼病名。検査目的は `text` に、依頼病名はコードがあれば `coding` に、なければ `text` に設定する |
| reasonReference | 依頼病名を[JP_Condition][JP_Condition]として参照できる場合に使用する。同じ理由を reasonCode と重複して設定しない |
| insurance | 適用する保険（[JP_Coverage][JP_Coverage]） |
| supportingInfo | 検査の実施や結果の解釈に必要な患者情報（身長、体重、採取時の状態など）への参照 |
| specimen | 採取済みの検体に対する依頼の場合のみ、[JP_Specimen_Common][JP_Specimen_Common]を参照する |
| note | 検査部門への連絡事項など、他の要素で表現できない依頼コメント |

### priority（緊急度）

priority の値セット（[RequestPriority](http://hl7.org/fhir/R4/valueset-request-priority.html)）は binding が required のため、値は変更できない。HL7 v2 と同じ体系である。日本の運用との対応は次を目安とする。

| 値 | 日本の運用 | 補足 |
| --- | --- | --- |
| routine | 通常 | 省略時は routine とみなす |
| urgent | 至急 | |
| asap | ― | urgent より優先し、stat ほどではない依頼。該当する運用がない場合は使用しなくてよい |
| stat | 緊急 | 最優先で実施する |

## 記述例について

このプロファイルの記述例は、次の 2 つの意図で用意している。

| 記述例 | 意図 |
| --- | --- |
| [個別検査項目（γ-GTP）](ServiceRequest-jp-servicerequest-order-laboratory-item-example-1.html) | 最低限のサンプル。必須要素（1..1、1..*）のみを設定している |
| [個別検査項目（クレアチニン）](ServiceRequest-jp-servicerequest-order-laboratory-item-example-2.html) | 項目を付加したサンプル。必須要素に加え、検体検査の依頼で使用する任意要素も設定している |

2 つの例の違いは設定する要素の範囲であり、検査項目の違いに意味はない。「γ-GTP は前者のとおりに、クレアチニンは後者のとおりに記述しなければならない」という意味ではない。項目を付加したサンプルは、すべての要素の設定を求めるものでもない。

項目を付加したサンプルでも、`basedOn` と `requisition`（依頼単位との関係付けを JP Core で規定しないため）、`bodySite`（通常は使用しないため）、`supportingInfo` は設定していない。

## 補足

- 検索パラメータは[JP Core ServiceRequest Common プロファイル][JP_ServiceRequest_Common]と共通である
- 依頼単位との関係付けは JP Core では規定しない。`basedOn` による参照は、個別仕様で用いる場合の参考例にとどまる

{% include markdown-link-references.md %}
{% include external-link-reference.md %}
