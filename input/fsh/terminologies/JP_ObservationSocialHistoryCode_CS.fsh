CodeSystem: JP_ObservationSocialHistoryCode_CS
Id: jp-observation-socialhistory-code-cs
Title: "JP Core Observation SocialHistory Code"
Description: "Observation（生活背景）で使用する項目コード、電子保存された診療録情報の交換のためのデータ項目セット([https://www2.medis.or.jp/master/jmix/file/tab1.pdf](https://www2.medis.or.jp/master/jmix/file/tab1.pdf))にて定義される"
* ^url = $JP_ObservationSocialHistoryCode_CS
* ^status = #draft
* ^caseSensitive = true
* ^valueSet = $JP_ObservationSocialHistoryCode_VS
* ^content = #complete

//電子保存された診療録情報の交換のためのデータ項目セットより参照
//https://www2.medis.or.jp/master/jmix/file/tab1.pdf
* #MD0012770 "出生地" "出生地（都道府県、市町村名など）"
* #MD0012780 "主な居住地歴" "居住地（都道府県、市町村名など）のリスト"
* #MD0012790 "家庭環境" "家庭環境の記述"
* #MD0012800 "学業歴" "最終学歴を表す文字列"
* #MD0012810 "職業歴" "主な職業のリスト"
* #MD0012820 "化学物質.取り扱い歴" "なし、または主たる取り扱い物質のリスト"
* #MD0012830 "放射線物質.取り扱い歴" "なし、または主たる取り扱い物質のリスト"
* #MD0012840 "騒音環境" "騒音環境"
* #MD0012850 "海外渡航歴" "主な医学衛生学上特記すべき渡航地域のリスト"
* #MD0012860 "常用薬剤歴" "主な常用薬剤名のリスト"
* #MD0012870 "喫煙歴.有無" "過去の喫煙習慣の有無"
* #MD0012880 "現在の喫煙.有無" "現在の喫煙習慣の有無"
* #MD0012890 "喫煙種類区分" "主要な喫煙の種類"
* #MD0012900 "１日の喫煙本数" "1日の喫煙本数（喫煙の種類についての）"
* #MD0012910 "通算喫煙年数" "通算の喫煙年数"
* #MD0012920 "喫煙指数" "BrickmanIndex"
* #MD0012930 "飲酒歴.有無" "過去の飲酒習慣の有無"
* #MD0012940 "現在の飲酒.有無" "現在の飲酒習慣の有無"
* #MD0012950 "飲酒の種類区分" "主な飲酒の種類"
* #MD0012960 "１日の飲酒量" "1日のアルコール換算摂取量（ｍｌ）"
* #MD0012970 "通算飲酒年数" "おおよその通算飲酒年数"
* #MD0012980 "嗜好品" "嗜好品のリスト"
* #MD0012990 "生活習慣" "特記すべき生活習慣のリスト"
* #MD0013000 "性格" "特記すべき性格のリスト"
// 宗教は除外する
// * #MD0013010 "宗教" "宗教のリスト"
* #MD0013020 "趣味" "特記すべき趣味のリスト"
