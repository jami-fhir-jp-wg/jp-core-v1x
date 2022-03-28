# 環境作成

---
## 1. 必要なライブラリ
* Sushi
  * Node.js
  * npm
* IG Publisher
  * Java SDK
  * Ruby
  * gen
  * Jekyll

---
## 2. Windows インストール手順
* ### Node.js

入手先：https://nodejs.org/ja/download/ <br/>
最新のLTSバージョンを取得する。
npmも併せてインストールされる。
下記にてインストールを確認する。

```
node -version    #バージョン確認
npm -version    #バージョン確認

```
* ### Sushi

```
# install
npm install -g fsh-sushi

sushi -v    #バージョン確認
```

* ### Javaランタイム
#### JavaSDK
入手先: https://www.oracle.com/java/technologies/downloads/<br/>
ver8,11,17のLSTバージョン<br/>
**Java SDKを利用する場合はライセンス注意**
#### OpenJDK
入手先: http://jdk.java.net/<br/>
ダウンロード後解凍し、フォルダに配置する。<br/>
環境変数に対象フォルダを登録し、どの環境からでも実行できるように設定すること。

* ### Ruby
入手先:http://jekyllrb-ja.github.io/docs/installation/<br/>
 Ruby+Devkitを選択する<br/>
ridk installを選択すること(**gemをインストールするため**)

* ### Jekyll
```
# install
gem install jekyll bundler

jekyll -v     #バージョン確認
```

* ### git client
入手先：https://gitforwindows.org/<br/>


## 3. Linux ubuntu インストール手順

``` ruby
# aptのアップデート。必要に応じて行ってください。
$ sudo apt update

# nodejsのインストール
$ sudo apt install nodejs npm

$ node -v    #バージョン確認
$ npm -v    #バージョン確認

# sushiのインストール
$ sudo npm install -g fsh-sushi

$ sushi -v    #バージョン確認

# java sdk のインストール
#-----------------------------
# 下記のいずれかをインストールすること
# 今回はOpenJDKの例を記載

# 1)java jre(ライセンス注意のこと)
# $ sudo apt install default-jreZ

# 2)open jdk (xxの部分はバージョン指定)
# sudo apt install openjdk-xx-jre 下はversion11のインストール例
$ sudo apt install openjdk-11-jre

$ java -version    #バージョン確認

# ruby (developer)のインストール
$ sudo apt install ruby-dev

$ ruby --version

# jekyll ※ruby gemがインストールされていること。
$ sudo gem install jekyll bundler

$ jekyll -v    #バージョン確認

# git client
$ sudo apt install git

$ git version    #バージョン確認

```

---
## 4. 推奨編集ツール

### 4.1. Visual Studio Code
無償のテキストエディタ。下記Extension機能をインストールすることにより、自動補完や完成イメージの表示、色付け等の高機能なソース編集ツールとして利用可能である。他のテキストエディタを利用することも可能。

* VSCode FHIR Shorthand (FSH) Language Support
* markdown all in one
* YAML Language Support by Red Hat, with built-in Kubernetes syntax support
* Json for Visual Studio Code


### 4.2. git client
gitを画面操作できるツールがある。本プロジェクトではVisual Studio Code上での編集を推奨するが、ユーザでの経験があるようであれば他のツールを利用することも可能とする。

#### 参考(git client)
* Visual Studio Code
* GitHub Desktop
* Source Tree
