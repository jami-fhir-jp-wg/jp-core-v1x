## このプロファイルで追加した制約

基本プロファイルである[JP Core ServiceRequest Common プロファイル][JP_ServiceRequest_Common]に対して、次の制約を追加している。

| 要素 | 制約 | 理由 |
| --- | --- | --- |
| identifier | 1.. | 検査項目単位で一意に識別する必要があるため |
| intent | order 固定 | intent はオーダの種類を表す要素であり、依頼単位と検査項目の区別には使わないため |
| code | 1.. | 依頼内容を示さないサービスリクエストは意味をなさないため |
| code.text | 1.. | 標準コードとローカルコードで表示名が異なる場合があり、共通の表示名が必要なため |
| subject | 1.. かつ Reference([JP_Patient][JP_Patient]) のみ | 検体検査の対象は患者に限られるため |

## 主な要素の指定方法

| 要素 | 指定方法 |
| --- | --- |
| identifier | 依頼オーダ番号に検査項目を識別する情報を組み合わせる。[JP_Observation_LabResult][JP_Observation_LabResult]の identifier の生成規則を参考にする |
| status | 依頼が確定していれば `active`。取消は `revoked`、完了は `completed` |
| intent | `order` |
| priority | 下表を参照 |
| code | JLAC10（または JLAC11）とローカルコード。いずれか一方は必須 |
| code.text | 検査項目の名称（「γ-GTP」など） |
| subject | 対象患者（[JP_Patient][JP_Patient]） |
| occurrence[x] | 検体採取の予定日時。未定なら設定せず、決まった時点で更新する |
| specimen | 採取済みの検体に対する依頼の場合のみ、[JP_Specimen_Common][JP_Specimen_Common]を参照する |

### priority（緊急度）

priority の値セット（[RequestPriority](http://hl7.org/fhir/R4/valueset-request-priority.html)）は binding が required のため、値は変更できない。HL7 v2 と同じ体系である。日本の運用との対応は次を目安とする。

| 値 | 日本の運用 | 補足 |
| --- | --- | --- |
| routine | 通常 | 省略時は routine とみなす |
| urgent | 至急 | |
| asap | ― | urgent より優先し、stat ほどではない依頼。該当する運用がない場合は使用しなくてよい |
| stat | 緊急 | 最優先で実施する |

## 補足

- 検索パラメータは[JP Core ServiceRequest Common プロファイル][JP_ServiceRequest_Common]と共通である
- 依頼単位との関係付けは JP Core では規定しない。`basedOn` による参照は、個別仕様で用いる場合の参考例にとどまる

{% include markdown-link-references.md %}
