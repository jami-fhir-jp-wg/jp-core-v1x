// ==============================
//   Extension 定義
// ==============================
Extension: JP_Department
Id: jp-department
Title: "JP Core Department Extension"
Description: "診療科情報を格納するための汎用的な拡張。様々なリソースで診療科情報を表現する際に使用できる。診療科コード（CodeableConcept）または診療科組織への参照（Reference）のいずれかを指定する。"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Department"
* ^status = #active
* ^date = "2025-10-28"
* ^context[0].type = #element
* ^context[=].expression = "Resource"
* . ^short = "診療科情報"
* . ^definition = "そのリソースに関連する診療科を表す拡張。診療科コード（valueCodeableConcept）または診療科組織への参照（valueReference）のいずれかを使用できる。"
* . ^comment = """診療科情報は以下の2つの方法で表現できる：
1. valueCodeableConcept: SS-MIX2診療科コードなどのコード化された診療科情報
2. valueReference: JP_Organization_Departmentプロファイルを使用した診療科組織への参照

用途に応じて適切な表現方法を選択すること。診療科名称の統一が困難な場合は、CodeableConceptのtext要素を使用してテキストベースで診療科名を記録することも可能。"""

* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Department" (exactly)
* value[x] only CodeableConcept or Reference(JP_Organization_Department)
* valueCodeableConcept from $JP_Department_SsMix_VS (preferred)
* valueCodeableConcept ^short = "診療科コード"
* valueCodeableConcept ^definition = "SS-MIX2診療科コード等を使用した診療科のコード表現"
* valueCodeableConcept ^comment = "診療科コードが利用可能な場合に使用する。SS-MIX2診療科コード（2桁または3桁）の使用を推奨するが、他のコードシステムも使用可能。診療科名称のみの場合はtext要素に設定する。"
* valueReference only Reference(JP_Organization_Department)
* valueReference ^short = "診療科組織への参照"
* valueReference ^definition = "診療科を表すJP_Organization_Departmentプロファイルへの参照"
* valueReference ^comment = "診療科をOrganizationリソースとして管理している場合に使用する。診療科の詳細情報（所属医療機関、連絡先等）を含める場合に適している。"
