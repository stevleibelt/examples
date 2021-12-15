#!/usr/bin/env pwsh
####
# Enum example
####
# @see
#   https://arcanecode.com/2021/12/14/fun-with-powershell-classes-the-basics/
#   https://adamtheautomator.com/powershell-classes/
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
    [int]hidden $MySecretId
    [int]static $MaximumId = 999

    MyOtherClass ([string] $Name, [int] $Id)
    {
        $this.Id = $Id
        $this.SetName($Name)
    }

    [int] GetId()
    {
        return $this.Id
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
