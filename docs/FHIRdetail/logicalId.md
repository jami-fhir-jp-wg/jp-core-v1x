<!-- -*- coding: utf-8-unix -*-)-->


# <a href="#Logical IDの管理とリソースのコピー" name="Logical IDの管理とリソースのコピー">Logical IDの管理とリソースのコピー ◆</a>

リソースのLogical IDの命名方法はFHIRサーバの実装に任されています。
しかし、Update as Createのような操作によって外部で命名されたLogical IDを
FHIRサーバ内に取り込むことができるようにするためには、Logical IDの命名規則を
適切に設定する必要があります。

ここではLogical IDの使用方法を示し、
複数のFHIRサーバ間で交換可能なLogical IDとしてOIDの利用を提案します。


グラフ構造を保ったままリソース群をコピーする次のようなユースケースが考えられます。

* ある患者のすべてのデータを別のサーバへ移行する。
* あるサーバのすべてのデータを別のサーバへ移行・統合する。
* 他のサーバを参照する重要なデータがあり、他サーバーがダウンしたりデータが消去されたりしても完全性を確保するためにコピーしておく。

このようなユースケースが当面ないとしても、
必要になったときに後から対策するのは困難であるため事前に検討しておいた方がよいと思われます。


## <a href="#1." name="1.">1. ◆</a>Logical IDの構成

リソースの__Logical ID__は、FHIRサーバが保有するリソースを識別するためのIDです。
FHIRサーバによって唯一性が保たれており、そのFHIRサーバ内に存在するリソースを特定することができます。しかしそのFHIRサーバの外では意味を持ちません。
すべてのFHIRリソースは1個のLogical IDを持ちます。

リソースのLogical IDはつぎの要素で構成します。

* リソース種別  
PatientやObservationなどのリソース種別（resourceType属性としてJSONやXMLで表現されるが、リソースのエレメントの値ではない）。
* id  
すべての種類のリソースが持つidエレメントに格納する文字列。
* meta/versionId  
リソースの改変履歴におけるバージョンを示すID。

FHIR仕様ではリソース種別とidのペアでLogical IDと呼び、使われる文脈によって該当するリソースの履歴全体、あるいは該当するリソースの最新の値を参照します。
ある時点でのリソースを示す場合にはLogical IDにmeta/vaersionIDを添えて参照します。

### <a href="#1.1." name="1.1.">1.1. ◆</a>FHIR仕様における記述


