Instance:  jp-composition-progressnote-example-1
InstanceOf: JP_Composition_ProgressNote
Title: "JP Core Composition ProgressNote Example 経過記録"
Description: "経過記録の例"
Usage: #example
* meta.lastUpdated = "2024-08-19T11:07:20+09:00"
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Composition_ProgressNote"
* extension.url = "http://hl7.org/fhir/StructureDefinition/composition-clinicaldocument-versionNumber"
* extension.valueString = "2"
* identifier.system = "http://myhospital.com/fhir/System/composition/1311234567"
* identifier.value = "00000040.20240819.110720.Z999.1.20.000.-3"
* status = #final
* type = $Loinc_CS#11506-3 "Progress note"
* category = $Loinc_CS#11506-3 "Progress note"
* subject = Reference(Patient/00000040)
* date = "2024-08-19T11:00:02+09:00"
* author = Reference(Practitioner/1234567)
* title = "経過記録"
* custodian = Reference(Organization/1311234567) "ＭＹ病院"
* relatesTo.code = #replaces
* relatesTo.targetReference = Reference(Composition/00000040.20240819.110002.Z999.1.20.000.-3)
* section[0].title = "Problems Section"
* section[=].code = $Loinc_CS#11450-4 "Problems Section"
* section[=].entry[0] = Reference(Condition/00000040.-3.0) "D#0　全体に関係 (医師)"
* section[=].entry[+] = Reference(Condition/00000040.3.0) "D#1　ＲＳウイルス肺炎"
* section[+].title = "Subjective Section"
* section[=].code = $Loinc_CS#61150-9 "Subjective Section"
* section[=].section.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section.extension.valueDateTime = "2024-08-19T11:00:01+09:00"
* section[=].section.text.status = #additional
* section[=].section.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>１週間ほど前から39℃の高熱とゼイゼイというしつこい咳が続いている。</p></div>"
* section[+].title = "Objective Section"
* section[=].code = $Loinc_CS#61149-1 "Objective Section"
* section[=].section[0].extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section[=].extension[=].valueDateTime = "2024-08-19T11:00:02+09:00"
* section[=].section[=].extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_ThumbnailImage"
* section[=].section[=].extension[=].valueAttachment.contentType = #image/jpeg
* section[=].section[=].extension[=].valueAttachment.data = "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"
* section[=].section[=].entry = Reference(DocumentReference/00000040.20240819.110720.Z999.1.20.000.-3.O00.0)
* section[=].section[+].extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section[=].extension.valueDateTime = "2024-08-19T11:07:20+09:00"
* section[=].section[=].author = Reference(Practitioner/1000231)
* section[=].section[=].text.status = #additional
* section[=].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>下肺野の過膨張や肺炎の影が見られ、ウイルス性の肺炎と思われる。</p><p/></div>"
* section[=].section[+].extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section[=].extension.valueDateTime = "2024-08-19T11:00:02+09:00"
* section[=].section[=].text.status = #additional
* section[=].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>【検体検査結果】</p><p>生化学Ａ,糖・有機酸,尿定量（新尿）,尿一般,血液一般 採取日時：2024-08-19 </p><p>総蛋白                         4.7</p><p>TP(その他)                     0.5</p><p><b>ALB                     H 41</b></p><p>C3                             </p><p/></div>"
* section[+].title = "Assessment Section"
* section[=].code = $Loinc_CS#51848-0 "Assessment Section"
* section[=].section[0].extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section[=].extension.valueDateTime = "2024-08-19T11:00:02+09:00"
* section[=].section[=].text.status = #additional
* section[=].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>【ﾌﾟﾛﾌﾞﾚﾑ登録】</p><p>D#1 ＲＳウイルス肺炎 開始日:2024-08-19</p></div>"
* section[=].section[+].extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section[=].extension.valueDateTime = "2024-08-19T11:00:02+09:00"
* section[=].section[=].text.status = #additional
* section[=].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>【病名登録】</p><p>ＲＳウイルス肺炎 </p><p>開始日:2024-08-19</p></div>"
* section[=].section[+].extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section[=].extension.valueDateTime = "2024-08-19T11:00:02+09:00"
* section[=].section[=].text.status = #additional
* section[=].section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>https://www.mhlw.go.jp/bunya/kenkou/kekkaku-kansenshou19/rs_qa.html</p></div>"
* section[+].title = "Plan of Treatment Section"
* section[=].code = $Loinc_CS#18776-5 "Plan of Treatment Section"
* section[=].section.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section.extension.valueDateTime = "2024-08-19T11:00:02+09:00"
* section[=].section.text.status = #additional
* section[=].section.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>【放射線】</p><p>胸部(立位 P-A)</p><p>検査日時 : 2024-08-19 </p><p>【共通補足情報】</p><p>  MRSA:-</p><p>  MDRP:-</p><p>  CRE:-</p><p>  TB:-</p><p>  MAC:-</p><p>  CJD:+</p><p>  薬アレルギー：あり</p><p>【MRI注意事項】</p><p>【造影剤注意事項】</p><p>  気管支喘息:なし</p><p>  腎機能障害:なし</p><p>【血管造影注意事項】</p><p>【コメント】</p><p>【検査同意書】</p><p>【保険】</p><p>  組合</p></div>"
* section[+].title = "Additional documentation"
* section[=].code = $Loinc_CS#77599-9 "Additional documentation"
* section[=].section.extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_DataEnterDateTime"
* section[=].section.extension[=].valueDateTime = "2024-08-19T11:00:02+09:00"
* section[=].section.extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Composition_ThumbnailImage"
* section[=].section.extension[=].valueAttachment.contentType = #image/png
* section[=].section.extension[=].valueAttachment.data = "iVBORw0KGgoAAAANSUhEUgAAAEYAAABACAIAAAAoFZbOAAADQUlEQVR4Xu2YzWsTQRTA96hoiojF0lZLKIi2ph5E2RRLDxUkF3vwooJ4ET0WehA/EAtSkFzqQQ/iQSiEetFDvAg95Fgo5Cpp/oA2t56S3dkg9W22nU7efGyyncaduD9KmH3vzZv5dbJTqLXXd1g4YD6JkgkkSiaQKJlAomQCiZKEP7u7Xm7WG7A6/yGTY82PK7iRDvQogQ/JXm2s/6p3yM62s/SCjKZgIvw6cLujoUlpwHK+f8P7DqOxuUFGUmT6ml4rbUp4v51xHFb/WKl+DFa9UHJX3vtXwtDJ+lYF51r4VqOp5vJb3DcSvVAiU2lnbRVq3JeLOHdA4+tnuANx30j0QsmbuACf5MYV8ugezlF2tqEJ7hsJPV3USuS27XzI+7fi2irOMZik5Hz55J0/QcYHcaIdk5TgVlBfDwEmKcGtQB7Mk2yG3J3DOQaTlMjYWXiLnNK6N3yKXBqC28IbPg1TyJzt/PxBy8xQcpffwL79Fyk3Q9LnfI3LI/tfv62Kf26ZNC2OuxL8eSUXz/gmNyfI9BR89+DSg4NyF576hiCTzcDbRWav0ymxVvLfnNwMnIP77rV/0aFbAeLwdj15CNpsONZK8Oi+WoQ/rDCAG5xNKYi1EpyS/9qMD6JzUBNrpWgkSlL0dBEqTbbI5/PB2LbtYrHIBhFmKNVqNfgMxtVqFayCRyFmKIEGVQo+A+C4cLUpSnAshUIhGJfL5X44JXYMPqVSyWylbomdUmNzA++xG2B6zJTuz7t3bjUqv/FOOwMmwnTv2WPcNxJ6lIDm8wWP+8d35z8wHXeMijal+PD/KVnWYYHVDlN1WIBDB6BU8KioPwqqpvySNCJL8fEAoRIfV8BWqmdJc8JVhUH0KEwJg10hW5pHlbZaoAgaoLEwQvsEAwRbqYBWhk5RpVEXvindE7sMjfBB2SMNUmRBdixDmmNahbTYEykhUDC0JhjzERQUEpaW/MJQX1TGZPYjfIGwDI35CAoKkabZpooF+Edhii/gd6au6amS0AEh3JBiomJFYX8WaZqXES6AxvwjCsomWu0I4zRCs0LC0pLuigX4CA3yKTbCZ6Ohp4sW+lBJF4mSCSRKJpAomUCiZAJ9qPQXinCwcLZ+TDUAAAAASUVORK5CYII="
* section[=].section.text.status = #additional
* section[=].section.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>D:\\紹介状.pdf</p></div>"
* section[=].section.entry = Reference(DocumentReference/00000040.20240819.110720.Z999.1.20.000.-3.F00.0)