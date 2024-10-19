# OpenVPN hooks for Tunnelblick

This package provide example of configuration for automitizate 2FA code passing during OpenVPN connecting.
Autofill 2FA response code using 2FA secret stored in [Mac Keychain Access](https://support.apple.com/en-gb/guide/keychain-access/kyca1083/mac) 

## Instalation

1. Get your openvpn config from your company OpenVPN portal. You will receive *.ovpn file
2. Clone this repo. Save received *.ovpn (from step 1) in repo folder with path `client.tblk/config.ovpn` . (Note: Mac OS Finder should recognize `client.tblk` as package, for open it as folder Right CLick -> Show package content)
3. Import `client.tblk` as package configuration to [Tunnelblick](https://tunnelblick.net/).
4. Install [totp-keychain](https://github.com/moul/totp-keychain). It CLI tool for generate 2FA code. It stored secret in encrypted storage of KeyChain
>  brew install totp-keychain
5. You need to put 2FA secret into `totp-keychain`. Please read below in next section how to export your 2FA secret from popular 2FA apps.
> totp-keychain add my-openvpn SECRET_VALUE
6. Please check that you pur correct SECRET_VALUE. Call command and compare received one time codes from command response and your 2FA app.
> totp-keychain get my-openvpn
7. Now you can connect to your openvpn using Tunnelblick. One time code will be fill automatic by hook and `totp-keychain`. You need to put login and password (Tunnelblick provides feature for save it into encrypted storage).
8. Optional. It is better to encrypt your mac using FileVault.
9. Optional. If you use multiple OpenVPN config - please use different key insted of `my-openvpn` (change in commands above and in script `client.tblk/static-challenge-response.user.sh`)

# How to export you 2FA Secret prom popular application
## In your OpenVPN portal
Usually in your personal OpenVPN portla there is QR-code to add code to on your 2FA app.
Below this QR-code it should provide `your secret is: XXXXX` or you can decode QR-code by any QR-decoder.

## Google authenticator
Google authenticator is mobile 2FA client provided by Google.
Use QR export and decode it with [Google Authenticator secret extractor](https://github.com/krissrex/google-authenticator-exporter).
Note: you need key `totpSecret` for your VPN secret.
## Authly
It is useful Cloud 2FA client which save your 2FA secret in encrypted cloud storage. You will not loose your 2FA secret when you phone are broken or loosed.
For export secret use [Instruction](https://gist.github.com/gboudreau/94bb0c11a6209c82418d01a59d958c93) which describe how to connect to Application with Chrome debugger.

## Gauth
Gauth is browser based 2FA client. It has feature to export your Secrets in [Settings](https://gauth.apps.gbraad.nl/#settings)

