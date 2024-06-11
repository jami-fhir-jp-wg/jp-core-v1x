<!-- -*- coding: utf-8-unix -*-)-->


# <a href="#URLの扱いについて" name="URLの扱いについて">URLの扱いについて ◆</a>

FHIRでは、エレメントの値としてURLを設定するときのエンコードについていくつかの注意が必要です。

FHIR仕様でのURLエンコードに関する言及が少なく、HL7協会へ仕様理解について確認をとったのち、
FHIR-JPから注意喚起とガイドラインを示すことを提案します。

* FHIR仕様にはURLエンコードに関する記述がほとんど無いため、ユーザやクライアントシステムは意識せずにエンコードしない値を設定している可能性がある。
本来は人手ではなくユーザが使うシステムがエンコードを担うが、手動でFHIRサーバにアクセスするケースも少なくなく、手動で確認した仕様に基づいてシステムが実装されることもあるため、注意喚起が必要だろう。
* 欧米ではURLエンコードが不用であるURLが多いと思われるため、FHIR仕様では注目されていないのかもしれない。日本では日本語を含むURLでURLエンコードが必須であるため、欧米よりURLエンコードを使う機会が多いと考えられる。
* URLエンコードはエンコード結果が一意でないため、エンコードした値の検索で問題が出る可能性がある。FHIR-JPとしてエンコード方法のガイドラインを示すことで検索における相互運用性を向上できる。


## <a href="#1." name="1.">1. ◆</a>URLをもつエレメント

### <a href="#1.1." name="1.1.">1.1. ◆</a>URLを直接外部参照に使うエレメント

#### <a href="#1.1.1." name="1.1.1.">1.1.1. ◆</a>url型

