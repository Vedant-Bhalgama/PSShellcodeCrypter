Function XOR-Encrypt {
<#
    .SYNOPSIS
    A simple PS script which can be used to XOR encrypt a shellcode

    .DESCRIPTION 
    This simple PS script can be used to XOR encrypt a shellcode, and if needed, can be written into a file in the C usable format,
    Another function with the name XOR-Decrypt can be used to decrypt an existing XOR encrypted shellcode too

    .PARAMETER OriginalShellcode 
    Specify the original shellcode in an array to encrypt

    .PARAMETER Key
    Specify the key which will be used for XOR encrypting the shellcode 

    .PARAMETER WriteToFile
    If you wish to output the shellcode to a file (C usable format), specify this parameter along with the name of the file you wish to save in

    .EXAMPLE 
    PS> XOR-Encrypt 0xFC,0x48,0xD5 secretkee@123 

    PS> XOR-Encrypt 0xFC,0x48,0xD5 secretkee@123 -WriteToFile shellcode.out
#>


    [CmdletBinding()]
    param([Parameter(Mandatory=$True)]$OriginalShellcode, [Parameter(Mandatory=$True)]$Key, $WriteToFile)
    
    $XOREncryptedShellcode = @()
    $FormattedXOREncShcode = @()

    for($i=0; $i -lt $OriginalShellcode.Length; $i++) {
        $XOREncryptedShellcode += $OriginalShellcode[$i] -bxor [Byte][Char]$Key[$i % $Key.Length]
    }

    foreach ($byte in $XOREncryptedShellcode) {
        $FormattedXOREncShcode += "0x{0:X}" -f $byte
    }

    $SizeOfShellcode = $XOREncryptedShellcode.Length
    $formatted = $FormattedXOREncShcode -join ","
    if($WriteToFile) {
        $write_shellcode = @"
    
char shellcode[$SizeOfShellcode] = {$formatted};

"@
        Set-Content -Path $WriteToFile -Value $write_shellcode
        Write-Host -f red "[!] Shellcode written to $WriteToFile!"

    } else {
        return "($formatted)"
    }

}

Function XOR-Decrypt {

<#
    .SYNOPSIS
    A simple PS script which can be used to XOR encrypt a shellcode

    .DESCRIPTION 
    This simple PS script can be used to XOR decrypt a shellcode, Another function with the name XOR-Encrypt can be used to XOR encrypt a shellcode too

    .PARAMETER EncryptedShellcode 
    Specify the Encrypted shellcode in an array to encrypt

    .PARAMETER Key
    Specify the key which will be used for XOR decrypting the shellcode 

    .EXAMPLE 
    PS> XOR-Decrypt 0xBD,0xD2,0xFD secretkee@123 

#>

    [CmdletBinding()]
    param([Parameter(Mandatory=$True)]$EncryptedShellcode, [Parameter(Mandatory=$True)]$Key)
    
    $XORDecryptedShellcode = @()
    $FormattedDecryptedShellcode = @()

    for($i=0; $i -lt $EncryptedShellcode.Length; $i++) {
        $XORDecryptedShellcode += $EncryptedShellcode[$i] -bxor [Byte][Char]$Key[$i % $Key.Length]
    }

    foreach ($byte in $XORDecryptedShellcode) {
        $FormattedDecryptedShellcode += "0x{0:X}" -f $byte
    }

    $formatted = $FormattedDecryptedShellcode -join ","
    return "($formatted)"

}
