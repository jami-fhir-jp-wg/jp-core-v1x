CodeSystem: JP_ObservationSocialHistoryCode_CS
Id: jp-observation-socialhistory-code-cs
Title: "JP Core Observation SocialHistory Code"
Description: "Observation（生活背景）で使用する項目コード"
* ^url = $JP_ObservationSocialHistoryCode_CS
* ^status = #draft
* ^caseSensitive = true
* ^valueSet = $JP_ObservationSocialHistoryCode_VS
* ^content = #complete

//電子保存された診療録情報の交換のためのデータ項目セットより参照
//https://www2.medis.or.jp/master/jmix/file/tab1.pdf
* #MD0012870 "喫煙歴.有無"
* #MD0012880 "現在の喫煙.有無"
* #MD0012890 "喫煙種類区分"
* #MD0012900 "１日の喫煙本数"
* #MD0012910 "通算喫煙年数"
* #MD0012920 "喫煙指数"
* #MD0012930 "飲酒歴.有無"
* #MD0012940 "現在の飲酒.有無"
* #MD0012950 "飲酒の種類区分"
* #MD0012960 "１日の飲酒量"
* #MD0012970 "通算飲酒年数"
* #MD0012980 "嗜好品"
* #MD0012990 "生活習慣"
* #MD0013000 "性格"
* #MD0013020 "趣味"
