# FHIR JPCore ver1.x用　開発用サイト
FHIRのJp Core実装のための開発用レポジトリです。

# 注意事項
このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのVer.1.x系を作成しているレポジトリです。本レポジトリは開発時の編集用途として使用しています、正式には https://jpfhir.jp/fhir/core/index.html にて公開されている内容をご確認ください。今後、予告なく内容に変更があります。実装や利用は全て自己責任で行ってください。


## 編集先レポジトリ
下記の表を参照し、アクティブなレポジトリに修正を行ってください。
| JPCore ver | BASE Ver|対象レポジトリ | 状況 | コメント | 
| - | - | - | - | - |
| v2.0.0  | 4.3.0 | https://github.com/jami-fhir-jp-wg/fhir-jp-core-r4 | 開発中 | リリース時期未定<p/>影響点の大きな修正はを本バージョンに投入する。Base VerがR4.3.0であることに注意|
| v1.3.0  | 4.0.1 | https://github.com/jami-fhir-jp-wg/jp-core-v1x/ | 開発中 | 次期リリース予定<p/>不具合や影響の少ないリソース追加の修正に利用 |
| [v1.2.0-a](https://jpfhir.jp/fhir/core/1.2.0-a/index.html) | 4.0.1 | https://github.com/jami-fhir-jp-wg/jp-core-v1x/releases/tag/1.2.0-a | 承認フェーズ | パブリックコメント受付中 |
| [v1.1.2](https://jpfhir.jp/fhir/core/1.1.2/index.html)  | 4.0.1 | https://github.com/jami-fhir-jp-wg/jp-core-v1x/releases/tag/v1.1.2 (編集不可) | リリース済 | 現行リリースの最新バージョン | 
| [v1.1.1](https://jpfhir.jp/fhir/core/1.1.1/index.html)  | 4.0.1 | https://github.com/jami-fhir-jp-wg/jp-core-v1x/releases/tag/v1.1.1 (編集不可) | リリース済 | v1.1.0からの不具合修正バージョン<p/>Patch version to V1.1.0<p/>リリース済のため編集不可　|
| [v1.1.0](https://jpfhir.jp/fhir/core/1.1.0/index.html)  | 4.0.1 | https://github.com/jami-fhir-jp-wg/jp-core-v1x/releases/tag/v1.1.0 (編集不可) | リリース済 | 開発環境のSushi&IG Publisherへの移行ver1.0.5のブラッシュアップ実施<p/>IG publisher version from V1.0.5 |
| [v1.0.5](https://jpfhir.jp/jpcorev1ig/index.html)  | 4.0.1 | 旧開発環境で開発されたたため、ソースファイル非公開 | リリース済<p/>編集不可 | 初期バージョン<p/>Initial release<p/>現在サポート対象外 | 
## GitHubAction 自動ビルド＆デプロイ
ビルドおよびデプロイに２０分程度時間を要します。
* [ビルド状況 [step1]](https://github.com/jami-fhir-jp-wg/jp-core-v1x/actions)
* [デプロイ状況 [step2]](https://github.com/jami-fhir-jp-wg/jp-core-v1xpages/actions)
* [ビルド結果 [step3]](https://jami-fhir-jp-wg.github.io/jp-core-v1xpages/index.html)

## 環境作成
自端末にてIGのコンパイルまで行なう場合、下記を参考に環境を作成してください。
* [FHIR Shorthand & IG Publisher環境作成方法](docs/environment.md)

## コンパイル手順
下記を実行することで、outputフォルダにIGのhtmlが作成されます。
_genonceの実行にてheep sizeのエラーが発生する場合、メモリ量の割り当てを調整してください。

### Windowsの場合
``` sh
#実行ディレクトリに移動
> cd (プロジェクトディレクトリ移動)

# (初回のみ実行)gitクローン
> git clone http://github.com/jami-fhir-jp-wg/jp-core-v1x.git

# git 最新化
> cd jp-core-v1x
> git fetch
> git pull


# (初回＋更新時のみ実行)TerminologyServerのPackageを入手
> _updateTx.bat

# (初回＋更新時のみ実行)IgPublisher.jarのダウンロード
> _updatePublisher.bat

# IGPublisherの実行
> _genonce.bat
```

### Ubuntuの場合
``` sh
#実行ディレクトリに移動
$ cd (プロジェクトディレクトリ移動)

# (初回のみ実行)gitクローン
$ git clone http://github.com/jami-fhir-jp-wg/jp-core-v1x.git

# git 最新化
$ cd jp-core-v1x
$ git fetch
$ git pull

# (初回＋更新時のみ実行)TerminologyServerのPackageを入手
> bash _updateTx.sh

# (初回のみ実行)IgPublisher.jarのダウンロード
$ bash _updatePublisher.sh

# IGPublisherの実行
$ bash _genonce.sh
```

## FSH & Markdown記載ルール
* [FHIR Shorthand記載ルール](docs/fishingrule.md)
* [プロファイル説明用Markdown記載ルール](docs/template_intronotes.md)
* [github 利用ルール](docs/githubflow.md)
* [文書記載ルール](docs/ig_rules.md)
* [リリースルール](docs/release_rule.md)
* [リリース手順](docs/for-release.md)

## 資料・学習用サイト等
* [FHIR Shorthand FSH School(外部リンク)](https://fshschool.org/)
* [FHIR Shorthand Overview(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/overview.html)
* [FHIR Shorthand Language Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/reference.html)
* [FHIR Shorthand Quick Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/FSHQuickReference.pdf)
* [Markdown記法 Basic(外部リンク)](https://www.markdownguide.org/basic-syntax/)
* [Markdown記法 Extended(外部リンク)](https://www.markdownguide.org/extended-syntax/)
