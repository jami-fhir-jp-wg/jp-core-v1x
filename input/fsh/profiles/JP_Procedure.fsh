// ==============================
//   Profile 定義
// ==============================
Profile: JP_Procedure
Parent: Procedure
Id: jp-procedure
Title: "JP Core Procedure Profile"
Description: "このプロファイルはProcedureリソースに対して、患者に対する医療的な処置のデータを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Procedure"
* ^status = #active
* ^date = "2024-11-18"
* . ^short = "Procedureリソース"
* . ^definition = "患者に対して、または患者のために実行されているか実行されたアクション。これは、手術のような身体的介入、または長期サービス、カウンセリング、催眠療法のような低侵襲性である可能性がある。"
* text ^short = "このリソースを人間が解釈するためのテキスト要約"
* id ^short = "Logical id of this artifact"
* contained ^short = "Contained, inline Resources"
* identifier ^definition = "これは、ビジネスプロセスによって定義され、リソース自体への直接のURL参照が適切でない場合に参照するために使用される、このProcedureに関連する識別子を記録する。"
* identifier ^comment = "これはビジネス識別子であり、リソース識別子ではない（議論参照）。識別子は1つのリソースインスタンスにのみ表示されることがベストだが、ビジネス上の慣習により、同じ識別子を持つ複数のリソースインスタンスが存在することがあるかもしれない。例えば、複数のPatientとPersonリソースインスタンスが同じ社会保険番号を共有しているかもしれない。"
* instantiatesCanonical ^definition = "本Procedureの全部または一部を遵守するFHIR定義のプロトコル、ガイドライン、オーダセット、その他の定義を指すURL。"
* instantiatesUri ^definition = "本Procedure全体または一部を遵守する、外部で管理されているプロトコル、ガイドライン、オーダセット、またはその他の定義を指すURL。"
* basedOn ^short = "このプロシージャの依頼情報"
* basedOn ^definition = "このプロシージャの依頼情報の詳細を含むリソースへの参照。"
* basedOn ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不能などを可能にする）。解決には、URLからの検索、またはリソースタイプによって該当する場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索することができる。   
【JP Core仕様】Observation_LabResultにならい、任意。"
* partOf only Reference(JP_Procedure or JP_Observation_Common or JP_MedicationAdministration)
* partOf ^short = "このプロシジャーが構成要素やステップとなるより大きな医療行為"
* partOf ^definition = "【JP Core仕様】https://www.hl7.org/fhir/R4/procedure.htmlを参照"
* partOf ^comment = "MedicationAdministrationリソースにはProcedureへのpartOf参照があるが、これは循環参照ではない。たとえば、麻酔MedicationAdministrationは外科的処置の一部である（MedicationAdministration.partOf = Procedure）。  
また、たとえば、IV投薬管理用にIVポートを挿入する手順は、投薬管理の一部である（Procedure.partOf = MedicationAdministration）。  
【JP Core仕様】Observation_LabResultにならい、任意。"
* status ^definition = "プロシージャの状態を指定するコードである。一般的には、進行中または完了した状態になる。【JP Core仕様】http://hl7.org/fhir/us/core/STU3.1/StructureDefinition-us-core-procedure.htmlを参照"
* status ^comment = "「不明な」コードは、他のステータスを伝えるために使用されるべきではない。ステータスの1つが当てはまる場合、「不明」コードを使用する必要があるが、オーサリングシステムはプロシージャの現在の状態を認識していない。  
ステータスにリソースを現在無効としてマークするコードが含まれているため、この要素は修飾子としてラベル付けされる。"
* statusReason ^short = "このプロシジャーの進捗の理由（未完了であったり中止されたことの理由）"
* statusReason ^definition = "プロシージャの現在の進捗の理由を設定する。"
* statusReason ^comment = "これは通常、「未完了」、「一時停止」、「中止」などの「例外」ステータスにのみ使用される。イベントを実行する理由は、ここではなく、reasonCodeに設定する。"
* category ^short = "このプロシジャーの分類カテゴリ"
* code ^short = "このプロシジャーの識別子"
* code ^definition = "行われた具体的な手順。手技の正確な性質がコード化できない場合はテキストを使用する（例：「腹腔鏡下虫垂切除術」）"
* code ^comment = "すべての用語の使用がこの一般的なパターンに当てはまるわけではない。場合によっては、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係や事前・事後の調整を管理するための独自の構造を提供すべきである。"
* code ^binding.description = "Procedureコード。"
* subject only Reference(JP_Patient)
* subject ^short = "誰にこのプロシジャーが実施されたか"
* subject ^definition = "プロシジャーが実行された対象の人、動物、またはグループ。"
* subject ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不能などを可能にする）。解決は、URLからの検索、またはリソースタイプによって該当する場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "このプロシジャーの記録が作成された受療の状況"
* encounter ^definition = "プロシジャーが作成または実行された受療の状況、またはこの記録の作成が緊密に関連している受療の状況。"
* encounter ^comment = "これは通常、イベントが発生した出会いの中で行われるが、活動によっては、出会いの公式な終了前または終了後に開始されても、出会いの文脈と結びついている場合がある。"
* performed[x] ^short = "いつこのプロシジャーが実施されたか"
* performed[x] ^definition = "Procedureが行われた推定または実際の日付、日時、期間、または年齢。複数の日付にまたがる複雑なProcedureをサポートするために期間を許可し、Procedureの長さを把握することも可能。"
* performed[x] ^comment = "年齢は一般的に、患者が手技が行われた年齢を報告するときに使用される。  
範囲は、一般的に、患者が手順が実行されたときに年齢範囲を報告する場合に使用される。たとえば、20〜25歳の間など。  
dateTimeは、ミリ秒の精度を持たない可能性がある過去の手順として報告される一部の手順と、Encounterの期間において実施され文書化された他の手順が、タイムゾーンでより正確なUTCタイムスタンプを持つ可能性があるため、さまざまな精度をサポートする。"
* recorder only Reference(JP_Patient or RelatedPerson or JP_Practitioner or JP_PractitionerRole)
* recorder ^short = "このプロシジャーを記録した人"
* recorder ^definition = "記録を記録し、その内容に責任を負う個人。"
* recorder ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* asserter only Reference(JP_Patient or RelatedPerson or JP_Practitioner or JP_PractitionerRole)
* asserter ^short = "このプロシジャーの実施の記録者"
* asserter ^definition = "プロシジャーの実施記録を作成した個人。"
* asserter ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* performer.actor only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or RelatedPerson or Device)
* performer ^short = "このプロシジャーの実施者"
* performer ^definition = "医療機器ではなく「生身の人間」に限定。"
* performer.function ^short = "実施者の役割（ロール）"
* performer.function ^definition = "プロシジャーへの実施者の関与のタイプを区別する。たとえば、外科医、麻酔科医、内視鏡医。"
* performer.function ^comment = "すべての用語の使用がこの一般的なパターンに当てはまるわけではない。場合によっては、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係や事前・事後の調整を管理するための独自の構造を提供するべきである。  
 【JP Core仕様】当面利用しない。"
