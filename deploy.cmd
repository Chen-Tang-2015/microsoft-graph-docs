 +@if "%SCM_TRACE_LEVEL%" NEQ "4" @echo off

:: ----------------------
:: KUDU Deployment Script
:: Version: 0.2.2
:: ----------------------

:: Prerequisites
:: -------------

:: Verify node.js installed
where node 2>nul >nul
IF %ERRORLEVEL% NEQ 0 (
  echo Missing node.js executable, please install node.js, if already installed make sure it can be reached from current environment.
  goto error
)

:: Setup
:: -----

setlocal enabledelayedexpansion

SET ARTIFACTS=%~dp0%..\artifacts

IF NOT DEFINED DEPLOYMENT_SOURCE (
  SET DEPLOYMENT_SOURCE=%~dp0%.
)

IF NOT DEFINED DEPLOYMENT_TARGET (
  SET DEPLOYMENT_TARGET=%ARTIFACTS%\wwwroot\GraphDocuments
)

IF NOT DEFINED DEPLOYMENT_TEMPLATE (
  SET DEPLOYMENT_TARGET=%ARTIFACTS%\wwwroot\MD\office-content-pr\rest-api\Microsoft.Graph\html-template
)

IF NOT DEFINED MSBUILD_PATH (
  SET APIDOCS_PATH=%ARTIFACTS%\wwwroot\MD\apidocs\apidocs.exe
)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Deployment
:: ----------

echo Handling md file to html file publish.

call :ExecuteCmd %APIDOCS_PATH% publish --format mustache --path %DEPLOYMENT_SOURCE% --output %DEPLOYMENT_TARGET% --template %DEPLOYMENT_TEMPLATE%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:exitFromFunction
()

:end
endlocal
echo Finished successfully. 