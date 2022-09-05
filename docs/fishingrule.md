# JP Core FHIR Shorthand記載ルール

## フォルダ構成
 フォルダ構成は下記の通り
```ruby
(project root)
├─.github #githubに関するシステムファイル
├─custom-template #IG Publisher用テンプレート
├─docs #github説明用ファイル
├─input #入力フォルダ
│  ├─fsh #FHIR Shorthandファイル格納フォルダ
│  │  ├─capabilitystatements #capability statement用
│  │  ├─examples #リソース例 example
│  │  ├─others #その他
│  │  ├─profiles #profile,extension用
│  │  ├─searchparameters #search parameter
│  │  └─terminologies #values,codesystem,conceptmap用
│  ├─includes #link file
│  ├─intro-notes #profileの前後説明文(-intro.md, -notes.md)
│  ├─pagecontent #Markdown Page
│  └─resources #resource
└─script #スクリプト格納フォルダ
```
## 名称ルール

### [1] ID命名規則
#### 形式
Kebab Case形式(小文字) [ **aaa-bbb-ccc** ]を採用する。<br/>
正規表現 : ``` ([a-z]|[-])+ ```

| 項目 | ルール <br/> `(例)`  |
| --- | --- | 
| profile | jp-{profile} <br/>`jp-patient`|  |
| extension | jp-{profile}-{element}-{extension} <br/>`jp-medicationrequest-dispenserequest-expectedrepeatcount` <br/>64文字を超える場合は、**{element}-** を省略可能とする |
| datetype | jp-{datatype} <br/>`jp-humanname `| |
| search parameter | jp-{profile}-{parameter}-sp <br/>`jp-patient-birthdate-sp` | |
| capability statement | jp-{actor}-capabilitystatement <br/>`jp-client-capabilitystatement` |
| codesystem | jp-{codesystem}-cs <br/> `jp-gender-cs` |
| valueset | jp-{valueset}-vs <br/> `jp-gender-vs` |
| example | jp-{profile}-example-{N} <br/> `jp-patient-example-1` |

### [2] Name命名規則
単語はPascal(UpperCamel)区切は_(アンダーバー) とする<br/>
省略語は英大文字としてもよい
[ **Aa_BbbCcc_Ddd** ]を採用する。<br/>
正規表現 : ``` (([A-Z]+[a-z]*)+_)+([A-Z]+[a-z]*)+ ```

| 項目 | ルール <br/> `(例)`  |
| --- | --- | 
| profile | JP_{Profile} <br/>`JP_Patient`|  |
| extension | JP_{Profile}\_{Element}\_{Extension} <br/>`JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount` |
| datetype | JP_{DataType} <br/>`JP_HumanName `| |
| search parameter | JP_{Profile}_{Parameter}_SP <br/>`JP_Patient_Birthdate_SP` | |
| capability statement | JP_{Actor}_CapabilityStatement <br/>`JP_Client_CapabilityStatement` |
| codesystem | JP_{CodeSystem}_CS <br/> `JP_Gender_CS` |
| valueset | JP_{ValueSet}_VS <br/> `JP_Gender_VS` |
| example | JP_{Profile}_Example_{N} <br/> `JP_Patient_Example_1` |

### [3] 定義URL形式
* Page部分はNameと同一とする。<br/>
* JPCoreに関するサイト名称は **http://jpfhir.jp/fhir/core** にて統一する。
* ただしTerminologyについては **http://jpfhir.jp/fhir/Common** とする。<br/>
※JPCoreに限らずいろいろな用途として利用されるため。

| 項目 | ルール <br/> `(例)`  |
| --- | --- | 
| profile, <br/>datatype | http://jpfhir.jp/fhir/core/StructureDefinition/{Name} <br/>`http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient`| 
| extension | http://jpfhir.jp/fhir/core/Extension/StructureDefinition/{Name}<br/> `http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race`|
| search<br/>parameter | http://jpfhir.jp/fhir/core/SearchParameter/{Name} <br/>`http://jpfhir.jp/fhir/core/SearchParameter/JP_Patient_Birthdate_SP` | |
| capability<br/>statement | http://jpfhir.jp/fhir/core/CapabilityStatement/{Name} <br/>`http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Client_CapabilityStatement` |
| codesystem | http://jpfhir.jp/fhir/Common/CodeSystem/{Name} <br/>`http://jpfhir.jp/fhir/Common/CodeSystem/JP_Gender_CS` |
| valueset | http://jpfhir.jp/fhir/Common/ValueSet/{Name} <br/>`http://jpfhir.jp/fhir/Common/ValueSet/JP_Gender_VS` |

