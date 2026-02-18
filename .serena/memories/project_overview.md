# JP Core v1.x - Project Overview

## Purpose
Japanese FHIR Implementation Guide (IG) for healthcare interoperability.
Defines Japan-specific FHIR R4.0.1 profiles, extensions, and terminology for standardized medical data exchange.

## Tech Stack
- **FSH (FHIR Shorthand)**: Domain-specific language for FHIR definitions
- **SUSHI**: FSH compiler → FHIR JSON resources
- **HL7 IG Publisher**: Generates HTML implementation guide (requires Java 8/11/17)
- **Jekyll**: Static site generation for documentation
- **Ruby**: Utility scripts (link generation, URL management)
- **Python**: URL replacement scripts
- **Node.js**: SUSHI runtime
- **Git/GitHub**: Version control with GitHub Actions CI/CD

## Base Standard
- FHIR R4.0.1
- External dependency: jpfhir-terminology.r4 v1.3.0+

## Development Platform
- Windows (primary), Linux/macOS supported
- Recommended memory: 12GB (Java heap: -Xmx12G)
- Network required for terminology validation (tx.fhir.org)

## Governance
- Constitution: `.specify/memory/constitution.md` (v1.1.2)
- Branch strategy: main (production) → develop (main dev) → feature branches
- Feature branch naming: `feature/swg[1-6]-(description)`
