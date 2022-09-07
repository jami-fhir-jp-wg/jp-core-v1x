// ==============================
//   DataType 定義
// ==============================
Profile: JP_MedicationTiming
Parent: Timing
Id: jp-medicationtiming
Title: "JP Core Medication Timing DataType"
Description: "このプロファイルはTiming DataTypeに対して、薬剤に関するタイミング定義を行なったものである"

* timing ^short = "服用もしくは注射を行なうタイミング"
* timing ^definition = "服用もしくは注射を行なうタイミングを記録する。"
* timing ^comment = "Dosage.textが設定されていることが想定されているのとは異なり、この属性は常に設定されていなくてもよい。もし、療法が設定されている場合はDosage.textはDosage.timingを反映させているべきである。"
* timing ^requirements = "患者に薬剤を投与すべき計画上のタイミング。このデータ型はさまざまな表現をとることができる。たとえば、「8時間おき」「1日3回」、「2011年12月23日から10日間、朝食全30分前に」、「2013年10月15日と2013年11月1日に」などである。しばしば、総量/総投与期間を表現するような場合に比率は期間を明示しておくことがある（たとえば、500mlを2時間でという指示は2時間と明示している)。しかしながら、比率で期間を表さない場合(たとえば、250ml/毎時）はtiming.repeat.durationで注射の総投与期間を伝える必要がある。"
* timing.id ^short = "エレメント間参照のためのユニークID"
* timing.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* timing.event ^short = "服用もしくは注射を行なうタイミングを示す時刻"
* timing.event ^definition = "服用タイミングを具体的な日時で指定する場合に使⽤する"
* timing.repeat ^short = "イベントが発生する時刻"
* timing.repeat ^definition = "イベントがスケジュールされたルールについての記述。"
* timing.repeat ^requirements = "スケジュールされたタイミングの多くは規則的な繰り返しで決定されている。"
* timing.repeat.id ^short = "エレメント間参照のためのユニークID"
* timing.repeat.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* timing.repeat.bounds[x] only Duration or Period or Range
* timing.repeat.boundsDuration.id ..0
* timing.repeat.boundsDuration.value 1..
* timing.repeat.boundsDuration.value ^short = "投薬日数"
* timing.repeat.boundsDuration.value ^definition = "投薬日数"
* timing.repeat.boundsDuration.comparator ..0
* timing.repeat.boundsDuration.unit 1..
* timing.repeat.boundsDuration.code = #d (exactly)
* timing.repeat.boundsDuration.system = "http://unitsofmeasure.org" (exactly)
* timing.repeat.boundsDuration.unit = "日" (exactly)
* timing.repeat.boundsDuration.unit ^short = "投薬日数の単位"
* timing.repeat.boundsDuration.unit ^definition = "投薬日数の単位文字列。日で固定される"
* timing.repeat.boundsDuration.system 1..
* timing.repeat.boundsDuration.system ^short = "UCUM"
* timing.repeat.boundsDuration.system ^definition = "単位コード UCUMを識別するURI。固定値。"
* timing.repeat.boundsDuration.code 1..
* timing.repeat.boundsDuration.code ^short = "投与日数の単位"
* timing.repeat.boundsDuration.code ^definition = "単位コードUCUMにおける投与日数の単位。dで固定される。"
* timing.repeat.bounds[x] ^short = "服用・注射開始日から服用・注射終了日までの全日数"
* timing.repeat.bounds[x] ^definition = "服用・注射開始日から服用・注射終了日までの全日数。実投与日数ではないことに注意する。"
* timing.repeat.count ^short = "繰り返し服用もしくは注射回数"
* timing.repeat.count ^definition = "Timing仕様の全てにおいて、特定の期間に繰り返されるように指定された総回数。もし、countMaxが設定されていれば、このエレメントは許容される最低限度の回数を示す。"
* timing.repeat.count ^comment = "回数に上限、下限の範囲がある場合は、このcountで示される回数が起きるまでは、エレメントは範囲の中にあると解釈されるべきである。"
* timing.repeat.countMax ^short = "繰り返しの最大回数"
* timing.repeat.countMax ^definition = "このエレメントが設定されている場合は、回数に範囲があることを示している。したがって、[count]から[countmax]までの回数で繰り返される。"
* timing.repeat.countMax ^comment = "32bit整数。もし、値がこれを超える場合はdecimalで記録される。"
* timing.repeat.duration ^short = "継続時間"
* timing.repeat.duration ^definition = "投与されるタイミングが発生している時間。もし、durationMaxが設定されていれば、このエレメントは許容される継続時間の下限を示す。"
* timing.repeat.duration ^comment = "継続時間はイベントの定義の一部（たとえば、静脈注射(IV)では特定の量と速度が明示される)として示されることがある。その他、Timing仕様の一部（たとえば、運動）として示されることもある。"
* timing.repeat.duration ^requirements = "アクティビティによっては即時的なものではなく、その期間において維持される必要がある。"
* timing.repeat.durationMax ^short = "継続時間(最大値)"
* timing.repeat.durationMax ^definition = "もし、このエレメントに値が設定されていれば、durationには範囲があることを示している。したがって、[duration]から[durationMax]までの継続時間の範囲で投与される。"
* timing.repeat.durationMax ^comment = "継続時間はイベントの定義の一部（たとえば、静脈注射(IV)では特定の量と速度が明示される)として示されることがある。その他、Timing仕様の一部（たとえば、運動）として示されることもある。"
* timing.repeat.durationMax ^requirements = "アクティビティによっては即時的なものではなく、その期間において維持される必要がある。"
* timing.repeat.durationUnit ^definition = "UCUM単位で表される継続時間についての単位。"
* timing.repeat.durationUnit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* timing.repeat.frequency ^short = "期間内にイベントが発生する回数、頻度"
* timing.repeat.frequency ^definition = "特定の期間に繰り返して発生した行為の回数。もし、frequencyMaxが設定されていれば、このエレメントはfrequencyとして認められた下限を示す。"
* timing.repeat.frequency ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* timing.repeat.frequency ^meaningWhenMissing = "frequencyが指定されていなければ、期間内に1回だけイベントが発生すると想定される。しかし、システムはこれを常時特定しておく必要がある。"
* timing.repeat.frequencyMax ^short = "期間内にイベントが発生する最大回数、最大頻度"
* timing.repeat.frequencyMax ^definition = "このエレメントに値が設定されていれば、frequencyには範囲が指定されている。つまり、期間あるいは期間の範囲内に[frequency]から[frequencyMax]回繰り返されることを示している。"
* timing.repeat.frequencyMax ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* timing.repeat.period ^short = "イベントが発生する頻度に対応する期間"
* timing.repeat.period ^definition = "繰り返し投与が行われる期間を示す。たとえば、「1日3回」であれば、3は繰り返しの頻度(frequency)であり、「1日」が期間(period)である。もし、periodMaxに値が設定されていれば、このエレメントは期間として認められた範囲の下限を示す。"
* timing.repeat.period ^comment = "IEEEの浮動小数点型を使わずに、小数点も含むdecimal型のようなものを利用すること（たとえばJavaのBigInteger)。"
* timing.repeat.periodMax ^short = "期間の上限（3-4時間）"
* timing.repeat.periodMax ^definition = "もし、この値が設定されていれば、期間は[period]から[periodMax]までであることを示し、「3-5日に1回投与」のような表現が認められる。"
* timing.repeat.periodMax ^comment = "IEEEの浮動小数点型を使わずに、小数点の制度も示すdecimal型のようなものを利用すること（たとえばJavaのBigInteger)。"
* timing.repeat.periodUnit ^definition = "期間を表すUCUM単位。"
* timing.repeat.periodUnit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* timing.repeat.dayOfWeek ^definition = "期間として1週間以上が指定されていれば、指定された曜日のみで投与が行われる。"
* timing.repeat.dayOfWeek ^comment = "曜日が指定されていなければ、他に指定された日には毎日投与されると想定される。frequencyとperiodエレメントはdayOfWeekと同じように使うことはできない。"
* timing.repeat.timeOfDay ^short = "一日の間で投与される時刻"
* timing.repeat.timeOfDay ^definition = "一日の間で指定された投与される時刻。"
* timing.repeat.timeOfDay ^comment = "もし、このtimeOfDayに値が指定されていれば、毎日（daysOfWeekでフィルタされた曜日の）指定された時刻に投与されると推定される。whenやfrequency, periodエレメントはtimeOfDayとは同様に使うことはできない。"
* timing.repeat.when ^short = "投薬期間についてのコード"
* timing.repeat.when ^definition = "一日の間のおおよその時間帯で投与すべきタイミングを示す。日常のイベントに関連付けられていることもある。"
* timing.repeat.when ^comment = "一つ以上のイベントが記載されている場合、そのイベントは特定のイベントの組み合わせと結びついている。"
* timing.repeat.when ^requirements = "タイミングはしばしば起床や食事、睡眠などのできごとによってしばしば決定されている。"
* timing.repeat.offset ^short = "イベントからの時間(分、前後）"
* timing.repeat.offset ^definition = "イベントからの時間(分)。もし、分で示される時間がイベントのコードが前か後かを示していない場合、offsetはイベントの後であることが想定される。"
* timing.repeat.offset ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* timing.code ^definition = "スケジュール上のタイミングを表すコード（あるいはcode.text内のテキスト）。BID(1日2回)のようなコードはどこにでもあるが、多くの医療機関は付加的なコードを定義している。もし、コードが示されていれば、構造化されたタイミングで完全に示されたデータであると解釈され、コードまたはTimingを解釈するためのデータであると解釈される。しかし、例外的に.repeat.bounds（コードは含まれない)はコードを上書きして適用される。"
* timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。"
