# FHIR JPCore ver1.1用　開発用サイト
FHIRのJp Core実装のための開発用レポジトリです。

# 注意事項
このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのドラフトVer.1.1 です。このバージョンは日本HL7協会による承認を受けていません。今後、予告なく内容に変更があります。実装や利用は全て自己責任で行ってください。
このページの実装ガイドは常に修正、追加がある改訂版開発用ページです。

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

# (初回のみ実行)IgPublisher.jarのダウンロード
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

## 資料・学習用サイト等
* [FHIR Shorthand FSH School(外部リンク)](https://fshschool.org/)
* [FHIR Shorthand Overview(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/overview.html)
* [FHIR Shorthand Language Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/reference.html)
* [FHIR Shorthand Quick Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/FSHQuickReference.pdf)
* [Markdown記法 Basic(外部リンク)](https://www.markdownguide.org/basic-syntax/)
* [Markdown記法 Extended(外部リンク)](https://www.markdownguide.org/extended-syntax/)
