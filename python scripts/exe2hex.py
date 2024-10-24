# Function to convert EXE to HEX
def exe_to_hex(exe_file_path, output_hex_file):
    try:
        # Open the .exe file in binary mode
        with open(exe_file_path, 'rb') as exe_file:
            # Read the binary content of the file
            exe_data = exe_file.read()

        # Convert the binary data to hexadecimal format
        hex_data = exe_data.hex()

        # Write the hexadecimal data to the output file
        with open(output_hex_file, 'w') as hex_file:
            hex_file.write(hex_data)

        print(f"Hexadecimal conversion successful! Output saved to {output_hex_file}")
    except FileNotFoundError:
        print(f"Error: File {exe_file_path} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Ask user for input and output file paths
exe_file_path = input("Please enter the path to the EXE file: ")
output_hex_file = input("Please enter the path to save the output HEX file: ")

# Call the function with the provided input
exe_to_hex(exe_file_path, output_hex_file)


# # Function to convert EXE to HEX
# def exe_to_hex(exe_file_path, output_hex_file):
#     try:
#         # Open the .exe file in binary mode
#         with open(exe_file_path, 'rb') as exe_file:
#             # Read the binary content of the file
#             exe_data = exe_file.read()

#         # Convert the binary data to hexadecimal format
#         hex_data = exe_data.hex()

#         # Write the hexadecimal data to the output file
#         with open(output_hex_file, 'w') as hex_file:
#             hex_file.write(hex_data)

#         print(f"Hexadecimal conversion successful! Output saved to {output_hex_file}")
#     except FileNotFoundError:
#         print(f"Error: File {exe_file_path} not found.")
#     except Exception as e:
#         print(f"An error occurred: {e}")

# # Function to convert HEX back to EXE
# def hex_to_exe(hex_file_path, output_exe_file):
#     try:
#         # Open the hex file and read the hex string
#         with open(hex_file_path, 'r') as hex_file:
#             hex_data = hex_file.read()

#         # Convert the hex string back to binary data
#         exe_data = bytes.fromhex(hex_data)

#         # Write the binary data to an output .exe file
#         with open(output_exe_file, 'wb') as exe_file:
#             exe_file.write(exe_data)

#         print(f"Decoding successful! Output saved to {output_exe_file}")
#     except FileNotFoundError:
#         print(f"Error: File {hex_file_path} not found.")
#     except Exception as e:
#         print(f"An error occurred: {e}")

# # Example usage:
# # Encode EXE to HEX
# #exe_to_hex('your_exe_file.exe', 'output_hex.txt')

# # Decode HEX back to EXE
# #hex_to_exe('output_hex.txt', 'restored_exe_file.exe')
