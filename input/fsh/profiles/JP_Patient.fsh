// ==============================
//   Profile 定義
// ==============================
Profile: JP_Patient
Parent: Patient
Id: jp-patient
Title: "JP Core Patient Profile"
Description: "このプロファイルはPatientリソースに対して、患者のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient"
* ^status = #active
* ^date = "2025-07-04"
* . ^short = "医療サービスを受けている個人または動物に関する情報"
* . ^definition = "ケアまたはその他の健康関連サービスを受けている個人または動物に関する基本情報およびその他の管理情報。"
* extension contains
    $patient-religion|4.0.1 named religion ..* and
    $patient-birthPlace|4.0.1 named birthPlace ..1 and
    JP_Patient_Race named race ..*
* extension[religion] ^short = "患者の宗教 【詳細参照】"
* extension[religion] ^definition = "患者の公言された宗教的所属。"
* extension[religion] ^comment = "患者の宗教をValueSet(v3.ReligiousAffiliation)より選択する。輸血や食事で考慮が必要な場合がある。  
　- 1013 キリスト教  
　- 1020 ヒンドゥー教  
　- 1023 イスラム教  
　  
など"
* extension[birthPlace] ^short = "患者の生誕地 【詳細参照】"
* extension[birthPlace] ^definition = "患者の登録された出生地。システムは、birthPlaceアドレスを個別の要素に格納しない場合、address.textを使用してよい。"
* extension[birthPlace] ^comment = "患者の生誕地をAddress型で表現する"
* extension[race] ^short = "患者の人種 【詳細参照】"
* extension[race] ^definition = "オプションの拡張要素-すべてのリソースで使用できる。"
* extension[race] ^comment = "患者の人種をValueSet(Race)より選択する。  
　- 2034-7 中国人  
　- 2039-6 日本人  
　- 2040-4 韓国人  
　- 2108-9 ヨーロッパ人  
　- 2110-5 英国人  
　- 2111-3 フランス人  
　- 2112-1 ドイツ人  
　  
など"
* identifier 1..
* identifier ^short = "患者の識別子【詳細参照】"
* identifier ^definition = "患者の識別子。"
* identifier ^comment = "IDの名前空間を表す Patient.identifier.system と ID値そのものを表す Patient.identifier.value の組み合わせとして表現する。  
Patient.identifier.system には、urn:oid:1.2.392.100495.20.3.51.医療機関識別OID番号を使用する。  
医療機関識別OID番号は患者IDの発行者である機関の医療機関コード（１０桁）の先頭に１をつけた11桁とする。医療機関コード（１０桁）の詳細はOrganizationプロファイルの医療機関コード１０桁の説明を参照すること。  
　  
例：医療機関コード「1312345670」の場合「urn:oid:1.2.392.100495.20.3.51.11312345670」  
　  
なお、urn:oid:1.2.392.100495.20.3.51の部分は、「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」表19 識別子名前空間一覧において医療機関等の患者IDとして割り当てられたOIDのURL型である。地域医療連携ネットワークの地域患者IDを指定する場合も同様に、地域患者IDを識別する名前空間（IHE ITI PIX等で使用されるOID等）をsystemに使用することができる。"
* identifier ^requirements = "ほとんどの場合、患者には特定の数値識別子が割り当てられる。"
* identifier.use ^short = "usual | official | temp | secondary | old (If known) 【詳細参照】"
* identifier.use ^comment = "IDの種別をValueSet(IdentifierUse)より選択する。  - usual : 一般- official : 公式（マイナンバーなど、最も信頼できると見なされる場合に使用）- temp : 一時的　- secondary : 二次利用　- old : 過去の識別子"
* identifier.type ^short = "識別子の種別 【詳細参照】"
* identifier.type ^comment = "IDの種別をValueSet(Identifier Type Codes)より選択する。　- DL : 運転免許証番号　- PPN : パスポート番号　- BRN : 血統登録番号　- MR : カルテ番号、など"
* identifier.system ^short = "The namespace for the identifier value 【詳細参照】"
* identifier.system ^comment = "Patient.identifier.system には、urn:oid:1.2.392.100495.20.3.51.医療機関識別OID番号を使用する。 医療機関識別OID番号は患者IDの発行者である機関の医療機関コード（１０桁）の先頭に１をつけた11桁とする。医療機関コード（１０桁）の詳細はOrganizationプロファイルの医療機関コード１０桁の説明を参照すること。  ```例：医療機関コード「1312345670」の場合「urn:oid:1.2.392.100495.20.3.51.11312345670」```　なお、urn:oid:1.2.392.100495.20.3.51の部分は、「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」表19 識別子名前空間一覧において医療機関等の患者IDとして割り当てられたOIDのURL型である。地域医療連携ネットワークの地域患者IDを指定する場合も同様に、地域患者IDを識別する名前空間（IHE ITI PIX等で使用されるOID等）をsystemに使用することができる。"
* identifier.value 1..
* identifier.value ^short = "識別子のvalueは一意である必要がある。 【詳細参照】"
* identifier.value ^comment = "患者を一意的に識別するID(例えば、患者IDやカルテ番号など)を設定。"
* identifier.period ^comment = "IDが使われていた/使われている期間。"
* identifier.assigner only Reference(JP_Organization)
* identifier.assigner ^comment = "IDを発行した組織（テキストのみでも可）"
* active ^definition = "この患者記録がアクティブに使用されているかどうか。多くのシステムは、このプロパティを使用して、組織のビジネスルールに基づいて一定期間見られなかった患者など、非現在の患者としてマークする。  
非アクティブな患者を除外するために患者リストをフィルタリングするためによく使用される。  
死亡した患者は、同じ理由で不活性とマークされる場合があるが、死後しばらくは活性である場合がある。"
* active ^comment = "この患者の記録が有効かどうか。誤って患者を登録して削除したい場合などにfalseにする"
* active ^requirements = "患者レコードが誤って作成された場合のため、使用されないレコードとしてマークできる必要がある。"
* active ^isModifierReason = "この要素は、レコードの有効・無効判定を示すステータス要素であるため、修飾子としてラベル付けされる"
* name only JP_HumanName
* name ^definition = "個人に関連付けられた名前。"
* name ^comment = "患者は、用途や適用期間が異なる複数の名前を持つ場合がある。動物の場合、名前は人間によって割り当てられて使用され、同じパターンを持つという意味で「HumanName」を使用する。  
FHIRデータ型仕様に従って、以下の内容を採用する。  
　- 姓名分割できる場合は、名前パート HumanName.familyとHumanName.givenに指定する  
　- ミドルネームがある場合は、given に指定する（givenは繰り返し可能）  
　- 姓名に分割できない場合は、HumanName.text にフルネームを指定する  
　- 各名前パートとtext は、両方存在してもよい  
　- 漢字氏名、カナ氏名の区別は、iso21090-EN-representation を使用する"
* name ^requirements = "複数の名前で患者を追跡できる必要がある。例としては、正式名とパートナー名がある。"
* telecom ^short = "個人に連絡するための連絡先の詳細"
* telecom ^definition = "個人に連絡するための連絡先の詳細（電話番号や電子メールアドレスなど）。"
* telecom ^comment = "患者は、さまざまな用途または適用期間違いで連絡先を複数の方法を持っている場合がある。緊急時連絡先として、また身元確認を支援するためのオプションが必要になる場合がある。患者当人に直接連絡できない場合があるが、患者を代理できる別の関係者（自宅の電話、またはペットの所有者の電話）を設定する場合もある。"
* telecom ^requirements = "人々は、電話、電子メールなどの何らかの方法で彼らに連絡する（プライマリ）方法を持っている。"
* telecom.system ^short = "phone | fax | email | pager | url | sms | other 【詳細参照】"
* telecom.system ^comment = "患者の連絡先の種別をValueSet(ContactPointSystem)より選択する。  　- phone : 電話　- fax : Fax 　- email : 電子メール　- pager : ポケットベル　- url : 電話、ファックス、ポケットベル、または電子メールアドレスではなく、URLとして表される連絡先。これはWebサイト、ブログ、Skype、Twitter、Facebookなどのさまざまな機関または個人の連絡先を対象としている。電子メールアドレスには使用しないこと。　- sms : SMSメッセージの送信に使用できる連絡先（携帯電話、一部の固定電話など）  　- other : 電話、Fax、ポケットベル、または電子メールアドレスではなく、URLとして表現できない連絡先。例：内部メールアドレス。これは、URLとして表現できる連絡先（Skype、Twitter、Facebookなど）には使用しないこと。"
* telecom.value ^comment = "連絡先の番号やメールアドレス"
* telecom.use ^short = "home | work | temp | old | mobile - 連絡先の用途等 【詳細参照】"
* telecom.use ^comment = "患者の連絡先の種別をValueSet(ContactPointUse)より選択する。   一時的なものまたは古いものであると明示しない限り、連絡先が最新とみなされる。  
　- home : 自宅  
　- work : 職場  
　- temp : 一時的  
　- old : 以前の  
　- mobile : モバイル機器"
* telecom.rank ^comment = "連絡先の使用順序（1 = 最高）"
* telecom.period ^comment = "連絡先が使用されていた/されている期間"
* gender ^definition = "管理上の性別-患者が管理および記録管理の目的で持つと見なされる性別。"
* gender ^comment = "患者の性別をValueSet(AdministrativeGender)より選択する。  
　male 男性  
　female 女性  
　other その他  
　unknown 不明"
* birthDate ^short = "個人の生年月日"
* birthDate ^definition = "個人の生年月日"
* birthDate ^comment = "実際の生年月日が不明な場合は、少なくとも推定年を推測として提供する必要があり、時間が必要な場合（出産/乳児ケアシステムなど）に使用できる標準の拡張extension「patient-birthTime」がある。  
患者の生年月日をYYYY-MM-DD形式で入れる。  
例：1945-08-23"
* deceased[x] ^short = "個人が死亡しているかどうかを示す"
* deceased[x] ^definition = "個人が死亡しているかどうかを示す。"
* deceased[x] ^comment = "値がない場合は、個人が死亡したかどうかについてのステートメントがないことを意味し、ほとんどのシステムは、値がないことを人が生きていることの兆候として解釈する。  
患者が死亡しているかどうかを示す  deceasedBooleanまたはdeceasedDateTimeのどちらかに値が入る  
　- deceasedBoolean : true(死亡) / false(生存)  
　- deceasedDateTime : 患者の死亡日時"
* address ^short = "個人の住所 【詳細参照】"
* address ^definition = "個人の住所。"
* address ^comment = "患者は、異なる用途または適用可能な期間で複数の住所を持っている可能性がある。  
【JP Core仕様】FHIRデータ型仕様に従って、以下の案とした。  
　- 住所が構造化されている場合、住所パート Address.country、Address.postalcode、Address.state、Address.city、Address.line に分割して記載する  
　- 住所が構造化されていない場合は、Address.text に記述する  
　- 各住所パートとtext は、両方存在してもよい  
※診療文書構造化記述規約等では、streetAddressLine (FHIRではlineに対応) に指定するとなっていた。"
* address.use ^short = "home | work | temp | old | billing - purpose of this address　住所の用途 【詳細参照】"
* address.use ^definition = "The purpose of this address.  
住所の用途"
* address.use ^comment = "住所の用途をValueSet(AddressUse)より選択する。  
　- home : 自宅  
　- work : 職場  
　- temp : 一時的  
　- old : 以前の  
　- billing : 請求書、インボイス、領収書などの送付用"
* address.type ^short = "postal | physical | both 【詳細参照】"
* address.type ^definition = "住所（訪問できる住所）と郵送先住所（私書箱や気付住所など）を区別する。ほとんどのアドレスは両方。"
* address.type ^comment = "住所の種類をValueSet(AddressType)より選択する。  
　- postal : 郵送先 - 私書箱、気付の住所  
　- physical : 訪れることのできる物理的な住所  
　- both : postalとphysicalの両方"
* address.text ^short = "住所のテキスト表現 【詳細参照】"
* address.text ^definition = "表示するアドレス全体を指定する  
例：郵便ラベル。これは、特定の部品の代わりに、または特定の部品と同様に提供される場合がある。"
* address.text ^comment = "テキスト表現とパーツの両方を提供できる。アドレスを更新するアプリケーションは、テキストとパーツの両方が存在する場合、パーツにないコンテンツはテキストに含まれないようにする必要がある。  
　- 住所を(都道府県や市町村などに)分離して管理していない場合は、textに入れる。  
　- 住所を(都道府県や市町村などに)分離して管理している場合でも、まとめてtextに入れること。  
　- 郵便番号は含めない。  
　  
例：東京都文京区本郷7-3-1"
* address.line ^short = "ストリート名や番地など 【詳細参照】"
* address.line ^definition = "このコンポーネントには、家番号、アパート番号、通りの名前、通りの方向、P.O。が含まれる。ボックス番号、配達のヒント、および同様の住所情報など。"
* address.line ^comment = "【JP Core仕様】state要素とcity要素で表現しなかったそのあとの住所部分を番地以降の部分も含めてすべていれる。  
英数字は半角でも全角でもよい。文字列の前後および途中に空白文字を含めないこと。  
繰り返し要素が許されているので、区切りを表現したい場合には、複数要素に分けて格納してもよい。  
　  
例：本郷7-3-1  
例：大字石神９７６  
例：藤崎町大字藤崎字西村1-2 春山荘201号室"
* address.city ^short = "市区町村名 【詳細参照】"
* address.city ^definition = "n市、町、郊外、村、その他のコミュニティまたは配達センターの名前。"
* address.city ^comment = "１MBを超えないこと。  【JP Core仕様】郡市区町村部分だけを「郡」「市」「区」「町」「村」などの文字を含めて設定する。 例：文京区"
* address.district ^short = "地区名 【詳細参照】"
* address.district ^comment = "【JP Core仕様】日本の住所では使用しない。"
* address.state ^short = "国の次の地区単位 【詳細参照】"
* address.state ^definition = "国の主権が制限されている国のサブユニット。日本の場合、都道府県名。"
* address.state ^comment = "１MBを超えないこと。  都道府県名。「都」「道」「府」「県」のそれぞれの文字を含める。 例：東京都"
* address.postalCode ^short = "郵便番号 【詳細参照】"
* address.postalCode ^comment = "郵便番号。日本の郵便番号の場合には3桁数字とハイフン1文字と4桁数字からなる半角８文字、または最初の3桁だけの3文字のいずれかとする。 例：113-8655"
* address.country ^short = "国名またはISO 3166コード　(ISO 3166 2 or 3文字コード)"
* address.country ^definition = "国-一般的に理解されている、または一般的に受け入れられている国の国名かコード。"
* address.country ^comment = "ISO 3166 3文字コードは、人間が読める国名の代わりに使用する。  ISO 3166の2文字または3文字のコード.  日本であれば、JPまたはJPN"
* address.period ^short = "住所が使用されていた（いる）期間"
* address.period ^definition = "住所が使用されていた（いる）期間"
* address.period ^comment = "住所が使用されていた/されている期間。 期間は時間の範囲を指定する。使用状況はその期間全体に適用されるか、範囲から1つの値が適用される。  期間は、時間間隔（経過時間の測定値）には使用されない。"
* maritalStatus ^short = "患者の婚姻（市民）状態 【詳細参照】"
* maritalStatus ^definition = "このフィールドは患者の最新の婚姻（市民）状態"
* maritalStatus ^comment = "患者の婚姻関係をValueSet(Marital Status Codes)より選択する。  
　A : 婚姻取消・無効  
　D : 離婚  
　I : 暫定法令  
　L : 法的別居中  
　M : 既婚  
　P : 一夫多妻制  
　S : 生涯独身・非婚  
　T : 同棲  
　U : 未婚  
　W : 未亡人  
　UNK : 不明"
* multipleBirth[x] ^short = "患者が多胎出産の一人かどうか"
* multipleBirth[x] ^definition = "患者が多胎児の一人であるか（boolean）、実際の出生順位（integer）であるかを示す。"
* multipleBirth[x] ^comment = "multipleBirthBooleanまたはmultipleBirthIntegerのどちらかに値が入る  
　- multipleBirthBoolean : 多胎出産時かどうか  
３つ子の例にbooleanが指定された場合、3つの患者レコードすべてがvalueBoolean = trueになる（順序は示されない）  
　- multipleBirthInteger : 多胎出産時の出生順位  
たとえば、３つ子の２番目の生まれはvalueInteger = 2で、3番目の生まれはvalueInteger = 3になる"
* multipleBirth[x] ^requirements = "多産児の曖昧性解消、特にラボなど、医療提供者が患者に会わない場合に関連する。"
* photo ^short = "患者の画像"
* photo ^definition = "患者の画像。"
* photo ^comment = "ガイドライン：  
　- 臨床写真ではなく、身分証明写真を使用すること  
　- 寸法をサムネイルに制限する  
　- リソースの更新を容易にするため、バイト数を少なくすること"
* photo ^requirements = "多くのEHRシステムには、患者の画像をキャプチャする機能がある。より新しいソーシャルメディアの使用にも適合する。"
* contact ^short = "患者の連絡先者（例：保護者、パートナー、友人）"
* contact ^definition = "患者の連絡先者（例：保護者、パートナー、友人）。"
* contact ^comment = "連絡先には、家族、取引先、保護者、介護者など、あらゆる種類の連絡先が含まれる。連絡先として使用しない親戚や家族を登録するためには適用されない。"
* contact ^requirements = "患者について連絡できる人を確認する必要がある。"
* contact.relationship ^short = "関係性の種類 【詳細参照】"
* contact.relationship ^definition = "患者と連絡先の関係性。"
* contact.relationship ^comment = "患者との関係性をValueSet(PatientContactRelationship)より選択する。  
　C : 緊急連絡先  
　E : 雇用者  
　F : 連邦政府機関  
　I : 保険会社  
　N : 近親者  
　S : 州政府機関  
　U : 不明"
* contact.relationship ^requirements = "状況に応じて、アプローチするのに最適な関係者を決定するために使用される。"
* contact.name ^definition = "連絡先に登録された名前。"
* contact.name ^requirements = "連絡先は名前で識別する必要があるが、その連絡先に複数の名前が必要になることはまれである。"
* contact.telecom ^definition = "連絡先に登録された連絡方法（電話番号やメールアドレスなど）。"
* contact.telecom ^comment = "連絡先には、さまざまな用途または適用期間で連絡を取るための複数の方法がある。その人に緊急に連絡する際の連絡先を確認する必要がある。"
* contact.telecom ^requirements = "電話、電子メールなどの（優先する）連絡方法を確認する必要がある。"
* contact.address ^definition = "連絡先の住所。"
* contact.address ^requirements = "郵送ないし訪問により連絡を取ることができるよう注意する必要があるため。"
* contact.gender ^definition = "管理上の性別-連絡先担当者が管理および記録管理のために持っていると考えられる性別。"
* contact.gender ^requirements = "その人に正しく話しかけるために必要である。"
* contact.organization only Reference(JP_Organization)
* contact.organization ^definition = "連絡先が主として活動する、または勤務している組織。"
* contact.organization ^comment = "連絡先に関連する組織"
* contact.period ^definition = "この患者に関連して、この連絡担当者または組織に連絡することが有効な期間。"
* communication ^short = "健康について患者と会話する際に使用する言語"
* communication ^definition = "健康について患者と会話する際に使用する言語。"
* communication ^comment = "言語が指定されていない場合、デフォルトのローカル言語が話されていることを意味する。複数のモードの習熟度を伝える必要がある場合は、複数のPatient.Communicationアソシエーションが必要である。動物の場合、言語は関連するフィールドではないため、インスタンスから除外する必要がある。患者がデフォルトの現地言語を話さない場合、通訳者が必要であることを明示的に宣言するために、通訳者必須基準を使用できる。"
* communication ^requirements = "患者が現地の言語を話さない場合、通訳が必要になる場合があるため、話せる言語と習熟度は、患者と関心のある他の人の両方にとって注意すべき重要な事項である。"
* communication.language ^short = "健康について患者と会話する際に使用する言語。 【詳細参照】"
* communication.language ^definition = "ISO-639-1 alpha 2コード小文字で言語を、またオプションとしてハイフンとISO-3166-1 alpha 2コード大文字を続けて地域を表す。たとえば、英語の場合は「en」、アメリカ英語の場合は「en-US」、イギリス英語の場合は「en-EN」である。"
* communication.language ^comment = "患者とコミュニケーションするときに使用できる言語をValueSet(CommonLanguages)より選択する。  
　de : ドイツ語  
　en : 英語  
　fr : フランス語  
　ja : 日本語  
　ko : 韓国語  
など"
* communication.language ^requirements = "多言語の国のほとんどのシステムは、言語を伝えたいと考えられる。 すべてのシステムが実際に地域の方言を必要とするわけではない。"
* communication.preferred ^definition = "患者がこの言語を優先するかどうかを示す（他の言語よりも特定レベルまで習得している）。"
* communication.preferred ^comment = "この言語は、医療情報を伝えるために特に識別される。  
患者がこの言語を習得している場合はtrue、そうでなければfalseを設定する。"
* communication.preferred ^requirements = "特定のレベルまで複数の言語を習得している人は、複数の言語を選択する可能性がある。つまり、特定の言語でのコミュニケーションに自信を持ち、他の言語を一種の備えとしている。"
* generalPractitioner only Reference(JP_Organization or JP_Practitioner or JP_PractitionerRole)
* generalPractitioner ^short = "患者が指名するケア提供者"
* generalPractitioner ^definition = "患者が指名するケア提供者"
* generalPractitioner ^comment = "これはプライマリケア提供者(GPを含む)である場合もあれば、コミュニティ/障害を持つ患者指定のケアマネージャーである場合もある。ケアチームの記録には使用されない。これらはケアプランまたはEpisodeOfCareリソースにリンクされるCareTeamリソースに含まれている必要がある。複数のGPは、学期中の大学GPと共にリストされた家庭GPなどの学生や、「フライイン/フライアウト」労働者など、さまざまな理由で患者に対して記録される場合がある。また、医学的問題を認識し続けるために家庭GPに含まれる。  
管轄区域は、必要に応じてこれを1、またはタイプごとに1にプロファイルできると決定する場合がある。"
* managingOrganization only Reference(JP_Organization)
* managingOrganization ^short = "患者記録の管理者である組織"
* managingOrganization ^definition = "患者記録の管理者である組織。"
* managingOrganization ^comment = "特定の患者記録を管理する組織は1つだけである。他の組織には独自の患者レコードがあり、Linkプロパティを使用してレコードを結合する場合がある（または、関連付けの信頼性評価を含めることができる個人リソース）"
* managingOrganization ^requirements = "事実上の同一患者をリンクする別のPatientリソース"
* link ^definition = "事実上の同一患者をリンクする別のPatientリソース。"
* link ^comment = "リンクされた患者記録に相互リンクがあるという仮定はない。"
* link ^requirements = "複数のユースケースがある。  
　- 事務的なエラーのため一貫して人間を特定することが困難であり患者の記録が重複している  
　- 複数のサーバにわたり患者情報が配布されている"
* link ^isModifierReason = "この要素は、メインのPatientリソースではない可能性があるため、修飾子としてラベル付けされ、このPatientレコードの代わりに参照された患者を使用する必要がある。link.type値が 'replaced-by'の場合"
* link.other only Reference(JP_Patient or RelatedPerson)
* link.other ^definition = "リンクが参照する他の患者リソース。"
* link.other ^comment = "ここでRelatedPersonを参照すると、Personレコードを使用して患者とRelatedPersonを同じ個人として関連付ける必要がなくなる。"
* link.type ^short = "replaced-by | replaces | refer | seealso 【詳細参照】"
* link.type ^definition = "この患者リソースと別の患者リソース間のリンクのタイプ。"
* link.type ^comment = "この患者リソースと別の患者リソース間のリンクのタイプをValueSet(LinkType)より選択する。  
　- replaced-by : このリンクを含む患者リソースは使用しないこと  
　- replaces : このリンクを含む患者リソースは、現在アクティブな患者レコードである  
　- refer : このリンクを含む患者リソースは使用中であり、有効であるが、患者に関する主な情報源とは見なされていない  
　- seealso : このリンクを含む患者リソースは使用中で有効であるが、同じ人物に関するデータが含まれていることがわかっている別の患者リソースを指す"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_Patient_Race
Id: jp-patient-race
Title: "JP Core Patient Race Extension"
Description: "人種(Race)に関する情報を格納するためのExtension。"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race"
* ^status = #active
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "Patient"
* . ^short = "人種に関する情報"
* . ^comment = "人種に関する情報を表現する拡張。  
ValueSetとしてhttp://terminology.hl7.org/CodeSystem/v3-Raceを使用する。  
例：  
　- Code : Description  
　- 2103-3 : White  
　- 2039-6 : Japanese  
　- 2040-4 : Korean  
等"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race" (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $patient-race-vs  (preferred)