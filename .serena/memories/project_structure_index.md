# Project Structure Index

## Root Files
| File | Purpose |
|------|---------|
| `CLAUDE.md` | AI agent development guidance (build commands, architecture) |
| `sushi-config.yaml` | Main SUSHI/IG configuration, metadata, dependencies, menu |
| `ig.ini` | IG Publisher settings |
| `.mcp.json` | MCP server configuration (Serena) |
| `_genonce.bat/.sh` | Single IG build script |
| `_gencontinuous.bat/.sh` | Continuous build (watch mode) |
| `_updatePublisher.bat/.sh` | Download IG Publisher JAR |
| `_updateTx.bat/.sh` | Download terminology packages |

## input/fsh/ - FSH Source Files (Core)

### Root FSH Files
| File | Purpose |
|------|---------|
| `aliases.fsh` | Standard FHIR URL aliases |
| `aliases-jpcore.fsh` | JP Core specific aliases (364 aliases total) |
| `invariant.fsh` | Shared invariant constraints |
| `ruleset.fsh` | Reusable FSH rulesets |
| `namingsystems.fsh` | OID-to-URL NamingSystem definitions |
| `namingSystemForIdentifier.fsh` | Identifier NamingSystem definitions |
| `namingSystemForExampleData.fsh` | Example data NamingSystem definitions |

### input/fsh/profiles/ - Profiles & Extensions (64 files)

#### Administration Domain
| File | Contents |
|------|----------|
| `JP_Patient.fsh` | Patient profile + extensions (Race, Religion, BirthPlace, etc.) |
| `JP_Organization.fsh` | Organization profile + extensions (PrefectureNo, InsuranceOrganizationCategory, InsuranceOrganizationNo) |
| `JP_Organization_Department.fsh` | Organization department profile |
| `JP_Practitioner.fsh` | Practitioner profile + extensions (qualifications) |
| `JP_PractitionerRole.fsh` | PractitionerRole profile |
| `JP_Location.fsh` | Location profile |
| `JP_Encounter.fsh` | Encounter profile |
| `JP_Coverage.fsh` | Insurance coverage profile + extensions |
| `JP_HumanName.fsh` | Japanese human name datatype profile |

#### Medication Domain
| File | Contents |
|------|----------|
| `JP_Medication.fsh` | Medication profile + extensions |
| `JP_MedicationRequest.fsh` | Prescription profile + extensions (DispenseRequest, DosageInstruction) |
| `JP_MedicationDispense.fsh` | Dispensing profile |
| `JP_MedicationAdministration.fsh` | Administration profile |
| `JP_MedicationStatement.fsh` | Medication statement profile |
| `JP_MedicationDosage.fsh` | Dosage datatype profile + extensions |
| `JP_MedicationQuantity.fsh` | Medication quantity datatype |
| `JP_MedicationRange.fsh` | Medication range datatype |
| `JP_MedicationRatio.fsh` | Medication ratio datatype |
| `JP_MedicationTiming.fsh` | Medication timing datatype + extensions |
| `JP_Immunization.fsh` | Immunization profile + extensions |

#### Diagnostic Domain
| File | Contents |
|------|----------|
| `JP_Observation_Common.fsh` | Base observation profile |
| `JP_Observation_LabResult.fsh` | Laboratory result |
| `JP_Observation_VitalSigns.fsh` | Vital signs |
| `JP_Observation_BodyMeasurement.fsh` | Body measurements |
| `JP_Observation_PhysicalExam.fsh` | Physical examination |
| `JP_Observation_SocialHistory.fsh` | Social history |
| `JP_Observation_Electrocardiogram.fsh` | Electrocardiogram |
| `JP_Observation_Microbiology.fsh` | Microbiology |
| `JP_Observation_Endoscopy.fsh` | Endoscopy findings |
| `JP_Observation_Radiology_Findings.fsh` | Radiology findings |
| `JP_Observation_Radiology_Impression.fsh` | Radiology impression |
| `JP_DiagnosticReport_Common.fsh` | Base diagnostic report |
| `JP_DiagnosticReport_LabResult.fsh` | Lab result report |
| `JP_DiagnosticReport_Radiology.fsh` | Radiology report |
| `JP_DiagnosticReport_Microbiology.fsh` | Microbiology report |
| `JP_DiagnosticReport_Endoscopy.fsh` | Endoscopy report |
| `JP_DiagnosticReport_DentalOral.fsh` | Dental/oral report |
| `JP_ImagingStudy_Radiology.fsh` | Radiology imaging study |
| `JP_ImagingStudy_Endoscopy.fsh` | Endoscopy imaging study |
| `JP_Media_Endoscopy.fsh` | Endoscopy media |
| `JP_Specimen_Common.fsh` | Specimen profile |

