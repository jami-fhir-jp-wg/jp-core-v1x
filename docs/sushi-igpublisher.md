## Sushi & IG Publisherノウハウ集
---

##  ◆ 環境
---
### 最新バージョンの確認

- IGPublisherはqa.html, qa.min.htmlの上部にIG Publisherのバージョンに関するコメントが出力される。
- Sushiは、実行後のコメントに出力される。

### Javaバージョン

- 古いJavaを利用すると、エラーが発生する場合あり。Java SDK 17推奨。

### レスポンス対策
- ネットワーク環境が悪いと遅くなる
- CodeSystem等の量が多くなると遅くなる傾向がある
- CPU性能、メモリとの因果関係は未調査。

## ◆ 記載方法
---
### 空白の扱い
- FSHのコメント（short, define, comment等）の最後に空白を入れると警告として扱われる。
- CodeSystemの名称の最後に全角スペースがあると、ビルドエラーになる。
- CodeSystemのCode部分に空白を入れたい場合、#の後に引用符で囲むとよい。

``` * #"PRtooth pain" "歯痛" ```

## ◆ 自動ビルド（GitHub Action）
---

- GitHubのActionより状況確認可能
- 同じブランチに対しビルドを同時に走らせるとDeployにてエラーが発生する
- Deploy関連のエラーは、rebuildを実行することで復旧する可能性が高い
- Commit時のコメントにて[ci skip]を入れることで自動ビルド対象外にすることが可能
- 実行時であれば、Actionを選択してCancelすることも可能
