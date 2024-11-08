### 必須要素
本プロファイルでは、次の要素を持たなければならない。

- status︓口腔診査の進捗は必須とする
- category︓このリソースが示す口腔診査の結果の特定の歯の有無を分類するための区分であり、必須とする
- code︓ Observation タイプ（歯の有・無）を示すため必須とする
- bodysite︓口腔診査の結果の特定の歯の位置を示すため必須とする
- subject︓このリソースが示す口腔診査結果項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする

### Extensions定義
本プロファイルでは、以下の要素を拡張する。
- BodySiteStatus：歯の状態を示す。例：『インプラント』、『その他の生体構造体』　※ 『有』、『無』、『未検査』以外が選択された場合の第二階層は将来の検討対象

### 制約一覧
本プロファイルでは、以下の制約を満たさなければならない。

- hasMember要素は、value要素で『未検査』が選択された場合、選択できない。`code.coding.where(code = '未検査').exists() implies hasMember.empty()`

<!--
## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

#### Operation一覧

### サンプル

## その他、参考文献、リンク等
-->

{% include markdown-link-references.md %}
