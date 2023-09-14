SET fhir_dir=%SystemDrive%\\USERS\\%USERNAME%\\.fhir
ECHO %fhir_dir%
IF NOT EXIST %fhir_dir% (
    MKDIR %fhir_dir%
)

REM package download
SET dlpkgurl=https://jpfhir.jp/fhir/fhir_dotFHIR_packages.tgz
SET localpkg=.\\temp\\fhir_dotFHIR_packages.tgz

REM CURL %dlpkgurl% > %localpkg%
tar -xvzf %localpkg% -C %fhir_dir%

REM terminlogy download
SET dltermurl=https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology-1.1.1.tgz
SET localterm=.\\temp\\jpfhir-terminology-1.1.1.tgz
set term_dir=%fhir_dir%\\packages\\jpfhir-terminology#1.1.1

CURL %dltermurl% > %localterm%

IF NOT EXIST %term_dir% (
    MKDIR %term_dir%
)

tar -xvzf %localterm% -C %term_dir%

pause
