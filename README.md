# PSShellcodeCrypter
My first and a simple PowerShell script which can be used to XOR encrypt your shellcode!


## Installation and Usage:
  ### Installation : 
  1. Clone the repository using : `git clone https://github.com/Vedant-Bhalgama/PSShellcodeCrypter`
  2. Open up Powershell and import the script in it using : `Import-Module .\ssencrypt.ps1`

  ### Usage :
  1. Using `XOR-Encrypt` :
     
     - XOR-Encrypt supported parameters :
       - `-OriginalShellcode` :
          - Specify the original shellcode in an array to encrypt
       - `-Key` :
          - Specify the key to use in XOR encryption of the shellcode
       - `-WriteToFile` :
          - If you wish to output the encrypted shellcode to a file, specify this parameter along with the file name (Encrypted shellcode will be outputted in C usable format)

<img width="823" alt="image" src="https://github.com/user-attachments/assets/56dcba43-e34f-4302-b7b4-2e9279d0647c">

  2. Using `XOR-Decrypt` :

     - XOR-Encrypt supported parameters :
       - `-EncryptedShellcode` :
          - Specify the encrypted shellcode in an array to decrypt
       - `-Key` :
          - Specify the key to use in XOR decryption of the shellcode

<img width="855" alt="image" src="https://github.com/user-attachments/assets/c8eedd5b-2a37-4a08-8a14-a66d7d173119">


## Examples :
  ### XOR Encrypting a shellcode generated using MSFVenom :
  
  - The shellcode is stored in an array named `$shellcode`, generated using MSFVenom (`msfvenom -p windows/x64/shell_reverse_tcp LHOST=127.0.0.1 LPORT=443 -f csharp`)

<img width="1052" alt="image" src="https://github.com/user-attachments/assets/15a18733-2185-49b1-b4f0-a65975b9a0fc">

  - Another example but encrypted shellcode is written to a file using `-WriteToFile`

<img width="812" alt="image" src="https://github.com/user-attachments/assets/6d4786c5-2919-47ba-bb52-fba080306658">

 <img width="1234" alt="image" src="https://github.com/user-attachments/assets/11132881-12ec-47d8-bd84-380451805e01">

  
