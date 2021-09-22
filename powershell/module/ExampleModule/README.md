# Powershell Module

## Use

```
Register-PSRepository -Name "ExampleRepository" -SourceLocation . -InstallationPolicy Trusted
#publish as a nuget package
#Publish-Module -Name "ExampleModule" -Repository "ExampleRepository"
Import-Module -Name "ExampleModule" -Verbose

List-Values

Remove-Module -Name ExampleModule
Unregister-PSRepository -Name "ExampleRepository"
```

## Manifest

```
#create manifest
New-ModuleManifest -Path <path/to/the/manifest.psd1> -ModuleVersion "0.0.1" -Author "Your Name"

#check manifest
Test-ModuleManifest <path/to/the/manifest.psd1>

#load module
Import-Module .\manifest.psd1
```

# Links

* [How to write a powershell module manifest](https://docs.microsoft.com/de-de/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest?view=powershell-7.1) - 20210922
