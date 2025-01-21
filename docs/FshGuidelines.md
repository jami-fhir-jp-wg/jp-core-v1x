# FSHを記載する上での推奨事項

## 設計原則

### 1. DRY(Dont Repeat Yourself)原則
重複した定義をなるべく作らない。
* 共通で利用するDataTypeの定義であれば、DataType側にて定義をおこなう
* 共通関数を作成し、同じ定義をおこなわない
* 定義済みのCodeSystemをコピーして重複定義しない

#### DataTypeの共通利用の例
```
[悪い例] 各プロファイルごとに定義をおこなう。
Profile: JP_Patient 
* name.extension ^slicing.discriminator.type = #value
* name.extension ^slicing.discriminator.path = "url"
* name.extension ^slicing.rules = #open
* name.extension contains $iso21090-EN-representation named nameRepresentationUse 0..1
* name.extension[nameRepresentationUse] ^definition = "名前の表現方法"
* name.extension[nameRepresentationUse] ^comment = "名前の文字起こし-表現方法（日本の名前など）。"

Profile: JP_Practitioner
* name.extension ^slicing.discriminator.type = #value
* name.extension ^slicing.discriminator.path = "url"
* name.extension ^slicing.rules = #open
* name.extension contains $iso21090-EN-representation named nameRepresentationUse 0..1
* name.extension[nameRepresentationUse] ^definition = "名前の表現方法"
* name.extension[nameRepresentationUse] ^comment = "名前の文字起こし-表現方法（日本の名前など）。"
```

```
[良い例]　DataTypeを定義し共通利用をおこなう
Profile: JP_Patient 
* name only JP_HumanName

Profile: JP_Practitioner
* name only JP_HumanName

Profile: JP_HumanName
Parent: HumanName
～～～～～～～～～～～～～～
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $iso21090-EN-representation named nameRepresentationUse 0..1
* extension[nameRepresentationUse] ^definition = "名前の表現方法"
* extension[nameRepresentationUse] ^comment = "名前の文字起こし-表現方法（日本の名前など）。"
```

####  共通関数(RuleSet)の例
```
[悪い例]　同様の処理をそれぞれ記載する
Profile: JP_Practitioner
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

Profile: JP_Organization
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
```
```
[良い例] 同一処理で簡略化できるものは共通関数を作成する
Profile: JP_Practitioner
insert DefineValueSlice(identifier, "system")

Profile: JP_Organization
insert DefineValueSlice(identifier, "system")

RuleSet: DefineValueSlice(name, path)
* {name} ^slicing.discriminator.type = #value
* {name} ^slicing.discriminator.path = {path}
* {name} ^slicing.rules = #open
```

### 2. 車輪の再発明を避ける
自分で独自で作るよりも、既に同じような定義が作成されているものを利用する。
国際的に既に定番となっているような定義もある場合はそれを参考にすべきである。

* 既に定義されているCodeSystemを利用する
* 既に定義されているExtensionを利用する
* Search Parameter Registryに定義されているものを利用する
* 定義済Operationを利用する
* Reference先にある定義が面倒なので、Extensionとして定義する
* 利用の際には、ライセンスおよびCopyrightに気を付ける


### 3. 拡張に対してオープン
//todo
* 制約は緩めるほうに定義できない
  * 多重度の最小値は小さくできない
  * 多重度の最大値は大きくできない
  * 一度付けたMustSupportは外すことができない
  * ValueSetのバインドの強度は、強化する方向にしか設定できない
  * 固定値を設定すると、派生する側も固定値となる
  * 型は、より限定する方向でしか定義できない。

### 5. より強い型付けの推奨
* Extension等のユースケースが限定される場合は、想定される中でより厳密な定義を行う。
* 拡張性を損なうような型定義はおこなわない

### 4. Is-aよりもHas-aの関係を好む
* 継承の乱用はコードを複雑化させ、予期せぬ動作を引き起こす可能性がある
* ひとつのプロファイルに対して多重継承ができないためベースクラスの採用はなるべく避けるようにすること
* DataTypeやReferenceなどのHas-a関係で定義を利用することでより柔軟性の高いモデルを組むことができる
* DRY原則を保つために、RuleSet(共通関数)を利用することで回避することを検討すること
* 継承階層を作る場合は、リスコフの置換原則（※）を遵守した上で、実装をすること

※リスコフの置換の原則＝派生クラスは基本クラスの代わりに使用できるべきという原則

### 5. シンメトリーを意識する
* 非対称な定義はおこなわない。


### 6. モジュール化を意識する
* 制約は局所的に定義する
* RuleSetも要素名を定義可能に

## 記載原則
### コーディングルールに従う

### 同じ定義をおこなわない
* 英語と同じ訳は不要
* ベースプロファイルと同じ定義は記載しない

## 繰り返し定義
* [0]は不要、[+]で記載する。


## 個別注意事項
### Extension

### Slicing

### URL値

### Identity型

### 動的なSystem値

## Terminology関連

### 複数型の定義 value[x]など

### Code, Coding, CodableConcept


### CodeSystem
* copyrightには気を付ける
* 共通的なCodeSystemを作る場合は、階層化を検討する

#### 定義済みマスタの変換


### ValueSet
* 