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
* ^date = "2022-07-31"
* . ^short = "ヘルスケアまたは関連サービスの提供に正式な責任を負う人"
* . ^definition = "A person who is directly or indirectly involved in the provisioning of healthcare.\r\n\r\n医療の提供に直接または間接的に関与する者をいう。"
* identifier ^definition = "An identifier that applies to this person in this role.\r\n\r\nある役割の人に適用される識別子。"
* identifier ^comment = "【JP-Core仕様】\r\nIDの名前空間を表す Practitioner.identifier.systemと ID値そのものを表す Practitioner.identifier.value の組み合わせとして表現する。\r\nPractitioner.identifier.systemには、\r\n医師の場合、　urn:oid:1.2.392.100495.20.3.41.医療機関識別OID番号\r\n歯科医師の場合、urn:oid:1.2.392.100495.20.3.42.医療機関識別OID番号\r\nを使用する。\r\n医療機関識別OID番号は、医師IDの発行者である医療機関を識別するもので、保険医療機関の場合、都道府県番号２桁から始まる10桁の医療機関番号（都道府県2桁、保険点数表コード1桁、保険医療機関番号７桁を連結したもの）または、特定健診・特定保健指導機関の医療機関番号10桁の先頭に１をつけた11桁とする。\r\n医療機関コードを持たない場合、「[9]＋当該施設の電話番号下 9 桁」を医療機関コードとして、その先頭に１をつけた11桁とする。\r\n\r\n例：医療機関コード「1312345670」での医師の場合「urn:oid:1.2.392.100495.20.3.41.11312345670」\r\n\r\nなお、rn:oid:1.2.392.100495.20.3.41　の部分は、厚生労働省 電子処方箋CDA 記述仕様第1版（平成30年7月）付表2 OID一覧において医師番号に割り当てられたOIDのURL型である。\r\n\r\n地域医療連携ネットワークの地域医療従事者IDを指定する場合も同様に、地域医療従事者IDを識別する名前空間（IHE ITI PIX等で使用されるOID等）を system に使用することができる。\r\n\r\n医師、歯科医師以外の医療者のIDの名前空間を表す system 値は今後検討する。"
* identifier ^requirements = "Often, specific identities are assigned for the agent.\r\n\r\n多くの場合、エージェントには特定の識別子が割り当てられている。"
* active ^definition = "Whether this practitioner's record is in active use.\r\n\r\nこの医療従事者の記録がアクティブに使用されているかどうかを示す。"
* active ^comment = "If the practitioner is not in use by one organization, then it should mark the period on the PractitionerRole with an end date (even if they are active) as they may be active in another role.\r\n\r\n医療従事者がある組織で使用されていない場合、別のロールでアクティブになっている可能性があるので、(例えそれらがアクティブであっても)PractitionerRoleに有効期間を終了日でマークしておく必要がある。"
* active ^requirements = "Need to be able to mark a practitioner record as not to be used because it was created in error.\r\n\r\n医療従事者のレコードを誤って作成してしまったとき、使用しないようにマークできるようにする必要がある。"
* active ^meaningWhenMissing = "This resource is generally assumed to be active if no value is provided for the active element\r\n\r\nこの要素に値が提供されていない場合、このリソースは通常アクティブである（1が入力されている）と解釈される。"
* name only JP_HumanName
* name ^definition = "The name(s) associated with the practitioner.\r\n\r\n医療従事者の氏名（複数の場合もある）"
* name ^comment = "The selection of the use property should ensure that there is a single usual name specified, and others use the nickname (alias), old, or other values as appropriate.  \r\rIn general, select the value to be used in the ResourceReference.display based on this:\r\r1. There is more than 1 name\r2. Use = usual\r3. Period is current to the date of the usage\r4. Use = official\r5. Other order as decided by internal business rules.\r\n\r\nuseプロパティの選択は、指定された単一の通常の名前があることを保証しなければならず、他の値はニックネーム（別名）、旧名、または他の値を適切に使用する。\r\n\r\n一般的には、以下を基準にResourceReference.displayで使用する値を選択する。\r\n\r\n 1. There is more than 1 name（最低限1つ以上の名前があること）\r\n 2. Use = usual（useプロパティが「usual」であること）\r\n 3. Period is current to the date of the usage（有効期限は利用開始日から現在まであること）\r\n 4. Use = official（useプロパティが「official」であること\r\n 5. Other order as decided by internal business rules.（その他、内部ルールで決められた順番）\r\n\r\n医療従事者のNameの漢字カナ表記については、JP_Patient.nameで採用した方法を踏襲する。\r\nそのほか、要素の説明は、JP_Patient.nameを参照。"
* name ^requirements = "The name(s) that a Practitioner is known by. Where there are multiple, the name that the practitioner is usually known as should be used in the display.\r\n\r\n\r\n医療従事者が知られている名前。複数ある場合は、従事者が通常知られている名前を表示に使用する。"
* telecom ^short = "A contact detail for the practitioner (that apply to all roles)　電話番号やメールアドレスなど、従事者への詳細な連絡先。"
* telecom ^definition = "A contact detail for the practitioner, e.g. a telephone number or an email address.\r\n\r\n電話番号やメールアドレスなど、従事者への詳細な連絡先。"
* telecom ^comment = "Person may have multiple ways to be contacted with different uses or applicable periods.  May need to have options for contacting the person urgently and to help with identification.  These typically will have home numbers, or mobile numbers that are not role specific.\r\n\r\n人は、異なる用途や適用される期間に応じて複数の連絡方法を持っている可能性がある。本人に緊急に連絡を取るためのオプションが必要な場合があり、また本人の身元確認に役立つ場合がある。これらは通常、自宅の電話番号、または役割が特定されていない携帯電話番号を持つことになる。\r\n\r\n要素の説明は、JP_Patient.telecomを参照。"
* telecom ^requirements = "Need to know how to reach a practitioner independent to any roles the practitioner may have.\r\n\r\n医療従事者が持っているかもしれない任意の役割ごとに独立した連絡方法を知る必要がある。"
* telecom.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](datatypes.html#Duration).\r\n期間は時間の範囲を指定する。使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、範囲から1つの値が適用されるか（たとえば、「この2回の間に患者に与える」）を指定する。\r\n期間は、時間間隔（経過時間の測定値）には使用されない。 [Duration]（datatypes.html＃Duration）を参照のこと。"
* address ^short = "Address(es) of the practitioner that are not role specific (typically home address)　役割が特定されていない従事者の住所（通常は自宅の住所）"
* address ^definition = "Address(es) of the practitioner that are not role specific (typically home address). \rWork addresses are not typically entered in this property as they are usually role dependent.\r\n\r\n役割が特定されていない従事者の住所（通常は自宅の住所）。\r\n勤務先の住所は通常、役割に依存するため、このプロパティには入力されない。"
* address ^comment = "The PractitionerRole does not have an address value on it, as it is expected that the location property be used for this purpose (which has an address).\r\n\r\nPractitionerRoleにアドレス値が付いていないのは、この目的のためにロケーションプロパティを使用することが想定されているからである（アドレスが付いている）。\r\n\r\n要素の説明は、JP_Patient.address を参照。"
* address ^requirements = "The home/mailing address of the practitioner is often required for employee administration purposes, and also for some rostering services where the start point (practitioners home) can be used in calculations.\r\n\r\n医療従事者の自宅/メールアドレスは、従業員管理のために必要とされることが多く、また、一部のロスタリングサービスでは、開始点（医療従事者の自宅）が計算に使用されることがある。"
* address.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](datatypes.html#Duration).\r\n期間は時間の範囲を指定する。使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、範囲から1つの値が適用されるか（たとえば、「この2回の間に患者に与える」）を指定する。\r\n期間は、時間間隔（経過時間の測定値）には使用されない。 [Duration]（datatypes.html＃Duration）を参照のこと。"
* gender ^definition = "Administrative Gender - the gender that the person is considered to have for administration and record keeping purposes.\r\n\r\n管理や記録のためにその人が持っていると思われる性別。"
* gender ^requirements = "Needed to address the person correctly.\r\n正しく相手に対応する必要がある。"
* birthDate ^short = "The date  on which the practitioner was born　医療従事者の生年月日"
* birthDate ^definition = "The date of birth for the practitioner.\r\n\r\n医療従事者の生年月日"
* birthDate ^requirements = "Needed for identification.\r\n\r\n身分証明に必要。"
* photo ^definition = "Image of the person.\r\n\r\n医療従事者の写真。"
* photo ^comment = "When providing a summary view (for example with Observation.value[x]) Attachment should be represented with a brief display text such as \"Signed Procedure Consent\".\r\n\r\nサマリービューを提供する場合（例えば、Observation.value[x]で）、添付ファイルは \"Signed Procedure Consent \"のような簡単な表示テキストで表現されなければならない。"
* photo ^requirements = "Many EHR systems have the capability to capture an image of patients and personnel. Fits with newer social media usage too.\r\n\r\n多くのEHRシステムは、患者や職員の画像をキャプチャする機能を持っている。新しいソーシャルメディアの利用にも対応している。"
* qualification ^short = "Certification, licenses, or training pertaining to the provision of care　ケアの提供に関連する認定、ライセンス、またはトレーニング"
* qualification ^definition = "The official certifications, training, and licenses that authorize or otherwise pertain to the provision of care by the practitioner.  For example, a medical license issued by a medical board authorizing the practitioner to practice medicine within a certain locality.\r\n\r\n医療従事者によるケアの提供を認可する、あるいは関連する、公式の証明書、トレーニング、免許証等。\r\n例えば、医療委員会が発行した医師免許証は、認定された地域内で医療を行うことを開業医に許可するものである。"
* qualification ^comment = "【JP-Core仕様】\r\nidentifierには資格番号を入力する。\r\nCodeは、v2 table 0360が例としてのっている。0360は、USER-DEFINED TABLES であるため、適切なCodeがなければ追加できる。\r\nPeriodにはその資格の開始日・終了日を入力する。（例：麻薬資格者の有効期限等の格納）\r\n\r\n医籍登録番号　Practitioner.qualification.identifier　urn:oid:1.2.392.100495.20.3.31\r\n麻薬施用者番号　Practitioner.qualification.identifier　urn:oid:1.2.392.100495.20.3.32.都道府県OID番号\r\n　　（都道府県OID番号は、都道府県番号2桁の先頭に１をつけた3桁の番号）"
* qualification.identifier ^definition = "An identifier that applies to this person's qualification in this role.\r\n\r\n\r\nこの人物のこの役割における資格に適用される識別子。"
* qualification.identifier ^requirements = "Often, specific identities are assigned for the qualification.\r\n\r\n\r\n多くの場合、資格には特定の識別子が割り当てられる。"
* qualification.code ^definition = "Coded representation of the qualification.\r\n\r\n\r\n資格のコード化された表現。"
* qualification.code ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\n\r\nすべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* qualification.period ^definition = "Period during which the qualification is valid.\r\n\r\n\r\n資格が有効な期間。"
* qualification.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](datatypes.html#Duration).\r\n\r\n\r\n使用のコンテキストは、範囲全体が適用されるか（例：「患者はこの時間範囲で病院の入院患者であった」）、範囲内の1つの値が適用されるか（例：「この2つの時間の間に患者に与える」）を指定する。\r\n\r\n期間は、期間(経過時間の尺度)には使用されない。[Duration](datatypes.html#Duration)を参照のこと。"
* qualification.period ^requirements = "Qualifications are often for a limited period of time, and can be revoked.\r\n\r\n\r\n資格は期間限定のものが多く、取り消されることもある。"
* qualification.issuer ^definition = "Organization that regulates and issues the qualification.\r\n\r\n\r\n資格を規制し、発行する機関"
* qualification.issuer ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n\r\n参照は実際のFHIRリソースへの参照でなければならず、解決可能でなければならない。解決は URL からの検索、またはリソースタイプによって、絶対参照を正規の URL として扱い、ローカルのレジストリ/リポジトリで検索することで行うことができる。"
* qualification ^slicing.discriminator.type = #value
* qualification ^slicing.discriminator.path = "identifier.system"
* qualification ^slicing.rules = #open
* qualification ^comment = "麻薬施用者免許番号、または医籍登録番号を格納するためのQualification/Slicing定義。\r\n\r\ns麻薬施用者免許番号の場合のsystemはFixed Valueの urn:oid:1.2.392.100495.20.3.32.1[都道府県番号] を使用する。\r\n( 頭に1をつけて末尾3桁で表現する。これは北海道などの場合、都道府県番号は01になるが、OID\r\nでは先頭が0は許可されていないため、頭に1をつけて3桁で表現する)\r\nつまり麻薬施用者免許番号を発行した都道府県ごとにsystemも異なる値となる。\r\n医籍登録番号のsystemはFixed Valueの urn:oid:1.2.392.100495.20.3.31 を使用する。"
* qualification contains
    narcoticPrescriptionLicenseNumber01 ..1 and
    narcoticPrescriptionLicenseNumber02 ..1 and
    narcoticPrescriptionLicenseNumber03 ..1 and
    narcoticPrescriptionLicenseNumber04 ..1 and
    narcoticPrescriptionLicenseNumber05 ..1 and
    narcoticPrescriptionLicenseNumber06 ..1 and
    narcoticPrescriptionLicenseNumber07 ..1 and
    narcoticPrescriptionLicenseNumber08 ..1 and
    narcoticPrescriptionLicenseNumber09 ..1 and
    narcoticPrescriptionLicenseNumber10 ..1 and
    narcoticPrescriptionLicenseNumber11 ..1 and
    narcoticPrescriptionLicenseNumber12 ..1 and
    narcoticPrescriptionLicenseNumber13 ..1 and
    narcoticPrescriptionLicenseNumber14 ..1 and
    narcoticPrescriptionLicenseNumber15 ..1 and
    narcoticPrescriptionLicenseNumber16 ..1 and
    narcoticPrescriptionLicenseNumber17 ..1 and
    narcoticPrescriptionLicenseNumber18 ..1 and
    narcoticPrescriptionLicenseNumber19 ..1 and
    narcoticPrescriptionLicenseNumber20 ..1 and
    narcoticPrescriptionLicenseNumber21 ..1 and
    narcoticPrescriptionLicenseNumber22 ..1 and
    narcoticPrescriptionLicenseNumber23 ..1 and
    narcoticPrescriptionLicenseNumber24 ..1 and
    narcoticPrescriptionLicenseNumber25 ..1 and
    narcoticPrescriptionLicenseNumber26 ..1 and
    narcoticPrescriptionLicenseNumber27 ..1 and
    narcoticPrescriptionLicenseNumber28 ..1 and
    narcoticPrescriptionLicenseNumber29 ..1 and
    narcoticPrescriptionLicenseNumber30 ..1 and
    narcoticPrescriptionLicenseNumber31 ..1 and
    narcoticPrescriptionLicenseNumber32 ..1 and
    narcoticPrescriptionLicenseNumber33 ..1 and
    narcoticPrescriptionLicenseNumber34 ..1 and
    narcoticPrescriptionLicenseNumber35 ..1 and
    narcoticPrescriptionLicenseNumber36 ..1 and
    narcoticPrescriptionLicenseNumber37 ..1 and
    narcoticPrescriptionLicenseNumber38 ..1 and
    narcoticPrescriptionLicenseNumber39 ..1 and
    narcoticPrescriptionLicenseNumber40 ..1 and
    narcoticPrescriptionLicenseNumber41 ..1 and
    narcoticPrescriptionLicenseNumber42 ..1 and
    narcoticPrescriptionLicenseNumber43 ..1 and
    narcoticPrescriptionLicenseNumber44 ..1 and
    narcoticPrescriptionLicenseNumber45 ..1 and
    narcoticPrescriptionLicenseNumber46 ..1 and
    narcoticPrescriptionLicenseNumber47 ..1 and
    medicalRegistrationNumber ..1
* qualification[narcoticPrescriptionLicenseNumber01].identifier.system = "urn:oid:1.2.392.100495.20.3.32.101"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber02].identifier.system = "urn:oid:1.2.392.100495.20.3.32.102"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber03].identifier.system = "urn:oid:1.2.392.100495.20.3.32.103"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber04].identifier.system = "urn:oid:1.2.392.100495.20.3.32.104"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber05].identifier.system = "urn:oid:1.2.392.100495.20.3.32.105"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber06].identifier.system = "urn:oid:1.2.392.100495.20.3.32.106"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber07].identifier.system = "urn:oid:1.2.392.100495.20.3.32.107"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber08].identifier.system = "urn:oid:1.2.392.100495.20.3.32.108"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber09].identifier.system = "urn:oid:1.2.392.100495.20.3.32.109"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber10].identifier.system = "urn:oid:1.2.392.100495.20.3.32.110"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber11].identifier.system = "urn:oid:1.2.392.100495.20.3.32.111"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber12].identifier.system = "urn:oid:1.2.392.100495.20.3.32.112"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber13].identifier.system = "urn:oid:1.2.392.100495.20.3.32.113"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber14].identifier.system = "urn:oid:1.2.392.100495.20.3.32.114"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber15].identifier.system = "urn:oid:1.2.392.100495.20.3.32.115"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber16].identifier.system = "urn:oid:1.2.392.100495.20.3.32.116"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber17].identifier.system = "urn:oid:1.2.392.100495.20.3.32.117"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber18].identifier.system = "urn:oid:1.2.392.100495.20.3.32.118"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber19].identifier.system = "urn:oid:1.2.392.100495.20.3.32.119"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber20].identifier.system = "urn:oid:1.2.392.100495.20.3.32.120"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber21].identifier.system = "urn:oid:1.2.392.100495.20.3.32.121"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber22].identifier.system = "urn:oid:1.2.392.100495.20.3.32.122"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber23].identifier.system = "urn:oid:1.2.392.100495.20.3.32.123"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber24].identifier.system = "urn:oid:1.2.392.100495.20.3.32.124"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber25].identifier.system = "urn:oid:1.2.392.100495.20.3.32.125"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber26].identifier.system = "urn:oid:1.2.392.100495.20.3.32.126"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber27].identifier.system = "urn:oid:1.2.392.100495.20.3.32.127"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber28].identifier.system = "urn:oid:1.2.392.100495.20.3.32.128"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber29].identifier.system = "urn:oid:1.2.392.100495.20.3.32.129"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber30].identifier.system = "urn:oid:1.2.392.100495.20.3.32.130"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber31].identifier.system = "urn:oid:1.2.392.100495.20.3.32.131"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber32].identifier.system = "urn:oid:1.2.392.100495.20.3.32.132"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber33].identifier.system = "urn:oid:1.2.392.100495.20.3.32.133"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber34].identifier.system = "urn:oid:1.2.392.100495.20.3.32.134"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber35].identifier.system = "urn:oid:1.2.392.100495.20.3.32.135"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber36].identifier.system = "urn:oid:1.2.392.100495.20.3.32.136"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber37].identifier.system = "urn:oid:1.2.392.100495.20.3.32.137"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber38].identifier.system = "urn:oid:1.2.392.100495.20.3.32.138"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber39].identifier.system = "urn:oid:1.2.392.100495.20.3.32.139"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber40].identifier.system = "urn:oid:1.2.392.100495.20.3.32.140"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber41].identifier.system = "urn:oid:1.2.392.100495.20.3.32.141"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber42].identifier.system = "urn:oid:1.2.392.100495.20.3.32.142"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber43].identifier.system = "urn:oid:1.2.392.100495.20.3.32.143"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber44].identifier.system = "urn:oid:1.2.392.100495.20.3.32.144"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber45].identifier.system = "urn:oid:1.2.392.100495.20.3.32.145"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber46].identifier.system = "urn:oid:1.2.392.100495.20.3.32.146"  (exactly)
* qualification[narcoticPrescriptionLicenseNumber47].identifier.system = "urn:oid:1.2.392.100495.20.3.32.147"  (exactly)

