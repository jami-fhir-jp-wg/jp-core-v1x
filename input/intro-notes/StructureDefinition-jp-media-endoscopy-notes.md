
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

#### 必須項目
ImagingStudyリソースは、次の要素を持たなければならない。

- status︓検査項目情報の状態は必須である
- subject︓このリソースが示す検査項目がどの患者のものかを示すため、参照するpatientリソース定義を必須とした

#### Must Support
ImagingStudyリソースは該当する情報が存在する場合、次の要素を持たなければならない。

- identifier：DICOM画像が存在する場合、DICOMタグのStudyInstance UID (0020,000D)が保持される必要がある。Accession Number and Issuer (0080,0050)+(0080,0051) あるいは Study ID (0020,0010)の設定も可能だが、JP CoreではStudyInstance UIDをMust Supportとし、他は任意とする（複数のidentifierの設定は可能）。必要に応じてオーダ番号等を持つことも可能である
- series.modality：DICOM画像が存在する場合シリーズが取得されたモダリティを示す、DICOMでは必須情報となっておりDICOMタグ(0008,0060)の情報が格納される
- series.performer.actor：組織または撮影者を示す具体的には実施医あるいは操作者（診療放射線技師）を示す関連するリソースへのreferenceである。DICOMタグの(0008, 1050) \| (0008, 1052) \| (0008, 1070) \| (0008, 1072) とマッピングされる
- series.instance.uid：画像のユニークID、DICOMタグ(0008,0018)にある値をそのまま設定する
- series.instance.sopClass：SOPクラスUID、DICOMタグ(0008,0016)にある値をそのまま設定する

### Extension定義

このプロファイルでは拡張定義は行っていない。

## 注意事項

### Mappings

ImagingStudyはDICOM tagとの対応が重要である。各エレメントとDICOM tagのマッピングについては[ Resource ImagingStudy - Mappings](https://hl7.org/fhir/R4/imagingstudy-mappings.html#dicom)を参照すること。

### ProcedureCode

ProcedureCodeについてはRadLex lexiconに定義されているものを利用することを想定している。これは本家の仕様に基づくものである。一方で、JJ1017についてはこの利用を制限するものでは無いが、JJ1017には手技に関連する情報以外に部位情報や左右の情報を含むため、利用する場合は以下に示すbodySiteやlateralityとの整合性を確保する必要がある。
### BodySiteとlaterality

ImagingStudyのbodySiteエレメントには原則としてDICOMタグに含まれる部位情報が設定されるのが原則である。これはオーダ情報等の別の管理情報には左右や部位の間違いが含まれることがあり、実際の撮影時に修正されることがあるためである。ただし、DICOMに部位情報が含まれない場合はJJ1017Pなどのコードあるいはそのサブセットを用い指定することを許容する。ただし、lateralityエレメントとの整合性をとり、部位情報が正しいものであることを確認すること。
また、DICOMではSNOMED-CTとのmappingがなされており、DICOMで定義されているSNOMED-CTのコードの利用は無償で可能となる契約がなされている。
BodySite等でDICOMでmappingされているSNOMED-CTをCodeSystemとして利用する場合、コードに対応するdisplay textの表記にはSNOMED-CTで規定されている表記を用いること。同様にDICOMをCodeSystemとして指定する際はBody Part Examined (0018,0015)に規定されている表記を指定すること。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | identifier | token | `GET [base]/ImagingStudy?identifier=urn:oid:2.16.124.999999.9999.1154777499.30246.19789.3503430045` |
| SHOULD | patient | reference | `GET [base]/ImagingStudy?patient=123` |
| SHOULD | patient,modality | reference,token | `GET [base]/ImagingStudy?patient=123&modality=CT` |
| SHOULD | patient,bodysite | reference,token | `GET [base]/ImagingStudy?patient=123&bodysite=T-15460` |
| SHOULD | patient,started | reference,date | `GET [base]/ImagingStudy?patient=123&started=eq2021-06-25` |
| SHOULD | patient,started,modality,bodysite | reference,date,token,token  | `GET [base]/ImagingStudy?patient=123&started=eq2021-06-18&modality=CT&bodysite=T-15460` |
| SHOULD | encounter | reference  | `GET [base]/ImagingStudy?encounter=Encounter/456` |

#### 操作詳細

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。（**SHALL**）
ImagingStudyリソースでは検索の多様性が求められるため、必須としての検索項目は定義していない。

##### 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（**SHOULD**）

1.患者中心での検索：対象患者（= Patientリソース）を条件とした検索をサポートすることが望ましい

   ```
   GET [base]/ImagingStudy?patient={reference}
   ```

   例：

   ```
   GET [base]/ImagingStudy?patient=123
   ```


2.モダリティ中心の検索：対象患者（= Patientリソース）と撮影に使用されたモダリティを条件とした検索をサポートすることが望ましい

   ```
   GET [base]/ImagingStudy?patient={reference}&modality={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?patient=123&modality=CT
   ```

3.部位中心の検索：対象患者（= Patientリソース）と撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい

   ```
   GET [base]/ImagingStudy?patient={reference}&bodysite={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?patient=123&bodysite=T-15460
   ```

4.日付中心の検索：対象患者（= Patientリソース）と撮影の日時を条件とした検索をサポートすることが望ましい

   ```
   GET [base]/ImagingStudy?patient={reference}&started={date}
   ```

   例：

   ```
   GET [base]/ImagingStudy?patient=123&started=eq2021-06-25
   ```

5.日付中心の検索：対象患者（= Patientリソース）と撮影の日時を条件とした検索をサポートすることが望ましい

   ```
   GET [base]/ImagingStudy?patient={reference}&started={date}
   ```

   例：

   ```
   GET [base]/ImagingStudy?patient=123&started=eq2021-06-25
   ```
   
6.複数の条件を組み合わせた検索：対象患者（= Patientリソース）、撮影の日時、撮影に使用されたモダリティ、撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい


   ```
   GET [base]/ImagingStudy?patient={reference}&started={date}&modality={token}&bodysite={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?patient=123&started=eq2021-06-18&modality=CT&bodysite=T-15460
   ```
   
7.来院情報中心の検索：来院情報（= Encounterリソース）を条件とした検索をサポートすることが望ましい


   ```
   GET [base]/ImagingStudy?encounter={reference}
   ```

   例：

   ```
   GET [base]/ImagingStudy?encounter=456
   ```

##### オプション検索パラメータ

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**放射線画像検査**][jp-imagingstudy-radiology-example-1]

{% include markdown-link-references.md %}
