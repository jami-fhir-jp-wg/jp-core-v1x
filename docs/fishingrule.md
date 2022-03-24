# JP Core FHIR Shorthand記載ルール(案)

## 1. フォルダ構成
 フォルダ構成は下記の通り
```ruby
(project root)
├─.github #githubに関するシステムファイル
├─custom-template #IG Publisher用テンプレート
├─docs #github説明用ファイル
└─input #入力フォルダ
   ├─fsh #FHIR Shorthandファイル格納フォルダ
   │  ├─capablitystatements #capablity statement用
   │  ├─codesystems #code system用
   │  ├─others #その他
   │  ├─profiles #profile,extension用
   │  ├─searchparameters #search parameter
   │  └─valuesets #values
   ├─includes #link file
   ├─intro-notes #profileの前後説明文(-intro.md, -notes.md)
   ├─pagecontent #Markdown Page
   └─resources #resource
```
## 名称ルール

### 1. ID命名規則
#### 形式
Kabab Case形式(小文字) [ **aaa-bbb-ccc** ]を採用する。<br/>
正規表現 : ``` ([a-z]|[-])+ ```

| 項目 | ルール <br/> `(例)`  |
| --- | --- | 
| profile | jp-{profile} <br/>`jp-patient`|  |
| extension | jp-{profile}-{element}-{extension} <br/>`jp-medicationrequest-dispenserequest-expectedrepeatcount` <br/>64文字を超える場合は、**{element}-** を省略可能とする |
| datetype | jp-{datatype} <br/>`jp-humanname `| |
| search parameter | jp-{profile}-{parameter}-sp <br/>`jp-patient-birthdate-sp` | |
| capblity statement | jp-{actor}-capablitystatement <br/>`jp-client-capablitystatement` |
| codesytesm | jp-{codesystem}-cs <br/> `jp-gender-cs` |
| valueset | jp-{valueset}-vs <br/> `jp-gender-vs` |

### 2. Name命名規則
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
| capblity statement | JP_{Actor}_CapablityStatement <br/>`JP_Client_CapablityStatement` |
| codesytesm | JP_{CodeSystem}_CS <br/> `JP_Gender_CS` |
| valueset | JP_{ValueSet}_VS <br/> `JP_Gender_VS` |


### 3. 定義URL形式
* Page部分はNameと同一とする。<br/>
* JPCoreに関するサイト名称は **http://jpfhir.jp/fhir/core** にて統一する。
* ただしTerminologyについては **http://jpfhir.jp/fhir/Common** とする。<br/>
※JPCoreに限らずいろいろな用途として利用されるため。

| 項目 | ルール <br/> `(例)`  |
| --- | --- | 
| profile, <br/>datatype | http://jpfhir.jp/fhir/core/StructureDefinition/{Name} <br/>`http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient`| 
| extension | http://jpfhir.jp/fhir/core/Extension/StructureDefinition/{Name}<br/> `http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race`|
| search<br/>parameter | http://jpfhir.jp/fhir/core/SearchParameter/{Name} <br/>`http://jpfhir.jp/fhir/core/SearchParameter/JP_Patient_Birthdate_SP` | |
| capblity<br/>statement | http://jpfhir.jp/fhir/core/CapabilityStatement/{Name} <br/>`http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Client_CapabilityStatement` |
| codesystem | http://jpfhir.jp/fhir/Common/CodeSystem/{Name} <br/>`http://jpfhir.jp/fhir/Common/CodeSystem/JP_Gender_CS` |
| valueset | http://jpfhir.jp/fhir/Common/ValueSet/{Name} <br/>`http://jpfhir.jp/fhir/Common/ValueSet/JP_Gender_VS` |


### 5. Title命名規則
NameをSpace Separator形式に変換する。(全ての項目共通)<br/>省略語は英大文字としてもよい
``` 
JP Core Patient Race Extension
```

### 2. ファイル配置＆命名規則
#### 形式
Name形式[ **Aaa_BbbCcc_Ddd.fsh** ]に変換し、拡張子を.fshとする。<br/>
正規表現 : ``` ([a-z]|[_])+.fsh ```

| 項目 | ルール | 備考 |
| --- | --- | --- |
| profile<br/>extension| profiles/{[snake]Profile ID}.fsh | profileおよびextensionは1ファイル集約 |
| datatype | others/{[snake]DateType ID}.fsh | |
| operation | others/{[snake]Operation ID}.fsh |  |
| search parameter| searchparamters/{[snake]Profile ID}_sp.fsh | postfixとして **[_sp]** があるのを注意。1ファイル集約 |
| codesystem | codesystems/{[snake]CodeSystem ID}.fsh | |
| valueset | valuesets/{[snake]ValueSet ID}.fsh | |

#### サンプル

```
# profile, extension
.\input\fsh\profiles\JP_Patient.fsh

# datatype
.\input\fsh\others\JP_HumanName.fsh

# search parameter
.\input\fsh\searchparameters\JP_Patient_SP.fsh

# code system
.\input\fsh\codesytems\JP_Gender_CS.fsh

# value set
.\input\fsh\valuesets\JP_Gender_VS.fsh
```

## 除外項目
以下の項目はsushi-config.yamlの定義が展開されるため、.fshファイルでは定義しないこと。

* version (バージョン)
* copyright (コピーライト)
* publisher (公開者)
* contract (契約者)
* licese (ライセンス)
* jurisdiction (管轄)

設定してもsushi-config.yamlの内容に上書きされるため記載対象としない。

## Must Support
JP Coreでは定義しない。（※日本国内のベースで派生先の制約を少なくしたいため）<br/>JP Coreの派生先での利用を想定している。

## コメント記載
以下のようにファイル内にグループがある場合、コメントにて区切りを入れ、グループが分かるようにすること。
```
// ==============================
//   Extension 定義
// ==============================

(　~　prifile記載　~　)

// ==============================
//   Extension 定義
// ==============================

(　~　extension記載　~　)
```

## 警告対策
### xmlタグの開閉

| 非推奨 | 推奨 | 備考 |
| --- | --- | --- |
| ```<br>``` | ```<br/>``` | tagが閉じていないとの警告が発生する。xhtml形式にすることで回避。 |
| ```<p>``` | ```<p/>``` | tagが閉じていないとの警告が発生する。xhtml形式にすることで回避。 |
| ```<a herf="http://xxx">title</a>``` | ```[title](http://xxx)``` | tagが対応しておらず、閉じていないとの警告が発生する。Markdown形式に変更することで回避 |
| ```<tag>hoge</tag>``` | ```&gt;tag&lt;hoge&gt;/tag&lt;``` | その他対未対応タグは,xmlのEscape処理を行なう。 |

### 説明文書記載上の注意

##### コメント中のAlternate Syntax
```
見出し1\r\n===============   =>  <h1>見出し1</h1>

見出し2\r\n---------------   =>  <h2>見出し2</h2>
```
章立てのカウントに影響を及ぼすため禁止とする。