* qualification[narcoticPrescriptionLicenseNumber01].identifier.value ^short = "麻薬施用者番号(北海道)"
* qualification[narcoticPrescriptionLicenseNumber02].identifier.value ^short = "麻薬施用者番号(青森県)"
* qualification[narcoticPrescriptionLicenseNumber03].identifier.value ^short = "麻薬施用者番号(岩手県)"
* qualification[narcoticPrescriptionLicenseNumber04].identifier.value ^short = "麻薬施用者番号(宮城県)"
* qualification[narcoticPrescriptionLicenseNumber05].identifier.value ^short = "麻薬施用者番号(秋田県)"
* qualification[narcoticPrescriptionLicenseNumber06].identifier.value ^short = "麻薬施用者番号(山形県)"
* qualification[narcoticPrescriptionLicenseNumber07].identifier.value ^short = "麻薬施用者番号(福島県)"
* qualification[narcoticPrescriptionLicenseNumber08].identifier.value ^short = "麻薬施用者番号(茨城県)"
* qualification[narcoticPrescriptionLicenseNumber09].identifier.value ^short = "麻薬施用者番号(栃木県)"
* qualification[narcoticPrescriptionLicenseNumber10].identifier.value ^short = "麻薬施用者番号(群馬県)"
* qualification[narcoticPrescriptionLicenseNumber11].identifier.value ^short = "麻薬施用者番号(埼玉県)"
* qualification[narcoticPrescriptionLicenseNumber12].identifier.value ^short = "麻薬施用者番号(千葉県)"
* qualification[narcoticPrescriptionLicenseNumber13].identifier.value ^short = "麻薬施用者番号(東京都)"
* qualification[narcoticPrescriptionLicenseNumber14].identifier.value ^short = "麻薬施用者番号(神奈川)"
* qualification[narcoticPrescriptionLicenseNumber15].identifier.value ^short = "麻薬施用者番号(新潟県)"
* qualification[narcoticPrescriptionLicenseNumber16].identifier.value ^short = "麻薬施用者番号(富山県)"
* qualification[narcoticPrescriptionLicenseNumber17].identifier.value ^short = "麻薬施用者番号(石川県)"
* qualification[narcoticPrescriptionLicenseNumber18].identifier.value ^short = "麻薬施用者番号(福井県)"
* qualification[narcoticPrescriptionLicenseNumber19].identifier.value ^short = "麻薬施用者番号(山梨県)"
* qualification[narcoticPrescriptionLicenseNumber20].identifier.value ^short = "麻薬施用者番号(長野県)"
* qualification[narcoticPrescriptionLicenseNumber21].identifier.value ^short = "麻薬施用者番号(岐阜県)"
* qualification[narcoticPrescriptionLicenseNumber22].identifier.value ^short = "麻薬施用者番号(静岡県)"
* qualification[narcoticPrescriptionLicenseNumber23].identifier.value ^short = "麻薬施用者番号(愛知県)"
* qualification[narcoticPrescriptionLicenseNumber24].identifier.value ^short = "麻薬施用者番号(三重県)"
* qualification[narcoticPrescriptionLicenseNumber25].identifier.value ^short = "麻薬施用者番号(滋賀県)"
* qualification[narcoticPrescriptionLicenseNumber26].identifier.value ^short = "麻薬施用者番号(京都府)"
* qualification[narcoticPrescriptionLicenseNumber27].identifier.value ^short = "麻薬施用者番号(大阪府)"
* qualification[narcoticPrescriptionLicenseNumber28].identifier.value ^short = "麻薬施用者番号(兵庫県)"
* qualification[narcoticPrescriptionLicenseNumber29].identifier.value ^short = "麻薬施用者番号(奈良県)"
* qualification[narcoticPrescriptionLicenseNumber30].identifier.value ^short = "麻薬施用者番号(和歌山県)"
* qualification[narcoticPrescriptionLicenseNumber31].identifier.value ^short = "麻薬施用者番号(鳥取県)"
* qualification[narcoticPrescriptionLicenseNumber32].identifier.value ^short = "麻薬施用者番号(島根県)"
* qualification[narcoticPrescriptionLicenseNumber33].identifier.value ^short = "麻薬施用者番号(岡山県)"
* qualification[narcoticPrescriptionLicenseNumber34].identifier.value ^short = "麻薬施用者番号(広島県)"
* qualification[narcoticPrescriptionLicenseNumber35].identifier.value ^short = "麻薬施用者番号(山口県)"
* qualification[narcoticPrescriptionLicenseNumber36].identifier.value ^short = "麻薬施用者番号(徳島県)"
* qualification[narcoticPrescriptionLicenseNumber37].identifier.value ^short = "麻薬施用者番号(香川県)"
* qualification[narcoticPrescriptionLicenseNumber38].identifier.value ^short = "麻薬施用者番号(愛媛県)"
* qualification[narcoticPrescriptionLicenseNumber39].identifier.value ^short = "麻薬施用者番号(高知県)"
* qualification[narcoticPrescriptionLicenseNumber40].identifier.value ^short = "麻薬施用者番号(福岡県)"
* qualification[narcoticPrescriptionLicenseNumber41].identifier.value ^short = "麻薬施用者番号(佐賀県)"
* qualification[narcoticPrescriptionLicenseNumber42].identifier.value ^short = "麻薬施用者番号(長崎県)"
* qualification[narcoticPrescriptionLicenseNumber43].identifier.value ^short = "麻薬施用者番号(熊本県)"
* qualification[narcoticPrescriptionLicenseNumber44].identifier.value ^short = "麻薬施用者番号(大分県)"
* qualification[narcoticPrescriptionLicenseNumber45].identifier.value ^short = "麻薬施用者番号(宮崎県)"
* qualification[narcoticPrescriptionLicenseNumber46].identifier.value ^short = "麻薬施用者番号(鹿児島県)"
* qualification[narcoticPrescriptionLicenseNumber47].identifier.value ^short = "麻薬施用者番号(沖縄県)"


