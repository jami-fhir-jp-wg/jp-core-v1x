
### 必須要素

次の要素は必須（**SHALL**）である。

- status : リソースの状態。原則、`completed`。
- content : メディアの実際のコンテンツーインラインまたはメディアソースファイルへの直接参照。

### Must Support
このプロファイルではMust Supportとなる要素はない。

### Extension定義
このプロファイルでは拡張定義は行っていない。

## 注意事項

Mediaリソースは、FHIRの基底R5以降は、DocumentReferenceリソースに集約統合されている。Mediaリソースを使用する際は、将来的なDocumentReferenceリソースへのマッピングを考慮して実装することが強く推奨される。

Mediaリソースには、いくつかのdate/timesが含まれている。

- Media.created[x]: 収集の日付(/時間)、または収集が発生した期間。
- Media.duration： メディアの長さ。記録が一時停止された場合、期間はcreatedPeriodと異なる場合がある。
- Media.content.creation：これはMedia.created[x]と一致するはずだが、部分的もしくは編集された記録のために異なる場合がある。このリソースは、attachment.data要素を介して画像情報を直接埋め込むことができる。ただし、通常はattachment.url要素を使用してBinaryリソースを指定することを推奨する。サーバは多くの場合、潜在的に大きなアーティファクトにより適した専用のリポジトリにバイナリリソースを存続可能である。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### 検索パラメータ一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL | identifier | token | `GET [base]/media?identifier=urn:oid:2.16.124.999999.9999.1154777499.30246.19789.3503430045` |
| MAY | patient | reference | `GET [base]/media?patient=123` |
| MAY | patient,modality | reference,token | `GET [base]/media?patient=123&modality=ES` |
| MAY | patient,created | reference,date | `GET [base]/media?patient=123&created=eq2021-06-25` |
| MAY | patient,modality,created | reference,token,date  | `GET [base]/media?patient=123&modality=ES&created=eq2021-06-25` |

#### 必須検索パラメータ

本プロファイルで必須(**SHALL**)として定義された検索項目はない。

#### オプション検索パラメータ

本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**上部消化管検査画像**][jp-media-endoscopy-example-1]

# その他、参考文献・リンク等

* 本プロファイルそのものの定義には影響しないが、消化器内視鏡検査レポートについては、[日本消化器内視鏡学会](https://jges.net/)が推進する[JED (Japan Endoscopy Database) Project](https://jedproject.jges.net/)に準拠していることが強く推奨される。 

{% include markdown-link-references.md %}
{% include external-link-reference.md %}

