@ECHO OFF
SET publisher_jar=publisher.jar
SET input_cache_path=%CD%\input-cache

ECHO Checking internet connection...
PING tx.fhir.org -4 -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET txoption=-tx n/a
GOTO igpublish

:isonline
ECHO We're online
REM SET txoption=-tx https://tx.jpfhir.jp:8081 

:igpublish

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%publisher_jar%" (
REM	JAVA -jar "%input_cache_path%\%publisher_jar%" -ig ig.ini -tx n/a
	JAVA -jar "%input_cache_path%\%publisher_jar%" -ig ig.ini
) ELSE If exist "..\%publisher_jar%" (
REM JAVA -jar "..\%publisher_jar%" -ig ig.ini -tx n/a
	JAVA -jar "..\%publisher_jar%" -ig ig.ini
) ELSE (
	ECHO IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
)

PAUSE