[url型](https://hl7.org/fhir/datatypes.html#url)は、FHIRの定義ではつぎの値を保持すると記述があります。

「A Uniform Resource Locator (RFC 1738 icon). Note URLs are accessed directly using the specified protocol. Common URL protocols are http{s}:, ftp:, mailto: and mllp:, though many others are defined」

外部へのアクセスプロトコルで使われることがあり、そのときには[値をそのまま使う](https://hl7.org/fhir/r4/datatypes.html#:~:text=Note%20URLs%20are%20accessed%20directly%20using%20the%20specified%20protocol. )としているため、URLはエンコードされた状態で保持すると解釈すべきです。
（FHIRではUnicodeを使うことが規定されていますが、（特に日本では）Unicode以外のエンコードを使うURLが存在します。たとえばShift-JISで記述されたパスを含むURLなどです。このときにはエンコード前の値を持つことが不可能であるため、エンコードしたURLとして保持する必要がありますのでURLエンコードした値しか扱えません。）

#### <a href="#1.1.2." name="1.1.2.">1.1.2. ◆</a>xhtml型

xhtmlがもつ```<a href=URL>```などのタグでは、URLエンコードした値の設定が求められます。

#### <a href="#1.1.3." name="1.1.3.">1.1.3. ◆</a>markdown型

markdownではリンクの記法に関する統一的な規格が無いようです。

空白などのmarkdownとして意味のある文字を含むURL場合には、URLエンコードしないと
正しく扱われません。それ以外の文字については、URLエンコードする前の値を設定してもURLエンコードしたURLへ変換されることもあれば、そのまま送信されてWebサーバ側が適当に解釈するようなこともあるようです。


### <a href="#1.2." name="1.2.">1.2. ◆</a>IDとしてのURLを持つエレメント

IDとしてURLを扱うエレメントのデータ型にはつぎのものがあります。
これらについてもエンコード後の値を設定すべきと考えられます。
（URI型についてはRFC3986に準拠すると定義されています）

* [uri型](https://hl7.org/fhir/datatypes.html#uri)
* [canonical型](https://hl7.org/fhir/datatypes.html#canonical)

URL型が準拠すると指定されている[RFC1738](http://tools.ietf.org/html/rfc1738)とURI型が準拠すると指定されている[RFC3986](http://tools.ietf.org/html/rfc3986)では、
URLエンコードの方法が異なります。
RFC3986のエンコード方法の方が自由度が少なく、
RFC3986でエンコードしたURLはRFC1738でも同じ文字列へデコードできます。

### <a href="#1.3." name="1.3.">1.3. ◆</a>Reference.referenceエレメント

[Reference型のreferenceエレメント](https://hl7.org/fhir/r4/references-definitions.html#Reference.reference)はstring型で、相対URLであればIDとして解釈し、絶対URLであれば外部参照として解釈します（URLエンコードする）。

「Using absolute URLs provides a stable scalable approach suitable for a cloud/web context, while using relative/logical references provides a flexible approach suitable for use when trading across closed eco-system boundaries. Absolute URLs do not need to point to a FHIR RESTful server, though this is the preferred approach. If the URL conforms to the structure "/[type]/[id]" then it should be assumed that the reference is to a FHIR RESTful server.」

* リソースIDに使う文字列はURLエンコードをする必要がありません（またIDとして扱うためエンコードしてはならないと解釈します）。
    * \[type\][リソースタイプに使える文字](https://hl7.org/fhir/r4/structuredefinition-definitions.html#StructureDefinition.name)：\[A-Z\]\(\[A-Za-z0-9_\]\)\{0,254\}
    * \[id\][リソースIDに使える文字](https://hl7.org/fhir/r4/datatypes.html#id)：\[A-Za-z0-9\\-\\.\]\{1,64\}
    * \[meta/versionId\][リソースのバージョンIDに使える文字](https://hl7.org/fhir/r4/datatypes.html#id)：\[A-Za-z0-9\\-\\.\]\{1,64\}
* 外部参照に使うURLは、URL型と同じくURLエンコード済みでダイレクトに外部参照に使える値とします。  
FHIRサーバであれば、リソースIDがエンコード不用であるため、エンコード不用な\[base\] URLを与えることで絶対URLもエンコードが不用となります。  
しかし、[FHIRサーバではないサーバを参照することもある](https://hl7.org/fhir/r4/references-definitions.html#:~:text=Absolute%20URLs%20do%20not%20need%20to%20point%20to%20a%20FHIR%20RESTful%20server%2C%20though%20this%20is%20the%20preferred%20approach.)ため、URLエンコードが必要な場合があります。


## <a href="#2." name="2.">2. ◆</a>URLを書き換えるサーバ動作

サーバがリソース値を格納するときにURLを書き換えることがあります。


### <a href="#2.1." name="2.1.">2.1. ◆</a>Transaction処理で解決したリファレンスの書き換え

Transaction処理では解決した[リファレンスの書き換え](https://www.hl7.org/fhir/r4/http.html#:~:text=A%20transaction%20may,are%20not%20replaced.)を行います。

つぎのエレメント値が含むid文字列を置換します。

* Reference型のreferenceエレメント
* url型エレメント
* uri型エレメント
* oid型エレメント
* xhtmlの"＜a href="XX"＞＜img src="YY"＞
* markdownの中のリンク

注：[FHIR仕様の記述](https://www.hl7.org/fhir/r4/http.html#:~:text=Servers%20SHALL%20replace,are%20not%20replaced.)では置換対象としてuuid型とoid型のエレメントを含んでいます。しかし、uuidやoidをurlへ置換するとuuid型の値としては不適当になるため、誤記かもしれません（[HL7要確認](hl7question.md#4. )）。


書き換え前のURLはIDとして扱うため、エンコードの有無は意味を持ちません。（IDとしてuuidを使えば書き換えパターンが偶然他の部分に一致してしまうような書き換えミスは起こりにくくなります。）


### <a href="#2.2." name="2.2.">2.2. ◆</a>Transaction処理におけるConditional Reference

検索URLとしてエンコードした値を設定します。


Conditional referenceでは、解決したいReference型のreference値に検索コマンドを[設定します](https://www.hl7.org/fhir/http.html#:~:text=The%20client%20could%20resolve,the%20correct%20reference:)。
ここで設定する検索コマンドは正しく構文解析を行うためにURLエンコードする必要があります。

[FHIR仕様にあるサンプル](https://www.hl7.org/fhir/http.html#:~:text=reference%20value%3D%22Patient%3Fidentifier%3D12345%22)Observation.subjectのReference値を、
identifierが「X&Y123」かつactive=trueのPatientへのリンクへ変えるとつぎのような
値とすることになります。


```
Patient?identfier=X%26Y123&active=true
                          ↑検索パラメータの区切りの"&"はパーセントエンコードしない。
                   ↑「X&Y123」の"&"はパーセントエンコードして「%26」とする。

```

## <a href="#3." name="3.">3. ◆</a>URLの検索

FHIRサーバは、URLの検索を[uri検索型](https://hl7.org/fhir/R4/search.html#uri)として実行します。
uri検索型では、大文字・小文字を区別するなど厳密な比較を行います。

URLのパーセントエンコードの方法は一意ではないことがあります。
たとえばWebサーバは「%2c」を「%2C」と同様に扱うことができるのが一般的であるからです。


## <a href="#4." name="4.">4. ◆</a>ガイドライン案

### <a href="#4.1." name="4.1.">4.1. ◆</a>URLの扱い

* FHIRサーバのBASE URLには、URLエンコードの不要な文字列を採用する。  
URLエンコードにまつわる問題を予防するためである。
* 相互運用性（URL値に対する検索結果が一致するようにする）のために、エンコード結果が一意になるようなエンコード方法を示す。
* FHIRリソースが保持するURL値をもつエレメントには、URLエンコード済の文字列を設定する。
* **課題**
    * markdown型に含まれるURLのエンコード有無をどうすべきか。
    * CanonicalURLにはURLエンコードの不要な文字列を採用すると明記すべきか。

### <a href="#4.2." name="4.2.">4.2. ◆</a>検索結果を一致させるためのエンコーディング

URL値の検索をヒットさせるためにはパーセントエンコードの方法を統一する必要がある。
FHIRサーバ内のコンテンツではつぎの方式でエンコードすることを推奨する。

* パーセントエンコードでは英大文字で文字コードの16進表示を行う。
* 英数字（[A-Za-z0-9]）はパーセントエンコードしない。
* コントロール文字（U+0000～U+001F）と、U+007F以上のコードを持つ文字はパーセントエンコードする。
* 空白（0x20）は%20へエンコードする。
* 記号のうちつぎに列挙するものはパーセントエンコードする。
    * ？？？
* **課題**
    * プログラミング言語の標準ライブラリの仕様と異なる場合があるだろう。  
    例えば[JavaScriptのencodeURIComponentはRFC2396準拠らしい](https://qiita.com/sisisin/items/3efeb9420cf77a48135d#:~:text=RFC3986%E3%81%AE%E5%89%8D%E8%BA%AB,%E3%81%AEencodeURIComponent%E3%81%AA%E3%81%A9)
    * パーセントエンコードすべき記号の列挙
    * 検索コマンドをPOSTで実行するときには「application/x-www-form-urlencoded」を使う。これとの互換性を確認する。
    * [WHATWGによる規格](https://url.spec.whatwg.org/)を採用する可能性？
        * 定義がきわめて難解
        * なんらかの権威があるか不明

### <a href="#4.3." name="4.3.">4.3. ◆</a>注意事項

* URL値を検索値として指定する場合には、URLエンコードした目的の値をさらにURLエンコードする必要がある。
* 検索パラメータとしてのエンコーディングが必要な値にはつぎのものがある。
    * GETによるFHIRサーバの検索におけるRequest-uri
    * POSTによるFHIRサーバの検索におけるRequest Body
    * TransactionにおけるBundle.request.url
    * TransactionにおけるConditional Reference
