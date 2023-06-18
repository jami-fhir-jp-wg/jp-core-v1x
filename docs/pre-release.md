## 準備作業

* CodeSystemの定義箇所
  * JP Core以外で用語は原則Terminology Serverに移動する

* エラー・警告確認  
qa.htmlを確認し、問題箇所を確認する。原則エラーおよび警告はゼロにする。

* CapabilityStatementの編集  
プロファイルや検索例に変更があった場合に見直しを行なう。
  * SupportedProfileの追加
  * 検索パラメータの追加有無

* リンク先不正のチェック  
下記のような不正リンク先がないかを最終チェックする
  * バージョン指定なしのリンク  
```
正規表現
https://www\.hl7\.org/fhir/^(R4)
```
  * 公開先フォルダの参照  
https://jpfhir.jp/fhir/
  * GitHubPagesの参照  
https://github

* 語尾チェック
  * ます。です。ました。

* 更新履歴
  * git diffより差分情報を確認
  * 更新履歴に反映する

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
    * 最新版 → 公開バージョンに移動
    * 最新版devのバージョン振替
    * 公開版バージョンの付け替え

* githubのpackage公開