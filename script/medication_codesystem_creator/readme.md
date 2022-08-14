# 医薬品マスター CodeSystemファイル生成スクリプト

## description
各種標準マスターの提供元からダウンロードしたファイルより、CodeSystemのfshファイルを生成する。

## HOT9コード & YJコード

1.MEDISのダウンロードページより、医薬品HOTコードマスターを入手する
https://www2.medis.or.jp/hcode/

2.ダウンロードしたzipファイルを展開する
```
MEDISyyyymmdd_HOT9.TXT
MEDISyyyymmdd_OP.TXT
MEDISyyyymmdd.TXT
オプションレイアウト.pdf
標準レイアウト.pdf
```

3.展開されたファイルより `MEDISyyyymmdd_HOT9.TXT` を以下のディレクトリにコピーする
```
./script/medication_codesystem_creator
```

4.rubyスクリプトを実行する

ファイルを指定する場合
```bash
$ ruby script/medication_codesystem_creator/create_hot9_yj.rb -f MEDISyyyymmdd_HOT9.TXT
```
ファイルを指定しない場合、ファイル名のyyyymmddの値が最も大きなものが採用される
```bash
$ ruby script/medication_codesystem_creator/create_hot9_yj.rb
```

5.CodeSystemファイルが更新されていることを確認する
- JP_MedicationCodeHOT9_CS.fsh
- JP_MedicationCodeYJ_CS.fsh

## 一般名処方マスター

1.`rubyXL`をインストールする（初回のみ）
```
gem install rubyXL
```

2.厚生労働省のダウンロードページより、一般名処方マスター（xlsx版）を入手する
https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000078916.html

3.ダウンロードしたファイルを、以下のディレクトリにコピーする
```
./script/medication_codesystem_creator
```

4.rubyスクリプトを実行する

ファイルを指定する場合
```bash
$ ruby script/medication_codesystem_creator/create_ippanmei.rb -f ippanmeishohoumaster_yymmdd.xlsx
```
ファイルを指定しない場合、ファイル名のyymmddの値が最も大きなものが採用される
```bash
$ ruby script/medication_codesystem_creator/create_ippanmei.rb
```

5.CodeSystemファイルが更新されていることを確認する
- JP_MedicationCodeCommon_CS.fsh
