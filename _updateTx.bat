SET fhir_dir=%SystemDrive%\\USERS\\%USERNAME%\\.fhir
SET temp_dir=.\temp
ECHO %fhir_dir%
IF NOT EXIST %fhir_dir% (
    MKDIR %fhir_dir%
)

IF NOT EXIST %temp_dir% (
    MKDIR %temp_dir%
)

IF NOT EXIST %fhir_dir%\packages (
    GOTO download_package
)
SET /p clear="clear packeges?  (resouce and terminology) (Y/N) "
IF %clear:Y=Y%==Y (
    RMDIR /S /Q %fhir_dir%\packages
)

:download_package
SET /p dpkg="download packeges of resource? (Y/N) "
IF NOT %dpkg:Y=Y%==Y (
    GOTO download_terminology
)

SET dlpkgurl=https://jpfhir.jp/fhir/fhir_dotFHIR_packages.tgz
SET localpkg=.\\temp\\fhir_dotFHIR_packages.tgz

CURL %dlpkgurl% > %localpkg%
tar -xvzf %localpkg% -C %fhir_dir%

:download_terminology

SET /p dterm="download packeges of terminology? (Y/N) "
IF NOT %dterm:Y=Y%==Y (
    GOTO end
)
SET dltermurl=https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology-1.1.1.tgz
SET localterm=.\\temp\\jpfhir-terminology-1.1.1.tgz
set term_dir=%fhir_dir%\\packages\\jpfhir-terminology#1.1.1

CURL %dltermurl% > %localterm%

IF NOT EXIST %term_dir% (
    MKDIR %term_dir%
)

tar -xvzf %localterm% -C %term_dir%

:end
pause
