:: Setup
:: -----

setlocal enabledelayedexpansion

IF NOT DEFINED SITE (
  SET SITE=%~dp0%..
)

IF NOT DEFINED DEPLOYMENT_SOURCE (
  SET DEPLOYMENT_SOURCE=%SITE%\repository
)

IF NOT DEFINED DEPLOYMENT_TARGET (
  SET DEPLOYMENT_TARGET=%SITE%\wwwroot\GraphDocuments
)

IF NOT DEFINED DEPLOYMENT_TEMPLATE (
  SET DEPLOYMENT_TEMPLATE=%SITE%\wwwroot\MD\office-content-pr\rest-api\Microsoft.Graph\html-template
)

IF NOT DEFINED APIDOCS_PATH (
  SET APIDOCS_PATH=%SITE%\wwwroot\MD\apidocs
)

%APIDOCS_PATH%\apidocs.exe publish --path %DEPLOYMENT_SOURCE% --output %DEPLOYMENT_TARGET% --template %DEPLOYMENT_TEMPLATE% --format mustache

MOVE /Y  %DEPLOYMENT_TARGET%\*.css  %SITE%\wwwroot\GraphStyles 
