// ==============================
//   Profile 定義
// ==============================
Profile: JP_Coverage
Parent: Coverage
Id: jp-coverage
Title: "JP Core Coverage Profile"
Description: "このプロファイルはCoverageリソースに対して、保険・公費のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Coverage"
* ^status = #active
* ^date = "2023-10-31"
* . ^short = "Insurance or medical plan or a payment agreement　保険または医療費支払いプラン、または合意された支払い方法"
* . ^definition = "Financial instrument which may be used to reimburse or pay for health care products and services. Includes both insurance and self-payment.  
ヘルスケア製品およびサービスの償還または支払いに使用される可能性のある金融商品。 保険と自己負担の両方が含まれる。"
* . ^comment = "The Coverage resource contains the insurance card level information, which is customary to provide on claims and other communications between providers and insurers.  
Coverageには、保険証レベルの情報が含まれている。これは、保険金請求やプロバイダと保険会社間のその他の通信で提供するのが通例である。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    JP_Coverage_InsuredPersonSymbol named insuredPersonSymbol ..* and
    JP_Coverage_InsuredPersonNumber named insuredPersonNumber ..* and
    JP_Coverage_InsuredPersonSubNumber named insuredPersonSubNumber ..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    insuranceIdentifier ..1 and
    insuranceCsvIdentifier ..1
