function New-VULTRRandomPassword {
    <#
        .SYNOPSIS
        Create a new random password
    #>
    [CmdletBinding()]
    Param (
        [int]$Length = 12
    )

    Process {
        $validCharacters = "abcdefghijklmnopqrstuvwxyz"
        $validCharacters += $validCharacters.ToUpper()
        $validCharacters += "1234567890"
        $validCharacters = $validCharacters.ToCharArray() | ForEach-Object { "$_" }

        $password = ""
        for ($i = 0; $i -lt $Length; $i++) {
            $password += Get-Random $validCharacters
        }

        $password = $password -join ""
        $password
    }
}
