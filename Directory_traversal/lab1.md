# Blind SQL injection with conditional errors
- Name: Blind SQL injection with conditional errors
- URL: https://portswigger.net/web-security/file-path-traversal/lab-simple
- Level: Easy Time: 1 min
- Objective: retrieve the contents of the `/etc/passwd` file.
---------------------------------------------------------------------------------


## Solution
1. Find an image.
2. Edit the Source Path for it to: `../../../etc/passwd`