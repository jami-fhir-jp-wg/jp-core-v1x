<!-- -*- coding: utf-8-unix -*-)-->

# <a href="#HL7協会への質問" name="HL7協会への質問">HL7協会への質問 ◆</a>

（項目の順番に意味はありません）。

## <a href="#1." name="1.">1. ◆</a>Update as Create操作におけるmeta/versionId

FHIRサーバは、Update as Create操作でClientが指定した
リソースIDのリソースをコピーできますが、meta/versionIdはコピー先で書き換えるように
指定されているようにみえます。バージョンつきリファレンスもふくめてグラフ構造を
コピーする

[FHIR仕様)](https://hl7.org/fhir/r4/resource.html#Meta:~:text=On%20the%20RESTful%20API%3A%20On%20receiving%20a%20write%20operation%2C%20the%20server%20SHALL%20update%20this%20item%20to%20the%20current%20value%2C%20or%20remove%20it.)には、
「RESTful APIにおける書き込み操作では、FHIRサーバは受信したmeta/versionIdを自らの管理する値に書き換えるか、（historyを扱わないサーバでは）削除するかすべきである。」という意味と思われる記述があります。

* FHIRの設計では、versionIdを指定したリファレンスをもつグラフ構造を異なるFHIRサーバ間でコピーする方法としてどのようなものを想定していますか。

【FHIRガイド内の記述】

* [Logical IDの構成](logicalid.md#1.)


## <a href="#2." name="2.">2. ◆</a>versionIdの新旧判定

バージョンIDの値を比較してバージョンの新旧を判定することはできないことが[FHIR仕様](https://hl7.org/fhir/R4/resource.html#:~:text=Changes%20each%20time,unable%20to )に明記されています。

またmeta/lastUpdateが示す時刻は、必須ではなく、存在した場合でも分解能が1msと広い幅をもち、同一時刻に複数回のUpdateが行われるリソースが存在しえるため、meta/lastUpdateで
新旧比較をできない場合があります。

一方、historyインタラクションでは[新しい順にソートすることが明示](https://hl7.org/fhir/R4/http.html#:~:text=sorted%20with%20oldest%20versions%20last%2C)されているため、
正しい新旧順を得ることができます。

FHIRサーバの実装方法に依存せずにバージョンIDの新旧を判定する確実な方法は、historyインタラクションを使ってリソースの全履歴をしらべる方法のみであるという理解は正しいでしょうか。

【FHIRガイド内の記述】

* [リソース履歴の新旧判定](logicalid.md#3.)

## <a href="#3." name="3.">3. ◆</a>履歴の一部無効化

[FHIR仕様](https://hl7.org/fhir/R4/http.html#:~:text=In%20the%20case%20that%20a%20past%20version%20of%20a%20resource%20needs%20to%20be%20explicitly,resource%20or%20its%20past%20versions )には、あるリソースの履歴一部だけの無効化にはProvenanceリソースを使うとあります。

この場合、Provenanceにはどのような値を設定するのでしょうか。


## <a href="#4." name="4.">4. ◆</a>uuid型とoid型におけるURL置換

Transaction処理で解決したリファレンスの書き換えについて、
[FHIR仕様の記述](https://www.hl7.org/fhir/r4/http.html#:~:text=Servers%20SHALL%20replace,are%20not%20replaced.)では置換対象としてuuid型とoid型のエレメントを含んでいます。
しかし、uuidやoidをurlへ置換するとuuid型の値としては不適当になります。どのように解釈すべきでしょうか。

【FHIRガイド内の記述】

* [Transaction処理で解決したリファレンスの書き換え](url.md#2.1.)