### [4] Title命名規則
NameをSpace Separator形式に変換する。(全ての項目共通)<br/>省略語は英大文字としてもよい
``` 
JP Core Patient Race Extension

JP Core PractitionerRole CodeSystem

JP Core Observation SocialHistory Code ValueSet
```

### [5] ファイル配置＆命名規則
#### 形式
Name形式[ **Aaa_BbbCcc_Ddd.fsh** ]に変換し、拡張子を.fshとする。<br/>

| 項目 | ルール | 備考 |
| --- | --- | --- |
| profile<br/>extension| profiles/{Profile Name}.fsh | profileおよびextensionは1ファイル集約 |
| datatype | others/{DateType Name}.fsh | |
| operation | others/{Profile Name}.fsh |  |
| search parameter| searchparamters/{Profile Name}_sp.fsh | postfixとして **[_sp]** があるのを注意。1ファイル集約 |
| codesystem | terminologies/{CodeSystem Name}.fsh | |
| valueset | terminologies/{ValueSet Name}.fsh | |
| example | examples/JP_{Profile}_Example.fsh | 1ファイル集約 |

```
# ファイル名サンプル
# profile, extension
.\input\fsh\profiles\JP_Patient.fsh

# datatype
.\input\fsh\others\JP_HumanName.fsh

# search parameter
.\input\fsh\searchparameters\JP_Patient_SP.fsh

# code system
.\input\fsh\terminologies\JP_Gender_CS.fsh

# value set
.\input\fsh\terminologies\JP_Gender_VS.fsh

# example
.\input\fsh\examples\JP_Gender_Example.fsh
```
## FSH編集ルール
### [1] 除外項目
以下の項目はsushi-config.yamlの定義が展開されるため、.fshファイルでは定義しないこと。

* version (バージョン)
* copyright (コピーライト)
* publisher (公開者)
* contract (契約者)
* license (ライセンス)
* jurisdiction (管轄)

設定してもsushi-config.yamlの内容に上書きされるため記載対象としない。

### [2] Cardinality
{min}の値が0の時は、{min}を省略すること。
```
* <element> {min}..{max}
* <element> {min}..   // leave max as-is
* <element> ..{max}   // leave min as-is
```

| ケース | 表記 |
| --- | --- |
| 0以上1以下 | ..1 |
| 0固定 | ..0 |
| 1固定 | 1..1 |
| 1以上 | 1.. |

Baseに対し、より制約を強くする（範囲を狭める）形で定義を行なうこと。

### [3] FSHファイル中コメント
#### コメント記載方法
行頭に`//`置くことでソースファイル中にコメントを記載することが出来る。

#### 区切コメント
ファイル内にグループがある場合、コメントにて区切りを入れ、グループが分かるようにすること。
```
// ==============================
//   Profile 定義
// ==============================

(  ~  profile記載  ~  )

// ==============================
//   Extension 定義
// ==============================

(  ~  extension記載  ~  )
```
#### 文中コメント記載時の注意事項
* コメントにより理解が深まる場合のみ記載すること。
* 以下のようなコメントは記載しないよう注意すること。
   1. 説明の必要のないコメント
   1. ソースと意味が重複しているコメント
   1. 追加、更新等に関するコメント

### [4] definition(定義)、comment(コメント)の記述
* 日本語のみの記述も可とする。日本語訳が難しいために補助的に英語を付記することは問題ない。
* 章構成に影響するMarkdownは利用しないこと。<br/>
下記はいずれもHeadingの解釈されるため利用しないこと
```
#
##
###
####
#####
######

<h1> </h1>
<h2> </h2>
<h3> </h3>
<h4> </h4>
<h5> </h5>
<h6> </h6>

===============
---------------
```

* htmlタグを使う場合はxhtml形式とし、タグの開閉に気を付けること。

| 非推奨 | 推奨 | 備考 |
| --- | --- | --- |
| ```<br>``` | ```<br/>``` | tagが閉じていないとの警告が発生する。xhtml形式にすることで回避。 |
| ```<p>``` | ```<p/>``` | tagが閉じていないとの警告が発生する。xhtml形式にすることで回避。 |
| ```<a herf="http://xxx">title</a>``` | ```[title](http://xxx)``` | tagが対応しておらず、閉じていないとの警告が発生する。Markdown形式に変更することで回避 |
| ```<tag>hoge</tag>``` | ```&gt;tag&lt;hoge&gt;/tag&lt;``` | その他対未対応タグは,xmlのEscape処理を行なう。 |

