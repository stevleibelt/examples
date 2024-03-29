#!/usr/bin/env pwsh
####
# Enum example
####
# @see
#   https://arcanecode.com/2021/12/14/fun-with-powershell-classes-the-basics/
#   https://adamtheautomator.com/powershell-classes/
#   https://arcanecode.com/2022/02/07/fun-with-powershell-classes-static-properties-and-methods/
#   https://arcanecode.com/2022/02/14/fun-with-powershell-classes-overloading/
#   https://arcanecode.com/2022/02/21/fun-with-powershell-classes-constructors/
# @since 2021-12-15
# @author stev leibelt <artodeto@bazzline.net>
####

class MyClass
{
    #bo properties
    [string]$Name
    [string]$DefaultValue = 'There is no foo without a bar'
    #eo properties

    #bo function
    #constructors are optional and you can overload them
    MyClass() {}
    MyClass([string] $Name)
    {
        $this.SetName($Name)
    }
    #first declares the return type, no return? just use [void]
    [string] GetName()
    {
        return $this.Name
    }

    [void] OutputName()
    {
        Write-Host $this.Name
    }

    #as you see, you can overload a function
    [void] SetName([string] $Name)
    {
        $this.Name = $Name
    }

    [void] SetName([string] $FirstName, [string] $LastName)
    {
        $this.Name = ($FirstName + " " + $LastName)
    }
    #eo function
}

#Inheritance is working
class MyOtherClass : MyClass
{
    [int] $Id
    hidden [int] $MySecretId
    static [int] $MaximumId = 999

    MyOtherClass ([string] $Name, [int] $Id)
    {
        $this.Id = $Id
        $this.SetName($Name)
    }

    [int] GetId()
    {
        return $this.Id
    }

    [void] DoFoo()
    {
        Write-Host ":: there is no foo without a bar."
    }

    static [void] DoBar([string] $Text = 'there is no bar without a foo')
    {
        #you can not use $this
        Write-Host $(":: ${Text}.")
    }
}

$MyClass = [MyClass]::new()
$MyOtherClass = [MyOtherClass]::new('Artodeto', 750)

$MyClass.Name = 'Foobar'
Write-Host ":: Outputting class property values of Name and DefaultValue."
Write-Host $("   >>" + $MyClass.Name + "<<.")
Write-Host $("   >>" + $MyClass.DefaultValue + "<<.")

Write-Host ""
Write-Host ":: Using method calls to access properties."
$MyClass.SetName("Baz")
Write-Host $("   >>" + $MyClass.GetName() + "<<.")

Write-Host ""
Write-Host ":: Using the extended class."
Write-Host $("   >>" + $MyOtherClass.GetId() + "<<.")
Write-Host $("   >>" + $MyOtherClass.GetName() + "<<.")
Write-Host $("   >>" + [MyOtherClass]::MaximumId + "<<.")
$MyOtherClass.DoFoo()
[MyOtherClass]::DoBar
