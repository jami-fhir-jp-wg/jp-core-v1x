Profile:        JP_DocumentReference
Parent:			DocumentReference
Id:             JP-DocumentReference
Description:    "JP_DocumentReference　暫定プロファイル"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DocumentReference"
* ^date = "2025-05-25"

* meta.lastUpdated 0.. MS
* meta.type ^short = "参照される文書の文書コード。適当なものがない場合には、type要素を省略してもよい。"
* meta.type ^definition = "参照される文書の文書コード。適当なものがない場合には、type要素を省略してもよい。"
* meta.type ^comment = "例）臨床経過　11506-3  \"Provider-unspecified Progress note\"または\"経過記録\"。その他、https://hl7.org/fhir/R4/valueset-c80-doc-typecodes.html　に記載されているValue Set http://hl7.org/fhir/ValueSet/c80-doc-typecodesから適切なコードを選択する。対応する日本語名称は、SS MIX 標準文書コード表を参照できる（https://jpfhir.jp/fhir/core/terminology/igv1/CodeSystem-jp-documentcodes-cs.html）。"
* meta.type from http://hl7.org/fhir/ValueSet/c80-doc-typecodes