* qualification[narcoticPrescriptionLicenseNumber01].identifier.value ^comment = "麻薬施用者番号(北海道)"
* qualification[narcoticPrescriptionLicenseNumber02].identifier.value ^comment = "麻薬施用者番号(青森県)"
* qualification[narcoticPrescriptionLicenseNumber03].identifier.value ^comment = "麻薬施用者番号(岩手県)"
* qualification[narcoticPrescriptionLicenseNumber04].identifier.value ^comment = "麻薬施用者番号(宮城県)"
* qualification[narcoticPrescriptionLicenseNumber05].identifier.value ^comment = "麻薬施用者番号(秋田県)"
* qualification[narcoticPrescriptionLicenseNumber06].identifier.value ^comment = "麻薬施用者番号(山形県)"
* qualification[narcoticPrescriptionLicenseNumber07].identifier.value ^comment = "麻薬施用者番号(福島県)"
* qualification[narcoticPrescriptionLicenseNumber08].identifier.value ^comment = "麻薬施用者番号(茨城県)"
* qualification[narcoticPrescriptionLicenseNumber09].identifier.value ^comment = "麻薬施用者番号(栃木県)"
* qualification[narcoticPrescriptionLicenseNumber10].identifier.value ^comment = "麻薬施用者番号(群馬県)"
* qualification[narcoticPrescriptionLicenseNumber11].identifier.value ^comment = "麻薬施用者番号(埼玉県)"
* qualification[narcoticPrescriptionLicenseNumber12].identifier.value ^comment = "麻薬施用者番号(千葉県)"
* qualification[narcoticPrescriptionLicenseNumber13].identifier.value ^comment = "麻薬施用者番号(東京都)"
* qualification[narcoticPrescriptionLicenseNumber14].identifier.value ^comment = "麻薬施用者番号(神奈川)"
* qualification[narcoticPrescriptionLicenseNumber15].identifier.value ^comment = "麻薬施用者番号(新潟県)"
* qualification[narcoticPrescriptionLicenseNumber16].identifier.value ^comment = "麻薬施用者番号(富山県)"
* qualification[narcoticPrescriptionLicenseNumber17].identifier.value ^comment = "麻薬施用者番号(石川県)"
* qualification[narcoticPrescriptionLicenseNumber18].identifier.value ^comment = "麻薬施用者番号(福井県)"
* qualification[narcoticPrescriptionLicenseNumber19].identifier.value ^comment = "麻薬施用者番号(山梨県)"
* qualification[narcoticPrescriptionLicenseNumber20].identifier.value ^comment = "麻薬施用者番号(長野県)"
* qualification[narcoticPrescriptionLicenseNumber21].identifier.value ^comment = "麻薬施用者番号(岐阜県)"
* qualification[narcoticPrescriptionLicenseNumber22].identifier.value ^comment = "麻薬施用者番号(静岡県)"
* qualification[narcoticPrescriptionLicenseNumber23].identifier.value ^comment = "麻薬施用者番号(愛知県)"
* qualification[narcoticPrescriptionLicenseNumber24].identifier.value ^comment = "麻薬施用者番号(三重県)"
* qualification[narcoticPrescriptionLicenseNumber25].identifier.value ^comment = "麻薬施用者番号(滋賀県)"
* qualification[narcoticPrescriptionLicenseNumber26].identifier.value ^comment = "麻薬施用者番号(京都府)"
* qualification[narcoticPrescriptionLicenseNumber27].identifier.value ^comment = "麻薬施用者番号(大阪府)"
* qualification[narcoticPrescriptionLicenseNumber28].identifier.value ^comment = "麻薬施用者番号(兵庫県)"
* qualification[narcoticPrescriptionLicenseNumber29].identifier.value ^comment = "麻薬施用者番号(奈良県)"
* qualification[narcoticPrescriptionLicenseNumber30].identifier.value ^comment = "麻薬施用者番号(和歌山県)"
* qualification[narcoticPrescriptionLicenseNumber31].identifier.value ^comment = "麻薬施用者番号(鳥取県)"
* qualification[narcoticPrescriptionLicenseNumber32].identifier.value ^comment = "麻薬施用者番号(島根県)"
* qualification[narcoticPrescriptionLicenseNumber33].identifier.value ^comment = "麻薬施用者番号(岡山県)"
* qualification[narcoticPrescriptionLicenseNumber34].identifier.value ^comment = "麻薬施用者番号(広島県)"
* qualification[narcoticPrescriptionLicenseNumber35].identifier.value ^comment = "麻薬施用者番号(山口県)"
* qualification[narcoticPrescriptionLicenseNumber36].identifier.value ^comment = "麻薬施用者番号(徳島県)"
* qualification[narcoticPrescriptionLicenseNumber37].identifier.value ^comment = "麻薬施用者番号(香川県)"
* qualification[narcoticPrescriptionLicenseNumber38].identifier.value ^comment = "麻薬施用者番号(愛媛県)"
* qualification[narcoticPrescriptionLicenseNumber39].identifier.value ^comment = "麻薬施用者番号(高知県)"
* qualification[narcoticPrescriptionLicenseNumber40].identifier.value ^comment = "麻薬施用者番号(福岡県)"
* qualification[narcoticPrescriptionLicenseNumber41].identifier.value ^comment = "麻薬施用者番号(佐賀県)"
* qualification[narcoticPrescriptionLicenseNumber42].identifier.value ^comment = "麻薬施用者番号(長崎県)"
* qualification[narcoticPrescriptionLicenseNumber43].identifier.value ^comment = "麻薬施用者番号(熊本県)"
* qualification[narcoticPrescriptionLicenseNumber44].identifier.value ^comment = "麻薬施用者番号(大分県)"
* qualification[narcoticPrescriptionLicenseNumber45].identifier.value ^comment = "麻薬施用者番号(宮崎県)"
* qualification[narcoticPrescriptionLicenseNumber46].identifier.value ^comment = "麻薬施用者番号(鹿児島県)"
* qualification[narcoticPrescriptionLicenseNumber47].identifier.value ^comment = "麻薬施用者番号(沖縄県)"

