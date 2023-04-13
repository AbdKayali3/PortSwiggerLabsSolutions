# Username enumeration via subtly different responses
- Name: Username enumeration via subtly different responses
- URL: https://portswigger.net/web-security/authentication/password-based/lab-username-enumeration-via-subtly-different-responses
- Level: Medium Time: 5 min
- Objective: enumerate a valid username, brute-force this user's password, then access their account page
---------------------------------------------------------------------------------


## Solution
1. Open the Login page.
2. Use burbsuite intruder to enumerate the username by using the provided list of usernames.
3. notice that the response is a little bit different when the username is valid. (The error mesasge have 1 different character)
4. Brute-force the password for the valid username wit the provided list of passwords.
5. The username is `ai` and the password is `baseball`.


Note: From now on, using burbsuite is the best approach to solve the labs without wasting a lot of time.