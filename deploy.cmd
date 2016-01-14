:: Setup
:: -----

setlocal enabledelayedexpansion

SET SITE=%~dp0%..

SET DEPLOYMENT_SOURCE=%~dp0%.

SET DEPLOYMENT_TARGET=%SITE%\wwwroot\GraphDocuments

SET DEPLOYMENT_TEMPLATE=%SITE%\wwwroot\MD\office-content-pr\rest-api\Microsoft.Graph\html-template

SET APIDOCS_PATH=%SITE%\wwwroot\MD\apidocs\apidocs.exe


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Deployment
:: ----------

echo start to transfer md to html and copy to GraphDocuments folder

%APIDOCS_PATH% publish --format mustache --path %DEPLOYMENT_SOURCE%\content --output %DEPLOYMENT_TARGET% --template %DEPLOYMENT_TEMPLATE%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:exitFromFunction
()

:end
endlocal
echo Finished successfully. 