// ==============================
//   Profile 定義
// ==============================
Profile: JP_Practitioner
Parent: Practitioner
Id: jp-practitioner
Title: "JP Core Practitioner Profile"
Description: "このプロファイルはPractitionerリソースに対して、医療従事者のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Practitioner"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "ヘルスケアまたは関連サービスの提供に正式な責任を負う人"
* . ^definition = "A person who is directly or indirectly involved in the provisioning of healthcare.  
医療の提供に直接または間接的に関与する者をいう。"
* identifier ^short = "An identifier for the person as this agent Practitionerリソースに対する識別子【詳細参照】"
* identifier ^definition = "An identifier that applies to this person in this role.  
ある役割の人に適用される識別子。"
* identifier ^comment = "【JP Core仕様】IDの名前空間を表す Practitioner.identifier.systemと ID値そのものを表す Practitioner.identifier.value の組み合わせとして表現する。  
Practitioner.identifier.systemは以下の割り当てる。  
　  
　- 医師の場合 : urn:oid:1.2.392.100495.20.3.41.医療機関識別OID番号  
　- 歯科医師の場合、urn:oid:1.2.392.100495.20.3.42.医療機関識別OID番号  
　  
医療機関識別OID番号は患者IDの発行者である施設を識別するものであり、医療機関コード（１０桁）の先頭に１をつけた11桁とする。医療機関コード（１０桁）の詳細についてはOrganizationプロファイルの医療機関コード１０桁の説明を参照すること。  
例：医療機関コード「1312345670」での医師の場合「urn:oid:1.2.392.100495.20.3.41.11312345670」  
　  
なお、urn:oid:1.2.392.100495.20.3.41 の部分は、「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」表19 識別子名前空間一覧において処方医 IDに割り当てられたOIDのURL型である。  
　  
地域医療連携ネットワークの地域医療従事者IDを指定する場合も同様に、地域医療従事者IDを識別する名前空間（IHE ITI PIX等で使用されるOID等）を system に使用することができる。  
医師、歯科医師以外の医療者のIDの名前空間を表す system 値はまだ未定のため、空白もしくは「ドメイン名/PractitionerのSystem発行キー」などの識別コードを入れること。  
　  
例：http://www.abd-hospital.co.jp/practitioner-system"
* identifier ^requirements = "多くの場合、エージェントには特定の識別子が割り当てられている。"
* active ^definition = "この医療従事者の記録がアクティブに使用されているかどうかを示す。"
* active ^comment = "医療従事者がある組織で使用されていない場合、別のロールでアクティブになっている可能性があるので、(例えそれらがアクティブであっても)PractitionerRoleに有効期間を終了日でマークしておく必要がある。"
* active ^requirements = "医療従事者のレコードを誤って作成してしまったとき、使用しないようにマークできるようにする必要がある。"
* name only JP_HumanName
* name ^definition = "医療従事者の氏名（複数の場合もある）"
* name ^comment = "プロパティの選択は、指定された単一の通常の名前があることを保証しなければならず、他の値はニックネーム（別名）、旧名、または他の値を適切に使用する。  
一般的には、以下を基準にResourceReference.displayで使用する値を選択する。  
　1. 最低限1つ以上の名前があること  
　2.useプロパティが「usual」であること  
　3. 有効期限は利用開始日から現在まであること  
　4. useプロパティが「official」であること  
　5. その他、内部ルールで決められた順番）  
医療従事者のNameの漢字カナ表記については、JP_Patient.nameで採用した方法を踏襲する。  
そのほか、要素の説明は、JP_Patient.nameを参照。"
* name ^requirements = "医療従事者が知られている名前。複数ある場合は、従事者が通常知られている名前を表示に使用する。"

