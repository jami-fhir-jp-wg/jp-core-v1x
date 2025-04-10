// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Electrocardiogram
Parent: JP_Observation_Common
Id: jp-observation-electrocardiogram
Title: "JP Core Observation Electrocardiogram Profile"
Description: "このプロファイルはObservationリソースに対して、心電図データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Electrocardiogram"
* ^status = #draft
* ^date = "2024-12-30"
* . ^short = "心電図検査結果"
* . ^definition = "心電図検査結果とその解釈。"
* . ^comment = "心電図検査についてのプロファイル"
* extension contains
    JP_Observation_Electrocardiogram_NumberOfLead named lead ..1 and
    JP_Observation_Electrocardiogram_DeviceInterpretation named deviceInterpretation ..1 and
    JP_Observation_Electrocardiogram_Duration named duration ..1 and
    JP_Observation_Electrocardiogram_StressType named stressType ..1
* insert SetDefinition(identifier, この心電図を表すObservationリソースに対する一意な識別ID)
* basedOn only Reference(CarePlan or DeviceRequest or ImmunizationRecommendation or JP_MedicationRequest or JP_MedicationRequest_Injection or NutritionOrder or ServiceRequest)
* insert SetDefinition(basedOn, このObservationが実施されることになった検査オーダーや計画、提案に関する情報)
* partOf only Reference(JP_MedicationAdministration or JP_MedicationAdministration_Injection or JP_MedicationDispenseBase or MedicationStatement or JP_Procedure or JP_Immunization or ImagingStudy)
* insert SetDefinition(partOf, このObservationが親イベントの一部を成す要素であるとき、その親イベントに関する情報)
* partOf ^comment = "ObservationをEncounterにencounter要素を使ってリンクする。もうひとつ別のObservationを参照することについては、以降にあるt [Notes](observation.html#obsgrouping)　をガイダンスとして参照のこと。"
* insert SetDefinition(status, 結果の状態)
* status ^comment = "このリソースは現在有効でないというマークをするコードを含んでいるため、この要素はモディファイアー（修飾的要素）として位置づけられている。"
* category contains
    second 0..1 and
    third 0..1
* insert SetDefinition(category, Observationリソースに対する分類コード。心電図検査には通常 procedure が指定される。必要に応じてextraCategoryを仕様する)
* category ^comment = "心電図検査は通常 procedure に分類される。"
* category[first].coding.code = $JP_SimpleObservationCategory_CS#procedure
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = $Loinc_CS#11524-6
* category[third] from JP_ObservationElectrocardiogramExtraCategory_VS (preferred)
* category[third].coding.system = $JP_ObservationElectrocardiogramExtraCategory_CS
* category[third] ^comment = "心電図検査について、負荷試験などの条件をつけた分類"

