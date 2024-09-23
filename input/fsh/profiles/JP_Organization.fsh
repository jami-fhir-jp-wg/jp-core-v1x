// ==============================
//   Profile 定義
// ==============================
Profile: JP_Organization
Parent: Organization
Id: jp-organization
Title: "JP Core Organization Profile"
Description: "このプロファイルはOrganizationリソースに対して、組織情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "共通の目的を持った人や組織の集まり【詳細参照】"
* . ^definition = "集団行動の何らかの形での達成を目的として結成された、正式または非公式に認められた人々または組織のグループ。企業、機関、企業、部門、コミュニティグループ、医療実践グループ、支払者/保険者などが含まれる。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    JP_Organization_PrefectureNo named prefectureNo ..1 and
    JP_Organization_InsuranceOrganizationCategory named organizationCategory ..1 and
    JP_Organization_InsuranceOrganizationNo named organizationNo ..1
* extension[prefectureNo] ^short = "都道府県番号２桁を表現するExtension"
* extension[prefectureNo] ^comment = "都道府県番号２桁。Identifier型の拡張を使用する。  
valueには都道府県番号2桁の値を格納し、systemには都道府県番号を表すOID「.100495.20.3.21」を指定する。"
* extension[organizationCategory] ^short = "点数表コード１桁（医科１、非保険検診施設２、歯科３、調剤４、訪問看護ステーション６）を表現するExtension【詳細参照】"
* extension[organizationCategory] ^comment = "点数表コード１桁（医科１、非保険検診施設２、歯科３、調剤４、訪問看護ステーション６）。systemには点数表番号を表すOID「.100495.20.3.22」を指定する。"
* extension[organizationNo] ^short = "医療機関コード（７桁）を表現するExtension【詳細参照】"
* extension[organizationNo] ^comment = "医療機関コード（７桁）。Identifier型の拡張「InsuranceOrganizationNo」を使用する。  
systemには医療機関コードを表すOID「http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicalOrganizationID」を指定する。  
valueには下記の値を格納する。  
　- 保険医療機関・保険薬局 : `医療機関コード（７桁）`  
　- 非保険の特定健診・特定保健指導機関 : `機関コード（７桁）`  
　  
医療機関コードの詳しい説明は、Organizationプロファイルの医療機関コード１０桁の説明を参照すること。  
なお上記に該当しない施設は、本拡張は使用しない。"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "複数のシステムでこの組織を識別【詳細参照】"
* identifier ^definition = "複数の異種システムにまたがって組織を識別するための識別子"
* identifier ^requirements = "組織は様々な ID で知られている。いくつかの機関では複数のIDを保持しており、ほとんどの機関では、組織に関する他の組織との交換のためにIDを収集している。"
* identifier ^comment = "福祉医療関連施設と保険者組織はSlicingについてはJP Coreにて定義を行なっているため、定義に従いデータを格納すること。それ以外の組織については、利用する際には必要に応じて識別子を定義を行なうこと。"
* identifier contains
    medicalInstitutionCode ..* and
    insurerNumber ..*
