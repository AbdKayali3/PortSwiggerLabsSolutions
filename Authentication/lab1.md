# Username enumeration via different responses
- Name: Username enumeration via different responses
- URL: https://portswigger.net/web-security/authentication/password-based/lab-username-enumeration-via-different-responses
- Level: Easy Time: 5 min
- Objective: enumerate a valid username, brute-force this user's password, then access their account page
---------------------------------------------------------------------------------


## Solution
1. Open the Login page.
2. Enumerate the username by using the provided list of usernames.
3. notice that the response is different when the username is valid or invalid.
4. Brute-force the password for the valid username wit the provided list of passwords.
5. The username is `apple` and the password is `maggie`.


Note: I used a manual approach here instead of using burbsuite as PortSwigger suggested.