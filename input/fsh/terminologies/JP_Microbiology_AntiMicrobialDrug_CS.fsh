CodeSystem: JP_Microbiology_AntiMicrobialDrug_CS
Id: jp-microbiology-anti-microbial-drug-cs
Title: "JP Core Microbiology AntiMicrobial Drug CodeSystem"
Description: "微生物学的検査抗菌薬コード(Ver.5.2)  
本コードは厚生労働省院内感染対策サーベイランス事業(https://janis.mhlw.go.jp/)で作成されているマスタを編集・加工して利用している"
* ^identifier[+].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.100495.10.3.100.5.11.5.2"
* ^url = $JP_Microbiology_AntiMicrobialDrug_CS
* ^status = #active
* ^experimental = false
* ^date = "2023-06-26"
* ^caseSensitive = true
* ^content = #complete
* ^hierarchyMeaning = #is-a
* ^copyright = "Copyright FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) 一般社団法人日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG  
厚生労働省院内感染対策サーベイランス事業(https://janis.mhlw.go.jp/)"
* #1100 "モノバクタム系"
  * #1101 "AZT" "アズトレオナム"
  * #1106 "CRMN" "カルモナム"
* #1200 "ペニシリン系"
  * #1201 "PCG" "ベンジルペニシリン"
  * #1202 "PCV" "フェノキシメチルペニシリン"
  * #1206 "DBECPCG" "ベンジルペニシリンベンザチン"
  * #1207 "DMPPC" "メチシリン"
  * #1208 "MPIPC" "オキサシリン"
  * #1211 "PEPC" "フェネチシリンカリウム"
  * #1212 "MCIPC" "クロキサシリン"
  * #1213 "MDIPC" "ジクロキサシリン"
  * #1214 "MFIPC" "フルクロキサシリン"
  * #1216 "ABPC" "アンピシリン"
  * #1217 "IPABPC" "ヘタシリン"
  * #1221 "BAPC" "バカンピシリン"
  * #1222 "MZPC" "メズロシリン"
  * #1226 "TAPC" "塩酸タランピシリン"
  * #1231 "SBTPC" "トシル酸スルタミシリン"
  * #1236 "LAPC" "レナンピシリン"
  * #1241 "ACPC" "シクラシリン"
  * #1246 "AMPC" "アモキシシリン"
  * #1251 "ASPC" "アスポキシシリン"
  * #1252 "CBPC" "カルベニシリン"
  * #1256 "SBPC" "スルベニシリン"
  * #1257 "CIPC" "カリンダシリン"
  * #1258 "CFPC" "カルフェシリン"
  * #1260 "MPC" "メシリナム"
  * #1261 "PMPC" "ピブメシリナム"
  * #1266 "PIPC" "ピペラシリン"
  * #1267 "TIPC" "チカルシリン"
  * #1271 "CVA/AMPC" "クラブラン酸・アモキシシリン"
  * #1276 "CVA/TIPC" "クラブラン酸・チカルシシリン"
  * #1281 "SBT/ABPC" "スルバクタム・アンピシリン"
  * #1282 "TAZ/PIPC" "タゾバクタム・ピペラシリン"
  * #1286 "ABPC+MCIPC" "クロキサシリン・アンピシリン"
  * #1291 "ABPC+MDIPC" "ジクロキサシリン・アンピシリン"
* #1300 "ペネム系"
  * #1301 "FRPM" "ファロペネム"
  * #1306 "RIPM-AC" "リティペネム・アコキシル"
* #1400 "カルバペネム系"
  * #1401 "IPM/CS" "イミペネム・シラスタチン"
  * #1406 "PAPM/BP" "パニペネム・ベタミプロン"
  * #1411 "MEPM" "メロペネム三水和物"
  * #1416 "BIPM" "ビアペネム"
  * #1421 "DRPM" "ドリペネム水和物"
  * #1426 "TBPM-PI" "テビペネム・ピボキシル"
  * #1427 "ETP" "エルタペネム"
* #1450 "カルバセフェム系"
  * #1451 "LCBF" "ロラカルベフ"
* #1500 "セフェム系"
  * #1501 "CED" "セフラジン"
  * #1502 "CEG" "セファログリシン"
  * #1506 "CEX" "セファレキシン"
  * #1511 "CFT" "セファトリジン"
  * #1516 "CXD" "セフロキサジン"
  * #1521 "CCL" "セファクロル"
  * #1526 "CDX" "セファドロキシル"
  * #1531 "CER" "セファロリジン"
  * #1536 "CET" "セファロチン"
  * #1537 "CEZ" "セファゾリン"
  * #1541 "CEPR" "セファピリン"
  * #1542 "CEC" "セファセトリル"
  * #1543 "CTZ" "セフチゾール"
  * #1546 "CTM" "セフォチアム"
  * #1547 "CTM-HE" "セフォチアム・ヘキセチル"
  * #1551 "CXM" "セフロキシム"
  * #1553 "CXM-AX" "セフロキシム・アキセチル"
  * #1556 "CMD" "セファマンドール"
  * #1561 "CFDN" "セフジニル"
  * #1562 "CFPZ" "セフプロジル"
  * #1566 "CEMT-PI" "セフェタメト・ピボキシル"
  * #1571 "CETB" "セフチブテン"
  * #1576 "CDTR-PI" "セフジトレン・ピボキシル"
  * #1581 "CFIX" "セフィキシム"
  * #1586 "CFTM-PI" "セフテラム・ピボキシル"
  * #1591 "CPDX-PR" "セフポドキシム・プロキセチル"
  * #1596 "CFPN-PI" "セフカペン・ピボキシル"
  * #1601 "CMZ" "セフメタゾール"
  * #1606 "CFX" "セフォキシチン"
  * #1611 "CTT" "セフォテタン"
  * #1616 "CMNX" "セフミノクス"
  * #1621 "CBPZ" "セフブペラゾン"
  * #1626 "CPM" "セフピラミド"
  * #1631 "CFS" "セフスロジン"
  * #1636 "CTX" "セフォタキシム"
  * #1641 "CPZ" "セフォペラゾン"
  * #1646 "CMX" "セフメノキシム"
  * #1651 "CZX" "セフチゾキシム"
  * #1656 "CTRX" "セフトリアキソン"
  * #1657 "CPIZ" "セフピミゾール"
  * #1658 "CZON" "セフゾナム"
  * #1661 "CAZ" "セフタジジム"
  * #1666 "CDZM" "セフォジジム"
  * #1671 "CPR" "セフピロム"
  * #1676 "CZOP" "セフォゾプラン"
  * #1681 "CFPM" "セフェピム"
  * #1682 "CFCL" "セフクリジン"
  * #1686 "CFSL" "セフォセリス"
  * #1691 "SBT/CPZ" "スルバクタム・セフォペラゾン"
  * #1692 "TAZ/CTLZ" "タゾバクタム・セフトロザン"
  * #1696 "LMOX" "ラタモキセフ"
  * #1701 "FMOX" "フロモキセフ"
  * #1706 "セフマチレン" "セフマチレン"
* #1800 "アミノグリコシド系"
  * #1801 "KM" "カナマイシン"
  * #1806 "FRM" "フラジオマイシン"
  * #1811 "SM" "ストレプトマイシン"
  * #1816 "AMK" "アミカシン"
  * #1821 "GM" "ゲンタマイシン"
  * #1826 "AKM" "ベカナマイシン"
  * #1827 "LVDM" "リビドマイシン"
  * #1828 "PRM" "パロモマイシン"
  * #1831 "RSM" "リボスタマイシン"
  * #1836 "DKB" "ジベカシン"
  * #1841 "TOB" "トブラマイシン"
  * #1846 "SISO" "シソマイシン"
  * #1851 "MCR" "ミクロノマイシン"
  * #1856 "ASTM" "アストロマイシン"
  * #1861 "NTL" "ネチルマイシン"
  * #1866 "ISP" "イセパマイシン"
  * #1871 "ABK" "アルベカシン"
  * #1876 "SPCM" "スペクチノマイシン"
  * #1881 "フラジオマイシン・トリプシン" "フラジオマイシン・トリプシン"
  * #1886 "フラジオマイシン・プレドニゾロン" "フラジオマイシン・プレドニゾロン"
* #1900 "マクロライド系"
  * #1901 "EM" "エリスロマイシン"
  * #1902 "OL" "オレアンドマイシン"
  * #1906 "RXM" "ロキシスロマイシン"
  * #1911 "CAM" "クラリスロマイシン"
  * #1916 "LM" "キタサマイシン"
  * #1921 "JM" "ジョサマイシン"
  * #1926 "AC-SPM" "アセチルスピラマイシン"
  * #1931 "MDM" "ミデカマイシン"
  * #1936 "RKM" "ロキタマイシン"
  * #1941 "AZM" "アジスロマイシン"
* #1950 "ケトライド系"
  * #1951 "TEL" "テリスロマイシン"
* #2000 "リンコマイシン系"
  * #2001 "LCM" "リンコマイシン"
  * #2006 "CLDM" "クリンダマイシン"
* #2100 "テトラサイクリン系/グリシルサイクリン系"
  * #2101 "TC" "テトラサクリン"
  * #2106 "OTC" "オキシテトラサイクリン"
  * #2107 "MTC" "メタサイクリン"
  * #2111 "DMCTC" "デメチルクロルテトラサイクリン"
  * #2116 "DOXY" "ドキシサイクリン"
  * #2121 "MINO" "ミノサイクリン"
  * #2131 "TGC" "チゲサイクリン"
* #2200 "クロラムフェニコール系"
  * #2201 "CP" "クロラムフェニコール"
  * #2203 "クロラムフェニコール、フラジオマイシン配合" "クロラムフェニコール、フラジオマイシン配合"
  * #2206 "TP" "チアンフェニコール"
* #2300 "グリコペプチド系/ペプチド系/リポペプチド系"
  * #2301 "VCM" "バンコマイシン"
  * #2306 "TEIC" "テイコプラニン"
  * #2311 "CL" "コリスチン"
  * #2316 "PL-B" "ポリミキシンB"
  * #2321 "BC" "バシトラシン、フラジオマイシン配合"
  * #2331 "DAP" "ダプトマイシン"
* #2400 "キノロン系"
  * #2401 "NA" "ナリジクス酸"
  * #2406 "PA" "ピロミド酸"
  * #2411 "PPA" "ピペミド酸三水和物"
  * #2412 "MLX" "ミロキサシン"
  * #2416 "CINX" "シノキサシン"
* #2500 "フルオロキノロン系"
  * #2501 "NFLX" "ノルフロキサシン"
  * #2506 "ENX" "エノキサシン"
  * #2511 "OFLX" "オフロキサシン"
  * #2516 "LVFX" "レボフロキサシン"
  * #2517 "NDFX" "ナジフロキサシン"
  * #2518 "TMFX" "テマフロキサシン"
  * #2521 "CPFX" "シプロフロキサシン"
  * #2526 "LFLX" "ロメフロキサシン"
  * #2531 "TFLX" "トシル酸トスフロキサシン"
  * #2536 "FLRX" "フレロキサシン"
  * #2541 "SPFX" "スパルフロキサシン"
  * #2551 "GPFX" "グレパフロキサシン"
  * #2556 "PUFX" "プルリフロキサシン"
  * #2561 "GFLX" "ガチフロキサシン"
  * #2566 "STFX" "シタフロキサシン"
  * #2571 "BLFX" "バロフロキサシン"
  * #2576 "PZFX" "パズフロキサシン"
  * #2577 "エンロフロキサシン" "エンロフロキサシン"
  * #2578 "MFLX" "モキシフロキサシン"
  * #2579 "GRNX" "ガレノキサシン"
* #2600 "その他の抗菌薬"
  * #2601 "FOM" "ホスホマイシン"
  * #2602 "CMRM" "クーママイシン"
  * #2603 "EDC" "エンラマイシン"
  * #2604 "KSM" "カスガマイシン"
  * #2607 "MKM" "ミカマイシン"
  * #2608 "FA" "フシジン酸"
  * #2609 "NB" "ノボビオシン"
  * #2611 "MUP" "ムピロシン"
  * #2612 "RCT" "リストセチン"
  * #2613 "NF" "ニトロフラゾン"
  * #2616 "LZD" "リネゾリド"
  * #2621 "QPR/DPR" "キヌプリスチン・ダルホプリスチン"
  * #2626 "ヘキサミン" "ヘキサミン"
* #2700 "サルファ薬"
  * #2701 "メチゾール" "スルファメチゾール"
  * #2706 "メトキサゾール" "スルファメトキサゾール"
  * #2711 "モノメトキシン" "スルファモノメトキシン"
  * #2716 "ジメトキシン" "スルファジメトキシン"
  * #2721 "サラゾピリン" "サラゾスルファピリジン"
  * #2726 "ST" "ST合剤"
* #2800 "抗結核薬"
  * #2801 "INH" "イソニアジド"
  * #2806 "IHMS" "イソニアジドメタンスルホン酸"
  * #2811 "PAS" "パラアミノサリチル酸カルシウム・アルミノパラアミノサリチル酸カルシウム"
  * #2816 "PZA" "ピラジナミド"
  * #2821 "EB" "エタンブトール"
  * #2826 "RFP" "リファンピシン"
  * #2828 "RBT" "リファブチン"
  * #2831 "ETH" "エチオナミド"
  * #2836 "CS" "サイクロセリン"
  * #2841 "EVM" "エンビオマイシン"
  * #2846 "PTH" "プロチオナミド"
* #2900 "抗真菌薬"
  * #2901 "AMPH-B" "アムホテリシンB"
  * #2906 "5-FC" "フルシトシン"
  * #2911 "MCZ" "ミコナゾール"
  * #2916 "FLCZ" "フルコナゾール"
  * #2917 "F-FLCZ" "ホスフルコナゾール"
  * #2921 "ITCZ" "イトラコナゾール"
  * #2926 "GRF" "グリセオフルビン"
  * #2931 "NYS" "ナイスタチン"
  * #2936 "テルビナフィン" "テルビナフィン"
  * #2941 "TRM" "トリコマイシン"
  * #2946 "PMR" "ピマリシン"
  * #2951 "クロトリマゾール" "クロトリマゾール"
  * #2956 "エコナゾール" "エコナゾール"
  * #2961 "イソコナゾール" "イソコナゾール"
  * #2966 "スルコナゾール" "スルコナゾール"
  * #2971 "オキシコナゾール" "オキシコナゾール"
  * #2976 "CCZ" "クロコナゾール"
  * #2981 "ビホナゾール" "ビホナゾール"
  * #2986 "KCZ" "ケトコナゾール"
  * #2991 "ネチコナゾール" "ネチコナゾール"
  * #2996 "ラノコナゾール" "ラノコナゾール"
  * #3001 "トルナフタート" "トルナフタート"
  * #3006 "フェニルヨード" "フェニルヨード"
  * #3011 "シッカニン" "シッカニン"
  * #3016 "シクロピロクス" "シクロピロクスオラミン"
  * #3021 "トルシクラート" "トルシクラート"
  * #3026 "ブテナフィン" "ブテナフィン"
  * #3031 "アモロルフィン" "アモロルフィン"
  * #3036 "リラナフタート" "リラナフタート"
  * #3041 "MCFG" "ミカファンギン"
  * #3042 "CPFG" "カスポファンギン"
  * #3046 "VRCZ" "ボリコナゾール"
  * #3051 "ルリコナゾール" "ルリコナゾール"
* #3100 "抗寄生虫薬"
  * #3101 "サントニン" "サントニン"
  * #3106 "カルバマジン" "クエン酸ジエチルカルバマジン"
  * #3111 "ピランテル" "パモ酸ピランテル"
  * #3116 "チアベンダゾール" "チアベンダゾール"
  * #3121 "メベンダゾール" "メベンダゾール"
  * #3126 "プラジカンテル" "プラジカンテル"
  * #3131 "アルベンダゾール" "アルベンダゾール"
  * #3136 "キニーネ" "キニーネ"
  * #3141 "スルファドキシン" "スルファドキシン・ピリメタミン配合"
  * #3146 "メトロニダゾール" "メトロニダゾール"
  * #3151 "チニダゾール" "チニダゾール"
  * #3156 "ペンタミジン" "イセチオン酸ペンタミジン"
  * #3161 "アンチモンナトリウム" "酒石酸アンチモンナトリウム"
  * #3166 "イベルメクチン" "イベルメクチン"
  * #3171 "メフロキン" "塩酸メフロキン"
