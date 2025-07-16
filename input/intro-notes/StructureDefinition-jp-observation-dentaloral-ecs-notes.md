### 必須要素
本プロファイルでは、次の要素を持たなければならない。

- status : 診療情報提供書の進捗は必須とする
- category : このリソースが示す診療情報提供書を分類するための区分であり、必須とする
- code : ポートの名前/コードとして 57133-1 を指定する
- (Extension) bodySiteStatus : 特定の状態を示さない 0 を指定する
- (Extension) bodystructure : このリソースが示す診療情報提供書用の項目が、どの複数の部位（特定の歯）の情報かを示すため、必須とする
- subject : このリソースが示す診療情報提供書用に、複数の部位が同一の疾患を有していたり、複数部位からなる疾患が存在した際に、複数の部位を表現することのできるプロファイルの項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする


### Extensions定義
本プロファイルでは、以下の要素を拡張する
- bodySiteStatus : 特定の状態を示さない 0 を指定する（標準歯式コード仕様の5桁目であるが、歯式にも関わらず状態を示すコードのため、状態なしである 0 を選択する）
- includedStructure : 複数の『歯』を繰り返し表現するため、このelementで示す

<!--

### 制約一覧

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

#### Operation一覧
-->
### サンプル
 [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)の記載例１１（歯冠破折２本）を参考にサンプルデータを作成した。

* [**口腔診査結果（診療情報提供書用）**][jp-observation-dentaloral-ecs-example]

## その他、参考文献、リンク等
- [公益社団法人 日本歯科医師会 「口腔診査情報標準コード仕様 Ver.1.02」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02.pdf)
- [公益社団法人 日本歯科医師会 「口腔状態モデルケースとコード化例」（2023年3月）](https://www.jda.or.jp/dentist/program/pdf/Oral-examination-Information-Standard-Code_v1.02-proportional.pdf)


{% include markdown-link-references.md %}

