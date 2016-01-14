:: Setup
:: -----

setlocal enabledelayedexpansion

SET SITE=%~dp0%..

SET DEPLOYMENT_SOURCE=%~dp0%..\repository

SET DEPLOYMENT_TARGET=%SITE%\wwwroot\GraphDocument

SET DEPLOYMENT_TEMPLATE=%SITE%\wwwroot\MD\office-content-pr\rest-api\Microsoft.Graph\html-template

SET APIDOCS_PATH=%SITE%\wwwroot\MD\apidocs\apidocs.exe

:ExecuteCmd
setlocal
set _CMD_=%*
call %_CMD_%
if "%ERRORLEVEL%" NEQ "0" echo Failed exitCode=%ERRORLEVEL%, command=%_CMD_%
exit /b %ERRORLEVEL%


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Deployment
:: ----------

echo start to transfer md to html and copy to GraphDocuments folder

call :ExecuteCmd %APIDOCS_PATH% publish --format mustache --path %DEPLOYMENT_SOURCE% --output %DEPLOYMENT_TARGET% --template %DEPLOYMENT_TEMPLATE%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:exitFromFunction
()

:end
endlocal
echo Finished successfully. 