* insert SetDefinition(code, 心電図検査を示すコード)
* code = $Loinc_CS#11524-6 "EKG Study"
* code ^comment = "心電図検査(LOINC: EKG Study)を示すLOINCコード 11524-6 を指定する。"
* subject only Reference(JP_Patient or Group or Device or JP_Location)
* insert SetDefinition(subject, このObservationの対象となる患者や患者群、機器、場所に関する情報)
* subject ^comment = "この要素は1..1のcardinalityになるはずと考えられる。この要素が欠損値になる唯一の状況は、対象患者が不明なデバイスによって観察が行われるケースである。この場合、観察は何らかのコンテキスト/チャネルマッチング技術を介して患者にマッチングされる必要があり、患者にマッチングされれば、その時点で本要素を更新する必要がある。"
* insert SetDefinition(focus, 配偶者、親、胎児、ドナーなど、このObservationのsubject要素が実際の対象でない場合、その実際の対象に関する情報)
* focus ^comment = "通常、心電図検査は対象（患者、または患者のグループ、場所、またはデバイス）について行われる。"
* encounter only Reference(JP_Encounter)
* insert SetDefinition(encounter, 診察や入院など、このObservationが実施されるきっかけとなった診療イベントに関する情報)
* encounter ^comment = "通常、イベントが発生したEncounterであるが、一部のイベントは、Encounterの正式な完了の前または後に開始される場合があり、その場合でもEncounterのコンテキストに関連付けられている（例：入院時検査、術前検査）。"
* insert SetDefinition(effective[x], 取得された結果が臨床的に確定された日時または期間)
* effective[x] ^comment = "この観察結果が過去の報告でない限り、少なくとも日付が存在する必要がある。不正確または「あいまいな」時間を記録するには（たとえば、「発作時」に行われた心電図検査）、[Timing]（datatypes.html＃timing）データ型を使用して、測定を通常のライフイベントに関連付けることができる。"
* insert SetDefinition(issued, このバージョンの心電図検査が医療者に提供された日時。通常、結果を確認し検証後に提供される日時)
* issued ^comment = "通常は心電図検査が実施されて結果が出良くされたときの日時であり、後日解釈が付け加えられた場合にはlastUpdatで示される日時を置き換えても良い。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam or JP_Patient or RelatedPerson)
* insert SetDefinition(performer, この心電図検査の責任者/実施者に関する情報)
* performer ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* insert SetDefinition(value[x], 心電図の測定結果)
* value[x] ^comment = "心電図検査は一つの測定値のみを用いられることはなく、一連の測定値を元にして所見を得て総合的に解釈される。単一の測定値としてのこの項目は空欄であることが前提であるが、送受信側の双方が合意して単一の測定値のみを送信するためにこのリソースを仕様することも許容される。"
* insert SetDefinition(dataAbsentReason, このObservationのvalue[x]要素に期待される結果が存在しなかった場合、その理由)
* dataAbsentReason ^comment = "ヌル値または例外値は、FHIRオブザベーションで2つの方法で表すことができる。 1つの方法は、それらを値セットに含めて、値の例外を表す方法である。たとえば、血清学的検査の測定値は、「検出された」、「検出されなかった」、「決定的でない」、または「検体が不十分」である可能性がある。別の方法は、実際の観測にvalue要素を使用し、明示的なdataAbsentReason要素を使用して例外的な値を記録することである。たとえば、測定が完了しなかった場合、dataAbsentReasonコード「error」を使用できる。この場合には、観測値は、報告する値がある場合にのみ報告される可能性があることに注意する必要がある。たとえば、差分セルカウント値は> 0の場合にのみ報告される場合がある。これらのオプションのため、nullまたは例外値の一般的な観測値を解釈するにはユースケースの合意が必要である。"
* insert SetDefinition(interpretation, 心電図所見)

//* interpretation from JP_ObservationElectrocardiogramInterpretationCode_VS (extensible)
* interpretation ^comment = "心電図所見・解釈について記載する。心電図所見は測定された結果と1対1で対応するものではなく、総合的に判断されるものである。したがって所見や解釈はこのエレメントに列記することとした。所見については、ミネソタコードを元に学会や検査機器ベンダーが用語集を作成している。必要に応じてそれらのコードを仕様することを推奨する。"
* interpretation ^requirements = "心電図所見についてのコード集を別途提示する。"
* interpretation ^slicing.discriminator.type = #value
* interpretation ^slicing.discriminator.path = "coding.system"
* interpretation ^slicing.rules = #open
* interpretation ^slicing.ordered = false
* interpretation contains
    ECAPS 0..1 and
    MINNESOTA1987_NK 0..1 and
    MINNESOTA2005_NK 0..1 and
    FKD_GRADE 0..1 and
    FKD_INTER 0..1 and
    MINESOTA_CODE 0..1
