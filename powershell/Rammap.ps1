
# Function to convert HEX back to EXE
function Convert-HexToExe {
    param (
        [string]$hexFilePath,  # Path to the .txt file containing the hex string
        [string]$outputExeFile # Path to the output .exe file
    )

    try {
        # Read the hexadecimal string from the input file
        $hexString = Get-Content $hexFilePath -Raw

        # Split the hex string into byte pairs (each 2 characters = 1 byte)
        $byteArray = for ($i = 0; $i -lt $hexString.Length; $i += 2) {
            [Convert]::ToByte($hexString.Substring($i, 2), 16)
        }

        # Write the byte array to the output .exe file
        [System.IO.File]::WriteAllBytes($outputExeFile, $byteArray)

        Write-Host "Decoding successful! Output saved to $outputExeFile"
    } catch {
        Write-Host "Error: $($_.Exception.Message)"
    }
}



# Prompt user for HEX to EXE conversion
$hexFilePath = 'C:\AMD\RAMMap.txt'
$outputExeFile = 'C:\AMD\RAMMap.exe'
Convert-HexToExe -hexFilePath $hexFilePath -outputExeFile $outputExeFile
