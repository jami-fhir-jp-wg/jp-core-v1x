// Instance: jp-allergyintolerance-example-1
// InstanceOf: JP_AllergyIntolerance
// Title: "JP Core AllergyIntolerance Basic Example"
// Description: "JP_AllergyIntoleranceリソースの1例"
// Usage: #example
// * clinicalStatus
//   * coding[0]
//     * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
//     * code = #active
// * verificationStatus
//   * coding[0]
//     * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
//     * code = #confirmed
// * type = #allergy 
// * category = #food
// * criticality = #low 
// * code
//   * coding
//     * system = $JP_JFAGY_CS
//     * code = #J9F713920000
//     * display = "ほや類"
//   * text = "ほや"
// * patient
//   * reference = "Patient/jp-patient-example-1"
//   * display = "山田 太郎"
// * onsetDateTime = "2021-08-22"
// * recordedDate = "2021-08-23" 
// * reaction
//   * manifestation
//     * coding
//       * system = "http://jpfhir.jp/fhir/CodeSystem/***"
//       * code = #***
//       * display = "蕁麻疹"
//     * text = "じん麻疹"
//   * severity = #mild
