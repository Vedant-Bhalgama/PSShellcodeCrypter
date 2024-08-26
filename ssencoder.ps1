Function Get-HexFormat {
    param($shellcode_bytes, $shellcode_array)
    foreach ($bytes in $shellcode_bytes){
        $new_hex_chars = "0x{0:X2}" -f $bytes
        $shellcode_array += $new_hex_chars
    }
    
    $joined_shellcode_array = $shellcode_array -join ","
    return "($joined_shellcode_array)"
}

Function Encode-Shellcode {

    <#
    .SYNOPSIS 
    A simple shellcode encoder in PS

    .DESCRIPTION
    This simple tool can be used to encode your shellcode, the encoding process is as follows 
    1. Get the shellcode in hex format and convert it to decimal.
    2. Left or Right shift the decimal bytes by the amount of times specified by the user 
    3. Increment the bytes by the amount of times specified by the user 
    4. Convert the new decimal bytes into hex format and print out the new shellcode

    .PARAMETER OriginalShellcode
    Specify the original shellcode to encode 
    
    .PARAMETER ShiftPosition
    Specify the amount of times to shift the bits by

    .OUTPUTS
    Encoded shellcode in hex format will be printed 

    .EXAMPLE
    PS> Encode-Shellcode -OriginalShellcode 0x6F -ShiftSide Right -ShiftPosition 3
    PS> Encode-Shellcode OriginalShellcode 111 -ShiftSide Right -ShiftPosition 3
    
    #>
    
    [CmdLetBinding()]
    param([Parameter(Mandatory=$True, Position=0)]$OriginalShellcode,[Parameter(Mandatory=$True, Position=1)][Int]$ShiftPosition, [String]$WriteToFile)
    $new_shellcode_bytes = @()
    $new_shellcode = @()

    try{
        foreach($byte in $OriginalShellcode) {
            $shift_byte = $byte -shl $ShiftPosition
            $incremented_shift_byte = ++$shift_byte
            $new_shellcode_bytes += $incremented_shift_byte
        }
        $final_shellcode = (Get-HexFormat -shellcode_bytes $new_shellcode_bytes -shellcode_array $new_shellcode)
        if ($WriteToFile) {
            $file_out = "Encoded Shellcode : " + $final_shellcode
            Add-Content -Path $WriteToFile -Value $file_out 
            Write-Host -f Green "[!] Shellcode written to $WriteToFile!"
        }
        else {
            Write-Host "Encoded shellcode : $final_shellcode"
        }

    } catch {
        Write-Host -f red $_
    }

}
