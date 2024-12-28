Alias: $v3-ParticipationType = http://terminology.hl7.org/CodeSystem/v3-ParticipationType

ValueSet: ImagingStudySeriesPerformerFunction-VS
Id: series-performer-function-vs
Title: "ImagingStudy series performer function"
Description: "Performer function of an agent in an imaging study series"
* ^url =  "http://hl7.org/fhir/ValueSet/series-performer-function"
* ^meta.lastUpdated = "2023-03-26T15:21:02.749+11:00"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #ii
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 4
* ^url = "http://hl7.org/fhir/ValueSet/series-performer-function"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.989"
* ^version = "5.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/fhir"

* $v3-ParticipationType#CON "consultant"
* $v3-ParticipationType#VRF "verifier"
* $v3-ParticipationType#PRF "performer"
* $v3-ParticipationType#SPRF "secondary performer"
* $v3-ParticipationType#REF "referrer"