* interpretation[ECAPS].coding.system = "urn:oid:1.2.392.200119.5.2.3.3.1" (exactly)
* interpretation[MINNESOTA1987_NK].coding.system = "urn:oid:1.2.392.200119.5.2.3.3.2.1" (exactly)
* interpretation[MINNESOTA2005_NK].coding.system = "urn:oid:1.2.392.200119.5.2.3.3.2.2" (exactly)
* interpretation[FKD_GRADE].coding.system = "urn:oid:1.2.392.200119.5.2.4.1.1.1" (exactly)
* interpretation[FKD_INTER].coding.system = "urn:oid:1.2.392.200119.5.2.4.1.1.2" (exactly)
* interpretation[MINESOTA_CODE].coding.system = "urn:oid:1.2.392.200119.5.2.4.1.1.3" (exactly)
* insert SetDefinition(interpretation[ECAPS].coding.system, ECAPS:日本光電解析コード)
* insert SetDefinition(interpretation[MINNESOTA1987_NK].coding.system, 日本光電解析ロジックによるミネソタコード1987年版をベースとした分類)
* insert SetDefinition(interpretation[MINNESOTA2005_NK].coding.system, 日本光電解析ロジックによるミネソタコード2005年版をベースとした分類)
* insert SetDefinition(interpretation[FKD_INTER].coding.system, フクダ電子所見コード)
* insert SetDefinition(interpretation[FKD_GRADE].coding.system, フクダ電子判定コード)
* insert SetDefinition(interpretation[MINESOTA_CODE].coding.system, フクダ電子：ミネソタコードと異常部位を記載)

* insert SetDefinition(note, このObservationに関するコメント)
* note ^comment = "観察（結果）に関する一般的な記述、重要な、予期しない、または信頼できない結果値に関する記述、またはその解釈に関連する場合はそのソースに関する情報が含まれる場合がある。"
* note ^requirements = "Need to be able to provide free text additional information.  
フリーテキストの追加情報を提供できる必要がある。"
* insert SetDefinition(bodySite, 対象となった身体部位)
* insert SetDefinition(method, この心電図検査の実施方法)
* insert SetDefinition(specimen, 心電図検査では通常用いられない)
* specimen ^comment = "心電図検査では通常用いられないが、被験者である患者の状態を示すために使っても良い。"
* insert SetDefinition(device, この心電図検査を実施した計測機器に対する情報)
* device ^comment = "これは、心電図検査を計測し記録するために使用された機器に関する情報であり、結果の送信に関与するデバイス（ゲートウェイなど）を表すことを意図したものではない。そのようなデバイスは、必要に応じてProvenanceリソースを使用して文書化する。"
* insert SetDefinition(referenceRange, 心電図検査の基準範囲は個々の検査値によって異なるために基準範囲との比較による結果の解釈方法のガイダンス)
* referenceRange ^comment = "通常の範囲または推奨範囲と比較して値を解釈する方法に関するガイダンス。複数の参照範囲は「OR」として解釈される。つまり、2つの異なるターゲット母集団を表すために、2つの `referenceRange`要素が使用される。"
* referenceRange ^requirements = "どの値が「正常」と見なされるかを知ることは、特定の結果の意義を評価するのに役立つ。さまざまなコンテキストに対応するため複数の参照範囲を提供できる必要がある。"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence)
* insert SetDefinition(hasMember, このObservationに関連する子リソースに関する情報。このObservationに関連する/属するパネル検査や検査セットなどのObservationグループ)
* hasMember ^comment = "この要素を使用する場合、observationには通常、値または関連するリソースのセットのいじれかを含む。その両方を含む場合もある。複数のobservationをグループに一緒にまとめる方法については、以下の[メモ]（observation.html＃obsgrouping）を参照せよ。システムは、[QuestionnaireResponse]（questionnaireresponse.html）からの結果を計算して最終スコアにし、そのスコアをobservationとして表す場合があることに注意。"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence)
* insert SetDefinition(derivedFrom, この心電図検査を表す波形データを示すImagingStudyリソース)
* derivedFrom ^comment = "この要素にリストされているすべての参照の選択肢は、派生値の元のデータなる可能性のある臨床観察やその他の測定値を表すことができる。最も一般的な参照先は、別のobservationである。observationをグループに一緒にまとめる方法については、以下の[メモ]（observation.html＃obsgrouping）を参照すること。"
* insert SetDefinition(component, この心電図検査で測定された一連の結果。)
* component ^comment = "心電図に関する一連の測定結果をまとめるためにコンポーネントを使用する。"
* component ^requirements = "この心電図検査で行われる一連の測定値をまとめるものであり、負荷心電図など複数の心電図検査を一連の検査として行った場合は別Observationインスタンスとして記録される。"
* component.code from $JP_ObservationElectrocardiogramComponentCode_VS (preferred)
* component.code ^comment = "心電図の各検査項目についてはLOINCなどの特定の用語集を利用することが推奨される。"
//* component.interpretation from JP_ObservationElectrocardiogramInterpretationCode_VS (extensible)
* component.interpretation ^definition = "心電図検査で測定された結果値に対する所見・解釈"
* component.interpretation ^comment = "心電図検査の測定結果と解釈は必ずしも1対1で対応しないが、PR間隔の測定値にPR間隔延長などの固有の所見をつけてもよい"
* component.interpretation ^slicing.discriminator.type = #value
* component.interpretation ^slicing.discriminator.path = "coding.system"
* component.interpretation ^slicing.rules = #open
* component.interpretation ^slicing.ordered = false
* component.interpretation contains
    ECAPS 0..1 and
    MINNESOTA1987_NK 0..1 and
    MINNESOTA2005_NK 0..1 and
    FKD_GRADE 0..1 and
    FKD_INTER 0..1 and
    MINESOTA_CODE 0..1