* identifier.assigner only Reference(JP_Organization)
* identifier[medicalInstitutionCode] ^short = "施設が福祉医療関連機関である場合に利用する識別子【詳細参照】"
* identifier[medicalInstitutionCode] ^definition = "福祉医療施設を区別するため医療機関コード（１０桁）を格納するためのIdentifier/Slicing定義。"  
* identifier[medicalInstitutionCode] ^comment = "systemはFixed Valueの```http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no```を使用する。  
value : ```医療機関コード（１０桁）```を使用する。  
医療機関コード（１０桁）の詳細はOrganizationプロファイルの医療機関コード１０桁の説明を参照すること。 "
* identifier[medicalInstitutionCode].system = "http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no" (exactly)
* identifier[medicalInstitutionCode].assigner only Reference(JP_Organization)
* identifier[insurerNumber] ^comment = "健康保険組合などの保険者の保険者番号を表現する際のIdentifier表現に使用する  
system要素には保険者番号を示すOID\" http://jpfhir.jp/fhir/core/mhlw/IdSystem/InsurerNumber\"を指定する。"
* identifier[insurerNumber].system = $JP_IdSystem_InsurerNumber (exactly)
* identifier[insurerNumber].assigner only Reference(JP_Organization)
* active ^short = "組織の記録がまだ有効に使われているかどうか【詳細参照】"
* active ^definition = "このアクティブフラグは、組織を一時的に閉鎖したり、工事中であることを示すために使用されることを意図していない。代わりに、組織内の場所(複数可)は、中断されたステータスを持っている必要がある。一時停止の理由の詳細が必要な場合は、この要素の拡張子を使用する必要がある。  
この要素は、リソースがエラーで作成されたことをマークするために使用される可能性があるため、修飾子としてラベル付けされている。"
* active ^requirements = "レコードが使用されなくなったことを示すためのフラグが必要で、一般的にUIではユーザのために非表示にする必要がある。"
* type ^short = "組織の種類【詳細参照】"
* type ^definition = "その種類の組織。"
* type ^comment = "n組織は、企業、病棟、セクション、臨床チーム、政府部門などにすることができる。多くのアプリケーションでは、コードは、特定の組織を識別するために使用されている（と言う、病棟）別の同じタイプのものとは対照的に - これらは識別子ではなく、コードである。  
複数のタイプが適切かどうかを検討する際には、異なるタイプが組織の異なるサブ領域に存在する可能性が高いため、子どもの組織の方がより適切な使用法であるかどうかを評価する必要がある。これは、宗教、学術、医療センターのように、タイプの価値観が直交する場合に使用される可能性が高い。  
いくつかの法域では、このオプション性を単一のカーディナリティとしてプロファイルすると予想される。"
* type ^requirements = "これがある組織の種類を追跡することができる必要がある - 異なる組織の種類は、異なる用途を持っている。"
* name ^short = "組織に使用されている名称【詳細参照】"
* name ^definition = "組織に関連付けられた名前。"
* name ^comment = "組織名が変更された場合は、旧名称をエイリアス欄に入れて検索で見つけられるようにすることを検討すべきである。"
* name ^requirements = "組織のラベルとして名前を使用する必要がある。"
* alias ^short = "組織が知られている、または過去に知られていた別名のリスト【詳細参照】"
* alias ^definition = "組織がその名で知られている、または過去にその名で知られていた代替名のリスト。"
* alias ^comment = "これは、名前がいつ使用されたかを追跡することを目的としたものではなく、古い名前でも組織を特定できるように検索を支援することを目的としているため、別名や歴史的な名前に関連付けられた日付はない。"
* alias ^requirements = "時間の経過とともに、場所や組織はさまざまな変化を経て、さまざまな名前で知ることができる。  
組織が知っている前の名前を知るための検索には、非常に便利なことができる。"
* telecom ^short = "組織の連絡先詳細【詳細参照】"
* telecom ^definition = "組織の連絡先詳細"
* telecom ^comment = "使用コード「home」は使用しないこと。これらの連絡先は、組織に雇用されている人や組織を代表する人の連絡先ではなく、組織自体の公式な連絡先であることに注意すること。"
* telecom ^requirements = "組織のヒューマンコンタクト。"

* telecom.system ^short = "phone | fax | email | pager | url | sms | other 【JP_Patient.telecomを参照。】"
* telecom.system ^comment = "連絡先の種別をValueSet(ContactPointSystem)より選択する。  　- phone : 電話　- fax : Fax 　- email : 電子メール　- pager : ポケットベル　- url : 電話、ファックス、ポケットベル、または電子メールアドレスではなく、URLとして表される連絡先。これはWebサイト、ブログ、Skype、Twitter、Facebookなどのさまざまな機関または個人の連絡先を対象としている。電子メールアドレスには使用しないこと。　- sms : SMSメッセージの送信に使用できる連絡先（携帯電話、一部の固定電話など）  　- other : 電話、Fax、ポケットベル、または電子メールアドレスではなく、URLとして表現できない連絡先。例：内部メールアドレス。これは、URLとして表現できる連絡先（Skype、Twitter、Facebookなど）には使用しないこと。"
* telecom.value ^comment = "連絡先の番号やメールアドレス"
* telecom.use ^short = "work | temp | old | mobile - 連絡先の用途等 【JP_Patient.telecomを参照。】homeは使用しないこと。"
* telecom.use ^comment = "患者の連絡先の種別をValueSet(ContactPointUse)より選択する。  一時的なものまたは古いものであると明示しない限り、連絡先が最新とみなされる。  
　- work : 職場  
　- temp : 一時的  
　- old : 以前の  
　- mobile : モバイル機器"
* telecom.rank ^comment = "連絡先の使用順序（1 = 最高）"
* telecom.period ^comment = "連絡先が使用されていた/されている期間"