* telecom ^short = "電話番号やメールアドレスなど、従事者への詳細な連絡先"
* telecom ^definition = "電話番号やメールアドレスなど、従事者への詳細な連絡先。"
* telecom ^comment = "異なる用途や適用される期間に応じて複数の連絡方法を持っている可能性がある。本人に緊急に連絡を取るためのオプションが必要な場合があり、また本人の身元確認に役立つ場合がある。これらは通常、自宅の電話番号、または役割が特定されていない携帯電話番号を持つことになる。  
要素の説明は、JP_Patient.telecomを参照。"
* telecom ^requirements = "医療従事者が持っているかもしれない任意の役割ごとに独立した連絡方法を知る必要がある。"
* telecom.system ^short = "phone | fax | email | pager | url | sms | other 【JP_Patient.telecomを参照。】"
* telecom.system ^comment = "連絡先の種別をValueSet(ContactPointSystem)より選択する。  　- phone : 電話　- fax : Fax 　- email : 電子メール　- pager : ポケットベル　- url : 電話、ファックス、ポケットベル、または電子メールアドレスではなく、URLとして表される連絡先。これはWebサイト、ブログ、Skype、Twitter、Facebookなどのさまざまな機関または個人の連絡先を対象としている。電子メールアドレスには使用しないこと。　- sms : SMSメッセージの送信に使用できる連絡先（携帯電話、一部の固定電話など）  　- other : 電話、Fax、ポケットベル、または電子メールアドレスではなく、URLとして表現できない連絡先。例：内部メールアドレス。これは、URLとして表現できる連絡先（Skype、Twitter、Facebookなど）には使用しないこと。"
* telecom.value ^comment = "連絡先の番号やメールアドレス"
* telecom.use ^short = "home | work | temp | old | mobile - 連絡先の用途等 【JP_Patient.telecomを参照。】"
* telecom.use ^comment = "患者の連絡先の種別をValueSet(ContactPointUse)より選択する。  一時的なものまたは古いものであると明示しない限り、連絡先が最新とみなされる。  
　- home : 自宅  
　- work : 職場  
　- temp : 一時的   
　- old : 以前の  
　- mobile : モバイル機器"
* telecom.rank ^comment = "連絡先の使用順序（1 = 最高）"
* telecom.period ^comment = "連絡先が使用されていた/されている期間"

* address ^short = "役割が特定されていない従事者の住所（通常は自宅の住所）"
* address ^definition = "役割が特定されていない従事者の住所（通常は自宅の住所）。  
勤務先の住所は通常、役割に依存するため、このプロパティには入力されない。"

* address ^comment = "患者は、異なる用途または適用可能な期間で複数の住所を持っている可能性がある。  
【JP Core仕様】FHIRデータ型仕様に従って、以下の案とした。  
　・住所が構造化されている場合、住所パート Address.country、Address.postalcode、Address.state、Address.city、Address.line に分割して記載する  
　・住所が構造化されていない場合は、Address.text に記述する  
　・各住所パートとtext は、両方存在してもよい"
* address ^requirements = "医療従事者の自宅/メールアドレスは、従業員管理のために必要とされることが多く、また、一部のロスタリングサービスでは、開始点（医療従事者の自宅）が計算に使用されることがある。"

