本プロファイルは、Mediaリソースを使用して、内視鏡検査で取得または使用される画像、映像、音声に関わる情報の登録や検索、取得するために最低限遵守すべき制約を取り纏めたものであり、本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。
なお、実際のコンテンツは、インラインまたは直接参照にて提供される。

## 背景および想定シナリオ

本プロファイルは、主に内視鏡検査で取得または使用されるNon-DICOMフォーマットの画像、映像、音声記録に関わるデータを取り扱うことを想定している。
* 診断、またはケア提供手順の記録を目的とした画像、映像、音声
* 診断レポートに含まれる画像

## スコープ

Mediaリソースには、画像、映像、音声が含まれ、これらは医療プロセスの一部として取得または使用される。

このリソースは、特定のタイプの [Observation]（値が音声、映像、または画像データである Observation）を取り込む。 このリソースは、情報の解釈に関連するメタデータを公開するため、このような形式の情報の好ましい表現である。 ただし、一部のレガシー環境では、メディア情報が代わりに Observation に表示されることがあり、システムはこの可能性を認識する必要がある。

Mediaリソースには、医療画像をDICOMフォーマットで含めることができる。これらの画像は、画像への直接参照をWADO-RSサーバーに提供するImagingStudyリソースを介してアクセス可能にすることもできる。

このような画像の場合、WADO-RSフレームワークは、画像を表現するために推奨される手段である。たとえば、WADO-RSサービスには、関連付けられた DICOMプレゼンテーション状態からの注釈と表示パラメータを使用して画像をレンダリングすることが含まれる場合がある。

一方、Mediaリソースを使用すると、WADO-RSサービスが利用できない境界を越えて画像を確実に転送できる。このため、医療画像も Mediaリソースで表すことができるが、Media.content.urlには画像のもとのWADO-RSサービスへの参照を提供する必要がある。

<h3>注記</h3>

* Mediaリソースは、FHIRの基底R5以降は、DocumentReferenceリソースに集約統合されている。Mediaリソースを使用する際は、将来的なDocumentReferenceリソースへのマッピングを考慮して実装することが強く推奨される。

## プロファイル定義
Usage:
Refer to this Resource Profile:
Examples for this Resource Profile: Media/jp-media-endoscopy-example-1

{% include markdown-link-references.md %}