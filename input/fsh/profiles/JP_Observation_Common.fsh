// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Common
Parent: Observation
Id: jp-observation-common
Title: "JP Core Observation Common Profile"
Description: "このプロファイルはObservationリソースに対して、データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "測定や簡単な観察事実（assertion）"
* . ^definition = "患者、デバイス、またはその他の対象について行われた測定と簡単な観察事実（assertion）。"
* . ^comment = "すべてのObservation（検査測定や観察事実）の共通部分のプロファイル"
* insert SetDefinition(identifier, このObservationリソースの一意な識別ID)
* basedOn only 	Reference(CarePlan or DeviceRequest or ImmunizationRecommendation or JP_MedicationRequest or JP_MedicationRequest_Injection or NutritionOrder or ServiceRequest)
* insert SetDefinition(basedOn, このObservationが実施されることになった依頼や計画、提案に関する情報)
* partOf only Reference(JP_MedicationAdministration or JP_MedicationAdministration_Injection or JP_MedicationDispenseBase or MedicationStatement or JP_Procedure or JP_Immunization or ImagingStudy)
* insert SetDefinitionRef(partOf, このObservationが親イベントの一部を成す要素であるとき、その親イベントに関する情報)
* partOf ^comment = "ObservationをEncounterにencounter要素を使ってリンクする。もうひとつ別のObservationを参照することについては、以降にあるt [Notes](observation.html#obsgrouping)　をガイダンスとして参照のこと。"
* insert SetDefinitionRef(status, 結果の状態)
* status ^comment = "このリソースは現在有効でないというマークをするコードを含んでいるため、この要素はモディファイアー（修飾的要素）として位置づけられている。"

