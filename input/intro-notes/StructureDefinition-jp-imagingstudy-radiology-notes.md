
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

#### 必須
ImagingStudyリソースは、次の要素を持たなければならない。

- status︓検査項目情報の状態は必須である。
- subject︓このリソースが示す検査項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須である。


### Extension定義

このプロファイルでは拡張定義は行っていない。

## 注意事項

### Mappings

ImagingStudyはDICOM tagとの対応が重要である。各エレメントとDICOM tagのマッピングについては[ Resource ImagingStudy - Mappings](https://hl7.org/fhir/R4/imagingstudy-mappings.html#dicom)を参照すること。

### ProcedureCode

ProcedureCodeについてはRadLex lexiconに定義されているものを利用することを想定している。これは本家の仕様に基づくものである。一方で、JJ1017についてはこの利用を制限するものでは無いが、JJ1017には手技に関連する情報以外に部位情報や左右の情報を含むため、利用する場合は以下に示すbodySiteやlateralityとの整合性を確保する必要がある。
### BodySiteとlaterality

ImagingStudyのbodySiteエレメントには原則としてDICOMタグに含まれる部位情報が設定されるのが原則である。これはオーダ情報等の別の管理情報には左右や部位の間違いが含まれることがあり、実際の撮影時に修正されることがあるためである。ただし、DICOMに部位情報が含まれない場合はJJ1017Pなどのコードあるいはそのサブセットを用い指定することを許容する。ただし、lateralityエレメントとの整合性をとり、部位情報が正しいものであることを確認すること。

## 利用方法

### インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
 | SHOULD | subject(Patient) | reference | `GET [base]/ImagingStudy?subject=Patient/123` |
 | SHOULD | subject,modality | reference,token | `GET [base]/ImagingStudy?subject=Patient/123&modality=CT` |
 | SHOULD | subject,bodysite | reference,token | `GET [base]/ImagingStudy?subject=Patient/123&bodysite=T-15460` |
 | SHOULD | subject,started | reference,date | `GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-25` |
 | SHOULD | subject,started,modality,bodysite | reference,date,token,token  | `GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-18&modality=CT&bodysite=T-15460` |
 | SHOULD | encounter | reference  | `GET [base]/ImagingStudy?encounter=Encounter/456` |


#### 操作詳細

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。（SHALL）
ImagingStudyリソースでは検索の多様性が求められるため、必須としての検索項目は定義していない。

##### 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（SHOULD）

1.患者中心での検索：対象患者（= Patientリソース）を条件とした検索をサポートすることが望ましい。

   ```
   GET [base]/ImagingStudy?subject={reference}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123
   ```


2.モダリティ中心の検索：対象患者（= Patientリソース）と撮影に使用されたモダリティを条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&modality={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123&modality=CT
   ```

3.部位中心の検索：対象患者（= Patientリソース）と撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&bodysite={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123&bodysite=T-15460
   ```
<br>

4.日付中心の検索：対象患者（= Patientリソース）と撮影の日時を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&started={date}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=subject=Patient/123&data=eq2021-06-25
   ```

5.日付中心の検索：対象患者（= Patientリソース）と撮影の日時を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&started={date}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=subject=Patient/123&data=eq2021-06-25
   ```
   
6.複数の条件を組み合わせた検索：対象患者（= Patientリソース）、撮影の日時、撮影に使用されたモダリティ、撮影の対象となった撮影部位を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?subject={reference}&data={date}&modality={token}&bodysite={token}
   ```

   例：

   ```
   GET [base]/ImagingStudy?subject=Patient/123&data=eq2021-06-18&modality=CT&bodysite=T-15460
   ```
   
7.来院情報中心の検索：来院情報（= Encounterリソース）を条件とした検索をサポートすることが望ましい。


   ```
   GET [base]/ImagingStudy?encounter={reference}
   ```

   例：

   ```
   GET [base]/ImagingStudy?encounter=Encounter/456
   ```

##### オプション検索パラメータ

このプロファイルではオプション検索パラメータ定義は行っていない。

#### Operation一覧

このプロファイルではオペレーション定義は行っていない。

#### サンプル

* [**放射線画像検査**][jp-imagingstudy-radiology-example-1]

{% include markdown-link-references.md %}
