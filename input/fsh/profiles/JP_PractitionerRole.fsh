// ==============================
//   Profile 定義
// ==============================
Profile: JP_PractitionerRole
Parent: PractitionerRole
Id: jp-practitionerrole
Title: "JP Core PractitionerRole Profile"
Description: "このプロファイルはPractitionerRoleリソースに対して、医療従事者役割のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_PractitionerRole"
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "医療従事者が関連付けられている役割/組織"
* . ^definition = "医療従事者が一定期間、組織で行うことができる役割／場所／専門性／サービスの特定のセット。"
* identifier ^short = "役割/場所に固有のビジネス識別子"
* identifier ^definition = "役割/場所に固有のビジネス識別子。"
* identifier ^requirements = "多くの場合、エージェントには特定の識別子が割り当てられている。"
* active ^short = "このPractitionerRoleレコードがアクティブに使用されているかどうか"
* active ^definition = "このPractitionerRoleレコードがアクティブに使用されているかどうか。"
* active ^comment = "この値がfalseの場合、ロールがいつアクティブに使用されていたかを期間を参照して確認することができる。期間が指定されていない場合、それがいつアクティブになったかを推論することはできない。"
* active ^requirements = "PractitionerRoleレコードがエラーで作成されたために使用されないことをマークできるようにする必要がある。"
* period ^short = "その人が、これらの役割（複数可）の医療従事者として行動することを許可されている期間"
* period ^definition = "その人が、組織のためにこれらの役割（複数可）の医療従事者として行動することを許可されている期間。"
* period ^comment = "期間は時間の範囲を指定する。使用状況はその期間全体に適用されるか、範囲から1つの値が適用される。  
期間は、時間間隔（経過時間の測定値）には使用されない"
* period ^requirements = "機関が取り消された後も、存在していた事実を記録しなければならない。"
* practitioner only Reference(JP_Practitioner)
* practitioner ^short = "組織に定義されたサービスを提供できる医療従事者"
* practitioner ^definition = "組織に定義されたサービスを提供できる医療従事者。"
* practitioner ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* organization only Reference(JP_Organization)
* organization ^short = "役割が可能な組織"
* organization ^definition = "医療従事者が関連する役割を実行する組織。"
* organization ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* code from JP_PractitionerRole_VS (preferred)
* code ^short = "この医療従事者が果たす役割【詳細参照】"
* code ^definition = "この医療従事者が組織のために実行することを許可されている役割。"
* code ^comment = "医師、看護職員、薬剤師、放射線技師、情報職員といった職種を格納する。  
以下のコード表を作成する。  
http://jpfhir.jp/fhir/core/CodeSystem/JP_PractitionerRole_CS  
SS-MIX2ではJHSR004 医療従事者の職種コードを採用  
コード : 名称  
DR-01 : 依頼医師  
DR-02 : 実施医師  
DR-03 : 麻酔医師  
TC-01 : 実施技師  
NS-01 : 看護師  
NS-02 : 付添看護師  
NS-03 : 助産師"
* code ^requirements = "practitionerがどのような権限を持っているのかを知る必要がある - 何ができるのか？"
* specialty ^definition = "医療従事者の特定の専門性"
* specialty ^comment = "PractitionerRole.codeに格納した職種の専門領域を格納する。  
以下のコード表を作成する。  
http://jpfhir.jp/fhir/core/CodeSystem/JP_PractionerRole_practicecodes"
* location only Reference(JP_Location)
* location ^short = "この医療従事者がケアを提供している場所"
* location ^definition = "この医療従事者がケアを提供している場所（複数可）。"
* location ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* healthcareService ^short = "この対象者がこの役割の組織/場所に対して提供するヘルスケアサービスのリスト"
* healthcareService ^definition = "この対象者がこの役割の組織/場所に対して提供するヘルスケアサービスのリスト。"
* healthcareService ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* telecom ^short = "役割/場所/サービスに固有の連絡先の詳細"
* telecom ^definition = "役割/場所/サービスに固有の連絡先の詳細。"
* telecom ^comment = "各要素の説明は、JP_Patient　の説明を参照。"
* telecom ^requirements = "多くの場合、医療従事者は、勤務する場所（またはサービス）ごとに専用の回線を持っており、それぞれに別々の連絡先を定義する必要がある。"
* availableTime ^definition = "医療従事者が利用可能な時間、またはその場所および/またはヘルスケアサービスでこの役割を実行している時間のコレクション。"
* availableTime ^comment = "より詳細な利用可能な情報は、関連するSchedule/Slotのリソースで提供される場合がある。"
* availableTime.daysOfWeek ^definition = "開始時刻と終了時刻の間に利用可能な曜日を示す。"
* availableTime.allDay ^definition = "これはいつでも利用できるか(そのため時間は関係ない) 例：24時間サービス。"
* availableTime.availableStartTime ^definition = "一日の開始時間。注意：AllDayフラグが設定されている場合、この時間は無視される。"
* availableTime.availableStartTime ^comment = "タイムゾーンは、このHealthcareServiceが提供されている場所のために期待される。"
* availableTime.availableEndTime ^definition = "一日の終了時刻。注意：AllDayフラグが設定されている場合、この時間は無視される。"
* availableTime.availableEndTime ^comment = "タイムゾーンは、このHealthcareServiceが提供されている場所のために期待される。"
* notAvailable ^short = "この期間中は利用できない理由と期間"
* notAvailable ^definition = "医療従事者は、提供された理由により、この期間中にこの役割を果たすことができないか、またはこの役割を果たすことができない。"
* notAvailable.description ^definition = "この時間が利用できない理由をユーザに提示することができる。"
* notAvailable.during ^definition = "この日からサービスのご利用（季節・祝日）はできない。"
* availabilityExceptions ^definition = "祝祭日の利用可能性など、サイトの利用可能性の例外についての説明。通常のサイトの利用可能性に対するすべての可能性のある例外を、利用可能なTimesと利用できないTimesの詳細として簡潔に記述する。"
* endpoint ^definition = "この役割を持つ医療従事者のために運営されているサービスへのアクセスを提供する技術的なエンドポイント。"
* endpoint ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* endpoint ^requirements = "組織には、様々なサービスを提供するための複数のシステムがあり、また、医療従事者にとっても様々である。  
したがって、エンドポイントは、それらにどのように接続するか、また、どのような目的で接続するかにての技術的な接続の詳細を定義することができるという必要性を満たす。"