* component.interpretation[ECAPS].coding.system = "urn:oid:1.2.392.200119.5.2.3.3.1" (exactly)
* component.interpretation[MINNESOTA1987_NK].coding.system = "urn:oid:1.2.392.200119.5.2.3.3.2.1" (exactly)
* component.interpretation[MINNESOTA2005_NK].coding.system = "urn:oid:1.2.392.200119.5.2.3.3.2.2" (exactly)
* component.interpretation[FKD_GRADE].coding.system = "urn:oid:1.2.392.200119.5.2.4.1.1.1" (exactly)
* component.interpretation[FKD_INTER].coding.system = "urn:oid:1.2.392.200119.5.2.4.1.1.2" (exactly)
* component.interpretation[MINESOTA_CODE].coding.system = "urn:oid:1.2.392.200119.5.2.4.1.1.3" (exactly)

* insert SetDefinition(component.interpretation[ECAPS].coding.system, ECAPS:日本光電解析コード)
* insert SetDefinition(component.interpretation[MINNESOTA1987_NK].coding.system, 日本光電解析ロジックによるミネソタコード1987年版をベースとした分類)
* insert SetDefinition(component.interpretation[MINNESOTA2005_NK].coding.system, 日本光電解析ロジックによるミネソタコード2005年版をベースとした分類)
* insert SetDefinition(component.interpretation[FKD_INTER].coding.system, フクダ電子所見コード)
* insert SetDefinition(component.interpretation[FKD_GRADE].coding.system, フクダ電子判定コード)
* insert SetDefinition(component.interpretation[MINESOTA_CODE].coding.system, フクダ電子：ミネソタコードと異常部位を記載)

// ==============================       
//   Extension 定義
// ==============================

//-------------------------------
// JP_Observation_Electrocardiogram_NumberOfLead
//-------------------------------
Extension: JP_Observation_Electrocardiogram_NumberOfLead
Id: jp-observation-electrocardiogram-numberoflead
Title: "JP Core Observation Electrocardiogram NumberOfLeed Extention"
Description: "心電図検査を実施したときに使った誘導の数を示すExtension"
* ^url = $JP_Observation_Electrocardiogram_NumberOfLead
* ^status = #active
* ^date = "2024-12-30"
* ^purpose = "心電図検査で使用した誘導の数を記録するために用いられる。"
* ^context.type = #element
* ^context.expression = "Observation"
* . ^short = "誘導の数"
* . ^definition = "心電図検査で使用した誘導の数を記録するための拡張"
* url = $JP_Observation_Electrocardiogram_NumberOfLead (exactly)
* value[x] 0..1
* value[x] only integer
* value[x] ^short = "誘導の数"
* value[x] ^definition = "心電図検査で使用した誘導の数"

