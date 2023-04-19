CodeSystem: JP_SimpleObservationCategory_CS
Id: jp-simpleobservationcategory-cs
Title: "JP Core Simple Observation Category CodeSystem"
Description: "JP Coreにて定義したObservationリソースに関する分類コード"
* ^url = $JP_SimpleObservationCategory_CS
* ^status = #active
* ^experimental = false
* ^date = "2023-04-18"
* ^caseSensitive = true
* ^content = #complete
* #sdoh "SDOH" "健康の社会的決定要因 (Social Determinant of Health)"
* #functional-status "Functional Status" "機能ステータス"
* #disability-status "Disability Status" "障害区分"
* #cognitive-status "Cognitive Status" "認知ステータスのカテゴリ"
* #social-history "Social History" "社会歴観察では、患者の職業、個人（ライフスタイルなど）、社会歴、家族歴、環境歴、および患者の健康に影響を与える可能性のある健康リスク要因を定義します。"
* #vital-signs "Vital Signs" "身体の基本機能のうち、呼吸機能、不整脈、血圧、体表面皮膚温、睡眠、意識障害、体温、脈拍数など。"
* #body-measurement "Body Measurement" "身体の基本機能のうち、体重、身長、胸囲、腹囲、嚥下、握力など。"
* #imaging "Imaging" "イメージングによって生成された観測。 範囲には、単純X線、超音波、CT、MRI、血管造影、心エコー検査、および核医学に関する観察が含まれます。"
* #laboratory "Laboratory" "研究所によって生成された観察結果。 検査結果は通常、化学、血液学、血清学、組織学、細胞学、解剖病理学 (デジタル病理学を含む)、微生物学、および/またはウイルス学などの分野で分析サービスを提供する検査室によって生成されます。 これらの観察結果は、患者から採取され、検査室に提出された検体の分析に基づいています。"
* #procedure "Procedure" "他の手順によって生成された観察。 このカテゴリには、実験室および画像検査 (心臓カテーテル法、内視鏡検査、電気診断など) を除く、介入および非介入手順から生じる観察結果が含まれます。 通常、検査結果は臨床医によって生成され、検査中に行われたコンポーネントの観察に関するより詳細な情報を提供します。 例としては、消化器内科医が大腸内視鏡検査中に観察されたポリープのサイズを報告する場合があります。 "
* #survey "Survey" "評価ツール/調査機器の観察 (例: Apgar Scores、Montreal Cognitive Assessment (MoCA))。"
* #exam "Exam" "臨床医による直接観察、単純な器具の使用、患者の体に直接行われた単純な操作の結果など、身体検査の結果によって生成された観察。"
* #therapy "Therapy" "非介入治療プロトコル（例：職業療法、物理療法、放射線療法、栄養療法、投薬療法）によって生成された観察"
* #activity "Activity" "体力と全体的な健康状態を向上または維持する身体活動を測定または記録する観察。 理学療法士などの施術者の直接の監督下にないこと。 (例: 水泳ラップ、歩数、睡眠データ) "
