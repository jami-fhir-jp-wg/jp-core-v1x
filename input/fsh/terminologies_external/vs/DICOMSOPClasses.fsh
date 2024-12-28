ValueSet: DICOMSOPClasses
Id: dicom-sop-classes
Title: "DICOM® SOP Classes"
Description: "DICOM® SOP Classes extracted from DICOM PS3.6 Table A-1."
* ^url = "http://hl7.org/fhir/uv/imaging-service-request-ig/ValueSet/dicom-sop-classes"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #ii
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = false
* ^publisher = "HL7 International / Imaging Integration"
* ^contact[0].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/imagemgt/index.cfm"
* ^contact[+].name = "HL7 International / Imaging Integration"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/imagemgt/index.cfm"
* ^contact[+].name = "Jonathan Whitby"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "jonathan.whitby@mi.medical.canon"
* ^contact[+].name = "Brian Bialecki"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "bbialecki@acr.org"
* ^contact[+].name = "Bas van den Heuvel"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "bas.van.den.heuvel@philips.com"
* DICOMUIDs#1.2.840.10008.1.1 "Verification"
* DICOMUIDs#1.2.840.10008.1.3.10 "MediaStorageDirectoryStorage"
* DICOMUIDs#1.2.840.10008.1.9 "BasicStudyContentNotification"
* DICOMUIDs#1.2.840.10008.1.20.1 "StorageCommitmentPushModel"
* DICOMUIDs#1.2.840.10008.1.20.2 "StorageCommitmentPullModel"
* DICOMUIDs#1.2.840.10008.1.40 "ProceduralEventLogging"
* DICOMUIDs#1.2.840.10008.1.42 "SubstanceAdministrationLogging"
* DICOMUIDs#1.2.840.10008.3.1.2.1.1 "DetachedPatientManagement"
* DICOMUIDs#1.2.840.10008.3.1.2.2.1 "DetachedVisitManagement"
* DICOMUIDs#1.2.840.10008.3.1.2.3.1 "DetachedStudyManagement"
* DICOMUIDs#1.2.840.10008.3.1.2.3.2 "StudyComponentManagement"
* DICOMUIDs#1.2.840.10008.3.1.2.3.3 "ModalityPerformedProcedureStep"
* DICOMUIDs#1.2.840.10008.3.1.2.3.4 "ModalityPerformedProcedureStepRetrieve"
* DICOMUIDs#1.2.840.10008.3.1.2.3.5 "ModalityPerformedProcedureStepNotification"
* DICOMUIDs#1.2.840.10008.3.1.2.5.1 "DetachedResultsManagement"
* DICOMUIDs#1.2.840.10008.3.1.2.6.1 "DetachedInterpretationManagement"
* DICOMUIDs#1.2.840.10008.5.1.1.1 "BasicFilmSession"
* DICOMUIDs#1.2.840.10008.5.1.1.2 "BasicFilmBox"
* DICOMUIDs#1.2.840.10008.5.1.1.4 "BasicGrayscaleImageBox"
* DICOMUIDs#1.2.840.10008.5.1.1.4.1 "BasicColorImageBox"
* DICOMUIDs#1.2.840.10008.5.1.1.4.2 "ReferencedImageBox"
* DICOMUIDs#1.2.840.10008.5.1.1.14 "PrintJob"
* DICOMUIDs#1.2.840.10008.5.1.1.15 "BasicAnnotationBox"
* DICOMUIDs#1.2.840.10008.5.1.1.16 "Printer"
* DICOMUIDs#1.2.840.10008.5.1.1.16.376 "PrinterConfigurationRetrieval"
* DICOMUIDs#1.2.840.10008.5.1.1.22 "VOILUTBox"
* DICOMUIDs#1.2.840.10008.5.1.1.23 "PresentationLUT"
* DICOMUIDs#1.2.840.10008.5.1.1.24 "ImageOverlayBox"
* DICOMUIDs#1.2.840.10008.5.1.1.24.1 "BasicPrintImageOverlayBox"
* DICOMUIDs#1.2.840.10008.5.1.1.26 "PrintQueueManagement"
* DICOMUIDs#1.2.840.10008.5.1.1.27 "StoredPrintStorage"
* DICOMUIDs#1.2.840.10008.5.1.1.29 "HardcopyGrayscaleImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.1.30 "HardcopyColorImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.1.31 "PullPrintRequest"
* DICOMUIDs#1.2.840.10008.5.1.1.33 "MediaCreationManagement"
* DICOMUIDs#1.2.840.10008.5.1.1.40 "DisplaySystem"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.1 "ComputedRadiographyImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.1.1 "DigitalXRayImageStorageForPresentation"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.1.1.1 "DigitalXRayImageStorageForProcessing"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.1.2 "DigitalMammographyXRayImageStorageForPresentation"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.1.2.1 "DigitalMammographyXRayImageStorageForProcessing"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.1.3 "DigitalIntraOralXRayImageStorageForPresentation"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.1.3.1 "DigitalIntraOralXRayImageStorageForProcessing"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.2 "CTImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.2.1 "EnhancedCTImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.2.2 "LegacyConvertedEnhancedCTImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.3 "UltrasoundMultiFrameImageStorageRetired"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.3.1 "UltrasoundMultiFrameImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.4 "MRImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.4.1 "EnhancedMRImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.4.2 "MRSpectroscopyStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.4.3 "EnhancedMRColorImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.4.4 "LegacyConvertedEnhancedMRImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.5 "NuclearMedicineImageStorageRetired"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.6 "UltrasoundImageStorageRetired"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.6.1 "UltrasoundImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.6.2 "EnhancedUSVolumeStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.6.3 "PhotoacousticImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.7 "SecondaryCaptureImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.7.1 "MultiFrameSingleBitSecondaryCaptureImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.7.2 "MultiFrameGrayscaleByteSecondaryCaptureImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.7.3 "MultiFrameGrayscaleWordSecondaryCaptureImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.7.4 "MultiFrameTrueColorSecondaryCaptureImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.8 "StandaloneOverlayStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9 "StandaloneCurveStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.1 "WaveformStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.1.1 "TwelveLeadECGWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.1.2 "GeneralECGWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.1.3 "AmbulatoryECGWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.1.4 "General32bitECGWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.2.1 "HemodynamicWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.3.1 "CardiacElectrophysiologyWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.4.1 "BasicVoiceAudioWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.4.2 "GeneralAudioWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.5.1 "ArterialPulseWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.6.1 "RespiratoryWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.6.2 "MultichannelRespiratoryWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.7.1 "RoutineScalpElectroencephalogramWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.7.2 "ElectromyogramWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.7.3 "ElectrooculogramWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.7.4 "SleepElectroencephalogramWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.9.8.1 "BodyPositionWaveformStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.10 "StandaloneModalityLUTStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11 "StandaloneVOILUTStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.1 "GrayscaleSoftcopyPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.2 "ColorSoftcopyPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.3 "PseudoColorSoftcopyPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.4 "BlendingSoftcopyPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.5 "XAXRFGrayscaleSoftcopyPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.6 "GrayscalePlanarMPRVolumetricPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.7 "CompositingPlanarMPRVolumetricPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.8 "AdvancedBlendingPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.9 "VolumeRenderingVolumetricPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.10 "SegmentedVolumeRenderingVolumetricPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.11 "MultipleVolumeRenderingVolumetricPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.11.12 "VariableModalityLUTSoftcopyPresentationStateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.12.1 "XRayAngiographicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.12.1.1 "EnhancedXAImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.12.2 "XRayRadiofluoroscopicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.12.2.1 "EnhancedXRFImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.12.3 "XRayAngiographicBiPlaneImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.12.77
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.13.1.1 "XRay3DAngiographicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.13.1.2 "XRay3DCraniofacialImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.13.1.3 "BreastTomosynthesisImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.13.1.4 "BreastProjectionXRayImageStorageForPresentation"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.13.1.5 "BreastProjectionXRayImageStorageForProcessing"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.14.1 "IntravascularOpticalCoherenceTomographyImageStorageForPresentation"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.14.2 "IntravascularOpticalCoherenceTomographyImageStorageForProcessing"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.20 "NuclearMedicineImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.30 "ParametricMapStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.40
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66 "RawDataStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.1 "SpatialRegistrationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.2 "SpatialFiducialsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.3 "DeformableSpatialRegistrationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.4 "SegmentationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.5 "SurfaceSegmentationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.6 "TractographyResultsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.7 "LabelMapSegmentationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.66.8 "HeightMapSegmentationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.67 "RealWorldValueMappingStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.68.1 "SurfaceScanMeshStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.68.2 "SurfaceScanPointCloudStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1 "VLImageStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.2 "VLMultiFrameImageStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.1 "VLEndoscopicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.1.1 "VideoEndoscopicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.2 "VLMicroscopicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.2.1 "VideoMicroscopicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.3 "VLSlideCoordinatesMicroscopicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.4 "VLPhotographicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.4.1 "VideoPhotographicImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.1 "OphthalmicPhotography8BitImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.2 "OphthalmicPhotography16BitImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.3 "StereometricRelationshipStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.4 "OphthalmicTomographyImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.5 "WideFieldOphthalmicPhotographyStereographicProjectionImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.6 "WideFieldOphthalmicPhotography3DCoordinatesImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.7 "OphthalmicOpticalCoherenceTomographyEnFaceImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.5.8 "OphthalmicOpticalCoherenceTomographyBscanVolumeAnalysisStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.6 "VLWholeSlideMicroscopyImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.7 "DermoscopicPhotographyImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.8 "ConfocalMicroscopyImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.77.1.9 "ConfocalMicroscopyTiledPyramidalImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.1 "LensometryMeasurementsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.2 "AutorefractionMeasurementsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.3 "KeratometryMeasurementsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.4 "SubjectiveRefractionMeasurementsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.5 "VisualAcuityMeasurementsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.6 "SpectaclePrescriptionReportStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.7 "OphthalmicAxialMeasurementsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.78.8 "IntraocularLensCalculationsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.79.1 "MacularGridThicknessAndVolumeReportStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.80.1 "OphthalmicVisualFieldStaticPerimetryMeasurementsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.81.1 "OphthalmicThicknessMapStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.82.1 "CornealTopographyMapStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.1 "TextSRStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.2 "AudioSRStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.3 "DetailSRStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.4 "ComprehensiveSRStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.11 "BasicTextSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.22 "EnhancedSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.33 "ComprehensiveSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.34 "Comprehensive3DSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.35 "ExtensibleSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.40 "ProcedureLogStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.50 "MammographyCADSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.59 "KeyObjectSelectionDocumentStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.65 "ChestCADSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.67 "XRayRadiationDoseSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.68 "RadiopharmaceuticalRadiationDoseSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.69 "ColonCADSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.70 "ImplantationPlanSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.71 "AcquisitionContextSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.72 "SimplifiedAdultEchoSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.73 "PatientRadiationDoseSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.74 "PlannedImagingAgentAdministrationSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.75 "PerformedImagingAgentAdministrationSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.76 "EnhancedXRayRadiationDoseSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.88.77 "WaveformAnnotationSRStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.90.1 "ContentAssessmentResultsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.91.1 "MicroscopyBulkSimpleAnnotationsStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.104.1 "EncapsulatedPDFStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.104.2 "EncapsulatedCDAStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.104.3 "EncapsulatedSTLStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.104.4 "EncapsulatedOBJStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.104.5 "EncapsulatedMTLStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.128 "PositronEmissionTomographyImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.128.1 "LegacyConvertedEnhancedPETImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.129 "StandalonePETCurveStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.130 "EnhancedPETImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.131 "BasicStructuredDisplayStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.1 "CTDefinedProcedureProtocolStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.2 "CTPerformedProcedureProtocolStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.3 "ProtocolApprovalStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.4 "ProtocolApprovalInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.5 "ProtocolApprovalInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.6 "ProtocolApprovalInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.7 "XADefinedProcedureProtocolStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.200.8 "XAPerformedProcedureProtocolStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.201.1 "InventoryStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.201.2 "InventoryFind"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.201.3 "InventoryMove"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.201.4 "InventoryGet"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.201.5 "InventoryCreation"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.201.6 "RepositoryQuery"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.1 "RTImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.2 "RTDoseStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.3 "RTStructureSetStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.4 "RTBeamsTreatmentRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.5 "RTPlanStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.6 "RTBrachyTreatmentRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.7 "RTTreatmentSummaryRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.8 "RTIonPlanStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.9 "RTIonBeamsTreatmentRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.10 "RTPhysicianIntentStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.11 "RTSegmentAnnotationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.12 "RTRadiationSetStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.13 "CArmPhotonElectronRadiationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.14 "TomotherapeuticRadiationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.15 "RoboticArmRadiationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.16 "RTRadiationRecordSetStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.17 "RTRadiationSalvageRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.18 "TomotherapeuticRadiationRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.19 "CArmPhotonElectronRadiationRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.20 "RoboticRadiationRecordStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.21 "RTRadiationSetDeliveryInstructionStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.22 "RTTreatmentPreparationStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.23 "EnhancedRTImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.24 "EnhancedContinuousRTImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.481.25 "RTPatientPositionAcquisitionInstructionStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.501.1 "DICOSCTImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.501.2.1 "DICOSDigitalXRayImageStorageForPresentation"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.501.2.2 "DICOSDigitalXRayImageStorageForProcessing"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.501.3 "DICOSThreatDetectionReportStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.501.4 "DICOS2DAITStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.501.5 "DICOS3DAITStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.501.6 "DICOSQuadrupoleResonanceStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.601.1 "EddyCurrentImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.601.2 "EddyCurrentMultiFrameImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.601.3 "ThermographyImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.1.601.4 "ThermographyMultiFrameImageStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.1.1 "PatientRootQueryRetrieveInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.1.2 "PatientRootQueryRetrieveInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.1.3 "PatientRootQueryRetrieveInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.2.1 "StudyRootQueryRetrieveInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.2.2 "StudyRootQueryRetrieveInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.2.3 "StudyRootQueryRetrieveInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.3.1 "PatientStudyOnlyQueryRetrieveInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.3.2 "PatientStudyOnlyQueryRetrieveInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.3.3 "PatientStudyOnlyQueryRetrieveInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.4.2 "CompositeInstanceRootRetrieveMove"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.4.3 "CompositeInstanceRootRetrieveGet"
* DICOMUIDs#1.2.840.10008.5.1.4.1.2.5.3 "CompositeInstanceRetrieveWithoutBulkDataGet"
* DICOMUIDs#1.2.840.10008.5.1.4.20.1 "DefinedProcedureProtocolInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.20.2 "DefinedProcedureProtocolInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.20.3 "DefinedProcedureProtocolInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.31 "ModalityWorklistInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.32.1 "GeneralPurposeWorklistInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.32.2 "GeneralPurposeScheduledProcedureStep"
* DICOMUIDs#1.2.840.10008.5.1.4.32.3 "GeneralPurposePerformedProcedureStep"
* DICOMUIDs#1.2.840.10008.5.1.4.33 "InstanceAvailabilityNotification"
* DICOMUIDs#1.2.840.10008.5.1.4.34.1 "RTBeamsDeliveryInstructionStorageTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.34.2 "RTConventionalMachineVerificationTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.34.3 "RTIonMachineVerificationTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.34.4.1 "UnifiedProcedureStepPushTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.34.4.2 "UnifiedProcedureStepWatchTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.34.4.3 "UnifiedProcedureStepPullTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.34.4.4 "UnifiedProcedureStepEventTrial"
* DICOMUIDs#1.2.840.10008.5.1.4.34.6.1 "UnifiedProcedureStepPush"
* DICOMUIDs#1.2.840.10008.5.1.4.34.6.2 "UnifiedProcedureStepWatch"
* DICOMUIDs#1.2.840.10008.5.1.4.34.6.3 "UnifiedProcedureStepPull"
* DICOMUIDs#1.2.840.10008.5.1.4.34.6.4 "UnifiedProcedureStepEvent"
* DICOMUIDs#1.2.840.10008.5.1.4.34.6.5 "UnifiedProcedureStepQuery"
* DICOMUIDs#1.2.840.10008.5.1.4.34.7 "RTBeamsDeliveryInstructionStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.34.8 "RTConventionalMachineVerification"
* DICOMUIDs#1.2.840.10008.5.1.4.34.9 "RTIonMachineVerification"
* DICOMUIDs#1.2.840.10008.5.1.4.34.10 "RTBrachyApplicationSetupDeliveryInstructionStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.37.1 "GeneralRelevantPatientInformationQuery"
* DICOMUIDs#1.2.840.10008.5.1.4.37.2 "BreastImagingRelevantPatientInformationQuery"
* DICOMUIDs#1.2.840.10008.5.1.4.37.3 "CardiacRelevantPatientInformationQuery"
* DICOMUIDs#1.2.840.10008.5.1.4.38.1 "HangingProtocolStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.38.2 "HangingProtocolInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.38.3 "HangingProtocolInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.38.4 "HangingProtocolInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.39.1 "ColorPaletteStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.39.2 "ColorPaletteQueryRetrieveInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.39.3 "ColorPaletteQueryRetrieveInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.39.4 "ColorPaletteQueryRetrieveInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.41 "ProductCharacteristicsQuery"
* DICOMUIDs#1.2.840.10008.5.1.4.42 "SubstanceApprovalQuery"
* DICOMUIDs#1.2.840.10008.5.1.4.43.1 "GenericImplantTemplateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.43.2 "GenericImplantTemplateInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.43.3 "GenericImplantTemplateInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.43.4 "GenericImplantTemplateInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.44.1 "ImplantAssemblyTemplateStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.44.2 "ImplantAssemblyTemplateInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.44.3 "ImplantAssemblyTemplateInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.44.4 "ImplantAssemblyTemplateInformationModelGet"
* DICOMUIDs#1.2.840.10008.5.1.4.45.1 "ImplantTemplateGroupStorage"
* DICOMUIDs#1.2.840.10008.5.1.4.45.2 "ImplantTemplateGroupInformationModelFind"
* DICOMUIDs#1.2.840.10008.5.1.4.45.3 "ImplantTemplateGroupInformationModelMove"
* DICOMUIDs#1.2.840.10008.5.1.4.45.4 "ImplantTemplateGroupInformationModelGet"
* DICOMUIDs#1.2.840.10008.10.1 "VideoEndoscopicImageRealTimeCommunication"
* DICOMUIDs#1.2.840.10008.10.2 "VideoPhotographicImageRealTimeCommunication"
* DICOMUIDs#1.2.840.10008.10.3 "AudioWaveformRealTimeCommunication"
* DICOMUIDs#1.2.840.10008.10.4 "RenditionSelectionDocumentRealTimeCommunication"