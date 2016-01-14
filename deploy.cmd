:: Setup
:: -----

setlocal enabledelayedexpansion

SET SITE=%~dp0%..

SET DEPLOYMENT_SOURCE=%~dp0%..\repository

SET DEPLOYMENT_TARGET=%SITE%\wwwroot\GraphDocument

SET DEPLOYMENT_TEMPLATE=%SITE%\wwwroot\MD\office-content-pr\rest-api\Microsoft.Graph\html-template

SET APIDOCS_PATH=%SITE%\wwwroot\MD\apidocs

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Deployment
:: ----------

echo start to transfer md to html and copy to GraphDocuments folder

cd %SITE%\wwwroot\MD\apidocs
apidocs.exe publish --format mustache --path %DEPLOYMENT_SOURCE% --output %DEPLOYMENT_TARGET% --template %DEPLOYMENT_TEMPLATE%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:exitFromFunction
()

:end
endlocal
echo Finished successfully. 