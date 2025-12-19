## JP Coreを利用した実装ガイドの作成方法

### パッケージファイルの取得
_updateTx.bat,shを参考にローカルパッケージキャッシュを事前にダウンロード&解凍します。
jpcoreのインデックスページ(https://jpfhir.jp/fhir/core/)より、snapshotのパッケージを取得します。

### パッケージファイルの解凍
.fhirフォルダに対して、パッケージファイルを解凍し配置します。
フォルダ名は、後述するsushi-config.yamlのバージョンとあわせます。


```
.fhir ─ package ┬ fhir.jp.core#(対象バージョン)
                ├ jpfhir-terminology.r4#(対象バージョン)

```

### sushi-config.yamlの編集
dependencies:にjpcoreおよびjpfhirのTerminologyのパッケージを指定します。

```
dependencies:
  jpfhir.jp.core:
    uri: http://jpfhir.jp/fhir/core/1.2.0/ImplementationGuide/
    version: (バージョン)
  jpfhir-terminology.r4:
    uri: http://jpfhir.jp/fhir/jpfhir-terminology/ImplementationGuide/
    version: (バージョン)
```

### 確認
JP_xxxxを親に指定して、プロファイルを作成します。
sushiコマンドを実行し、エラーがなく、parentが指定されていることを確認します。
