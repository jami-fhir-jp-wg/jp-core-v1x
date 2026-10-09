// ==============================
//   Profile 定義
// ==============================
Profile: JP_ServiceRequest_Order_Laboratory_Item
Parent: JP_ServiceRequest_Common
Id: jp-servicerequest-order-laboratory-item
Title: "JP Core ServiceRequest Order Laboratory Item Profile"
Description: "このプロファイルはServiceRequestリソースに対して、検体検査の依頼に含まれる個別の検査項目を表現するための制約を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_Order_Laboratory_Item"
* ^status = #active
* ^date = "2026-09-23"
* . ^short = "検体検査の個別検査項目【詳細参照】"
* . ^definition = "検体検査の依頼に含まれる、個々の検査項目のサービスリクエスト。"
* . ^comment = "【JP Core仕様】このプロファイルは検体検査を対象とする。
検査項目の粒度は、結果として返される Observation（JP_Observation_LabResult）と同じ JLAC の検査項目単位とする。複数の検査項目をまとめた依頼単位（セットオーダ、パネルオーダ）は JP_ServiceRequest_OrderRequesting プロファイル（追加予定）で表現する。
JP Core では、依頼単位と個別検査項目との関係付けの方法を規定しない。関係付けが必要な場合は、本プロファイルを継承する個別仕様（ユースケースごとの実装ガイド）で定義する。"
//
* id ^short = "論理ID"
* meta ^short = "リソースに関するメタデータ"
* meta.id ^short = "要素間参照のための一意なID"
* meta.extension ^short = "実装によって定義される追加コンテンツ"
* meta.versionId ^short = "バージョン固有の識別子"
* meta.lastUpdated ^short = "リソースのバージョンが最後に変更された日時"
* meta.source ^short = "リソースの出所"
* meta.profile ^short = "準拠を宣言するプロファイル"
* meta.security ^short = "リソースに適用されるセキュリティラベル"
* meta.tag ^short = "リソースに適用されるタグ"
* implicitRules ^short = "このコンテンツが作成されたルールのセット"
* language ^short = "リソースコンテンツの言語"
* text ^short = "このリソースを人間が解釈するためのテキスト要約"
* contained ^short = "インラインリソース"
* extension ^short = "実装によって定義される追加コンテンツ"
* modifierExtension ^short = "無視できない拡張"
//
* identifier 1..
* identifier ^short = "個別検査項目の業務ID【詳細参照】"
* identifier ^definition = "個別検査項目に割り当てられた識別子。"
* identifier ^comment = "【JP Core仕様】このプロファイルでは必須とする。
依頼オーダ番号だけでは検査項目を一意に識別できないため、依頼オーダ番号に検査項目を識別する情報（HL7 v2 の OBR-4「検査項目ID」、OBX-3「検査項目」に相当）を組み合わせた識別子を設定する。組み立て方は JP_Observation_LabResult の identifier の生成規則を参考にすること。"
//
* basedOn ^short = "このリクエストの元になるリクエストへの参照【詳細参照】"
* basedOn ^comment = "【JP Core仕様】JP Core では、個別検査項目と依頼単位（追加予定の JP_ServiceRequest_OrderRequesting）との関係付けに basedOn を使用するか否かを規定しない。
参考（informative）：個別仕様で関係付ける場合、子（本プロファイル）の basedOn から親（依頼単位）を参照する片方向の参照が FHIR での一般的な表現である。"
//
* requisition ^short = "サービスリクエストの複合ID（別名 グループID）【詳細参照】"
* requisition ^comment = "【JP Core仕様】JP Core では、個別検査項目と依頼単位との関係付けに requisition を使用するか否かを規定しない。関係付けの方法は、本プロファイルを継承する個別仕様で定義する。"
//
* status ^short = "オーダの状態【詳細参照】"
* status ^comment = "【JP Core仕様】依頼が確定し検査を実施すべき状態では active を設定する。依頼が取り消された場合は revoked、検査が完了した場合は completed を設定する。
(draft | active | on-hold | revoked | completed | entered-in-error | unknown)"
//
* intent = #order
* intent ^short = "サービスリクエストの意図（order 固定）【詳細参照】"
* intent ^comment = "【JP Core仕様】このプロファイルでは order に固定する。
intent はオーダの種類を表す要素であり、依頼単位と個別検査項目の親子を区別するためには使用しない。"
//
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^short = "検査の区分【詳細参照】"
* category ^comment = "【JP Core仕様】このプロファイルでは必須とする。
検体検査の依頼であることを判別できるよう、laboratory スライスを必ず設定する。施設固有の区分などを追加で設定してもよい。"
* category contains laboratory 1..1
* category[laboratory] = $JP_SimpleObservationCategory_CS#laboratory
* category[laboratory] ^short = "検体検査を示す区分（laboratory 固定）【詳細参照】"
* category[laboratory] ^definition = "検体検査の依頼であることを示す区分。"
* category[laboratory] ^comment = "【JP Core仕様】結果として返される Observation（JP_Observation_LabResult）の category と同じコード表（JP Core Simple Observation Category CodeSystem）を使用し、laboratory に固定する。"
//
* priority ^short = "緊急度（routine | urgent | asap | stat）【詳細参照】"
* priority ^comment = "【JP Core仕様】値セット（RequestPriority）は required であり、値は変更できない。日本の運用との対応は次を目安とする。
・routine：通常
・urgent：至急
・stat：緊急（最優先で実施する）
・asap：urgent より優先し、stat ほどではない依頼。日本の運用で該当する区分がない場合は使用しなくてよい。
省略した場合は routine とみなす。"
//
* code 1..
* code from $JP_ObservationLabResultCode_VS (preferred)
* code ^binding.description = "MEDIS 臨床検査マスター"
* code ^short = "検査項目のコード【詳細参照】"
* code ^definition = "依頼された個別の検査項目を識別するコード。"
* code ^comment = "【JP Core仕様】このプロファイルでは必須とする。
標準コードとして JLAC10（または JLAC11）を使用する。結果として返される Observation（JP_Observation_LabResult）の code と同じコード体系を使用すると、依頼と結果の突合が容易になる。"
* code.id ^short = "要素間参照のための一意なID"
* code.extension ^short = "実装によって定義される追加コンテンツ"
* code.coding 1..
* code.coding ^short = "検査項目のコード（標準コード、ローカルコード）【詳細参照】"
* code.coding ^comment = "【JP Core仕様】このプロファイルでは必須とする。標準コードとローカルコードの両方を設定できる。いずれか一方は設定すること。JLAC10 と JLAC11 など複数の標準コードを設定できるよう、上限は設けない。"
* code.text 1..
* code.text ^short = "検査項目の名称"
* code.text ^definition = "検査項目の表示名。オーダ票や報告書に記載する名称。"
* code.text ^comment = "【JP Core仕様】このプロファイルでは必須とする。
標準コードとローカルコードで coding.display が異なる場合があるため、共通の表示名として設定する。"
//
* subject 1..
* subject only Reference(JP_Patient)
* subject ^short = "検査の対象患者【詳細参照】"
* subject ^definition = "オーダの対象となる患者。"
* subject ^comment = "【JP Core仕様】このプロファイルでは、Patient に限定し、必須とする。"
//
* encounter ^comment = "【JP Core仕様】入院・外来の区別、所在場所、担当診療科の情報に使用する。
通常は設定されるが、ユースケースにより使用しない場合を考慮し、必須としない。"
//
* occurrence[x] ^short = "検体採取の予定日時【詳細参照】"
* occurrence[x] ^definition = "依頼された検査を実施すべき日時または期間。"
* occurrence[x] ^comment = "【JP Core仕様】検体採取の予定日時を設定する。予定日が決まっていない場合は設定せず、決まった時点で更新する。"
//
* requester ^short = "依頼者【詳細参照】"
* requester ^definition = "オーダを発行した依頼者（オーダ発行者）。"
* requester ^comment = "【JP Core仕様】依頼単位を分解して個別検査項目として送信する場合は、依頼単位と同じ依頼者を設定する。"
//
* performerType ^short = "実施部門・職種【詳細参照】"
* performerType ^comment = "【JP Core仕様】検査を実施する部門（検体検査部門、外注検査など）や職種を設定する。"
//
* specimen ^short = "検体【詳細参照】"
* specimen ^comment = "【JP Core仕様】採取済みの検体に対して依頼する場合に、その検体（JP_Specimen_Common）を参照する。
依頼時点で検体が未採取の場合は設定せず、Specimen リソース側から ServiceRequest を参照する。"
//
* bodySite ^comment = "【JP Core仕様】検体検査では、JLAC10 の材料コードなど code に検体や部位が含まれることが多いため、通常は使用しない。code から部位が分からない場合にのみ使用する。"
//
* reasonCode ^short = "検査目的、依頼病名【詳細参照】"
* reasonCode ^definition = "検査を依頼する理由。検査目的や依頼病名をコードまたはテキストで表現する。"
* reasonCode ^comment = "【JP Core仕様】検査目的は自由記載が多いため、text に設定する。依頼病名は、コード化されている場合は coding に、コード化されていない場合は text に設定する。
病名を Condition リソースとして参照できる場合は reasonReference を使用する。同じ理由を reasonCode と reasonReference の両方に重複して設定しないこと。"
//
* reasonReference ^short = "依頼病名などへの参照【詳細参照】"
* reasonReference ^definition = "検査を依頼する理由となるリソースへの参照。"
* reasonReference ^comment = "【JP Core仕様】依頼病名を Condition リソース（JP_Condition）として参照できる場合に使用する。"
//
* supportingInfo ^comment = "【JP Core仕様】検査の実施や結果の解釈に必要な患者情報（身長、体重、採取時の状態など）を、Observation などのリソースへの参照として設定する。"
//
* note ^short = "依頼コメント【詳細参照】"
* note ^comment = "【JP Core仕様】検査部門への連絡事項など、他の要素で表現できない依頼コメントをテキストで設定する。"