* performer.actor ^short = "医療従事者への参照"
* performer.actor ^definition = "プロシジャーに関わった医療従事者。"
* performer.actor ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不可などを可能にする）。解決には、URLからの検索、またはリソースタイプによって適用可能な場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索することができる。"
* performer.onBehalfOf only Reference(JP_Organization)
* performer.onBehalfOf ^short = "従事した組織"
* performer.onBehalfOf ^definition = "従事した組織。"
* performer.onBehalfOf ^comment = "参照は、実際のFHIRリソースへの参照であり、解決可能でなければならない（アクセス制御、一時的な利用不能などを可能にする）。解決には、URLからの検索によるものと、リソースタイプによって該当する場合は、絶対参照を正規のURLとして扱い、ローカルレジストリ/リポジトリで検索するものがある。"
* location only Reference(JP_Location)
* location ^short = "このプロシジャーが実施された場所"
* location ^definition = "プロシジャーが実施された場所。  
例:自宅での出生、レストランで気管切開など。"
* location ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* reasonCode ^short = "このプロシジャーが実施された理由コード"
* reasonCode ^definition = "処置が行われたコード化された理由。  
これはある種のコード化された実体であるかもしれないし、単にテキストとして存在するかもしれない。"
* reasonCode ^comment = "ひとつのコードが理由を十分に説明している場合は、Procedure.reasonCodeを使用する。  
リソースを参照する場合は、Procedure.reasonReferenceを使用する。これにより、開始日など、より多くの情報を伝達できる。  
Procedure.reasonCodeとProcedure.reasonReferenceは、重複することを意図したものではない。単一の理由で、Procedure.reasonCodeまたはProcedure.reasonReferenceのいずれかだけを使用できる。  
Procedure.reasonCodeは要約コードの場合もあれば、Procedure.reasonReferenceを使用して、Condition | Observation | Procedure | DiagnosticReport | DocumentReference のいずれかにより、非常に精緻な理由の定義を参照することもできる。  
もしプロシージャの異なる理由を説明しているのであれば、Procedure.reasonCodeとProcedure.reasonReferenceの両方を使用できる。"
* reasonReference only Reference(JP_Condition or JP_Observation_Common or JP_Procedure or JP_DiagnosticReport_Common or DocumentReference)
* reasonReference ^short = "このプロシジャーが実施された正当性"
* reasonReference ^definition = "なぜそのようなProcedureを行ったのか、その正当性を示す。"
* reasonReference ^comment = "ある手順が別の手順（硬膜外など）の理由（帝王切開など）になる可能性がある。他の例には、拡張および生検（診断および治療用途の組み合わせ）のための内視鏡検査が含まれる。  
コードが理由を十分に説明している場合は、Procedure.reasonCodeを使用する。  
リソースを参照する場合は、Procedure.reasonReferenceを使用する。これにより、開始日など、より多くの情報を伝達できる。  
Procedure.reasonCodeとProcedure.reasonReferenceは、重複することを意図したものではない。単一の理由で、Procedure.reasonCodeまたはProcedure.reasonReferenceのいずれかだけを使用できる。  
Procedure.reasonReferenceを使用して、Condition | Observation | Procedure | DiagnosticReport | DocumentReference等のリソースを利用することも可能である。"
* bodySite ^short = "このプロシジャーの対象となった人体部位"
* bodySite ^definition = "詳細かつ構造化された解剖学的な位置情報。複数の場所を指定することができる。例えば、1つの病変に対して複数のパンチングバイオプシーを行うことができる。"
* bodySite ^comment = "ユースケースでBodySiteリソースの属性が必要な場合（たとえば、個別に識別して追跡するため）、標準の拡張extension [procedure-targetbodystructure]（extension-procedure-targetbodystructure.html）を使用する。"
* outcome ^short = "このプロシジャーのアウトカム"
* outcome ^definition = "Procedureの結果 - Procedureが行われた理由が解決されたか？"
* outcome ^comment = "結果に叙述的記述トのみが含まれている場合は、CodeableConcept.textを使用してその情報を格納できる。"
* report only Reference(JP_DiagnosticReport_Common or DocumentReference or Composition)
* report ^short = "このプロシジャーの結果報告"
* report ^definition = "これは、組織学的結果、病理学的報告書、手術報告書などであろう。"
* report ^comment = "複数のレポートが存在する可能性がある  
例：これが複数の生検を行ったプロシジャーであって、いくつもの解剖病理学報告が得られた場合。"
* complication ^short = "このプロシジャーによる合併症"
* complication ^definition = "プロシジャー中、またはその実施直後の期間に発生した合併症。これらは通常、note要素とは別に記録される。note要素は通常、「プロシジャー後」の問題ではなく、プロシジャー自体を説明するものである。"
* complication ^comment = "合併症が叙述的なテキストによってのみ表現されている場合は、CodeableConcept.textに格納できる。"
* complicationDetail only Reference(JP_Condition)
* complicationDetail ^short = "このプロシジャーの合併症の結果生じた患者状態"
* complicationDetail ^definition = "Procedureの実施中、または実施直後に発生した全ての合併症。"
* complicationDetail ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* complicationDetail ^requirements = "これは、プロシジャーの理由であった状態ではなく、プロシジャーの結果である状態を文書化するために使用される。"
* followUp ^short = "今後の処置が特別なフォローアップを必要とする場合（例：抜糸）、フォローアップはシンプルなnote として表現してもよいが、より複雑になる可能性もあり、その場合はケアプランリソースを使用することができる。"
* followUp ^comment = ""
* note ^short = "このプロシジャーの関する追加情報"
* note ^definition = "このプロシジャーに関する注意点やコメントなど。"
* note ^comment = "構造化された注釈（アノテーション）を持たないシステムの場合、作成者や時間なしで単一の注釈を簡単に伝達できる。情報を変更する可能性があるため、この要素をナラティブに含める必要がある場合がある。   
*注釈は、計算機処理れきる「変更」情報を伝達するために使用されるべきではない*。 （ユーザの行動を強制することはほとんど不可能であるため、これはSHOULDとする）。"
* focalDevice ^short = "このプロシジャーの際に操作、埋め込み、または削除されたデバイス"
* focalDevice ^definition = "Procedureが行われる局所に、あるいは、そこから、埋め込まれる、取り外される、またはその他の操作（キャリブレーション、バッテリー交換、プロテーゼの装着、陰圧ドレインバックの装着など）が行われるデバイス。"
* focalDevice.action ^definition = "Procedure中にデバイスに起こった変化の種類。【JP Core仕様】https://www.hl7.org/fhir/R4/procedure.htmlを参照"
* focalDevice.manipulated ^definition = "Procedure中に操作（変更）されたデバイス。【JP Core仕様】https://www.hl7.org/fhir/R4/procedure.htmlを参照"
* usedReference only Reference(Device or JP_Medication or Substance)
* usedReference ^short = "プロシジャー中に使用されるアイテム"
* usedReference ^definition = "プロシジャーの一部として使用される薬剤、機器およびその他の物質を特定する。"
* usedReference ^comment = "実際に埋め込まれた、または取り外されたデバイスについては、Procedure.deviceを使用すること。"
* usedCode ^short = "プロシジャー中に使用したアイテムのコード"
* usedCode ^definition = "Procedureの一部として使用されたコード化されたアイテムを識別する。"
* usedCode ^comment = "実際に埋め込まれた、または取り外されたデバイスについては、Procedure.deviceを使用すること。"

