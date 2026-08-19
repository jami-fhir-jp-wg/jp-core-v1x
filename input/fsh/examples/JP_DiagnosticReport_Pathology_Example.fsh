Instance: JP-DiagnosticReport-Pathology-Example-1
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Title: "JP Core DiagnosticReport Pathology Example 1"
Description: "病理診断レポートのインスタンス例"
* identifier.system = "http://hospital.example.org/fhir/pathology-report-id"
* identifier.value = "P2026-001234-v1"
* status = #final
* category[first] = $Loinc_CS#LP7839-6 "病理"
* code = http://loinc.org#11526-1 "Pathology study"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2026-08-10T10:30:00+09:00"
* issued = "2026-08-10T14:00:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-female-1)
* resultsInterpreter = Reference(Practitioner/jp-practitioner-example-male-1)
* specimen = Reference(Specimen/jp-specimen-example-1)
* conclusion = "胃体部の腺癌。深達度pT2（MP）。リンパ節転移陰性。"
* presentedForm.contentType = #application/pdf
* presentedForm.data = "JVBERi0xLjQKJeLjz9MKMSAwIG9iago8PAovVGl0bGUgKFBhdGhvbG9neSBSZXBvcnQpCj4+"
* presentedForm.title = "病理診断報告書"