* address.use ^short = "home | work | temp | old | billing - purpose of this address　住所の用途 【JP_Patient.address参照】"
* address.use ^definition = "The purpose of this address.  
住所の用途"
* address.use ^comment = "住所の用途をValueSet(AddressUse)より選択する。  
　- home : 自宅  
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
* address.line ^short = "ストリート名や番地など 【JP_Patient.address参照】"
* address.line ^definition = "このコンポーネントには、家番号、アパート番号、通りの名前、通りの方向、P.O。が含まれる。ボックス番号、配達のヒント、および同様の住所情報など。"
* address.line ^comment = "【JP Core仕様】state要素とcity要素で表現しなかったそのあとの住所部分を番地以降の部分も含めてすべていれる。  
英数字は半角でも全角でもよい。文字列の前後および途中に空白文字を含めないこと。  
繰り返し要素が許されているので、区切りを表現したい場合には、複数要素に分けて格納してもよい。  
例：本郷7-3-1  
例：大字石神９７６  
例：藤崎町大字藤崎字西村1-2 春山荘201号室"
* address.city ^short = "市区町村名 【JP_Patient.address参照】"
* address.city ^definition = "n市、町、郊外、村、その他のコミュニティまたは配達センターの名前。"
* address.city ^comment = "１MBを超えないこと。  【JP Core仕様】郡市区町村部分だけを「郡」「市」「区」「町」「村」などの文字を含めて設定する。 例：文京区"
* address.district ^short = "地区名 【JP_Patient.address参照】"
* address.district ^comment = "【JP Core仕様】日本の住所では使用しない。"
* address.state ^short = "国の次の地区単位 【JP_Patient.address参照】"
* address.state ^definition = "国の主権が制限されている国のサブユニット。日本の場合、都道府県名。"
* address.state ^comment = "１MBを超えないこと。  都道府県名。「都」「道」「府」「県」のそれぞれの文字を含める。 例：東京都"
* address.postalCode ^short = "郵便番号 【JP_Patient.address参照】"
* address.postalCode ^comment = "郵便番号。日本の郵便番号の場合には3桁数字とハイフン1文字と4桁数字からなる半角８文字、または最初の3桁だけの3文字のいずれかとする。 例：113-8655"
* address.country ^short = "国名またはISO 3166コード　(ISO 3166 2 or 3文字こーど)"
* address.country ^definition = "国-一般的に理解されている、または一般的に受け入れられている国の国名かコード。"
* address.country ^comment = "ISO 3166 3文字コードは、人間が読める国名の代わりに使用する。  ISO 3166の2文字または3文字のコード.  日本であれば、jpまたはjpn"
* address.period ^short = "住所が使用されていた（いる）期間"
* address.period ^definition = "住所が使用されていた（いる）期間"
* address.period ^comment = "住所が使用されていた/されている期間。 期間は時間の範囲を指定する。使用状況はその期間全体に適用されるか、範囲から1つの値が適用される。  期間は、時間間隔（経過時間の測定値）には使用されない。"