* address ^short = "組織の住所【詳細参照】"
* address ^definition = "組織の住所"
* address ^comment = "組織は、用途や適用期間が異なる複数の住所を持っている場合がある。使用コード「home」は使用しないこと。"
* address ^requirements = "連絡、請求、または報告のために、組織のアドレスを追跡する必要がある場合がある。"

* address.use ^short = "work | temp | old | billing - purpose of this address　住所の用途 【JP_Patient.address参照】使用コード「home」は使用しない。"
* address.use ^definition = "The purpose of this address.  
住所の用途"
* address.use ^comment = "住所の用途をValueSet(AddressUse)より選択する。  
　- work : 職場  
　- temp : 一時的  
　- old : 以前の  
　- billing : 請求書、インボイス、領収書などの送付用"
* address.type ^short = "postal | physical | both 【JP_Patient.address参照】"
* address.type ^definition = "住所（訪問できる住所）と郵送先住所（私書箱や気付住所など）を区別する。ほとんどのアドレスは両方。"
* address.type ^comment = "住所の種類をValueSet(AddressType)より選択する。  
　- postal : 郵送先 - 私書箱、気付の住所  
　- physical : 訪れることのできる物理的な住所  
　- both : postalとphysicalの両方"
* address.text ^short = "住所のテキスト表現 【JP_Patient.address参照】"
* address.text ^definition = "表示するアドレス全体を指定する  
例：郵便ラベル。これは、特定の部品の代わりに、または特定の部品と同様に提供される場合がある。"
* address.text ^comment = "テキスト表現とパーツの両方を提供できる。アドレスを更新するアプリケーションは、テキストとパーツの両方が存在する場合、パーツにないコンテンツはテキストに含まれないようにする必要がある。  
　- 住所を(都道府県や市町村などに)分離して管理していない場合は、textに入れる。  
　- 住所を(都道府県や市町村などに)分離して管理している場合でも、まとめてtextに入れること。  
　- 郵便番号は含めない。  
　  
例：東京都文京区本郷7-3-1"
* insert SetExampleString(address.text, 東京都文京区本郷7-3-1)
* address.line ^short = "ストリート名や番地など 【JP_Patient.address参照】"
* address.line ^definition = "このコンポーネントには、家番号、アパート番号、通りの名前、通りの方向、P.O。が含まれる。ボックス番号、配達のヒント、および同様の住所情報など。"
* address.line ^comment = "【JP Core仕様】state要素とcity要素で表現しなかったそのあとの住所部分を番地以降の部分も含めてすべていれる。  
英数字は半角でも全角でもよい。文字列の前後および途中に空白文字を含めないこと。  
繰り返し要素が許されているので、区切りを表現したい場合には、複数要素に分けて格納してもよい。  
　  
例：本郷7-3-1  
例：大字石神９７６  
例：藤崎町大字藤崎字西村1-2 春山荘201号室"
* insert SetExampleString(address.line, 本郷7-3-1)
* address.city ^short = "市区町村名 【JP_Patient.address参照】"
* address.city ^definition = "n市、町、郊外、村、その他のコミュニティまたは配達センターの名前。"
* address.city ^comment = "１MBを超えないこと。  【JP Core仕様】郡市区町村部分だけを「郡」「市」「区」「町」「村」などの文字を含めて設定する。 例：文京区"
* insert SetExampleString(address.city, 文京区)
* address.district ^short = "地区名 【JP_Patient.address参照】"
* address.district ^comment = "【JP Core仕様】日本の住所では使用しない。"
* address.state ^short = "国の次の地区単位 【JP_Patient.address参照】"
* address.state ^definition = "国の主権が制限されている国のサブユニット。日本の場合、都道府県名。"
* address.state ^comment = "１MBを超えないこと。  都道府県名。「都」「道」「府」「県」のそれぞれの文字を含める。 例：東京都"
* insert SetExampleString(address.state, 東京都)
* address.postalCode ^short = "郵便番号 【JP_Patient.address参照】"
* address.postalCode ^comment = "郵便番号。日本の郵便番号の場合には3桁数字とハイフン1文字と4桁数字からなる半角８文字、または最初の3桁だけの3文字のいずれかとする。 例：113-8655"
* insert SetExampleString(address.postalCode, 113-8655)
* address.country ^short = "国名またはISO 3166コード　(ISO 3166 2 or 3文字こーど)"
* address.country ^definition = "国-一般的に理解されている、または一般的に受け入れられている国の国名かコード。"
* address.country ^comment = "ISO 3166 3文字コードは、人間が読める国名の代わりに使用する。  ISO 3166の2文字または3文字のコード.  日本であれば、jpまたはjpn"
* address.period ^short = "住所が使用されていた（いる）期間"
* address.period ^definition = "住所が使用されていた（いる）期間"
* address.period ^comment = "住所が使用されていた/されている期間。 期間は時間の範囲を指定する。使用状況はその期間全体に適用されるか、範囲から1つの値が適用される。  期間は、時間間隔（経過時間の測定値）には使用されない。"