//-------------------------------
// JP_Observation_Electrocardiogram_DeviceInterpretation
//-------------------------------
Extension: JP_Observation_Electrocardiogram_DeviceInterpretation
Id: jp-observation-electrocardiogram-deviceinterpretation
Title: "JP Core Observation Electrocardiogram Device Interpretation Extention"
Description: "心電図検査で測定された結果に対しての機械的に判定された所見、解釈の有無"
* ^url = $JP_Observation_Electrocardiogram_DeviceInterpretation
* ^status = #active
* ^date = "2024-12-30"
* ^purpose = "心電図検査で測定された結果についての所見や解釈が機械的に判定されたものかどうかを示すために用いられる。"
* ^context.type = #element
* ^context.expression = "Observation"
* . ^short = "機械判定された所見・解釈の有無"
* . ^definition = "心電図検査の所見が機械的に判定されたものであるかどうかを示す"
* url = $JP_Observation_Electrocardiogram_DeviceInterpretation (exactly)
* value[x] 0..1
* value[x] only boolean
* value[x] ^short = "機械判定所見の有無"
* value[x] ^definition = "心電図検査が機械的に判定されたものであるかどうかを示す"

//-------------------------------
// JP_Observation_Electrocardiogram_Duration
//-------------------------------
Extension: JP_Observation_Electrocardiogram_Duration
Id: jp-observation-electrocardiogram-duration
Title: "JP Core Observation Electrocardiogram Duration Extention"
Description: "心電図検査で測定を行った時間を記録するための拡張。"
* ^url = $JP_Observation_Electrocardiogram_Duration
* ^status = #active
* ^date = "2024-12-30"
* ^purpose = "心電図検査では不整脈の検出などの目的に応じて長時間の測定が行われる。この拡張は測定された時刻を示すのではなく、計測された時間の長さを記録するためのものである。"
* ^context.type = #element
* ^context.expression = "Observation"
* . ^short = "測定を行った時間(長さ)"
* . ^definition = "心電図検査で測定が行われた時間を示す。"
* url = $JP_Observation_Electrocardiogram_Duration (exactly)
* value[x] 0..1
* value[x] only CodeableConcept or Duration
* valueCodeableConcept from JP_ObservationElectrocardiogramDuration_VS (example)
* value[x] ^short = "心電図の測定時間(長さ)"
* value[x] ^definition = "心電図を測定した時間の長さを記録するための拡張である。"

//-------------------------------
// JP_Observation_Electrocardiogram_StressType
//-------------------------------
Extension: JP_Observation_Electrocardiogram_StressType
Id: jp-observation-electrocardiogram-stresstype
Title: "JP Core Observation Electrocardiogram StressType Extention"
Description: "負荷心電図検査の種別について記録する。"
* ^url = $JP_Observation_Electrocardiogram_StressType
* ^status = #active
* ^date = "2024-12-30"
* ^purpose = "このプロファイルでは負荷心電図検査を記録するに十分な要素をそろえていないが、将来的に拡張することに備えて負荷心電図の種別について記録できるようにした。"
* ^context.type = #element
* ^context.expression = "Observation"
* . ^short = "負荷心電図種別"
* . ^definition = "負荷心電図の種別を示す拡張である。"
* url = $JP_Observation_Electrocardiogram_StressType (exactly)
* value[x] 0..1
* value[x] only CodeableConcept
* valueCodeableConcept from JP_ObservationElectrocardiogramStressType_VS (example)
* value[x] ^short = "心電図の測定時間(長さ)"
* value[x] ^definition = "心電図を測定した時間の長さを記録するための拡張である。Durationとして数値を示すか、プリセットされた値としてコードを指定することもできる。"