* gender ^definition = "管理や記録のためにその人が持っていると思われる性別。"
* gender ^requirements = "正しく相手に対応する必要がある。"
* birthDate ^short = "医療従事者の生年月日"
* birthDate ^definition = "医療従事者の生年月日"
* birthDate ^requirements = "身分証明に必要。"
* photo ^definition = "医療従事者の写真。"
* photo ^comment = "サマリービューを提供する場合（例えば、Observation.value[x]で）、添付ファイルは \"Signed Procedure Consent \"のような簡単な表示テキストで表現されなければならない。"
* photo ^requirements = "多くのEHRシステムは、患者や職員の画像をキャプチャする機能を持っている。新しいソーシャルメディアの利用にも対応している。"
* qualification ^short = "ケアの提供に関連する認定、ライセンス、またはトレーニング 【詳細参照】"
* qualification ^definition = "医療従事者によるケアの提供を認可する、あるいは関連する、公式の証明書、トレーニング、免許証等。  
例えば、医療委員会が発行した医師免許証は、認定された地域内で医療を行うことを開業医に許可するものである。"
* qualification ^comment = "麻薬施用者免許番号、または医籍登録番号を格納するためのQualification/Slicing定義。  
麻薬施用者免許番号の場合のsystemはFixed Valueの urn:oid:1.2.392.100495.20.3.32.1[都道府県番号] を使用する。  
( 頭に1をつけて末尾3桁で表現する。これは北海道などの場合、都道府県番号は01になるが、OIDでは先頭が0は許可されていないため、頭に1をつけて3桁で表現する)  
つまり麻薬施用者免許番号を発行した都道府県ごとにsystemも異なる値となる。  
医籍登録番号のsystemはFixed Valueの urn:oid:1.2.392.100495.20.3.31 を使用する。"
* qualification.identifier ^definition = "この人物のこの役割における資格に適用される識別子。"
* qualification.identifier ^comment = "【JP Core仕様】identifierには資格番号を入力する。  
Codeは、v2 table 0360が例としてのっている。0360は、USER-DEFINED TABLES であるため、適切なCodeがなければ追加できる。  
Periodにはその資格の開始日・終了日を入力する。（例：麻薬資格者の有効期限等の格納）  
医籍登録番号　Practitioner.qualification.identifier　urn:oid:1.2.392.100495.20.3.31  
麻薬施用者番号　Practitioner.qualification.identifier　urn:oid:1.2.392.100495.20.3.32.都道府県OID番号  
　　（都道府県OID番号は、都道府県番号2桁の先頭に１をつけた3桁の番号）"
* qualification.identifier ^requirements = "多くの場合、資格には特定の識別子が割り当てられる。"
* qualification.code ^definition = "資格のコード化された表現。"
* qualification.code ^comment = "すべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* qualification.period ^definition = "資格が有効な期間。"
* qualification.period ^comment = "使用のコンテキストは、範囲全体が適用されるか（例：「患者はこの時間範囲で病院の入院患者であった」）、範囲内の1つの値が適用されるか（例：「この2つの時間の間に患者に与える」）を指定する。  
期間は、期間(経過時間の尺度)には使用されない。[Duration](http://hl7.org/fhir/R4/datatypes.html#Duration)を参照のこと。"
* qualification.period ^requirements = "資格は期間限定のものが多く、取り消されることもある。"
* qualification.issuer ^definition = "資格を規制し、発行する機関"
* qualification.issuer ^comment = "参照は実際のFHIRリソースへの参照でなければならず、解決可能でなければならない。解決は URL からの検索、またはリソースタイプによって、絶対参照を正規の URL として扱い、ローカルのレジストリ/リポジトリで検索することで行うことができる。"
* qualification ^slicing.discriminator.type = #value
* qualification ^slicing.discriminator.path = "code"
* qualification ^slicing.rules = #open
* qualification contains
    narcoticPrescriptionLicenseNumber ..47 and
    medicalRegistrationNumber ..1
* qualification[narcoticPrescriptionLicenseNumber].identifier ^short = "都道府県別 麻薬施用者免許番号"
* qualification[narcoticPrescriptionLicenseNumber].identifier.system ^short = "麻薬施用者免許番号OIDを格納。OIDは右記のルールに従う。urn:oid:1.2.392.100495.20.3.32.[1(固定)+都道府県番号(２桁)] 【詳細参照】"
* qualification[narcoticPrescriptionLicenseNumber].identifier.system ^definition = "麻薬施用者免許番号OIDを格納。OIDは右記のルールに従う。urn:oid:1.2.392.100495.20.3.32.[1(固定)+都道府県番号(２桁)]"
* qualification[narcoticPrescriptionLicenseNumber].identifier.system ^comment = "麻薬施用者免許番号OIDを格納。OIDは右記のルールに従う。urn:oid:1.2.392.100495.20.3.32.[1(固定)+都道府県番号(２桁)]。  
都道府県毎のOIDを以下に示す。  
　- urn:oid:1.2.392.100495.20.3.32.101(北海道)  
　- urn:oid:1.2.392.100495.20.3.32.102(青森県)  
　- urn:oid:1.2.392.100495.20.3.32.103(岩手県)  
　- urn:oid:1.2.392.100495.20.3.32.104(宮城県)  
　- urn:oid:1.2.392.100495.20.3.32.105(秋田県)  
　- urn:oid:1.2.392.100495.20.3.32.106(山形県)  
　- urn:oid:1.2.392.100495.20.3.32.107(福島県)  
　- urn:oid:1.2.392.100495.20.3.32.108(茨城県)  
　- urn:oid:1.2.392.100495.20.3.32.109(栃木県)  
　- urn:oid:1.2.392.100495.20.3.32.110(群馬県)  
　- urn:oid:1.2.392.100495.20.3.32.111(埼玉県)  
　- urn:oid:1.2.392.100495.20.3.32.112(千葉県)  
　- urn:oid:1.2.392.100495.20.3.32.113(東京都)  
　- urn:oid:1.2.392.100495.20.3.32.114(神奈川)  
　- urn:oid:1.2.392.100495.20.3.32.115(新潟県)  
　- urn:oid:1.2.392.100495.20.3.32.116(富山県)  
　- urn:oid:1.2.392.100495.20.3.32.117(石川県)  
　- urn:oid:1.2.392.100495.20.3.32.118(福井県)  
　- urn:oid:1.2.392.100495.20.3.32.119(山梨県)  
　- urn:oid:1.2.392.100495.20.3.32.120(長野県)  
　- urn:oid:1.2.392.100495.20.3.32.121(岐阜県)  
　- urn:oid:1.2.392.100495.20.3.32.122(静岡県)  
　- urn:oid:1.2.392.100495.20.3.32.123(愛知県)  
　- urn:oid:1.2.392.100495.20.3.32.124(三重県)  
　- urn:oid:1.2.392.100495.20.3.32.125(滋賀県)  
　- urn:oid:1.2.392.100495.20.3.32.126(京都府)  
　- urn:oid:1.2.392.100495.20.3.32.127(大阪府)  
　- urn:oid:1.2.392.100495.20.3.32.128(兵庫県)  
　- urn:oid:1.2.392.100495.20.3.32.129(奈良県)  
　- urn:oid:1.2.392.100495.20.3.32.130(和歌山県)  
　- urn:oid:1.2.392.100495.20.3.32.131(鳥取県)  
　- urn:oid:1.2.392.100495.20.3.32.132(島根県)  
　- urn:oid:1.2.392.100495.20.3.32.133(岡山県)  
　- urn:oid:1.2.392.100495.20.3.32.134(広島県)  
　- urn:oid:1.2.392.100495.20.3.32.135(山口県)  
　- urn:oid:1.2.392.100495.20.3.32.136(徳島県)  
　- urn:oid:1.2.392.100495.20.3.32.137(香川県)  
　- urn:oid:1.2.392.100495.20.3.32.138(愛媛県)  
　- urn:oid:1.2.392.100495.20.3.32.139(高知県)  
　- urn:oid:1.2.392.100495.20.3.32.140(福岡県)  
　- urn:oid:1.2.392.100495.20.3.32.141(佐賀県)  
　- urn:oid:1.2.392.100495.20.3.32.142(長崎県)  
　- urn:oid:1.2.392.100495.20.3.32.143(熊本県)  
　- urn:oid:1.2.392.100495.20.3.32.144(大分県)  
　- urn:oid:1.2.392.100495.20.3.32.145(宮崎県)  
　- urn:oid:1.2.392.100495.20.3.32.146(鹿児島県)  
　- urn:oid:1.2.392.100495.20.3.32.147(沖縄県)"
* qualification[narcoticPrescriptionLicenseNumber].identifier.value ^short = "都道府県別　麻薬施用者免許番号 【詳細参照】"
* qualification[narcoticPrescriptionLicenseNumber].identifier.value ^comment = "都道府県別　麻薬施用者免許番号"
* qualification[narcoticPrescriptionLicenseNumber].code from JP_MedicalLicenseCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber].code = $JP_MedicalLicenseCertificate_CS#narcotics-practitioner
* qualification[narcoticPrescriptionLicenseNumber].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber].identifier.assigner only Reference(JP_Organization)
* qualification[medicalRegistrationNumber].identifier ^short = "医籍登録番号"
* qualification[medicalRegistrationNumber].identifier.system = "urn:oid:1.2.392.100495.20.3.31" (exactly)
* qualification[medicalRegistrationNumber].identifier.value ^short = "医籍登録番号"
* qualification[medicalRegistrationNumber].identifier.value ^comment = "医籍登録番号"
* qualification[medicalRegistrationNumber].code from JP_MedicalLicenseCertificate_VS (required)
* qualification[medicalRegistrationNumber].code = $JP_MedicalLicenseCertificate_CS#medical-registration
* qualification[medicalRegistrationNumber].identifier.assigner only Reference(JP_Organization)
* qualification[medicalRegistrationNumber].issuer only Reference(JP_Organization)

* communication ^short = "医療従事者が患者とのコミュニケーションで使用できる言語"
* communication ^definition = "医療従事者が患者とのコミュニケーションで使用できる言語。"
* communication ^comment = "このように正確なケーシングを持つ構造体 aa-BB は、ロケールのために最も広く使われている表記法の一つ。しかし、すべてのシステムがこれをコード化しているわけではなく、代わりにフリーテキストとしている。そのため、データ型としてはコードの代わりに CodeableConcept を使用している。"
* communication ^requirements = "医療従事者がどの言語を話すかを知ることは、患者とのコミュニケーションを円滑にするのに役立つ。"
