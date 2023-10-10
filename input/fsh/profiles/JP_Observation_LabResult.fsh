// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_LabResult
Parent: JP_Observation_Common
Id: jp-observation-labresult
Title: "JP Core Observation LabResult Profile"
Description: "このプロファイルはObservationリソースに対して、検体検査結果のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "検体検査結果"
* . ^definition = "検体検査結果の格納に使用する。"
* . ^comment = "すべてのObservation（検査測定や観察事実）の制約プロファイル"
* identifier ^short = "当該検査項目に対して、施設内で割り振られる一意の識別子"
* identifier ^definition = "この検査項目に割り当てられた一意の識別子。リソースの識別子やシステム的なシーケンスではなく、ビジネスID。"
* identifier ^comment = "【JP Core仕様】当該検査項目に対して、施設内で割り振られる一意の識別子があればそれを使用する。なければ次のルールを参考に一意となる識別子を生成し設定する。\r\n\r\nアプリケーション側のデータベースにおけるフィールド長の定義については、最低64バイトを確保すること。\r\n\r\n--- 参考 ---\r\n\r\n次の項目を順にセパレータ「_(アンダースコア)」で連結し、 identifier.value に設定する。グループ項目でない場合など、該当コード／番号がない場合はセパレータを連続で連結する。各コードはローカルコードを使用し、必ず設定できること。\r\n\r\n　１．ORC-2(依頼者オーダ番号)　SS-MIX2の15桁前ゼロ形式の番号\r\n\r\n　２．OBR-4(検査項目ID)　検査セットの識別コード\r\n\r\n　３．SPM-4(検体タイプ)\r\n\r\n　４．OBX-3(検査項目)\r\n\r\n　５．OBX-4(検査副ID)・・・オプション。必要に応じて使用。\r\n\r\n形式：[ORC-2]_[OBR-4]_[SPM-4]_[OBX-3]（_[OBX-4]）"
* identifier.use ^definition = "この識別子の目的。"
* identifier.use ^comment = "アプリケーションは、identifierが一時的であると明示的に述べられない限り、永続的であると想定できる。"
* identifier.system ^comment = ""
* identifier.value ^definition = "システムのコンテキスト内で一意の識別子となる文字列を設定。"
* basedOn only Reference(ServiceRequest)
* basedOn ^definition = "このプロファイルでは、検体検査オーダに関する情報。"
* basedOn ^comment = "【JP Core仕様】オーダ情報がある場合、このプロファイルでは ServiceRequest のリソースを参照する。オーダIDの情報はここで使用する。"
* partOf ^definition = "このリソースが一部として、あるいは手順の一つとして含まれるより大きなイベント。"
* partOf ^comment = "【JP Core仕様】当面は使用しない。"
* status ^definition = "結果値の状態。"
* status ^comment = "【JP Core仕様】v2.5の「F」に相当する値は「final」であるが、ここでは 必須コード表「ObservationStatus」より、全てのコード値を使用可とする。\r\n\r\n(registered | preliminary | final | amended |   corrected | cancelled | entered-in-error | unknown)"
* category 1..

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains laboratory 1..1
* insert SetDefinition(category.coding, 検査結果のコード化されたカテゴリー)

* category ^comment = "【JP Core仕様】推奨コード表「JP Core Simple Observation Category CodeSystem」より、このプロファイルでは「laboratory」固定とする。\r\n\r\n(social-history | vital-signs | imaging | laboratory | procedure | survey | exam | therapy | activity)"
* category.coding ^comment = "【JP Core仕様】推奨コード表「JP Core Simple Observation Category CodeSystem」より、このプロファイルでは「laboratory」固定とする。"

