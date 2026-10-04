本プロファイルは、[ServiceRequestリソース][JP_ServiceRequest_Common]のうち、処方オーダおよび注射オーダの**ヘッダー情報**（オーダ単位の依頼情報）を表現するための定義である。ここでは、ServiceRequestリソースに対して本プロファイルに準拠する場合に必須となる要素や、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

* オーダリングシステムで医師等が発行した処方オーダ・注射オーダを、薬剤部門システムなどへ送信する際に、オーダ単位の情報（オーダ番号、オーダ種別、処方区分／注射区分など）を表現する
* 処方オーダ・注射オーダの一覧を、オーダ種別や処方区分／注射区分によって検索・表示する

## スコープ

本プロファイルは[JP_ServiceRequest_Common][JP_ServiceRequest_Common]プロファイルから派生したもので、処方オーダおよび注射オーダのヘッダー情報を表現する。

オーダリングシステムで医師等が発行する処方オーダ・注射オーダは、一般に次の2階層で構成される。

* オーダ単位のヘッダー情報（オーダ番号、オーダ種別、処方区分／注射区分、依頼者、依頼日時、対象患者など）
* 個々の薬剤の処方・注射指示（薬剤、用法、用量、投与期間など）

本プロファイルは前者を表現する。後者は[JP_MedicationRequest][JP_MedicationRequest]（内服・外用）または[JP_MedicationRequest_Injection][JP_MedicationRequest_Injection]（注射）で表現する。

ServiceRequestはオーダ種別（処方、注射、検体検査、放射線検査など）ごとに派生プロファイルを定義する方針である。本プロファイルは処方オーダと注射オーダを対象とし、`category`でどちらのオーダかを区別する。

## 関連するリソースとの関係性

本プロファイルでは、配下の[JP_MedicationRequest][JP_MedicationRequest]および[JP_MedicationRequest_Injection][JP_MedicationRequest_Injection]との関連を要素の制約として定義しない。関連付けの方法は、注意事項の「配下のMedicationRequestとの関連付け」を参照のこと。

## プロファイル定義

{% include markdown-link-references.md %}
