# PSShellcodeEncoder
My first and a simple powershell script which can be used to encode your shellcode!

## Encoding Process 
- The encoding process used is very simple (as of now, will be upgrading it in the future) :
  -  Bitwise right shift operator is used on the original shellcode which will move the bits by the user specified amount
  -  The shifted bytes are then incremented by 1
  -  The shellcode is then finally printed out in hex format
 
## Installation and Usage :
  ### Installation : 
  1. Clone the repository using : `git clone https://github.com/Vedant-Bhalgama/PSShellcodeEncoder`
  2. Open up Powershell and import the script in it using : `Import-Module .\ssencoder.ps1`

  ### Usage : 
  #### Command help and syntax
  <img width="803" alt="image" src="https://github.com/user-attachments/assets/0eefa615-1a10-4921-8f7d-899b00823b94">
  
  - Specify original shellcode using the `-OriginalShellcode` parameter and the number of bits to shift by using the `-ShiftPosition` parameter.
  - If you want to write the shellcode to a file, Specify the `-WriteToFile` parameter along with the filename where you want to store it into
  

## Example Usage :
  ### Encoding of a shellcode generated via msfvenom :
  <img width="876" alt="image" src="https://github.com/user-attachments/assets/f871a18d-935b-466b-9f05-b492141357ad">

  - The shellcode generated is stored in the `$shellcode` variable (`windows/x64/shell_reverse_tcp`). The amount of bits to shift by is set to 2
  ### Encoding of a shellcode generated via msfvenom but stored locally : 
  <img width="878" alt="image" src="https://github.com/user-attachments/assets/0e6a749d-dea5-4d6d-9647-f30a46a9cb13">
  
  - Similar as above but the shellcode is stored in a file on-disk
