ValueSet: JP_DentalTeethObservation_VS
Id: jp-dental-teethobservation-vs
Title: "JP Core Dental TeethObservation ValueSet"
Description: "JP Coreにて定義した歯科のObservationリソースに関する歯面の詳細部位構造コード"
* ^url = $JP_DentalTeethObservation_VS
* ^status = #active
* ^experimental = false
* ^date = "2025-06-24"

* include codes from system $JP_DentalPresentTeethObservation_CS
* include codes from system $JP_DentalSimplePresentTeethObservation_CS
* include codes from system $JP_DentalMissingTeethObservation_CS
* include codes from system $JP_DentalSimpleMissingTeethObservation_CS
