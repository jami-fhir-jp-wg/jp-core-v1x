## 準備作業

* CapabilityStatementの編集
  * 追加プロファイル
  * 検索パラメータの追加有無

* 更新履歴
  * 差分表示ソフト比較
  * 更新履歴編集

* 日付変更
```
正規表現置換
[置換パターン]
([*] \^?date = )"\d{4}-\d{2}-\d{2}"
[置換文字]
$1"yyyy-MM-dd"
```

* リリース関連ファイル修正
  * sushi-config.yaml  
  日付とバージョン
  * workflows/develop.yaml
  * workflows/main.yaml
  * forPackageRelease/package.json
  * other/index.html
