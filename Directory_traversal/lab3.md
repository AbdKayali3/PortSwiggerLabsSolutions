# File path traversal, traversal sequences stripped non-recursively
- Name: File path traversal, traversal sequences stripped non-recursively
- URL: https://portswigger.net/web-security/file-path-traversal/lab-sequences-stripped-non-recursively
- Level: Medium Time: 1 min
---------------------------------------------------------------------------------


## Solution
1. Find an image.
2. Edit the Source Path for it to add `...//...//...//` which means the normal `../../../` in a normal envirument
3. Then add the `/etc/passwd` to it like the next: `/image?filename=...//...//...//etc/passwd`