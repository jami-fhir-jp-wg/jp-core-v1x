Instance: jp-enconter-example1
InstanceOf: JP_Encounter
Title: "jp enconter 外来"
Description: "jp enconter 外来"
Usage: #example
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* type = http://snomed.info/sct#410620009 "Well child visit (procedure)"
* type.text = "Well child visit (procedure)"
* subject = Reference(Patient/jp-patient-example-1) "Jonathan639 Kassulke119"
* participant.individual = Reference(Practitioner/587226) "Dr. Shirely692 Berge125"
* period.start = "2016-05-08T03:08:24+02:00"
* period.end = "2016-05-08T03:23:24+02:00"
* serviceProvider = Reference(Organization/587225) "PCP15810"