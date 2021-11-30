#!/usr/bin/env pwsh
####
# Enum example
####
# @see
#   https://arcanecode.com/2021/11/15/fun-with-powershell-enums/
#   https://arcanecode.com/2021/11/29/more-fun-with-powershell-enums/
# @since 2021-11-16
# @author stev leibelt <artodeto@bazzline.net>
####

Enum MyRssFeedList
{
    Foo
    Bar
    BarFoo
}

Write-Host ":: List all defined enums."
[MyRssFeedList].GetEnumNames()

Write-Host ":: List all defined enums in a different way."
[MyRssFeedList].GetEnumNames() | ForEach-Object { "Key: {0}, Value: {1}" -f $_,[int]([MyRssFeedList]::$_) }

$Bar = "bar"
$Foo = [MyRssFeedList]::Foo

Write-Host ":: Showing examples of validity check."

[enum]::IsDefined(([MyRssFeedList]), $Bar)
[enum]::IsDefined(([MyRssFeedList]), $Foo)
