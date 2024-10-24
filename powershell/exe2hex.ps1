# Function to convert EXE to HEX
function Convert-ExeToHex {
    param (
        [string]$exeFilePath,  # Path to the .exe file
        [string]$outputHexFile # Path to the output .txt file
    )

    try {
        # Read the .exe file as bytes
        $exeBytes = [System.IO.File]::ReadAllBytes($exeFilePath)

        # Convert each byte to its hex equivalent
        $hexString = -join ($exeBytes | ForEach-Object { $_.ToString("X2") })

        # Write the hex string to the output file
        [System.IO.File]::WriteAllText($outputHexFile, $hexString)

        Write-Host "Hexadecimal conversion successful! Output saved to $outputHexFile"
    } catch {
        Write-Host "Error: $($_.Exception.Message)"
    }
}

# Prompt user for EXE to HEX conversion
$exeFilePath = Read-Host "Please enter the path to the EXE file"
$outputHexFile = Read-Host "Please enter the path to save the output HEX file"
Convert-ExeToHex -exeFilePath $exeFilePath -outputHexFile $outputHexFile