* qualification[narcoticPrescriptionLicenseNumber01].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber02].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber03].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber04].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber05].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber06].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber07].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber08].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber09].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber10].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber11].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber12].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber13].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber14].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber15].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber16].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber17].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber18].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber19].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber20].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber21].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber22].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber23].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber24].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber25].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber26].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber27].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber28].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber29].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber30].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber31].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber32].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber33].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber34].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber35].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber36].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber37].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber38].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber39].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber40].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber41].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber42].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber43].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber44].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber45].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber46].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[narcoticPrescriptionLicenseNumber47].code from JP_MedicalLicenceCertificate_VS (required)

* qualification[narcoticPrescriptionLicenseNumber01].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber02].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber03].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber04].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber05].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber06].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber07].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber08].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber09].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber10].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber11].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber12].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber13].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber14].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber15].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber16].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber17].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber18].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber19].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber20].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber21].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber22].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber23].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber24].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber25].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber26].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber27].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber28].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber29].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber30].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber31].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber32].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber33].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber34].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber35].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber36].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber37].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber38].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber39].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber40].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber41].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber42].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber43].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber44].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber45].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber46].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)
* qualification[narcoticPrescriptionLicenseNumber47].code = $JP_MedicalLicenceCertificate_CS#narcotics-practitioner (exactly)