* リソースIDの仕様は __Logical ID__ [r4:2.26.3.3](https://hl7.org/fhir/R4/resource.html#id), [r4b:2.26.3.3](https://hl7.org/fhir/R4B/resource.html#id), [r5:2.1.27.5.3.3](https://hl7.org/fhir/R5/resource.html#id)と[id(Primitive Types)](https://hl7.org/fhir/r4/datatypes.html#id)にあります。  
サーバはidエレメントに正規表現``` [A-Za-z0-9\-\.]{1,64}```で表される任意の英数文字列を格納できます。一般には、整数値の文字列表現やOID、UUIDを設定します。
* meta/versionIdの仕様は[r4:2.26.3.7](https://hl7.org/fhir/R4/resource.html#:~:text=Changes%20each%20time,unable%20to )と[id(Primitive Types)](https://hl7.org/fhir/r4/datatypes.html#id)にあります。  
サーバはmeta/versionIdエレメントに正規表現``` [A-Za-z0-9\-\.]{1,64}```で表される任意の英数文字列を格納できます。[FHIR仕様](https://hl7.org/fhir/R4/resource.html#:~:text=The%20version%20can,Id%20of%20the%20resource)では、バージョン文字列はUUIDのようなグローバルに一意なものでも、リソースIDごとに一意であるものでも構わないとしています。
meta/versionIdは、CRUD操作のときに返されるETagの値としても使われます。  
RESTful APIにおける書き込み操作では、FHIRサーバは受信したmeta/versionIdを自らの管理する
値に書き換えるか、（historyを扱わないサーバでは）削除するか[すべきである](https://hl7.org/fhir/R4/resource.html#:~:text=On%20the%20RESTful,unable%20to)としています。

【FHIR仕様の疑問点】

* [リソースIDのユニーク性](hl7question.md#4. )：HTTPリクエストやReferenceエレメントによってリソースを特定するときにはリソース種別とidのペアが使われます。だからこのペアの値はFHIRサーバ内でユニークである必要があります。  
逆にリソース種別が異なればidは重複しても構わないとも考えられます。この場合には「[base]/?_id=xxxx」という検索の結果が複数のリソースを返す可能性があります。（FHIR仕様にはidがリソース種を超えてユニークであるかどうかに関する記述はみあたりません。）
リソース種別によらずidはユニークである必要はありますか？


## <a href="#2." name="2.">2. ◆</a>meta/versionIdと改訂履歴

リソースは改訂履歴をもつことができます（履歴を持たない構成のFHIRサーバもありうる）。
リソース種別＋IDのみによる参照は、リソースのそのときの最新版を指しますが、
リソースへの参照にはversionId（ETagとして返される文字列と同じ）を付加することができ、
これが付加された場合には最新版ではなく指定したバージョンの版を指すことになります。


```
    get [base]/Patient/123   　←　最新版を取得
    get [base]/Patient/123/_history/2 ← バージョン2を取得
```

たとえば次のような場合にバージョンつきのリファレンスを使うことができます。

* あるDiagnosticReportを作成した時点で準拠したObservationを指す。
* AuditEventが、記録対象のリソースを指す。

このような使い方をしている場合に、履歴の一部だけを廃止することがあります。
そのときには、Provenanceリソースによって廃止したことをラベリングします。FHIR仕様では履歴を参照する場合にはProvenanceも同時に参照する必要があるとしています。[FHIR仕様](https://hl7.org/fhir/R4/http.html#:~:text=In%20the%20case%20that%20a%20past%20version%20of%20a%20resource%20needs%20to%20be%20explicitly,resource%20or%20its%20past%20versions )

【FHIR仕様の疑問点】

* [履歴の一部無効化](fhirQuestion.md#3. )上記の履歴の一部の廃止をProvenanceリソースでどのように表現するか。（FHIR仕様には明示されていません）


## <a href="#3." name="3.">3. ◆</a>リソース履歴の新旧判定

バージョンIDの値を比較してバージョンの新旧を判定することはできないことが[FHIR仕様に明記](https://hl7.org/fhir/R4/resource.html#:~:text=Changes%20each%20time,unable%20to )されています。

meta/lastUpdatedで判定できる場合もありますが、つぎの問題点があります。

* meta/lastUpdatedの分解能は1msであるため、短時間に更新された場合に同一時刻の履歴が複数発生して新旧が判定できないことがある。
* meta/lastUpdatedに値が設定されていない場合がある。
* meta/lastUpdatedはそのデータがそのサーバへ登録されたときの時刻を示す。  
他のFHIRサーバからそのデータがコピーされた場合には、元の値は失われることがある。

FHIRサーバの実装に依存せずに履歴の順番を正確に把握する方法はつぎの2つだけと思われます。

* バージョンを指定せずにリソースを取得（Read）すれば、必ず最新版を得ることができます。
* 過去の履歴を正しい順番で取得する方法は、historyオペレーション（ __history__ [r4:3.1.0.12](https://hl7.org/fhir/R4/http.html#history), [r4b:3.1.0.12](https://hl7.org/fhir/R4B/http.html#history), [r5:3.2.0.12](https://hl7.org/fhir/R5/http.html#history) ）
のみです。  
historyオペレーションで取得する履歴は、必ずバージョンの古いものが並び順の後ろになるようにソートすることが[規定](https://hl7.org/fhir/R4/http.html#:~:text=sorted%20with%20oldest%20versions%20last%2C )されています。

## <a href="#4." name="4.">4. ◆</a>リソースのライフサイクルとLogical ID

あるFHIRサーバ内だけでリソースのライフサイクルが完結する場合には、
Logical IDはそのサーバが生成・管理し整合性を保ちます。
（ __Managing Resource Identity__ [r4:7.12](https://hl7.org/fhir/R4/managing.html#7.12), [r4b:7.12](https://hl7.org/fhir/R4B/managing.html#7.12), [r5:7.13](https://hl7.org/fhir/R5/managing.html#7.13)ではリソースIDの管理について
ふれていますが、注意すべき点を挙げているものの解決方法には言及していません。）

一方、リソースがそのライフサイクルのなかで異なるサーバやクライアントを移動する場合や
コピーされる場合には、サーバ間やサーバ・クライアント間でLogical IDを含めたコピーが
行われることがあります。一群のグラフ構造をコピーするときにLogical IDを振りなおすのが簡単
ではないからです。

外部で定義されたLogical IDを保存したままリソースをFHIRサーバへ登録するために、「Update as Create」操作などが定義されています。

### <a href="#4.1." name="4.1.">4.1. ◆</a>グラフ構造を保存したリソース群のインポート

#### <a href="#4.1.1" name="4.1.1">4.1.1 ◆</a>方法

グラフ構造（リファレンス関係）を保存したまま複数のリソースをFHIRサーバへインポートするには、
つぎの4つの方法があります。

1. [transaction](https://hl7.org/fhir/R4/http.html#transaction)を使って目的のリソース群をリファレンスつきでFHIRサーバへ書き込む。  
この方法は、つぎの問題があるため一般的には採用しにくいと思われます。
    * リソースのLogical IDが変化してしまい、コピー結果を継続的にアップデートするのが難しい。
1. [Update as Create](https://www.hl7.org/fhir/R4/http.html#upsert)を使って、
リソースIDを保存したままFHIRサーバへ書き込む。  
FHIRではこの方法によってリソースIDを保存したコピーを実現することを想定していると思われます。  
ただし、この方法ではversionIdを含めたデータ構造を保存できません。versionIdはインポート側
のサーバがローカルのIDへ書き換えてしまうからです。
1. [history型Bunldeによるbatch/transaction](https://www.hl7.org/fhir/R4/http.html#other-bundles)によって、リソースIDとバージョンIDを保存したままFHIRサーバへ書き込む。  
history型Bundleによるbatch/transactionは仕様の詳細が実装者に任されているように見えます。したがって、versionIdを含めたhistoryの再現を実装してもよいのではないかと思われます。
1. [バルクインタフェース](https://hl7.org/fhir/uv/bulkdata/export.html)を使ってエクスポート・インポートする。  
バルクインタフェースはエクスポートのみが仕様公開されています。インポートがどうなるかは現時点では不明です。

以下では「Update as Create」によるリソースIDのインポートについて議論します。


#### <a href="#4.1.2" name="4.1.2">4.1.2 ◆</a>ユースケース

FHIR仕様では、外部で定義されたリソースIDを保存したまま「Update as Create」を使用してFHIRサーバへインポートする用途として[次の例](https://www.hl7.org/fhir/R4/http.html#upsert)を挙げています。

1. キャッシュサーバ：Pub/subモデルでオリジナルのリソース群のコピーを保持し、キャッシュする。  
サーバにはコピーのみが存在し、そのサーバオリジナルのリソースは存在しない。
1. 構造を伴うコピー：あるサーバに存在するリソース群をグラフ構造を保ったままコピーする。  
サーバにはコピーと、そのサーバのオリジナルのデータが共存する。
1. リソース配布クライアント：あるクライアント群がリソース群をグラフ構造を保ったままFHIRサーバ群へ配布する。

「1」の用途では、インポート側にオリジナルのリソースIDが存在しないため、エクスポートされた
リソースのIDをそのまま使っても問題ありません。


「2」「3」の用途では、リソースIDの衝突回避のために複数のサーバの間でユニークなIDを
リソースへ与える必要があります。

#### <a href="#4.1.3." name="4.1.3.">4.1.3. ◆</a>OIDの利用

FHIRでは、この目的のためにリソースIDへグローバルにユニークなIDを与える方法として、
OIDを使う方法とUUIDを使う方法を[想定](http://hl7.org/fhir/r4/datatypes.html#id)していると思われます。

日本では医療機関のOIDが標準化されています。医療機関OIDの下位レベルにFHIRサーバのOIDを置く方法を定め、その下位にサーバが持つFHIRリソースのIDを設定することで、すべてのリソースにグローバルなOIDを付加することができます。 [リソースIDのOID化に関する提案](fhirjpIdea.md##2.)参照。


このほかリソースIDをUUIDとする方法もあり得ますが、障害調査などのユースケース
におけるデータの追跡の容易さなどの点でOIDが優ると考えます。
ただし、情報漏洩時にデータの起源がわかってしまうリスクも存在します。


* 参考：[ＪＡＨＩＳ IHE-ITI を用いた 医療情報連携基盤実装ガイド](https://www.jahis.jp/files/user/04_JAHIS%20standard/13-104_JAHIS%20IHE-ITI%E3%82%92%E7%94%A8%E3%81%84%E3%81%9F%E5%8C%BB%E7%99%82%E6%83%85%E5%A0%B1%E9%80%A3%E6%90%BA%E5%9F%BA%E7%9B%A4%E5%AE%9F%E8%A3%85%E3%82%AC%E3%82%A4%E3%83%89%E6%9C%AC%E7%B7%A8Ver.1.0.pdf)の「8. オブジェクト識別子（OID）定義」


【FHIR-JP提案】

* [リソースIDのOID化に関する提案](fhirjpIdea.md##2.)


## <a href="#5." name="5.">5. ◆</a>ユースケースごとの実装の詳細

* リソースが持つリファレンスの扱い
* 履歴のコピー
* Provenanceリソースの扱い


