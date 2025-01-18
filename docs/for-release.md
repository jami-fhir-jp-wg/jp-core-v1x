## リリース時作業

### 計画
* リリースバージョン、リリース目標日を定める
* [マイルストーン](../../../milestones)の作成

## 変更時
* チケット(issues)駆動開発
  * 修正する際は、必ずIssuesよりチケットを作成してから作業を始める
  * Issueは、マイルストーンに紐づける
  * Commit時は、可能な限り対象のIssueを発行し作成する
  * 変更が終わったらIssueをCloseする(クローズに種類があることに注意する)
    * 完了した場合: **Close as complete**
    * 採用せずに終了する場合： **Close as not planed**
  * 修正する時には、エラー・警告を増やさないように努力する
    * 欠陥ゼロの状態（グリーン）を目指す
    * わからない場合はヘルプを求める
  * サブワーキングのレビュー
    * ミスはあることを前提に作業を実施する
    * 最終工程にレビューを組み込む

## リリース前
* 変更漏れのチェック
  * Milestoneに記載されているIssueが投入されているかどうかを確認する
* 変更点の整合性
  * エラー・警告を確認し、対応の必要性高いものに対処する
  * 最終レビューを実施する
    * 同じプロファイルグループと方針が異なっているものがないか
    * 参考（コピー）にしたプロファイルの情報が意図せず残っていないか
    * ベースと同じ定義の上書きや日本語訳のみの修正はないか
    * 派生先に対して必要以上の制約を付けていないか
      * 多重度制限
      * Slicingなしでの固定値の利用
      * Slicingなしでの強制的なバインディング強度の指定
      * ユースケースが定まらないMust Supportの付与
  * 各種ルール（コーディング規約）の準拠
    * FHIR Shorthand記載ルール
    * 文書記載ルール
  * 参照先URLのチェック
    * FHIR URLを参照する際、必ずバージョンを指定する。※指定なしは最新バージョンにページが入れ替わってしまうため。
      * バージョン指定なしは正規表現で洗い出す  ```https:\/\/www\.hl7\.org\/fhir\/(([^Rr])```
    * 自分自身ページを参照する際は、MarkdownLinkを利用する
  * copyrightの確認
    * 許可の取れていないCodeSystemを利用していないこと
    * JP Core定義外で許可が取れているものはCopyrightに追加する
* 説明用資料の更新
  * 新たなプロファイルグループがあった場合にはメニューを追加する
  * プロファイルおよびExtensionが追加があった場合は、リソースグループメニューに追加する
  * Markdownのリンクを更新する
  ``` > ruby ./script/markdownlink_creator.rb```
  * sushi-config.yamlのSpecialUrlsを更新する
  ```> ruby ./script/specialurls_creator.rb```
  * 各Aliasの定義をグループごとにソートする。
* プロファイルの定義情報変更点の確認
  * プロファイルの定義より、**Search Parameter(検索パラメータ)** / **Operation(操作)** 変更がないかを確認する
  * 変更点がFHIR Baseにて定義済であるかを確認する。
  * 未定義の場合は　**Search Parameter(検索パラメータ)** / **Operation(操作)**　の追加を検討する
  * **Capability Statement**にある **Search Parameter(検索パラメータ)** / **Operation(操作)**　との差分を確認に応じて変更する。
* 貢献者リストの更新
  * 変更点について各SWGに確認を依頼する
* 変更履歴
  * Milestoneに紐づく、Issueを元に変更履歴を記載する


* 日付変更
```
正規表現置換
[置換パターン]
([*] \^?date = )"\d{4}-\d{2}-\d{2}"
[置換文字]
$1"yyyy-MM-dd"
```

### リリース作業
* CodeSystem配置
  * 定義されたCode
  

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
  