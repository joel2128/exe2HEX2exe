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

# Prompt user for EXE to HEX conversion
$exeFilePath = Read-Host "Please enter the path to the EXE file"
$outputHexFile = Read-Host "Please enter the path to save the output HEX file"
Convert-ExeToHex -exeFilePath $exeFilePath -outputHexFile $outputHexFile

# Prompt user for HEX to EXE conversion
$hexFilePath = Read-Host "Please enter the path to the HEX file"
$outputExeFile = Read-Host "Please enter the path to save the output EXE file"
Convert-HexToExe -hexFilePath $hexFilePath -outputExeFile $outputExeFile





# # Function to convert EXE to HEX
# function Convert-ExeToHex {
#     param (
#         [string]$exeFilePath,  # Path to the .exe file
#         [string]$outputHexFile # Path to the output .txt file
#     )

#     try {
#         # Read the .exe file as bytes
#         $exeBytes = [System.IO.File]::ReadAllBytes($exeFilePath)

#         # Convert each byte to its hex equivalent
#         $hexString = -join ($exeBytes | ForEach-Object { $_.ToString("X2") })

#         # Write the hex string to the output file
#         [System.IO.File]::WriteAllText($outputHexFile, $hexString)

#         Write-Host "Hexadecimal conversion successful! Output saved to $outputHexFile"
#     } catch {
#         Write-Host "Error: $($_.Exception.Message)"
#     }
# }

# # Function to convert HEX back to EXE
# function Convert-HexToExe {
#     param (
#         [string]$hexFilePath,  # Path to the .txt file containing the hex string
#         [string]$outputExeFile # Path to the output .exe file
#     )

#     try {
#         # Read the hexadecimal string from the input file
#         $hexString = Get-Content $hexFilePath -Raw

#         # Split the hex string into byte pairs (each 2 characters = 1 byte)
#         $byteArray = for ($i = 0; $i -lt $hexString.Length; $i += 2) {
#             [Convert]::ToByte($hexString.Substring($i, 2), 16)
#         }

#         # Write the byte array to the output .exe file
#         [System.IO.File]::WriteAllBytes($outputExeFile, $byteArray)

#         Write-Host "Decoding successful! Output saved to $outputExeFile"
#     } catch {
#         Write-Host "Error: $($_.Exception.Message)"
#     }
# }

# # Example Usage:
# # To convert EXE to HEX
# Convert-ExeToHex -exeFilePath "your_exe_file.exe" -outputHexFile "output_hex.txt"

# # To convert HEX back to EXE
# Convert-HexToExe -hexFilePath "output_hex.txt" -outputExeFile "restored_exe_file.exe"