* category[laboratory] from JP_SimpleObservationCategory_VS (required)
* insert SetDefinition(category[laboratory], 検体検査では、http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS のコード表から\"laboratory\"を設定する。)
* insert SetDefinition(category[laboratory].coding.system, 検体検査では、http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS のコード表を使用する。)
* category[laboratory] = $JP_SimpleObservationCategory_CS#laboratory (exactly)
* category[laboratory].coding.code 1..
* insert SetDefinition(category[laboratory].coding.code, 検体検査を表すコード laboratory を設定する。)

* code from $JP_ObservationLabResultCode_VS (preferred)
* code ^definition = "検査の内容の説明。検査名称。"
* code ^comment = "*JLAC10"
* code ^binding.description = "MEDIS 臨床検査マスター"
* code.coding 1..
* code.coding ^definition = "コード体系によって定義されたコードへの参照。"
* code.coding ^comment = "【JP Core仕様】SS-MIX2にならい、標準コード、ローカルコードの2つを設定可能とし、いずれか一方は必須とする。さらにJLAC10とJLAC11などの複数の標準コードも設定できるよう、上限は設けない。\r\n\r\n標準コード、ローカルコードの2つまで格納可。順不同。\r\nSS-MIX2だとCWE.1 ～CWE.3に標準コード、CWE.4～CWE.6にローカルコード、など（順不同）。"
* code.coding.system ^definition = "コード体系。"
* code.coding.system ^comment = "【JP Core仕様】標準コードの場合、JLAC10を表すURIを設定。\r\n\r\nURIは本WGで定義する。"
* code.coding.version ^comment = "Where the terminology does not clearly define what string should be used to identify code system versions, the recommendation is to use the date (expressed in FHIR date format) on which that version was officially published as the version date."
* code.coding.code ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size"
* code.coding.display ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size"
* code.coding.userSelected ^definition = "このコードが利用者によって、例えば利用可能なコードの選択リストから、など、直接選択されたものであることを示す。"
* code.coding.userSelected ^comment = "【JP Core仕様】当面は未使用とする。"
* code.text 1..
* code.text ^definition = "コードの表示名。報告書などに記載する場合に使用する表示名。コードを複数指定した場合(標準コード、ローカルコード)、その一般的な表現。"
* code.text ^comment = "【JP Core仕様】このプロファイルでは、表示名として必須とする。\r\n\r\n多くの場合、coding.display と同一になるが、coding.display に異なる複数の表現が格納される場合を想定し、code間で共通の表現として必須とする。"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^definition = "検体検査の対象となる患者。"
* subject ^comment = "【JP Core仕様】このプロファイルでは、Patient 限定、かつ必須とする。"
* focus ^definition = "患者当人ではなく、患者の胎児、親、ドナーなどの検査、観察の場合、その対象を示す。"
* focus ^comment = "【JP Core仕様】当面は未使用とする。"
* encounter ^definition = "この検査が行われるヘルスケアイベント。医療提供者と患者の接点。"
* encounter ^comment = "【JP Core仕様】入院外来の区別や所在場所、担当診療科の情報に使用する。\r\n\r\n※このプロファイルの用途では通常は必須と考えられるが、ユースケースにより使用されない場合を考慮し、1..1に制約しない。"
* effective[x] 1..
* effective[x] only dateTime or Period or Timing
* effective[x] ^definition = "検体検査の場合は、検体採取日時。"
* effective[x] ^comment = "【JP Core仕様】このプロファイルでは、検体採取日時を設定し、必須とする。\r\n\r\neffectiveInstant\r\n\r\ninstant型はイベント発生のログ時間であり、未使用とする。"
* issued ^definition = "この情報の発生日時。システム時刻であり、人が報告する時刻ではないことに注意。このリソースの発生時間と同じになる場合がある。"
* issued ^comment = "【JP Core仕様】検査結果が**システムにより**Observationリソースに格納または更新された日時。"
* performer ^definition = "検査値を確認した責任者。検査実施責任者情報。"
* performer ^comment = "【JP Core仕様】検査に直接責任を負う個人(つまり検査を実行、もしくは検証した人)の識別子。"
* value[x] only Quantity or CodeableConcept or string
* value[x] ^short = "同じ検査項目でも、システム（施設）により、使うデータ型が異なる可能性あり【詳細参照】"
* value[x] ^definition = "検体検査の結果として決定された情報。"
* value[x] ^comment = "以下のデータ型はSS-MIX2では未使用のため、未使用とした。今後の議論で使用の必要性が出れば復活させる。\r\n\r\nvalueBoolean\r\n\r\nvalueInteger　：検査結果値を整数値（Integer）で定義したい場合に指定する。ただし、valueQuantityで単位付き数値を示すので、通常は使わない。　SS-MIX2／HL7 V2.5→ OBX-2＝「NW」の時の OBX-5(結果値)\r\n\r\nvalueRange\r\n\r\nvalueRatio\r\n\r\nvalueSampledData\r\n\r\nvalueTime　：検査結果値が「時間」の場合、その時間を指定する。　SS-MIX2／HL7 V2.5→ OBX-2＝「TM」の時の OBX-5(結果値)\r\n\r\nvalueDateTime　：検査結果値が「日時」の場合、その日時を指定する。　SS-MIX2／HL7 V2.5→ OBX-2＝「DT」の時の OBX-5(結果値)\r\n\r\nvaluePeriod"
* valueQuantity ^short = "検査結果が「数値」の場合、値、単位を設定する。　SS-MIX2／HL7 V2.5→ OBX-2＝「NM」の時の OBX-5(結果値)、OBX-6(単位)【詳細参照】"
* valueQuantity ^comment = "valueQuantity.value　：結果値（数値）を定義。　SS-MIX2／HL7 V2.5：OBX-5(結果値)\r\n\r\nvalueQuantity.comparator　：QuantityComparator Value setから設定。　SS-MIX2／HL7 V2.5→ 検体検査結果メッセージでは未使用となっているデータ型だが、SN型のSN.1(比較演算子)が該当する。検査値の「0未満」の場合の「未満」などに相当するコードを設定。\r\n\r\nvalueQuantity.unit　：.systemで示す単位のValue setの文字列を指定。　SS-MIX2／HL7 V2.5→ OBX-6(単位) CWE.2 テキスト\r\n\r\nvalueQuantity.system　：単位のValue set名を指定。　SS-MIX2／HL7 V2.5→ OBX-6(単位) CWE.3 コード体系 HL7では「ISO+」だが、ローカルコード99zzzのHL7標準の「ISO+」が示すOID、ローカルコードの場合はOIDを別途取得必要\r\n\r\nvalueQuantity.code　：.systemで示す単位のValue setのコードを指定。　SS-MIX2／HL7 V2.5→ OBX-6(単位) CWE.1 識別子"
* valueCodeableConcept ^short = "検査結果が「コード値」の場合、コード、テキスト、コードのValue setを定義する。　SS-MIX2／HL7 V2.5→ OBX-2＝「CWE」の時の OBX-5(結果値)【詳細参照】"
* valueCodeableConcept ^comment = "valueCodeableConcept.coding　：ローカルコードと国際標準コードなど複数指定できる。　SS-MIX2／HL7 V2.5→ CWEは正規コード＋代替コードの2種類登録可能。\r\n\r\nvalueCodeableConcept.coding.system　：対象のValue set名を指定。　SS-MIX2／HL7 V2.5→ CWE.3 or 6 コード体系。対象コードの OIDを設定\r\n\r\nvalueCodeableConcept.coding.version　：対象のValue setのバージョンを指定。　SS-MIX2／HL7 V2.5→ CWE.7 コード体系バージョン ID valueCodeableConcept.coding.code　：対象のValue setのコードを指定。　SS-MIX2／HL7 V2.5→ CWE.1 or 4 識別子。対象コードシステムのコード\r\n\r\nvalueCodeableConcept.coding.display　：対象のValue setのテキストを指定。　SS-MIX2／HL7 V2.5→ CWE.2 or 5 テキスト。対象コードの名称\r\n\r\nvalueCodeableConcept.coding.userselected　：未使用。\r\n\r\nvalueCodeableConcept.text　：コードが示す意味を指定する。通常は.coding.displayの値を指定するが、複数ある場合は適宜編集すること。　SS-MIX2／HL7 V2.5→ CWE.2 テキスト。coding.display と同じ。"
* valueString ^short = "検査結果値が「文字列」の場合、その文字列を指定する。SS-MIX2／HL7 V2.5→ OBX-2＝「ST」の時の OBX-5(結果値)"
* dataAbsentReason ^definition = "検査結果値が欠落している理由。"
* dataAbsentReason ^comment = "【JP Core仕様】SS-MIX2で未使用だが、valueの欠落時に使用する必要があり、重要な項目である。\r\n\r\n制約「obs-6」に示す通り、valueが存在する場合、当該項目は存在してはならない。\r\n\r\ntextのみでの使用は基本的に不可とし、必ずcodingを設定すること。\r\n\r\n(unknown |   asked-unknown |   temp-unknown |   not-asked |   asked-declined | masked | not-applicable | unsupported | as-text | error |   not-a-number |   negative-infinity |   positive-infinity | not-performed | not-permitted)"
* interpretation ^short = "High, low, normal, etc. 高、低、正常など"
* interpretation ^definition = "検査結果値の、（高、低、正常）といったカテゴリー評価。結果報告書に記載されることもある情報。"
* interpretation ^comment = "【JP Core仕様】拡張可コード表「ObservationInterpretationCodes」を使用する。\r\n\r\nコード表が大きいため、下記参照。\r\n\r\nhttps://www.hl7.org/fhir/R4/valueset-observation-interpretation.html"
* interpretation ^requirements = "特に数値結果については、結果の重要性を完全に理解するために解釈を必要とする場合がある。"
* note ^definition = "検査、あるいは結果に関するコメント。フリーテキストの追加情報として使用可能。"
* note ^comment = "May include general statements about the observation, or statements about significant, unexpected or unreliable results values, or information about its source when relevant to its interpretation."
* note.author[x] ^comment = "Organization is used when there's no need for specific attribution as to who made the comment."
* note.time ^comment = ""
* note.text ^comment = "Systems are not required to have markdown support, so the text should be readable without markdown processing. The markdown syntax is GFM - see https://github.github.com/gfm/"
* bodySite ^definition = "検査が行われた患者の体の部位。検体検査に関しては、当面は使用しない。"
* bodySite ^comment = "【JP Core仕様】当面は未使用とする。"
* method ^short = "実施の方法"
* method ^definition = "検体検査の検査方法、測定方法。"
* method ^comment = "Observation.code の code から測定方法が暗黙的でない場合にのみ使用する。\r\n\r\n【JP Core仕様】Observation.code に JLAC10コードを使用する場合、測定方法コードが含まれているため method は使用しない。Observation.code から測定方法が判明しない場合や、実際の測定方法が異なる場合に使用することになるが、現状では運用が困難と想定されるため、当面は未使用とする。"
* method ^requirements = "In some cases, method can impact results and is thus used for determining whether results can be compared or determining significance of results.\r\n\r\n場合により、測定方法は結果に影響を与える可能性があるため、結果を比較できるかどうかを判断したり、結果の重要性を判断したりするために使用される。"
* specimen 1..
* specimen ^definition = "この検査に使用された検体（標本）。"
* specimen ^comment = "【JP Core仕様】検体検査プロファイルでは必須とする。"
* device ^definition = "検査装置、機器。"
* device ^comment = "【JP Core仕様】検査に使用した機器等の情報に使用する。"
* referenceRange ^definition = "推奨範囲として結果値を解釈するためのガイダンス。基準値。"
* referenceRange ^comment = "【JP Core仕様】可能な限りlow、highに構造化すべき。構造化できない場合、あるいはlow、highに該当しない場合はtextを使用。"
* referenceRange.low ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator."
* referenceRange.high ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator."
* referenceRange.type ^definition = "対象となる母集団のどの部分に適用するかを示すコード。正常範囲、要治療範囲、など。"
* referenceRange.type ^comment = "This SHOULD be populated if there is more than one range.  If this element is not present then the normal range is assumed."
* referenceRange.appliesTo ^definition = "基準値が適用される母集団を示すコード。人種、性別など。"
* referenceRange.appliesTo ^comment = "This SHOULD be populated if there is more than one range.  If this element is not present then the normal population is assumed."
* referenceRange.age ^definition = "基準値が適用される年齢。新生児の場合、週数もありうる。"
* referenceRange.age ^comment = "The stated low and high value are assumed to have arbitrarily high precision when it comes to determining which values are in the range. I.e. 1.99 is not in the range 2 -> 3."
* referenceRange.text ^definition = "量的範囲で表せない場合などに使用する。"
* referenceRange.text ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size"
* hasMember ^definition = "グループ検査の場合、この検査に含まれる複数の検査結果項目を示す。"
* hasMember ^comment = "【JP Core仕様】この1検査結果で複数の検査結果項目を含むような場合、value[x]には結果値を設定せず、それら検査結果項目を示すJP_Observation_LabResultへのReferenceをhasMemberに設定する。"
* derivedFrom ^definition = "この検査値の発生元である関連リソース。例えば他のObservation を受けて、本検査値が発生した場合など。"
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below."
* component ^definition = "一度のタイミングでの1回の検査で複数の結果を同時に得る場合にのみ使用される。例えば、血圧の収縮期、拡張期。新生児のApgarスコア。質問に対する複数の回答（飲んだアルコールの種類、など）。"
* component ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below."
* component.code ^comment = "*All* code-value and  component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation."
* component.value[x] ^comment = "Used when observation has a set of component observations. An observation may have both a value (e.g. an  Apgar score)  and component observations (the observations from which the Apgar score was derived). If a value is present, the datatype for this element should be determined by Observation.code. A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below."
* component.interpretation ^comment = "Historically used for laboratory results (known as 'abnormal flag' ),  its use extends to other use cases where coded interpretations  are relevant.  Often reported as one or more simple compact codes this element is often placed adjacent to the result value in reports and flow sheets to signal the meaning/normalcy status of the result."
* component.referenceRange ^comment = "Most observations only have one generic reference range. Systems MAY choose to restrict to only supplying the relevant reference range based on knowledge about the patient (e.g., specific to the patient's age, gender, weight and other factors), but this might not be possible or appropriate. Whenever more than one reference range is supplied, the differences between them SHOULD be provided in the reference range and/or age properties."