#### Dental/Oral Domain
| File | Contents |
|------|----------|
| `JP_Observation_DentalOral_ToothExistence.fsh` | Tooth existence observation |
| `JP_Observation_DentalOral_ToothSurface.fsh` | Tooth surface observation |
| `JP_Observation_DentalOral_ToothRoot.fsh` | Tooth root observation |
| `JP_Observation_DentalOral_ToothTreatmentCondition.fsh` | Treatment condition |
| `JP_Observation_DentalOral_MissingToothCondition.fsh` | Missing tooth condition |
| `JP_Observation_DentalOral_BodySiteStatus.fsh` | Body site status |
| `JP_Observation_DentalOral_BodyStructure_eCS.fsh` | Body structure eCS |
| `JP_Observation_DentalOral_eCS.fsh` | Dental oral eCS |

#### Clinical Domain
| File | Contents |
|------|----------|
| `JP_AllergyIntolerance.fsh` | Allergy/intolerance profile |
| `JP_Condition.fsh` | Condition profile |
| `JP_Condition_Diagnosis.fsh` | Diagnosis condition profile |
| `JP_Procedure.fsh` | Procedure profile |
| `JP_FamilyMemberHistory.fsh` | Family member history |

#### Workflow Domain
| File | Contents |
|------|----------|
| `JP_ServiceRequest_Common.fsh` | Service request profile |

#### Shared Extensions
| File | Contents |
|------|----------|
| `JP_Common_Department_Extension.fsh` | Clinical department extension (shared across profiles) |

#### Placeholder/Dummy Profiles
| File | Status |
|------|--------|
| `JP_Binary_dummy.fsh` | Placeholder |
| `JP_CarePlan_dummy.fsh` | Placeholder |
| `JP_Consent_dummy.fsh` | Placeholder |
| `JP_Device_dummy.fsh` | Placeholder |
| `JP_DocumentReference_dummy.fsh` | Placeholder |
| `JP_RelatedPerson_dummy.fsh` | Placeholder |
| `JP_ResearchStudy_dummy.fsh` | Placeholder |
| `JP_ResearchSubject_dummy.fsh` | Placeholder |

### input/fsh/terminologies/ - CodeSystems & ValueSets (41 files)
Organized by domain:
- **Dental**: JP_DentalBodySite, JP_DentalFundamentalStatus, JP_DentalMissingTeethObservation, JP_DentalPresentTeethObservation, JP_DentalRootBodyStructure, JP_DentalSurfaceBodyStructure, JP_DentalSimple*, JP_DentalTeethObservation, JP_DentalBodySiteStatus, JP_ObservationDentalCategory, JP_ObservationDetailedDentalCategory
- **Condition**: JP_ConditionDiseaseOutcomeHL70241, JP_ConditionDiseaseOutcomeReceipt, JP_Condition_BodySite
- **Observation**: JP_ObservationBodyMeasurementCode, JP_ObservationElectrocardiogram*, JP_ObservationEndoscopy*, JP_ObservationRadiologyCode
- **Imaging**: JP_DICOMModality, JP_ImagingStudy_Radiology_BodySite
- **Utility**: JP_Undefined_CS/VS

### input/fsh/searchparameters/ (4 files)
| File | Contents |
|------|----------|
| `JP_Patient_SP.fsh` | Patient search parameters |
| `JP_Organization_SP.fsh` | Organization search parameters |
| `JP_Coverage_SP.fsh` | Coverage search parameters |
| `JP_MedicationRequest_SP.fsh` | MedicationRequest search parameters |

### input/fsh/capabilitystatements/ (2 files)
| File | Contents |
|------|----------|
| `JP_Server_CapabilityStatement.fsh` | Server capability statement |
| `JP_Client_CapabilityStatement.fsh` | Client capability statement |

### input/fsh/examples/ (62 files)
Example instances for each profile, named `JP_{Profile}_Example.fsh`.

## input/pagecontent/ - IG Documentation Pages (20 files)
| File | Purpose |
|------|---------|
| `index.md` | IG homepage |
| `guidance.md` | General guidance |
| `guide-general.md` | General implementation guide |
| `guide-mustSupportCardinality.md` | MS and cardinality guide |
| `guide-handlingOfNonExistentData.md` | Missing data handling |
| `guide-characterEncoding.md` | Character encoding guide |
| `guide-stringSearch.md` | String search guide |
| `guide-precautions.md` | Precautions |
| `guide-urlmap.md` | URL mapping guide (OID→URL) |
| `group-administration.md` | Administration domain group |
| `group-medication.md` | Medication domain group |
| `group-diagnostic.md` | Diagnostic domain group |
| `group-clinical.md` | Clinical domain group |
| `group-workflow.md` | Workflow domain group |
| `group-fhircontents.md` | FHIR contents group |
| `group-searchParameter.md` | Search parameters group |
| `group-capabilityStatement.md` | Capability statements group |
| `security.md` | Security considerations |
| `download.md` | Download page |
| `update_history.md` | Update history |

