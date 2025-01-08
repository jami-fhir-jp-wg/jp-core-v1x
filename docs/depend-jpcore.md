## JP Coreを利用した実装ガイドの作成方法

## パッケージファイルの配置

_updateTx.bat,shを参考にローカルパッケージキャッシュを事前にダウンロード&解凍します。
jpcoreのパッケージはsnapshotのパッケージを取得します。

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
