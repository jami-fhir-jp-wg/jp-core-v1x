CodeSystem: JP_MedicalLicenseCertificate_CS
Id: jp-medicallicensecertificate-cs
Title: "JP Core MedicalLicenseCertificate CodeSystem"
Description: "医療関連免許証明に関するコードシステム。（現在作成中、今後医療系免許に関する情報追加する予定です。）"
* ^url = $JP_MedicalLicenseCertificate_CS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* ^caseSensitive = true
* ^valueSet = $JP_MedicalLicenseCertificate_VS
* ^content = #complete
// TODO: 医療関連資格の追加
* #narcotics-practitioner "麻薬施用者番号"
    "各都道府県にて管理される麻薬施用に関する免許番号"
* #medical-registration "医籍登録番号"
    "厚労省が発行する医師免許に割り振られる登録番号"