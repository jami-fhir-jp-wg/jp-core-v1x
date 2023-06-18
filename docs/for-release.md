## リリース時作業

### 計画
* リリースバージョン、リリース目標日を定める
* 修正対象のFIFX
* ソースFIX時期の決定

### 事前作用
* 変更点がソースに反映しているかを確認する
* エラー・警告確認  
qa.htmlを確認し問題点を解決する、原則エラーおよび警告はゼロにする
 

* CapabilityStatementの編集  
プロファイルや検索例に変更があった場合に見直しを行なう
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

### リリース作業
* CodeSystemの定義
  * JP Core以外の用語はTerminology Serverに移動への移動を検討する

* リリース関連ファイル修正
  * sushi-config.yaml  
  日付とバージョン
  * GitHub Actionファイルの修正
    * workflows/develop.yaml
    * workflows/main.yaml
  * パッケージファイルの修正
    * forPackageRelease/package.json
  * History用ホームページの修正
    * other/index.html
      * 最新版 → 公開バージョンに移動
      * 最新版devのバージョン振替
      * 公開版バージョンの付け替え

* Releaseブランチの作成
  
* mainブランチにマージ

### 公開作業
* githubのpackageとして公開
* simplefier.net上に公開
  