* insert SetDefinition(category, 行われた検査の一般的なタイプの分類。JP Core Observation Common Profileの【詳細説明】を参照のこと。)
* category from $JP_SimpleObservationCategory_VS (preferred)
* insert SetDefinitionRef(category, このObservationを分類するコード)
* category ^comment = "階層的にカテゴリーを設定することで粒度のレベルを概念定義できる。"
* insert SetDefinitionRef(code, このObservationの対象を特定するコード)
* code ^comment = "observationの意味を正しく理解するには、すべてのcode-valueペアと、さらに存在する場合にはcomponent.code-component.valueのペアが、考慮される必要がある。"
* subject only Reference(JP_Patient or Group or Device or JP_Location)
* insert SetDefinitionRef(subject, このObservationの対象となる患者や患者群、機器、場所に関する情報)
* subject ^comment = "この要素は1..1のcardinalityになるはずと考えられる。この要素が欠損値になる唯一の状況は、対象患者が不明なデバイスによって観察が行われるケースである。この場合、観察は何らかのコンテキスト/チャネルマッチング技術を介して患者にマッチングされる必要があり、患者にマッチングされれば、その時点で本要素を更新する必要がある。"
* insert SetDefinitionRef(focus, 配偶者、親、胎児、ドナーなど、このObservationのsubject要素が実際の対象でない場合、その実際の対象に関する情報)
* focus ^comment = "T通常、observationは対象（患者、または患者のグループ、場所、またはデバイス）について行われ、対象とobservationのために直接測定されるものとの区別は、observationコード自体（例：「血糖値」 ）で記述され、この要素を使用して個別に表す必要はない。検体（標本）への参照が必要な場合は、 `specimen`要素を使用する。リソースの代わりにコードが必要な場合は、人体部位には`bodysite`要素を使用するか、標準の拡張機能[focusCode]（extension-observation-focuscode.html）を使用する。"
* encounter only Reference(JP_Encounter)
* insert SetDefinitionRef(encounter, 診察や入院など、このObservationが実施されるきっかけとなった診療イベントに関する情報)
* encounter ^comment = "通常、イベントが発生したEncounterであるが、一部のイベントは、Encounterの正式な完了の前または後に開始される場合があり、その場合でもEncounterのコンテキストに関連付けられている（例：入院前の臨床検査）。"
* insert SetDefinitionRef(effective[x], 取得された結果が臨床的に確定された日時または期間)
* effective[x] ^comment = "この観察結果が過去の報告でない限り、少なくとも日付が存在する必要がある。不正確または「あいまいな」時間を記録するには（たとえば、「朝食後」に行われた血糖測定）、[Timing]（datatypes.html＃timing）データ型を使用して、測定を通常のライフイベントに関連付けることができる。"
* insert SetDefinitionRef(issued, このバージョンのObservationが医療者に提供された日時。通常、結果を確認し検証後に提供される日時)
* issued ^comment = "レビューと検証を必要としないobservationの場合、リソース自体の[`lastUpdated`]（resource-definitions.html＃Meta.lastUpdated）日時と同じになる場合がある。特定の更新のレビューと検証が必要なobservationの場合、新しいバージョンを再度レビューして検証する必要がないような臨床的に重要でない更新がなされたために、リソース自体の「lastUpdated」時間はこれと異なる場合がある。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam or JP_Patient or RelatedPerson)
* insert SetDefinitionRef(performer, このObservationの責任者/実施者に関する情報)
* performer ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* insert SetDefinition(value[x], 取得された結果)
* insert SetDefinitionRef(dataAbsentReason, このObservationのvalue[x]要素に期待される結果が存在しなかった場合、その理由)
* dataAbsentReason ^comment = "ヌル値または例外値は、FHIRオブザベーションで2つの方法で表すことができる。 1つの方法は、それらを値セットに含めて、値の例外を表す方法である。たとえば、血清学的検査の測定値は、「検出された」、「検出されなかった」、「決定的でない」、または「検体が不十分」である可能性がある。別の方法は、実際の観測にvalue要素を使用し、明示的なdataAbsentReason要素を使用して例外的な値を記録することである。たとえば、測定が完了しなかった場合、dataAbsentReasonコード「error」を使用できる。この場合には、観測値は、報告する値がある場合にのみ報告される可能性があることに注意する必要がある。たとえば、差分セルカウント値は> 0の場合にのみ報告される場合がある。これらのオプションのため、nullまたは例外値の一般的な観測値を解釈するにはユースケースの合意が必要である。"
* insert SetDefinitionRef(interpretation, 高、低、正常等の結果のカテゴリ分けした評価)
* interpretation ^comment = "「異常フラグ」として呼ばれる検査結果解釈コードが従来から使用されており、その使用はコード化された解釈が関連するような他の場合でも拡大して使われている。多くの場合、1つ以上の単純でコンパクトなコードとして報告され、この要素は、結果の意味や正常かどうかを示すために、レポートや時系列表で結果値の隣に配置されることがよくある。"
* interpretation ^requirements = "一部の結果、特に数値結果については、結果の意義を完全に理解するためには解釈コードが必要である。"
* insert SetDefinitionRef(note, このObservationに関するコメント)
* note ^comment = "観察（結果）に関する一般的な記述、重要な、予期しない、または信頼できない結果値に関する記述、またはその解釈に関連する場合はそのソースに関する情報が含まれる場合がある。"
* note ^requirements = "Need to be able to provide free text additional information.\r\nフリーテキストの追加情報を提供できる必要がある。"
* insert SetDefinition(bodySite, 対象となった身体部位)
* insert SetDefinition(method, このObservationの実施方法)
* insert SetDefinitionRef(specimen, このObservationに使われた検体/標本に関する情報)
* specimen ^comment = "`Observation.code`にあるコードで暗黙的に示されない場合にのみ使用する必要がある。検体自体の観察は行われない。観察（観測、検査）対象者に対して実施されるが、多くの場合には対象者から得られた検体に対して実施される。検体が奥の場合に関わるが、それらは常に追跡され、明示的に報告されるとは限らないことに注意すること。またobservationリソースは、検体を明示的に記述するような状況下（診断レポートなど）で使用される場合があることに注意。"
* insert SetDefinitionRef(device, このObservationでデータを得るために使われた測定機器に関する情報)
* device ^comment = "これは、結果の送信に関与するデバイス（ゲートウェイなど）を表すことを意図したものではない。そのようなデバイスは、必要に応じてProvenanceリソースを使用して文書化する。"
* insert SetDefinitionRef(referenceRange, 基準範囲との比較による結果の解釈方法のガイダンス)
* referenceRange ^comment = "通常の範囲または推奨範囲と比較して値を解釈する方法に関するガイダンス。複数の参照範囲は「OR」として解釈される。つまり、2つの異なるターゲット母集団を表すために、2つの `referenceRange`要素が使用される。"
* referenceRange ^requirements = "どの値が「正常」と見なされるかを知ることは、特定の結果の意義を評価するのに役立つ。さまざまなコンテキストに対応するため複数の参照範囲を提供できる必要がある。"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence)
* insert SetDefinitionRef(hasMember, このObservationに関連する子リソースに関する情報。このObservationに関連する/属するパネル検査や検査セットなどのObservationグループ)
* hasMember ^comment = "この要素を使用する場合、observationには通常、値または関連するリソースのセットのいじれかを含む。その両方を含む場合もある。複数のobservationをグループに一緒にまとめる方法については、以下の[メモ]（observation.html＃obsgrouping）を参照せよ。システムは、[QuestionnaireResponse]（questionnaireresponse.html）からの結果を計算して最終スコアにし、そのスコアをobservationとして表す場合があることに注意。"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence)
* insert SetDefinitionRef(derivedFrom, このObservationの結果の導出元に関する情報。例えば、画像検査から取得された結果となる場合その導出元となる画像検査結果を示すImagingStudyリソース)
* derivedFrom ^comment = "この要素にリストされているすべての参照の選択肢は、派生値の元のデータなる可能性のある臨床観察やその他の測定値を表すことができる。最も一般的な参照先は、別のobservationである。observationをグループに一緒にまとめる方法については、以下の[メモ]（observation.html＃obsgrouping）を参照すること。"
* insert SetDefinitionRef(component, 複合的な結果。例えば、血圧測定値ではそれを構成する収縮期および拡張期の値の組み合わせ)
* component ^comment = "複数のObservation をグループに一緒にまとめる方法については、以下の[Notes]（observation.html＃notes）を参照すること。"
* component ^requirements = "コンポーネントobservation は プライマリobservation としてのobservation リソースの中で同じ属性を共有し、常に単一のobservation の一部として扱われる（つまりそれらは分離可能ではないん）。ただし、プライマリobservationのreference rangeはコンポーネント値に継承されないため、reference rangeは各コンポーネントobservation に適切であれば必要である。"
