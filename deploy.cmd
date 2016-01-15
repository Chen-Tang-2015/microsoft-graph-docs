:: Setup
:: -----

setlocal enabledelayedexpansion

SET SITE=%~dp0%..

SET DEPLOYMENT_SOURCE=%SITE%\repository

SET DEPLOYMENT_TARGET=%SITE%\wwwroot\GraphDocuments

SET DEPLOYMENT_TEMPLATE=%SITE%\wwwroot\MD\office-content-pr\rest-api\Microsoft.Graph\html-template

SET APIDOCS_PATH=%SITE%\wwwroot\MD\apidocs

%APIDOCS_PATH%\apidocs.exe publish --path %DEPLOYMENT_SOURCE% --output %DEPLOYMENT_TARGET% --template %DEPLOYMENT_TEMPLATE% --format mustache

MOVE /Y  %DEPLOYMENT_TARGET%\*.css  %SITE%\wwwroot\GraphStyles 
