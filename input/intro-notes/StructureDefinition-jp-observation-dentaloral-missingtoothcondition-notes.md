### 必須要素
本プロファイルでは、次の要素を持たなければならない。

- status : 口腔診査の進捗は必須とする
- category : このリソースが示す口腔診査の結果の欠損歯の処置状態を分類するための区分であり、必須とする
- code : Observation タイプ（欠損歯の処置状態）を示すため必須とする
- bodysite : 口腔診査の結果の特定の歯の位置を示すため必須とする
- subject : このリソースが示す口腔診査結果項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする

### Extensions定義
本プロファイル特有の拡張はない。

### 制約一覧
本プロファイルでは、以下の制約を満たさなければならない。

- hasMember要素は選択できない。`hasMember.empty()`

<!--
## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

#### Operation一覧
### サンプル
 [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)の記載例１を参考にサンプルデータを作成した。

* [**検査結果（欠損歯の処置状態）**][jp-observation-dentaloral-missingtoothtreatmentcondition-example-1]  
-->

## その他、参考文献、リンク等
- [公益社団法人 日本歯科医師会 「口腔診査情報標準コード仕様 Ver.1.02」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02.pdf)
- [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)

{% include markdown-link-references.md %}
