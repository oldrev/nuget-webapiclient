@echo off
"C:\Program Files (x86)\MSBuild\14.0\Bin\MsBuild.exe" WebApiClient.sln /t:Clean,Build /p:Configuration=Release;SignAssembly=true;AssemblyOriginatorKeyFile=R:\Software\Sinch\dotNetSDKCodeSigningCert\dotNetSDKCodeSigningCert.snk
set BUILD_STATUS=%ERRORLEVEL%
if %BUILD_STATUS%==0 (
cd src\Sinch.WebApiClient 
nuget pack
cd ..\..
)
if not %BUILD_STATUS%==0  echo Build failed.  NuGet package not created.