* qualification[narcoticPrescriptionLicenseNumber01].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber02].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber03].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber04].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber05].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber06].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber07].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber08].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber09].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber10].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber11].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber12].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber13].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber14].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber15].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber16].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber17].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber18].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber19].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber20].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber21].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber22].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber23].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber24].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber25].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber26].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber27].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber28].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber29].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber30].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber31].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber32].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber33].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber34].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber35].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber36].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber37].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber38].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber39].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber40].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber41].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber42].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber43].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber44].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber45].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber46].issuer only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber47].issuer only Reference(JP_Organization)


* qualification[narcoticPrescriptionLicenseNumber01].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber02].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber03].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber04].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber05].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber06].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber07].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber08].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber09].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber10].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber11].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber12].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber13].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber14].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber15].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber16].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber17].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber18].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber19].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber20].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber21].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber22].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber23].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber24].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber25].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber26].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber27].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber28].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber29].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber30].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber31].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber32].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber33].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber34].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber35].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber36].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber37].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber38].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber39].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber40].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber41].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber42].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber43].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber44].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber45].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber46].identifier.assigner only Reference(JP_Organization)
* qualification[narcoticPrescriptionLicenseNumber47].identifier.assigner only Reference(JP_Organization)