* partOf only Reference(JP_Organization)
* partOf ^short = "【詳細参照】"
* partOf ^definition = "この組織が一部を構成する組織"
* partOf ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* contact ^short = "特定の目的のための組織の連絡先【詳細参照】"
* contact ^definition = "特定の目的のための組織の連絡先"
* contact ^comment = "同じ目的で複数の連絡先が提供されている場合、どの連絡先を使用するのが好ましいかを判断するために使用できる標準の拡張extension がある。"
* contact ^requirements = "より大きな組織内で割り当てられた連絡先を追跡する必要がある。"
* contact.name only JP_HumanName
* endpoint ^short = "組織のために運営されているサービスへのアクセスを提供する技術的エンドポイント【詳細参照】"
* endpoint ^definition = "組織のために運営されているサービスへのアクセスを提供する技術的エンドポイント"
* endpoint ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* endpoint ^requirements = "組織にはさまざまなサービスを提供する複数のシステムがあり、それらに接続する方法と目的について、技術的な接続の詳細を定義できる必要がある。"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_Organization_InsuranceOrganizationCategory
Id: jp-organization-insuranceorganizationcategory
Title: "JP Core Organization InsuranceOrganizationCategory Extension"
Description: "点数表コード１桁を表現するためのExtension。 JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"
* ^url = $JP_Organization_InsuranceOrganizationCategory
* ^status = #active
* ^date = "2023-06-26"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "点数表コード１桁【詳細参照】"
* . ^comment = "点数表コード１桁。systemには点数表番号  
を表すOID「http://jpfhir.jp/fhir/core/mhlw/CodeSystem/MedicationFeeScoreType」を指定する。"
* url = $JP_Organization_InsuranceOrganizationCategory (exactly)
* value[x] only Coding
* valueCoding from $JP_MedicalFeeScoreType_VS (extensible)
* valueCoding.system ^definition = "点数表番号の名前空間を識別するURIを指定。固定値。"
* valueCoding.code ^definition = "点数表コード１桁「1：医科」、「3：歯科」、「4：調剤」、「5：老人保健施設」、「6：訪問看護ステーション」」。"

Extension: JP_Organization_InsuranceOrganizationNo
Id: jp-organization-insuranceorganizationno
Title: "JP Core Organization InsuranceOrganizationNo Extension"
Description: "保険医療機関番号７桁を表現するためのExtension。 JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"
* ^url = $JP_Organization_InsuranceOrganizationNo
* ^status = #active
* ^date = "2023-06-26"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "保険医療機関番号７桁【詳細参照】"
* . ^comment = "保険医療機関番号７桁。Identifier型の拡張  
「InsuranceOrganizationNo」を使用する。systemには医療機関コードを表すOID「$JP_IdSystem_MedicalOrganizationID」を指定する。  
「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」の定義をベースにしているが、URLを以下に変更している  
http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo"
* url = $JP_Organization_InsuranceOrganizationNo (exactly)
* value[x] only Identifier
* value[x].system = $JP_IdSystem_MedicalOrganizationID  (exactly)
* value[x].system ^definition = "保険医療機関コードの名前空間を識別するURIを指定。固定値。"
* value[x].value ^definition = "保険医療機関番号７桁。半角数字で７桁固定。"

Extension: JP_Organization_PrefectureNo
Id: jp-organization-prefectureno
Title: "JP Core Organization PrefectureNo Extension"
Description: """都道府県番号２桁を表現するためのExtension。
JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"""
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo"
* ^status = #active
* ^date = "2023-06-26"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "都道府県番号2桁【詳細参照】"
* . ^comment = "都道府県番号２桁。Identifier型の拡張を使用する。  
valueには都道府県番号2桁の値を格納し、systemには都道府県番号を表すOID「1http://jpfhir.jp/fhir/core/mhlw/CodeSystem/PrefectureNo-2digits」を指定する。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo" (exactly)
* value[x] only Coding
* valueCoding from JP_PrefectureNumber_VS (extensible)
* valueCoding.system ^definition = "都道府県番号の名前空間を識別するURIを指定"
* valueCoding.code ^definition = "都道府県番号コード。 例）北海道　 \"01\""