### [5] MustSupport
* MustSupportの付与<br/>
JP Coreの派生先でのユースケース毎の利用を想定しており、JP Coreでは原則定義しない。（※日本国内のベースで派生先の制約を少なくしたいため）<br/>
ただし派生先ユースケースの利用方法を理解した上で、必要な場合に付け加えることは可能とする。この場合、MustSupportの定義(どのような制約になるのか）についても合わせて記述すること。
* FSHファイル上での記載<br/>
MustSupportはFlag Rulesの記載方法を推奨する
``` 
// 非推奨
element mustSupport = false or true

// 推奨
element 1.. MS 
```

### [6] プロファイルでの参照先
プロファイル参照する際に、既にJP Coreにて定義がされている場合、FHIR BASEではなくJP Coreプロファイルを利用すること。

``` 
// 非推奨
* subject only Reference(Patient)

// 推奨 JP Coreプロファイルを指定する
* subject only Reference(JP_Patient)
``` 
### [7] Sliceの名称命名規則
Sliceの名称定義の際は、Camel形式(lower camelCase)とする。
https://build.fhir.org/ig/HL7/fhir-shorthand/reference.html#item-names


### [8] JP Core独自仕様記述

リソースに関する説明文書の際にFHIR BASEの訳文とJP Core独自仕様部分の説明を明示的に分ける際には「**【JP Core仕様】**」を文のはじめに付与すること。

```

* identifier ^comment = "(FHIR BASEおよびその訳文)　【JP Core仕様】(JP Core独自仕様)"

```

## CodeSystemにてJP Core内定義したURLとは別のシステム識別子（URI,OID等）を持つ場合の対応

### [1]CodeSystemの定義

- URLは、JP Coreの命名規則に従ったものを記述する。(直接OIDを記載しない)
  - JP Coreで定義したリソースはURLに従って公開される予定のため。
- IdentifierとしてOIDを追加する。

CodeSystemに対してOIDが割り振られた際の記載例

```
[JP_MedicationCodeHOT9_CS.fsh]
CodeSystem: JP_MedicationCodeHOT9_CS
Id: jp-medicationcode-hot9-cs
Title: "JP Core MedicationCode HOT9 CodeSystem"
Description: "医薬品HOT9コードのコードシステム"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.200119.4.403.1"
* ^identifier[+].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.100495.20.2.74"
```

```
[aliases-jpcore.fsh]
Alias: $JP_MedicationCodeHOT9_CS = http://jpfhir.jp/fhir/Common/CodeSystem/JP_MedicationCodeHOT9_CS
```

### [2]NamingSystemへのマッピング情報の記載

- NamingSystemに対してOIDをIdentifierとJP Core URLとのマッピングを作成する。
- OIDについては念の為OID形式、URL形式の両方を登録する。
- URLとしてのPreferredは、JP CoreのURLに付けることとする。
- kind=#codesystemにすること点に注意すること。

```
[namingsystems.fsh]
Instance: jp-medicationcodehot9-namingsystem
InstanceOf: NamingSystem
Usage: #definition
* name = "JP_MedicationCodeHOT9_NamingSystem"
* status = #active
* kind = #codesystem
* description = "JP Core MedicationCode HOT9 NamingSystem"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.200119.4.403.1"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.200119.4.403.1"
* uniqueId[+].type = #oid
* uniqueId[=].value = "1.2.392.100495.20.2.74"
* uniqueId[+].type = #uri
* uniqueId[=].value = "urn:oid:1.2.392.100495.20.2.74"
* uniqueId[+].type = #uri
* uniqueId[=].value = $JP_MedicationCodeHOT9_CS
* uniqueId[=].preferred = true
```


## リソース追加、urlもしくはid変更時の対処

リソース追加、urlもしくはid変更時には必要に応じ、以下の作業を実施すること。
* sushiを実行する。
* markdownlink_creator.rbを実行し、input/include/markdown-link-reference.mdを更新し、リンク情報を書き換える。
* specialurls_creator.rbを実行し、sushi-config.yamlのspecial urlを書き換える。

``` sh
# sushi実行 fsh_generatedにjsonファイルが作成される。
$ sushi 

# markdown-link-reference.md更新
$ ruby script\markdownlink_creator.rb

# sushi-config.yamlのspecial-url更新
$ ruby script\specialurls_creator.rb
```

その他に下記の確認を行なうこと。
* input/pagecontent/group-xxxx.mdに修正・追加が変更が必要か確認する。
* input/pagecontent/index.mdの追加が必要か確認する。
* コンパイル後各種リンクが正しく動作するかを確認する。
