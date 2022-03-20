本プロファイル説明は、患者に付属する画像検査情報について、情報の登録や検索、取得のために、FHIR `ImagingStudy`リソースを使用するにあたっての、最低限の制約を記述したものである。


`ImagingStudy` リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

<br/>

## 背景および想定シナリオ

本プロファイルは、一般的な画像検査でDICOMで定義される画像情報を取り扱うことを想定している。Non-DICOMの画像を取り扱う場合は[`Media`リソース](http://www.hl7.org/fhir/media.html)を利用すること。


`ImagingStudy` リソースはDICOM画像検査において作成された内容（主としてDICOM タグ情報に相当する）を表す。一つの検査はシリーズを構成しており、それぞれのシリーズにはSerivce-Objext Pairインスタンス(SOPインスタンス）が一般的なタグ情報の中に含まれる。一つのシリーズにはただ一つのモダリティ(例えば単純エックス線撮影，CT，MRI，超音波のいずれか）から成り立つが、一つの検査は異なるモダリティによる複数のシリーズから構成されることがある。


 - `Patient`リソースからの指定された日時、期間での画像検査情報の参照
 - `ImagingStudy`リソースから指定したモダリティに関する検査の画像検査情報の参照
 - `ImagingStudy`リソースから指定したモダリティに関するシリーズの画像検査情報の参照
 - `ImagingStudy`リソースから指定した部位の画像検査情報の参照
 - `ImagingStudy`リソースから使用可能な画像検査情報の参照
 - `Encounter`リソースから画像検査を実施した検査の画像検査情報の参照
 - `ServiceRequest`リソースから画像検査を実施した検査の画像検査情報の参照

なお、`ServiceRequest`リソースは画像検査を実施するために発生するオーダ情報等を格納しうるリソースであるが、オーダリング情報の標準化の状況や情報の粒度によりユースケースが異なることが想定される。よって、`ServiceRequest`から提供され本リソースにマッピングされるべき情報の定義については`ServiceRequest`および一連の`TASK`管理あるいは`Procedure`に関連するユースケースで別途検討される。

<br/>

## スコープ

`ImagingStudy`リソースはDICOMのstudy, seriesおよび画像に関連する情報を提供し、それらの情報をどのようにして取り出すか（native DICOMフォーマットで受け取るか、JPEGなどの一般的な画像情報に変換したものを受けとるかなど）を示す。`ImagingStudy`は一つのDICOM studyのすべての情報を網羅するために用いられる。

このリソースでは32ビットのタグ（DICOMタグと呼ばれる）で示されるDICOMアトリビュート（タグ情報）をmappingするためのエレメントが用意されている。
DICOMタグは4桁の16進数がコンマで区切られたペア（例　(0008, 103E) )として表現される。それぞれのタグ情報に関する名称と値のペアについては[DICOM Part6 Data Dictionary](http://medical.nema.org/medical/dicom/current/output/html/part06.html)に記載されている。さらに、情報体の中のタグ情報の用途については[DICOM Part 3 Information Object Definitions](http://medical.nema.org/medical/dicom/current/output/html/part03.html)に記載されている。Number of Instances in StudyなどのDICOMにおける問い合わせモデルに関する情報は[ DICOM Part 4 Annex C](http://medical.nema.org/medical/dicom/current/output/html/part04.html#chapter_C)で参照できる。

最も単純な場合、`ImagingStudy`はDICOM query（例えばQIDO-RS）を行うことなく重要なDICOMタグ情報へのアクセスを提供する。一方で、DICOMの実画像情報などのインスタンスは`ImagingStudy`リソースには保存されないため、この情報を保存するためにはDICOM WADO-RSサーバやほかのストレージ機能を利用する必要がある。
（FHIRではREST APIを用いることが想定されており，親和性の観点からはDICOM web accessの利用が想定される。）

`ImagingStudy`は一つのDICOM studyに対してのリファレンスであり、またそのスタディのサブセットに対する参照にも利用できる。一方で、複数の`ImagingStudy`リソースが同じDICOM studyを参照することや，同じDICOM study内の異なるサブセット（シリーズ）を参照することもあり得る。

このプロファイルでは上記のようなDICOMに関連して用いられる `ImagingStudy`の用途がスコープであり、`ImagingStudy`の情報項目の１つを取り扱う際に、必要な要件を定義している。

## 関連するプロファイル

このプロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

 - [`Patient`](https://simplifier.net/jp-core-draftv1/jppatient)
 - [`Encounter`](Encounter)
 - [`CarePlan`](http://hl7.org/fhir/careplan.html)
 - [`Specimen`](http://hl7.org/fhir/specimen.html)
 - [`Condition`](Condition)
 - [`Location`](Location)
 - [`Procedure`](Procedure)
 - [`Endpoint`](http://hl7.org/fhir/endpoint.html)
 - [`Practitioner`](Practitioner)
 - [`DiagnosticReport`](DiagnosticReportRadiology)
 - [`Observation`](Observation)
 
## プロファイル定義