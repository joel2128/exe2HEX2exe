# Function to convert HEX back to EXE
def hex_to_exe(hex_file_path, output_exe_file):
    try:
        # Open the hex file and read the hex string
        with open(hex_file_path, 'r') as hex_file:
            hex_data = hex_file.read()

        # Convert the hex string back to binary data
        exe_data = bytes.fromhex(hex_data)

        # Write the binary data to an output .exe file
        with open(output_exe_file, 'wb') as exe_file:
            exe_file.write(exe_data)

        print(f"Decoding successful! Output saved to {output_exe_file}")
    except FileNotFoundError:
        print(f"Error: File {hex_file_path} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Ask user for input and output file paths
hex_file_path = input("Please enter the path to the HEX file: ")
output_exe_file = input("Please enter the path to save the output EXE file: ")

# Call the function with the provided input
hex_to_exe(hex_file_path, output_exe_file)
