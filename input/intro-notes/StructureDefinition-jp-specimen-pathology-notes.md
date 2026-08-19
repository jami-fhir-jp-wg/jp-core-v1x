### 必須要素

本プロファイルで明示的に必須として定義されたルート要素はない。

### Extensions定義

本プロファイルで追加定義された拡張はない。

## 利用方法

##### 必須検索パラメータ

本プロファイルで必須として定義された検索パラメータはない。

##### 推奨検索パラメータ

本プロファイルで推奨として定義された検索パラメータはない。

##### 追加検索パラメータ

本プロファイルで追加定義された検索パラメータはない。

#### Operation一覧

本プロファイルで追加定義されたOperationはない。

#### Operation 詳細

本プロファイルで追加定義されたOperationはない。

## 注意事項

本プロファイルは、病理診断レポートにおいて臓器そのものを表現する
検体情報を送受信するために使用する。

- identifierには、オーダ側、すなわち依頼元が発番した検体識別番号を指定する。
- accessionIdentifierには、病理検査側で発番した検体識別番号を指定する。
- statusには、検体の利用可能性を指定する。
- typeには、検査材料を指定する。
- subjectは、検体採取した患者を表すJP_Patientリソースを参照する。
- receivedTimeには、検体の受付日時を指定する。
- parentは使用しない。
- requestには、病理検査依頼元を示すServiceRequestリソースを参照する。
- collectionには、検体採取に関する詳細情報を指定する。
- collection.collectorには、検体採取した人を指定する。
- collection.collected[x]はdateTime型で指定する。
- collection.durationには、検体採取期間を指定する。
- collection.quantityには、検体量を指定する。
- collection.methodには、採取方法を指定する。
- collection.bodySiteには、検体部位を指定する。
- collection.fastingStatus[x]は使用しない。
- processingは使用しない。
- containerは使用しない。
- conditionは使用しない。
- noteには、検体に関する特記事項を記載する。

## その他、参考文献・リンク等

{% include markdown-link-references.md %}
{% include external-link-reference.md %}
