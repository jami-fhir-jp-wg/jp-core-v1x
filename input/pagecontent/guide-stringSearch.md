HL7®FHIR®規格では[検索クエリ](https://www.hl7.org/fhir/R4/search.html)に使用できるパラメータは[SearchParameterリソース](https://www.hl7.org/fhir/R4/searchparameter-registry.html)として定義されており、検索クエリはSearchParameterリソースのname, valueを用いて

    GET [base]/[type]?name=value&...

と表現される。

具体的には、

    GET [base]/Patient?gender=male

という検索クエリにおける"gender"はPatientリソースにおけるgenderプロパティを指しているのではなく、Patientリソースに対応した[id=individual-genderというSearchParameterリソース](https://www.hl7.org/fhir/R4/searchparameter-registry.html)のname属性を示しており、このindividual-genderというSearchParameterリソースが検索対象としてPatient.genderを指定しているという構造になっている。

各SearchParameterには[type](https://www.hl7.org/fhir/R4/searchparameter-definitions.html#SearchParameter.type)が定義されており、typeごとに[検索条件や対象とするDatatype, 各Datatypeで検索するフィールドなどが定義されている](https://www.hl7.org/fhir/R4/search.html#ptypes)。また、各typeには、検索時に使用できる:text, :notなどのmodifierを組み合わせて使用することもできる。

なお、サーバ側はクエリに一致するリソースを返すが、[関連があると思われる追加の検索結果を返すことができる特権を有する](https://www.hl7.org/fhir/R4/search.html)ことに注意する。

本節では特に日本において問題となりうる機能に限って記載する。実装者は検索機能を実装するにあたり、[Search](https://www.hl7.org/fhir/R4/search.html)および[SearchParameter](https://www.hl7.org/fhir/R4/searchparameter.html)について十分に理解しておくよう勧められる。

### 文字列検索
FHIR®におけるテキストについての検索は大きく4種類に分けることができる。ここではType:modifierと表すことにし、条件がある場合は適宜カッコで補足する。

1. case sensitiveな完全一致
    - [string:exact](https://www.hl7.org/fhir/R4/search.html#:~:text=The%20%3Aexact%20modifier%20returns%20results%20that%20match%20the%20entire%20supplied%20parameter%2C%20including%20casing%20and%20accents.)
    - [token](https://www.hl7.org/fhir/R4/search.html#:~:text=Match%20is%20case%20sensitive) (ただし2.の例外あり)  
FHIR R4において、「caseや発音区別符号を含めた完全一致」として定義されている。ただし、発音区別符号に伴う合成文字など正準等価な文字を正規化するか、単純にユニコードのコードポイントによって検索するかはサーバの実装に委ねられている。一方で、日本語において正準等価性に基づいた正規化を行うと、CJK統合漢字（例：福）とCJK互換漢字（例：福）が正規化されてしまい、:exactというパラメータの趣旨にそぐわないと考えられる。したがって、JP Coreにおいては、CJK統合漢字とCJK互換漢字を区別した完全一致を行うことが望ましい（MAY）と定める。ただし、異体字セレクタについてはコードポイントによる一致のみを検出するか、何らかの対応（例：SVSやIVSを含んだ福(U+798F U+FE00)や福(U+798F U+E0101)、福(U+798F U+E0103)で検索した場合に、福(U+FA1B)をヒットさせる、など）を行うかはサーバの実装に委ねることとする。

2. case insensitiveな完全一致
    - token ([CodeSystem.caseSensitiveなどによりcase insensitiveなことが示されているとき](https://www.hl7.org/fhir/R4/search.html#:~:text=unless%20the%20underlying%20semantics%20for%20the%20context%20indicate%20that%20the%20token%20should%20be%20interpreted%20case-insensitively))
    - token ([対象のDatatypeがstringのとき](https://www.hl7.org/fhir/R4/search.html#:~:text=If%20the%20underlying%20data%20type%20is%20string%20then%20the%20search%20is%20not%20case%20sensitive))

3. 通常のテキスト検索
    - [string](https://www.hl7.org/fhir/R4/search.html#string)
    - [string: contains](https://www.hl7.org/fhir/R4/search.html#:~:text=The%20%3Acontains%20modifier%20returns%20results%20that%20include%20the%20supplied%20parameter%20value%20anywhere%20within%20the%20field%20being%20searched.)
    - [token: text](https://www.hl7.org/fhir/R4/search.html#:~:text=Use-,%3Atext,-The%20search%20parameter) （code型などに対して、CodeableConcept.textなどのテキストデータを通常のstring型の検索を行う）  
基本的な文字列検索であり、患者名や住所、病名など検索がこのタイプである。FHIR®では、このタイプの検索において[大文字小文字の同一視、アクセントや他の発音区別符号の無視、句読点と連続する空白の無視](https://www.hl7.org/fhir/R4/search.html#:~:text=This%20search%20is%20insensitive%20to%20casing%20and%20included%20combining%20characters%2C%20like%20accents%20or%20other%20diacritical%20marks)した先頭一致検索（:containsを用いた場合は部分一致検索）として規定されている。JP Coreではこれに加えて、いわゆる全角文字（2バイト文字）と半角文字（1バイト文字）の正規化を必須とする（**SHOULD**）。実装上は、Unicodeの互換正規化（NFKCもしくはNFKD）に、大文字小文字の変換、濁点・半濁点の削除、句読点と連続する空白の処理を加えることで条件を満たすことができる。
サーバは検索のときに、丸付き文字（①⇔1）、数字（2⇔Ⅱ⇔II⇔二）、ひらがな⇔カタカナ、[カタカナの正規化](https://www.scripts-lab.co.jp/mindsearch/mindsearchHypermanual/modectrl.html)（末尾の長音記号の削除、ベ⇔ヴェなど）、[新字体⇔旧字体](https://www.asahi-net.or.jp/~ax2s-kmtn/ref/old_chara.html)、統合漢字⇔互換漢字、異体字セレクタの処理、[住所の正規化](https://info.gbiz.go.jp/tools/imi_tools/index.html)、[病名の正規化](http://sociocom.jp/~data/2018-manbyo/index.html)など、必要性に応じて自由に追加の正規化を行うことができる（**MAY**）。クライアントは、サーバが[関連があると思われる追加の検索結果を返すことができる特権を有する](https://www.hl7.org/fhir/R4/search.html)ことに注意する。

4. 高度な全文検索(full text search)
    - [string: text](https://www.hl7.org/fhir/R4/search.html#:~:text=An%20additional%20modifier%20%3Atext)
    - [_text](https://www.hl7.org/fhir/R4/search.html#:~:text=text%20search%20parameters%2C-,_text,-and%20_content%2C%20search)
    - [_content](https://www.hl7.org/fhir/R4/search.html#:~:text=parameters%2C%20_text%20and-,_content,-%2C%20search%20on%20the)  
_textと_contentはすべてのリソースに適応される[共通のsearch parameter](https://www.hl7.org/fhir/R4/search.html#all)である。これらのSearchParameterは全文検索のためのSearchParameterであり、「[テキストをインデックス化する高度な検索機能をサポートすべきである（**SHOULD**）](https://www.hl7.org/fhir/R4/search.html#:~:text=these%20parameters%20SHOULD%20support%20a%20sophisticated%20search%20functionality%20of%20the%20type%20offered%20by%20typical%20text%20indexing%20services)」とされており、加えて類語検索やあいまい検索、AND検索・OR検索なども実装することが望ましい。

5. _filterを用いた検索  
通常のsearch parameterについて、_filterパラメータを用いて検索することができる。ただし、Maturity Level:2 であることに注意する。String型のsearch parameterに対しては、  
    - eq (equals: Character sequence is the same (case insensitive))
    - ne (not equals: Character sequence is not the same (case insensitive))
    - co (contains: Character sequence matches somewhere (case insensitive))
    - sw (starts with: Character sequence matches from first digit (left most, when L->R) (case insensitive))
    - ew (ends with: Character sequence matches up to last digit (right most, when L->R) (case insensitive))
    - gt / lt / ge / le (Based on Integer comparison of Unicode code points of starting character (trimmed) (case insensitive))

    といったオペレータが用意されており、eqを用いてcase insensitiveな全体一致をクエリできる。


### 人名の検索について
組織ごとに患者記録が作成、維持されており、複数の組織でケアを受けている患者は、その情報が[複数のリソースに存在する可能性が高い](https://www.hl7.org/fhir/R4/patient.html#scope)。多くの場合は氏名による検索や、姓の変更があった場合でも下の名前＋生年月日などの検索である程度候補を絞ることが可能である。一方で日本語表記を持たない外国人など、氏名を表す音をカタカナで表現した場合その方法は一意ではなく、複数システムとの連携を行う場合において、同一人物の突合が困難になる恐れがある。

将来的に組織・システムをまたいだMaster Patient Index(MPI)が整備されることがあれば、[MPIに患者の同一性を問い合わせるクエリ](https://www.hl7.org/fhir/R4/patient.html#match)を用いることができる。