* statusReason from JP_ProcedureNotPerformedReason_VS (example)
* category from JP_ProcedureCategory_VS (example)
* code from JP_ProcedureCodesMedical_VS (example)
* code.coding ^slicing.discriminator[0].type = #value
* code.coding ^slicing.discriminator[=].path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains medical ..1
* code.coding[medical] from JP_ProcedureCodesMedical_VS (required)
* code.coding[medical] ^short = "医科診療行為マスタ ValueSet"
* code.coding[medical].system = $JP_ProcedureCodesMedical_CS (exactly)
* code.coding contains stem7 ..1
* code.coding[stem7] from JP_ProcedureCodesSTEM7_VS (required)
* code.coding[stem7] ^short = "STEM7 外保連手術基幹コード ValueSet"
* code.coding[stem7].system = $JP_ProcedureCodesSTEM7_CS (exactly)
* code.coding contains dental ..1
* code.coding[dental] from JP_ProcedureCodesDental_VS (required)
* code.coding[dental] ^short = "歯科診療行為マスタ ValueSet"
* code.coding[dental].system = $JP_ProcedureCodesDental_CS (exactly)
* code.coding contains nurse ..1
* code.coding[nurse] from JP_ProcedureCodesNurse_VS (required)
* code.coding[nurse].system = $JP_ProcedureCodesNurse_CS (exactly)
* code.coding[nurse] ^short = "看護行為マスタ ValueSet"
* code.coding contains ichi ..1
* code.coding[ichi] from JP_ProcedureCodesICHI_VS (required)
* code.coding[ichi].system = $JP_ProcedureCodesICHI_CS (exactly)
* code.coding[ichi] ^short = "WHO ICHI (International Classification of Health Interventions) ValueSet"
* outcome from JP_ProcedureOutcome_VS (example)
* performer.function from JP_ProcedurePerformerRole_VS (example)
* reasonCode from JP_ProcedureReason_VS (example)
* bodySite from JP_ProcedureBodySite_VS (example)
* complication from JP_ProcedureCondition_VS (example)
* followUp from JP_ProcedureFollowUp_VS (example)
* focalDevice.action from JP_ProcedureDeviceAction_VS (preferred)
* usedCode from JP_ProcedureDeviceKind_VS (example)
