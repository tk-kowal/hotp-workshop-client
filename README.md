# HOTP Workshop
-------------------------------

## Workshop Overview

### Narrative


_______________ has asked you to log in to the _____________________ and disable the _______________ in order to prevent the _____________________ from ___________________. You navigate to the root directory and run `./sign_in` - the login utility comes up and prompts you for the username and password. You enter the super secure credentials that they provided you with... but... what's this!? It appears to be protected by two factor auth!

```
Username: admin
Password: pass
2FA Code: ??????
```

In order to sign in you'll also need a six digit one time password (OTP). You're not sure why you know this but you're positive that the shared secret the server uses to generate it's OTPs is `secret_key` and the counter value is `the number of 30 second intervals since the beginning of time` (actually since the UNIX epoch).

Given those two pieces of information, it's up to you to implement the algorithm described in [RFC 4226](https://tools.ietf.org/html/rfc4226). If done correctly, it will produce the same OTPs as the server which means you can use them to log in! Hurry!

### Getting Started

1. Clone this repository `git clone git@github.com:/tk-kowal/hotp-workshop-client.git`
2. Install dependencies `bundle`
3. Run tests `rspec spec` (You should see 14 failing specs)
4. Using the [RFC](https://tools.ietf.org/html/rfc4226) as a guide, and the failing tests to ensure correctness, implement the HOTP algorithm.
5. Once you have a working algorithm, use it to generate an OTP.
6. Use the OTP from step 5 to log in using the `./sign_in` script. (The OTP changes every 30 seconds so you may have to generate a new one)

### Notes

We've provided you with a working `HMAC SHA-1` implementation so no need to worry about that. You'll need to implement the `IntervalCounter` and its `#get()` method which should return the number of 30 second intervals since the unix epoch. You'll also need to implement the HOTP algorithm itself. It will use both the `IntervalTimer` and the `HMAC` implementation provided.

### Using A Language Other Than Ruby?

You'll have a bit more work ahead of you if you'd like to tackle this in another language. However, given the secret key and the definition of the `IntervalCounter` in this README - you can implement a working HOTP algorithm in any language you'd like. You'll likely want to port the test cases to your test framework of choice in order to ensure correctness of both your HMAC provider and `IntervalCounter`.
