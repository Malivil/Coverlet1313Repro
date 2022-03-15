@echo off

REM Remove the existing test results
RMDIR ".\TestResults" /S /Q

REM Run the test and coverage
dotnet test /p:CollectCoverage=true /p:SkipAutoProps=true /p:CoverletOutputFormat=opencover /p:CoverletOutput="./TestResults/"

REM Remove the second generated format since we don't actually use it
DEL ".\TestResults\coverage.json" /Q

REM Generate the report
reportgenerator "-reports:.\TestResults\coverage.opencover.xml" "-targetdir:.\TestResults\Report"