* qualification[medicalRegistrationNumber].identifier.system = "urn:oid:1.2.392.100495.20.3.31" (exactly)
* qualification[medicalRegistrationNumber].identifier.value ^short = "医籍登録番号"
* qualification[medicalRegistrationNumber].identifier.value ^comment = "医籍登録番号"
* qualification[medicalRegistrationNumber].code from JP_MedicalLicenceCertificate_VS (required)
* qualification[medicalRegistrationNumber].identifier.assigner only Reference(JP_Organization)
* qualification[medicalRegistrationNumber].issuer only Reference(JP_Organization)

* communication ^short = "A language the practitioner can use in patient communication　医療従事者が患者とのコミュニケーションで使用できる言語。"
* communication ^definition = "A language the practitioner can use in patient communication.\r\n\r\n医療従事者が患者とのコミュニケーションで使用できる言語。"
* communication ^comment = "The structure aa-BB with this exact casing is one the most widely used notations for locale. However not all systems code this but instead have it as free text. Hence CodeableConcept instead of code as the data type.\r\n\r\nこのように正確なケーシングを持つ構造体 aa-BB は、ロケールのために最も広く使われている表記法の一つ。しかし、すべてのシステムがこれをコード化しているわけではなく、代わりにフリーテキストとしている。そのため、データ型としてはコードの代わりに CodeableConcept を使用している。"
* communication ^requirements = "Knowing which language a practitioner speaks can help in facilitating communication with patients.\r\n\r\n医療従事者がどの言語を話すかを知ることは、患者とのコミュニケーションを円滑にするのに役立つ。"