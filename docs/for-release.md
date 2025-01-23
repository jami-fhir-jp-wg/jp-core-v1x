# リリース作業

## 計画
* リリースバージョン、リリース目標日を定める
* [マイルストーン](../../../milestones)の作成


## 変更時
### 1. チケット(issues)駆動開発
* 修正する際は、必ずIssuesよりチケットを作成してから作業を始める
* Issueは、マイルストーンに紐づける
* Commit時は、可能な限り対象のIssueを発行し作成する
* 変更が終わったらIssueをCloseする(クローズに種類があることに注意する)
  * 完了した場合: **Close as complete**
  * 採用せずに終了する場合： **Close as not planed**
### 2. 修正する時には、エラー・警告を増やさないように努力する
* 欠陥ゼロの状態（グリーン）を目指す
* わからない場合はヘルプを求める
### 3. サブワーキングのレビュー
* ミスはあることを前提に作業を実施する
* 最終工程にレビューを組み込む

## リリース前
### 1. 変更漏れのチェック
* Milestoneに記載されているIssueが投入されているかどうかを確認する
### 2. 変更点の整合性
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
    * バージョン指定なしは正規表現で洗い出す  ```https:\/\/www\.hl7\.org\/fhir\/[^Rr]```
  * 自分自身ページを参照する際は、MarkdownLinkを利用する
* コメントの削除
  * 説明外の不必要なコメント（古いソース等）を削除する
* copyrightの確認
  * 許可の取れていないCodeSystemを利用していないこと
  * JP Core定義外で許可が取れているものはCopyrightに追加する
### 3. 説明用資料の更新
* 新たなプロファイルグループがあった場合にはメニューを追加する
* プロファイルおよびExtensionが追加があった場合は、リソースグループメニューに追加する
* Markdownのリンクを更新する
```ruby
> ruby ./script/markdownlink_creator.rb
```
* sushi-config.yamlのSpecialUrlsを更新する
```ruby
> ruby ./script/specialurls_creator.rb
```
* 各Aliasの定義をグループごとにソートする。
* プロファイルの定義情報変更点の確認
  * プロファイルの定義より、**Search Parameter(検索パラメータ)** / **Operation(操作)** 変更がないかを確認する
  * 変更点がFHIR Baseにて定義済であるかを確認する。
  * 未定義の場合は　**Search Parameter(検索パラメータ)** / **Operation(操作)**　の追加を検討する
  * **Capability Statement**にある **Search Parameter(検索パラメータ)** / **Operation(操作)**　との差分を確認に応じて変更する。
### 4. 貢献者リストの更新
* 変更点について各SWGに確認を依頼する
### 5. 変更履歴
* 過去の変更履歴を元に構成を作成する
* Milestoneに紐づく、Issueを元に変更履歴を記載する
* 特に下位互換性を保つことができない修正については記載する


## リリース作業
### 1. Terminology関連リソースの配置
* 出来上がったCodeSystemおよびValueSet,ConceptMapの中で、Terminology Package側で管理するものの判別をする
  * 既に変更が安定しており、今後変更が生じる頻度が少ないもの
  * 本来、他の団体にて定義されるべきもの
  * JP Coreの派生先になるかに限らず、Terminology単体で他のシーンで利用されるもの
上記のような特徴のあるものから、Package化をおこなってゆく

### 2. 日付変更
* 仮のリリース日を決定し、その日程を設定する
* sushi-config.yamlの日付を変更する
```
[sushi-config.yaml]
date: YYYY-MM-DD
```
* gitにて差分を抽出する 
```
git diff --name-only {コミットID1} {コミットID2}
```
* 各種定義用FSHの日付を変更
* リリース日確定後、日付を一括変換する（仮リリース日⇒本リリース日）
```
//　正規表現置換
// [置換パターン]
[*]\s?\^?date\s?=\s?"\(<?仮リリース日>YYYY-MM-DD)"

//[置換文字]
$1"yyyy-MM-dd"
```

### 3. バージョン変更
* バージョンの決定
  * 付番については、リリースルールに従って作成する
  * パブリックコメント向けのバージョンを作成するかどうかは事前に決定する

* sushi-config.yaml変更
```
[sushi-config.yaml]
version: x.x.x-temp
```
* github actionの変更
  * workflows/develop.yaml
  * workflows/main.yaml

guthub actionにあるversion変換処理にあるバージョンをsushi-config.yaml定義のバージョンとあわせる
```
[develop.yaml]
env:
  release_version : x.x.x-dev

[main.yaml]
env:
  release_version : x.x.x
```

### 4. mainブランチへのマージ
* releaseブランチを作成を作成し、リリース作業と今後更新作業を分離する
* moduleがFixedしたら、mainブランチへのマージをおこなう

※mainモジュールへの更新の際は、「sushi-config.yamlのバージョン」に対し細心の注意を払う必要がある、バージョンをそのままに更新すると公開されているフォルダが上書きされてしまう


## 公開作業

### 1. 履歴用ホームページ（https://jpfhir.jp/fhir/core/index.html）の修正
* other/index.htmlの修正
  * 最新との差分を確認すること
  * ホームページおよびpackageファイルパスが間違っていないかを特に確認する
* 公開ページとの入れ替え
  * バックアップを作成することを忘れないようにする


### 2. [githubリリース](../../..//releases)の作成
* mainブランチリリースタグの作成
* リリース作成
  * 変更履歴の作成
  * package.tgzのアップロード

### 3. ig-registryへの公開
* IGのエントリーリストを編集する
  * https://github.com/FHIR/ig-registry/blob/master/fhir-ig-list.json
  * 上記ファイルを分岐した上で、修正を実施する
  * 修正が終わったら、masterブランチに対するPull Requestを発行する
  * masterブランチへマージされるのを待つ
* 登録状況の確認
  * https://fhir.org/guides/registry/
  * 上記サイトにてJP Coreにて検索を実施する
  * ヒットしたサイトの内容を確認し、修正点が反映されているかを確認する
