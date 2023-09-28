@echo off
cls

set EFD_HOME="/h/efd_ss"
set JAVA_HOME=%EFD_HOME%\jre

set HOME_JAVA="%JAVA_HOME%\bin\java"
set ARG_MEMORY=-Xms128m -Xmx196m
set PROP_POLICY=-D_rcp_.policy.extended=true
set MAIN_JAR=rc15ktl.jar

set _CMD_=%HOME_JAVA% %ARG_MEMORY% %PROP_POLICY% -jar %MAIN_JAR%

@echo %_CMD_%
%_CMD_%