## input/intro-notes/ - Profile Documentation (92 files)
Each profile has `-intro.md` (background/scope) and `-notes.md` (usage/implementation).
Naming: `StructureDefinition-{kebab-case-id}-intro.md` / `-notes.md`

## input/includes/ (3 files)
| File | Purpose |
|------|---------|
| `markdown-link-references.md` | Auto-generated markdown link references |
| `external-link-reference.md` | External link references |
| `url-version-headerNote.md` | URL version header note |

## input/images/ (5 PNG files)
Structure diagrams for Observation profiles (dental, endoscopy, microbiology, radiology).

## input/_resources/ (1 file)
| File | Purpose |
|------|---------|
| `exp-params.json` | Terminology expansion parameters |

## script/ - Utility Scripts (10 files)
| File | Purpose |
|------|---------|
| `markdownlink_creator.rb` | Generate markdown link references |
| `specialurls_creator.rb` | Update sushi-config.yaml special URLs |
| `fshalias_creator.rb` | Generate FSH aliases |
| `resourcelist_creator.rb` | Generate resource lists |
| `resource_publisher.rb` | Publish resources |
| `create_symbolic_link_from_file2url.rb` | Create symbolic links for URL mapping |
| `replaceUrls.py` | Replace URLs in files |
| `_all_aliases_refresh.bat` | Refresh all aliases |
| `_gencontinuous.bat/.sh` | Continuous build from script dir |

## docs/ - Development Documentation (9 files)
| File | Purpose |
|------|---------|
| `environment.md` | Development environment setup |
| `fishingrule.md` | FSH authoring rules |
| `githubflow.md` | Git workflow and branching strategy |
| `ig_rules.md` | IG authoring rules |
| `sushi-igpublisher.md` | SUSHI and IG Publisher guide |
| `template_intronotes.md` | Intro-notes template guide |
| `depended-jpcore.md` | Dependencies information |
| `for-release.md` | Release procedures |
| `release_rule.md` | Release rules |

## .specify/ - SpecKit Framework
| Path | Purpose |
|------|---------|
| `memory/constitution.md` | Project constitution (v1.1.2) |
| `memory/domain/diagnostics/dental.md` | Dental domain quality standards |
| `templates/*.md` | SpecKit templates (spec, plan, tasks, checklist, constitution) |
| `scripts/powershell/*.ps1` | SpecKit automation scripts |

## .github/ - GitHub Configuration
| Path | Purpose |
|------|---------|
| `workflows/develop.yaml` | CI for develop branch |
| `workflows/main.yaml` | CI for main branch |
| `ISSUE_TEMPLATE/*.md` | Issue templates (bug, request, public comment) |
| `pull_request_template.md` | PR template |

## custom-template/ - IG Publisher Template
Custom Jekyll template for Japanese-localized IG Publisher output.
Contains: config.json, content/, includes/, layouts/, liquid/, package/, scripts/

## docker/ - Docker Configuration
| File | Purpose |
|------|---------|
| `Dockerfile` | IG build container |
| `docker-compose.yml` | Docker compose config |
| `entrypoint.sh` | Container entrypoint |

## other/ - Static Assets
`other/assetsOfIndex/` - CSS, JS, fonts, images for historical index page.

## forPackageRelease/ - Release Packages
FHIR package JSON files (diff and snapshot) for distribution.

## terminologies_external/ - External Terminologies
External CodeSystem and ValueSet definitions (cs/, vs/, example-CS-VS/ subdirectories).

## File Statistics
| Category | Count |
|----------|-------|
| FSH Profiles & Extensions | 64 |
| FSH Examples | 62 |
| FSH Terminologies | 41 |
| FSH Search Parameters | 4 |
| FSH Capability Statements | 2 |
| FSH Root Files (aliases, rulesets, etc.) | 7 |
| **Total FSH Files** | **180** |
| Intro-notes Documentation | 92 |
| Page Content | 20 |
| Development Docs | 9 |
| Scripts (Ruby/Python/Bash/Bat) | 10 |
| SpecKit Templates | 6 |
| SpecKit Scripts | 5 |
| CI/CD Workflows | 2 |
