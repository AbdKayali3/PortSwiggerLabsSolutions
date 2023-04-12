# File path traversal, validation of file extension with null byte bypass
- Name: File path traversal, validation of file extension with null byte bypass
- URL: https://portswigger.net/web-security/file-path-traversal/lab-validate-file-extension-null-byte-bypass
- Level: Medium Time: 1 min
- Objective: retrieve the contents of the `/etc/passwd` file.
---------------------------------------------------------------------------------


## Solution
1. Find an image.
2. We usually add `../../../etc/passwd` right away but in here it will not work because the server will check for the file extension.
3. Instead we will add a null byte at the end of the file path like the next: `/image?filename=../../../etc/passwd%00.png`
