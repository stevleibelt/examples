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
New-ModuleManifest -Path <path/to/the/manifest.psd1>`
    -ModuleVersion "0.0.1"`
    -Author "Your Name"`
    -RootModule <path/to/the/module.psm1`
    -Description "This is a description"
    -FunctionsToExport "First-Function",`
        "Second-Function"

#check manifest
Test-ModuleManifest <path/to/the/manifest.psd1>

#load module
Import-Module .\manifest.psd1
```

# Links

* [How to write a powershell module manifest](https://docs.microsoft.com/de-de/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest?view=powershell-7.1) - 20210922
* [How to organize your powershell functions into a module - Part 1](https://matthewjdegarmo.com/powershell/2020/07/28/how-to-organize-your-powershell-functions-into-a-module-part-1.html) - 20200728
* [How to organize your powershell functions into a module - Part 2](https://matthewjdegarmo.com/powershell/2020/08/03/how-to-organize-your-powershell-functions-into-a-module-part-2.html) - 20200803
