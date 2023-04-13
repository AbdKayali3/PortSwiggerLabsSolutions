# Username enumeration via response timing
- Name: Username enumeration via response timing
- URL: https://portswigger.net/web-security/authentication/password-based/lab-username-enumeration-via-response-timing
- Level: Medium Time: 7 min
- Objective: enumerate a valid username, brute-force this user's password, then access their account page
---------------------------------------------------------------------------------


## Solution
1. Open the Login page.
2. Use burbsuite intruder to enumerate the username by using the provided list of usernames.
3. In here we should notice that the response is a little bit different when the username is valid.
4. we can use the columns `response received` and `response completed` to check the timing.
5. Brute-force the password for the valid username wit the provided list of passwords.
6. The username is `auction` and the password is `ashley`.