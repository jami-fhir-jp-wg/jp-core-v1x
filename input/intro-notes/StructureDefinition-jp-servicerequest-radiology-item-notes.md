## 制約  
  
| id | Level | Location | Description | Expression |  
| --- | --- | --- | --- | --- |  
| prr-1 | Rule | (base) | code要素がある時にだけ、orderDetail要素は存在 | orderDetail.empty() or code.exists |  
  
## 必須要素  
  
次のデータ項目は必須（SHALL）である。  
  
- status : オーダの状態  
- intent : オーダの意図（"order" を指定する）  
- subject : 対象患者  
- category : オーダの分類  
  - category[orderCategory] : オーダ種別（JP_ServiceRequestOrderCategory_VSから放射線検査オーダは "imaging" を指定する）  
- code : DICOMのモダリティコードまたは、モダリティ（JJ1017指針の種別（モダリティ）コード。例：X線単純撮影）  
- requisition : オーダ番号（ローカルコード）  
- requester : オーダ依頼医  
  
## MustSupport  
  
JP Core としては原則 MustSupport を定義しない方針であるが、検査に際して必要性の高い内容であるため、supportingInfo については MustSupport とする（要SWG確認）。  
  
- アレルギー → AllergyIntolerance  
- 腎機能・体重 → Observation  
- 妊娠 → Condition  
- 体内金属（インプラント、ペースメーカーなど）→ Device  
- 上記で表現できないもの（入れ墨など）→ DocumentReference  
  
## Extensions定義  
  
本プロファイルで追加定義された拡張はない。  
  
## 利用方法  
  
### 検索例  
  
- オーダ番号（ローカルコード）による検索