* identifier ^short = "Business Identifier for the coverage　このカバレッジに割り当てられた一意の識別子【詳細参照】"
* identifier ^definition = "A unique identifier assigned to this coverage.  このカバレッジに割り当てられた一意の識別子。"
* identifier ^comment = "A unique identifier assigned to this coverage.  このカバレッジに割り当てられた一意の識別子。"
* identifier ^requirements = "Allows coverages to be distinguished and referenced.  
カバレッジを区別して参照できるようにする。"
* identifier[insuranceIdentifier] ^short = "被保険者識別子"
* identifier[insuranceIdentifier] ^definition = "被保険者識別子として、保険者情報と被保険者情報を以下の仕様で連結したひとつの文字列を使用する"
* identifier[insuranceIdentifier] ^comment = "「被保険者識別子」の文字列仕様(StructureDefinition_JP_Coverage.html#「被保険者識別子」の文字列仕様)を参照のこと"
* identifier[insuranceIdentifier].system = "http://jpfhir.jp/fhir/core/Idsystem/JP_Insurance_SubscriberID" (exactly)
* identifier[insuranceIdentifier].value ^short = "被保険者識別子の値を格納" 
* identifier[insuranceIdentifier].value ^definition = "被保険者識別子として、保険者情報と被保険者情報とを以下の仕様で連結したひとつの文字列を使用する。  
本仕様では、以下、これを「被保険者個人識別子」と称する。また英数字は１バイト系文字の英数字を指す。  
被保険者個人識別子:以下の各情報（要素）を半角コロン（文字コード１６進数 5A）で結合する。  
要素を省略する、とある場合には、長さ０の文字列とする。「被保険者識別子」の文字列仕様(StructureDefinition_JP_Coverage.html#「被保険者識別子」の文字列仕様)を参照のこと"
* identifier[insuranceIdentifier].assigner only Reference(JP_Organization)
* identifier[insuranceIdentifier].assigner ^short = "保険者情報を設定"
* identifier[insuranceIdentifier].assigner ^definition = "保険者情報として[JP_Organization](StructureDefinition-jp-organization.html)を設定する。"
* identifier[insuranceIdentifier].assigner ^comment = "保険者情報として[JP_Organization](StructureDefinition-jp-organization.html)を設定する。"

* identifier[insuranceCsvIdentifier] ^short = "被保険者識別子（CSV形式）　\"00012345\",\"１２－３４\",\"５６７８\",\"00\""
* identifier[insuranceCsvIdentifier] ^definition = "被保険者識別子として、保険者情報と被保険者情報をカンマ区切りにて連結する"
* identifier[insuranceCsvIdentifier] ^comment = "The main (and possibly only) identifier for the coverage - often referred to as a Member Id, Certificate number, Personal Health Number or Case ID. May be constructed as the concatenation of the Coverage.SubscriberID and the Coverage.dependent.  
カバレッジのメイン（および場合によっては唯一の）識別子-多くの場合、メンバID、証明書番号、個人の健康番号、またはケースIDと呼ばれる。  
【JP Core仕様】被保険者記号と番号と枝番を全角にした上でダブルコーテーションで囲い、カンマ区切りで連結する。  
ルール：\"{保険者番号:半角英数８桁}\",\"{被保険者記号}\",\"{被保険者番号}\",\"{枝番:半角数字２桁}\"  
例：\"00012345\",\"１２－３４\",\"５６７８\",\"00\"
要素を省略する、とある場合には、長さ０の文字列とする。
例：\"１２－３４\",\"５６７８\",\"00\""
* identifier[insuranceCsvIdentifier].system = "http://jpfhir.jp/fhir/core/Idsystem/JP_Insurance_SubscriberCsvID" (exactly)
* identifier[insuranceCsvIdentifier].value ^short = "被保険者識別子の値を格納" 
* identifier[insuranceCsvIdentifier].value ^definition = "The main (and possibly only) identifier for the coverage - often referred to as a Member Id, Certificate number, Personal Health Number or Case ID. May be constructed as the concatenation of the Coverage.SubscriberID and the Coverage.dependent.  
カバレッジのメイン（および場合によっては唯一の）識別子-多くの場合、メンバID、証明書番号、個人の健康番号、またはケースIDと呼ばれる。  
【JP Core仕様】被保険者記号と番号と枝番を全角にした上でダブルコーテーションで囲い、カンマ区切りで連結する。  
ルール：\"{保険者番号:半角英数８桁}\",\"{被保険者記号}\",\"{被保険者番号}\",\"{枝番:半角数字２桁}\"  
例：\"00012345\",\"１２－３４\",\"５６７８\",\"00\"
要素を省略する、とある場合には、長さ０の文字列とする。"
* identifier[insuranceCsvIdentifier].assigner only Reference(JP_Organization)
* identifier[insuranceCsvIdentifier].assigner ^short = "保険者情報を設定"
* identifier[insuranceCsvIdentifier].assigner ^definition = "保険者情報として[JP_Organization](StructureDefinition-jp-organization.html)を設定する。"
* identifier[insuranceCsvIdentifier].assigner ^comment = "保険者情報として[JP_Organization](StructureDefinition-jp-organization.html)を設定する。"

* status ^definition = "The status of the resource instance.  
リソースインスタンスのステータス。"
* status ^comment = "This element is labeled as a modifier because the status contains the code entered-in-error that marks the coverage as not currently valid.  
ステータスには、カバレッジが現在無効であることを示すエラー入力されたコードが含まれているため、この要素は修飾子としてラベル付けされる。"
* status ^requirements = "Need to track the status of the resource as 'draft' resources may undergo further edits while 'active' resources are immutable and may only have their status changed to 'cancelled'.  
「ドラフト」リソースはさらに編集される可能性があり、「アクティブ」リソースは不変であり、ステータスが「キャンセル」に変更されるだけである可能性があるため、リソースのステータスを追跡する必要がある。"
* status ^isModifierReason = "This element is labelled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid / この要素は、エラーで入力されたステータスを含むステータス要素であるため、修飾子としてラベル付けされている。これは、リソースが有効として扱われるべきではないことを意味する。"
* type ^short = "Coverage category such as medical or accident　医療保険や事故補償のような分類"
* type ^definition = "The type of coverage: social program, medical plan, accident coverage (workers compensation, auto), group health or payment by an individual or organization.  
補償の種類：社会プログラム、医療計画、事故補償（労働者災害補償、自動車）、グループの健康、または個人または組織による支払い。"
* type ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.  
すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。  
【JP Core仕様】「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」等で使用される保険種別コード（system=”urn:oid:1.2.392.100495.20.2.61”）として、https://www.mhlw.go.jp/content/10800000/000342368.pdf　の別表１１が使用している例があげられている。JP Coreとして本項目に対する用語のバインドは現時点では定義するまでに至っていない。"
* type ^requirements = "The order of application of coverages is dependent on the types of coverage.  
カバレッジの適用順序は、カバレッジのタイプによって異なる。"
* policyHolder only Reference(JP_Patient or RelatedPerson or JP_Organization)
* policyHolder ^short = "Owner of the policy　ポリシの所有者"
* policyHolder ^definition = "The party who 'owns' the insurance policy.  
保険証券を「所有する」当事者。"
* policyHolder ^comment = "For example: may be an individual, corporation or the subscriber's employer.  
例：個人、企業、または加入者の雇用主である可能性がある。"
* policyHolder ^requirements = "This provides employer information in the case of Worker's Compensation and other policies.  
これは、労働者災害補償およびその他のポリシの場合に雇用者情報を提供する。"
* subscriber only Reference(JP_Patient or RelatedPerson)
* subscriber ^short = "Subscriber to the policy　被保険者"
* subscriber ^definition = "The party who has signed-up for or 'owns' the contractual relationship to the policy or to whom the benefit of the policy for services rendered to them or their family is due.  
ポリシにサインアップした、またはポリシとの契約関係を「所有」している当事者、またはポリシの利益が彼らまたはその家族に提供されることになっている当事者。"
* subscriber ^comment = "May be self or a parent in the case of dependents.  
扶養家族の場合、自己または親である可能性がある。"
* subscriber ^requirements = "This is the party who is entitled to the benefits under the policy.  
これは、ポリシに基づいて給付を受ける権利を有する当事者である。"
* subscriberId ^short = "ID assigned to the subscriber　被保険者に割り当てられたID"
* subscriberId ^definition = "The insurer assigned ID for the Subscriber.  
被保険者に保険者が割り当てたID"
* subscriberId ^requirements = "The insurer requires this identifier on correspondence and claims (digital and otherwise).  
保険者は、連絡や請求（デジタルおよびその他）でこの識別子を要求する。  
保険会社は、通信および請求（デジタルおよびその他）でこの識別子を要求する。  
【JP Core仕様】被保険者記号と番号を全角にした上でダブルコーテーションで囲い、カンマ区切りで連結する。  
ルール：{被保険者記号}:{被保険者番号}  
例：\"あいう\",\"５６７８\""
* beneficiary only Reference(JP_Patient)
* beneficiary ^definition = "The party who benefits from the insurance coverage; the patient when products and/or services are provided.  
保険適用から利益を得る当事者、製品および／またはサービスが提供される際の患者。"
* beneficiary ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.  
参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。  
【JP Core仕様】患者Patientリソースへの参照。"
* beneficiary ^requirements = "This is the party who receives treatment for which the costs are reimbursed under the coverage.  
これは、補償の下で費用が償還される治療を受ける側のことである。"
* dependent ^short = "被保険者証 枝番"
* dependent ^definition = "A unique identifier for a dependent under the coverage.  
被保険者証の枝番。"
* dependent ^comment = "Periodically the member number is constructed from the subscriberId and the dependent number.  
被保険者証の枝番を全角で格納する。"
* dependent ^requirements = "For some coverages a single identifier is issued to the Subscriber and then a unique dependent number is issued to each beneficiary.  
一部の補償では、単一の識別子が加入者に発行され、次に一意の従属番号が各受益者に発行される。  
一部の保険では、単一の識別子が加入者に発行され、その後、各受益者に固有の扶養番号が発行される。  
【JP Core仕様】医療保険で本リソースを使用する場合には、この要素に拡張 InsuredPersonSubNumberに設定した値と同じ、被保険者番号の枝番号全角2桁を設定する。  
例：\"00\""
* relationship ^short = "Beneficiary relationship to the subscriber　加入者との受益者関係"
* relationship ^definition = "The relationship of beneficiary (patient) to the subscriber.  
受益者（患者）と加入者の関係。"
* relationship ^comment = "Typically, an individual uses policies which are theirs (relationship='self') before policies owned by others.  
一般的に、個人は、他人が所有するポリシよりも、自分のポリシ（relationship='self'）を使用する。"
* relationship ^requirements = "To determine relationship between the patient and the subscriber to determine coordination of benefits.  
患者と加入者の関係を決定し、給付の調整を決定する。  
【JP Core仕様】「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」等で使用される被保険者区分コード（system=”urn:oid:1.2.392.100495.20.2.62”）として、https://www.mhlw.go.jp/content/10800000/000342368.pdf　の別表１２が使用できる。  
　1 被保険者  
　2 被扶養者"
* period ^definition = "Time period during which the coverage is in force. A missing start date indicates the start date isn't known, a missing end date means the coverage is continuing to be in force.  
補償範囲が有効である期間。開始日が欠落している場合は、開始日が不明であることを示す。終了日が欠落している場合は、補償範囲が引き続き有効であることを意味する。"
* period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](http://hl7.org/fhir/R4/datatypes.html#Duration).  
Period（期間）は時間の範囲を指定する。使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、範囲から1つの値が適用されるか（たとえば、「この2回の間に患者に投与する」）を指定する。  
Period（期間）は、Duration（時間区間＝経過時間の測定値）には使用されない。 [Duration]（datatypes.html＃Duration）を参照のこと。  
This is not a duration - that's a measure of time (a separate type), but a duration that occurs at a fixed value of time. A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\"). If duration is required, specify the type as Interval|Duration.  
これはDuration（時間区間）ではない-　Durationは時間の尺度（別のタイプ）だが、時間の固定値で発生する時間区間である。Period（期間）は時間の範囲を指定する。使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、範囲から1つの値が適用されるか（たとえば、「この2回の間に患者に投与する」）を指定する。もし、Duration（時間区間）が必要な場合は、タイプをInterval | Durationとして指定する。  
これは期間ではなく-これは時間の尺度（別のタイプ）あるが、時間の固定値で発生する期間である。期間は時間の範囲を指定する。使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、または範囲から1つの値が適用されるか（たとえば、「これら2回の間に患者に与える」）を指定する。期間が必要な場合は、タイプをInterval | Durationとして指定する。  
【JP Core仕様】医療保険、公費で本リソースを使用する場合には、保険証または公費の有効期間の開始日、終了日をstart とendに yyyy-mm-dd形式で設定する。"
* period ^requirements = "Some insurers require the submission of the coverage term.  
保険会社によっては、補償期間の提出を義務付けているところもある。"
* payor only Reference(JP_Organization or JP_Patient or RelatedPerson)
* payor ^short = "支払者に関する情報"
* payor ^definition = "The program or plan underwriter or payor including both insurance and non-insurance agreements, such as patient-pay agreements.  
患者負担契約などの保険契約と保険外契約の両方を含むプログラムまたはプランの引受人または支払人。"
* payor ^comment = "May provide multiple identifiers such as insurance company identifier or business identifier (BIN number).\nFor selfpay it may provide multiple paying persons and/or organizations.  
保険会社の識別子や事業者の識別子（BIN番号）など、複数の識別子を提供してもよい。自己負担の場合は、複数の支払者および/または組織を提供してもよい。"
* payor ^requirements = "Need to identify the issuer to target for claim processing and for coordination of benefit processing.  
請求処理および給付処理の調整の対象となる発行者を特定する必要がある。  
【JP Core仕様】医療保険で本リソースを使用する場合には、保険者組織Organizationリソースへの参照。自費の場合には、患者Patientリソースへの参照。公費の場合には、公費負担者組織Organizationリソースへの参照。"
* class ^definition = "A suite of underwriter specific classifiers.  
保険事業者の分類子"
* class ^comment = "For example may be used to identify a class of coverage or employer group, Policy, Plan.  
例えば、保険の種類または雇用者グループ、保険契約、Planを識別するために使用することができる。"
* class ^requirements = "The codes provided on the health card which identify or confirm the specific policy for the insurer.  
健康カードに記載されているコードで、保険者の特定の保険契約を識別または確認するもの。"
* class.type ^definition = "The type of classification for which an insurer-specific class label or number and optional name is provided, for example may be used to identify a class of coverage or employer group, Policy, Plan.  
保険者固有のクラスラベルまたは番号、任意の名前が提供されている分類のタイプを表す。例えば、保険のクラスまたは雇用者グループ、保険契約、Planを識別するために使用することができる。"
* class.type ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.  
すべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* class.type ^requirements = "The insurer issued label for a specific health card value.  
保険者が発行した特定の健康カード番号のラベル。"
* class.value ^definition = "The alphanumeric string value associated with the insurer issued label.  
保険者が発行したラベルに関連付けられた英数字の文字列値。"
* class.value ^comment = "For example, the Group or Plan number.  
例えば、グループ番号やプラン番号など。"
* class.value ^requirements = "The insurer issued label and value are necessary to identify the specific policy.  
保険者が発行したラベルと値は、特定の保険契約を識別するために必要なものである。"
* class.name ^definition = "A short description for the class.  
保険種類の簡単な説明。"
* class.name ^requirements = "Used to provide a meaningful description in correspondence to the patient.  
患者に対応するのに意味のある説明をするために使用する。"
* order ^definition = "The order of applicability of this coverage relative to other coverages which are currently in force. Note, there may be gaps in the numbering and this does not imply primary, secondary etc. as the specific positioning of coverages depends upon the episode of care.  
現在適用されている他の保障と比較して、この保障の適用可能性が高い順に記載されている。なお、ナンバリングにギャップがある場合があり、カバーの具体的な位置づけはケアのエピソードに依存するため、一次、二次などを意味するものではない。"
* order ^comment = "32 bit number; for values larger than this, use decimal  
32 ビットの数値、これより大きい値の場合は 10 進数を使用する。"
* order ^requirements = "Used in managing the coordination of benefits.  
保険給付の調整管理に使用する。  
【JP Core仕様】公費情報で本リソースを使用する場合で、複数の公費負担情報がある場合に、その適用順序番号を示す１，２，３．．．を設定する。"
* network ^definition = "The insurer-specific identifier for the insurer-defined network of providers to which the beneficiary may seek treatment which will be covered at the 'in-network' rate, otherwise 'out of network' terms and conditions apply.  
保険者が定義したプロバイダの保険者定義ネットワークの保険者固有の識別子で、被保険者が「ネットワーク内」の料金でカバーされる治療を受けることができるが、そうでなければ「ネットワーク外」の条件が適用される。"
* network ^requirements = "Used in referral for treatment and in claims processing.  
治療のための紹介や請求処理の際に使用する。"
* costToBeneficiary ^short = "Patient payments for services/products　サービスやプロダクトに対する患者支払い"
* costToBeneficiary ^definition = "A suite of codes indicating the cost category and associated amount which have been detailed in the policy and may have been  included on the health card.  
ポリシに詳細が記載されており、ヘルスカードに含まれている可能性のあるコストカテゴリと関連する金額を示す一連のコード。"
* costToBeneficiary ^comment = "For example by knowing the patient visit co-pay, the provider can collect the amount prior to undertaking treatment.  
例えば、患者の訪問時の自己負担額を知ることで、医療提供者は治療を行う前にその金額を回収することができる。  
【JP Core仕様】公費の場合には自己負担率。判明している場合のみ設定する。"
* costToBeneficiary ^requirements = "Required by providers to manage financial transaction with the patient.  
事業者が患者との金銭的な取引を管理するために必要となる。"
* costToBeneficiary.type ^definition = "The category of patient centric costs associated with treatment.  
治療に伴う患者中心の費用のカテゴリー。"
* costToBeneficiary.type ^comment = "For example visit, specialist visits, emergency, inpatient care, etc.  
例えば、訪問診療、専門医の訪問診療、救急診療、入院診療など。"
* costToBeneficiary.type ^requirements = "Needed to identify the category associated with the amount for the patient.  
患者の金額に関連するカテゴリーを特定する必要があった。"
* costToBeneficiary.type.coding.system ^comment = "The URI may be an OID (urn:oid:...) or a UUID (urn:uuid:...).  OIDs and UUIDs SHALL be references to the HL7 OID registry. Otherwise, the URI should come from HL7's list of FHIR defined special URIs or it should reference to some definition that establishes the system clearly and unambiguously.  
保険や公費における自己負担率の種別を識別するコード体系のコード。  
\"http://terminology.hl7.org/CodeSystem/coverage-copay-type\""
* costToBeneficiary.type.coding.code ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size  
自己負担率を表すコード　\"copaypct\""
* costToBeneficiary.value[x] ^definition = "The amount due from the patient for the cost category.  
費用区分の患者からの支払額。"
* costToBeneficiary.value[x] ^comment = "Amount may be expressed as a percentage of the service/product cost or a fixed amount of currency.  
金額は、サービス/製品のコストに対する割合で表現される場合と、通貨の固定額で表現される場合がある。"
* costToBeneficiary.value[x] ^requirements = "Needed to identify the amount for the patient associated with the category.  
カテゴリーに関連する患者の支払い金額を特定する必要があった"
* costToBeneficiary.exception ^definition = "A suite of codes indicating exceptions or reductions to patient costs and their effective periods.  
患者費用の例外または削減を示すコードとその有効期間を示すコード群。"
* costToBeneficiary.exception ^requirements = "Required by providers to manage financial transaction with the patient.  
事業者が患者との金銭的な取引を管理するために必要となる。"
* costToBeneficiary.exception.type ^definition = "The code for the specific exception.  
特定の例外のコード。"
* costToBeneficiary.exception.type ^requirements = "Needed to identify the exception associated with the amount for the patient.  
患者の金額に関連する例外を特定する必要があった。"
* costToBeneficiary.exception.period ^definition = "The timeframe during when the exception is in force.  
例外が発生している間の時間枠。"
* costToBeneficiary.exception.period ^requirements = "Needed to identify the applicable timeframe for the exception for the correct calculation of patient costs.  
患者の費用を正しく計算するための例外の適用時期を特定する必要があった。"
* subrogation ^short = "Reimbursement to insurer　保険者への償還"
* subrogation ^definition = "When 'subrogation=true' this insurance instance has been included not for adjudication but to provide insurers with the details to recover costs.  
subrogation=trueの場合、この保険インスタンスは裁定のためではなく、保険者に費用回収のための詳細を提供するために含まれている。 (subrogation=代位、subrogation payment=代位納付)"
* subrogation ^comment = "Typically, automotive and worker's compensation policies would be flagged with 'subrogation=true' to enable healthcare payors to collect against accident claims.  
一般的に、自動車保険や労災保険では、医療費支払い者が事故請求に対して回収できるように、subrogation＝true というフラグが立てられている。"
* subrogation ^requirements = "See definition for when to be used.  
使用時期については定義を参照すること。"
* contract ^short = "Contract details　契約の詳細"
* contract ^definition = "The policy(s) which constitute this insurance coverage.  
この保険の適用範囲を構成するポリシ。"
* contract ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.  
参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* contract ^requirements = "To reference the legally binding contract between the policy holder and the insurer.  
契約者と保険者との間の法的拘束力のある契約を参照するため。"


// ==============================
//   Extension 定義
// ==============================
Extension: JP_Coverage_InsuredPersonNumber
Id: jp-coverage-insuredpersonnumber
Title: "JP Core Coverage InsuredPersonNumber Extension"
Description: "健康保険における被保険者証番号を示す拡張"
* ^url = $JP_Coverage_InsuredPersonNumber
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "健康保険における被保険者証番号"
* . ^comment = "健康保険における被保険者証番号を示す拡張。被保険者記号の全角文字列。"
* url = $JP_Coverage_InsuredPersonNumber (exactly)
* value[x] only string

Extension: JP_Coverage_InsuredPersonSubNumber
Id: jp-coverage-insuredpersonsubnumber
Title: "JP Core Coverage InsuredPersonSubNumber Extension"
Description: "健康保険における被保険者証番号の枝番を示す拡張"
* ^url = $JP_Coverage_InsuredPersonSubNumber
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "健康保険における被保険者証番号の枝番"
* . ^comment = "健康保険における被保険者証番号を示す拡張。2桁の半角数字文字列。一桁の場合には先頭に0をつけて2桁にする。"
* url = $JP_Coverage_InsuredPersonSubNumber (exactly)
* value[x] only string
* value[x] ^comment = "00～99の間の半角数字2桁、1桁の場合ゼロパディングを実施する。"

Extension: JP_Coverage_InsuredPersonSymbol
Id: jp-coverage-insuredpersonsymbol
Title: "JP Core Coverage InsuredPersonSymbol Extension"
Description: "健康保険における被保険者証記号を示す拡張"
* ^url = $JP_Coverage_InsuredPersonSymbol
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "健康保険における被保険者証記号"
* . ^comment = "健康保険における被保険者証記号を示す拡張。被保険者記号の全角文字列。"
* url = $JP_Coverage_InsuredPersonSymbol (exactly)
* value[x] only string
