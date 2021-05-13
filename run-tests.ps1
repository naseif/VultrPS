<#
    Execute all unit tests
#>
Import-Module Pester -RequiredVersion 5.2.0
$filesToCover = (Get-ChildItem .\VultrPS -File -Recurse -Include *.ps1) | Select-object -ExpandProperty Fullname
Invoke-Pester -Path "./Tests" -CodeCoverage $filesToCover