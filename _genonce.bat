@ECHO OFF
SET publisher_jar=publisher.jar
SET input_cache_path=%CD%\input-cache

SET javaoption=-Duser.language=ja -Duser.country=JP -Djava.awt.headless=true
@REM SET javaoption= -Xmx12G -Duser.language=ja -Duser.country=JP -Djava.awt.headless=true
SET txoption=-tx n/a

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%publisher_jar%" (
	JAVA -jar %javaoption% "%input_cache_path%\%publisher_jar%" -ig . %txoption% %*
) ELSE If exist "..\%publisher_jar%" (
	JAVA -jar %javaoption% "..\%publisher_jar%" -ig . %txoption% %*
) ELSE (
	ECHO IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
)

PAUSE
