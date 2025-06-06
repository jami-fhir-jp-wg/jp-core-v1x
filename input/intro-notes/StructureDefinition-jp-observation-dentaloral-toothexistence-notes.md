### 必須要素
本プロファイルでは、次の要素を持たなければならない。

- status : 口腔診査の進捗は必須とする
- category : このリソースが示す口腔診査の結果の特定の歯の有無を分類するための区分であり、必須とする
- code : Observation タイプ（歯の有・無）を示すため必須とする
- bodysite : 口腔診査の結果の特定の歯の位置を示すため必須とする
- subject : このリソースが示す口腔診査結果項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする

### Extensions定義
本プロファイルでは、以下の要素を拡張する。
- BodySiteStatus : 歯の状態を示す。例：『インプラント』、『その他の生体構造体』　※ 『有』、『無』、『未検査』以外が選択された場合の第二階層は将来の検討対象

### 制約一覧
本プロファイル特有の制約はない。

<!--
## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

#### Operation一覧
-->

### サンプル
 [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)の記載例１を参考にサンプルデータを作成した。

* [**検査結果1（歯の有無）**][jp-observation-dentaloral-toothexistence-example-1]  
* [**検査結果2（歯の有無）**][jp-observation-dentaloral-toothexistence-example-2]
* [**検査結果3（歯の有無）**][jp-observation-dentaloral-toothexistence-example-3]

## その他、参考文献、リンク等
- [公益社団法人 日本歯科医師会 「口腔診査情報標準コード仕様 Ver.1.02」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02.pdf)
- [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)
{% include markdown-link-references.md %}
