# 06 - SSL/TLS Configuration

## Overview

HTTPS was configured on the server using a Let's Encrypt SSL certificate. This ensures all communication between the user's browser and the web server is encrypted.

The SSL certificate is managed by Certbot and integrated directly into the Nginx web server configuration.

---

## Certificate Information

The installed certificate was verified using:

```bash
sudo certbot certificates
```

Output:

```text
Certificate Name: jithr.au
Key Type: ECDSA
Identifiers: jithr.au
Expiry Date: 2026-07-16
Certificate Path: /etc/letsencrypt/live/jithr.au/fullchain.pem
Private Key Path: /etc/letsencrypt/live/jithr.au/privkey.pem
```

---

## Certificate Files

Certificate files are stored within the Let's Encrypt directory structure:

```bash
sudo ls -la /etc/letsencrypt/live/jithr.au/
```

Output confirmed the presence of:

```text
cert.pem
chain.pem
fullchain.pem
privkey.pem
```

These files are symbolic links that point to the active certificate versions maintained by Certbot.

---

## Nginx SSL Configuration

The SSL configuration is defined within the Nginx virtual host file.

```bash
sudo grep -A 20 "listen 443" /etc/nginx/sites-available/jithr
```

Relevant configuration:

```nginx
listen 443 ssl;
listen [::]:443 ssl;

ssl_certificate /etc/letsencrypt/live/jithr.au/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/jithr.au/privkey.pem;
```

This configuration instructs Nginx to use the Let's Encrypt certificate when handling HTTPS requests.

---

## Certificate Validation

The certificate details were validated using OpenSSL.

```bash
echo | openssl s_client -connect jithr.au:443 -servername jithr.au 2>/dev/null | openssl x509 -noout -issuer -subject -dates
```

Output:

```text
issuer=C = US, O = Let's Encrypt, CN = E8
subject=CN = jithr.au

notBefore=Apr 17 00:23:32 2026 GMT
notAfter=Jul 16 00:23:31 2026 GMT
```

This confirms that the certificate was issued by Let's Encrypt and was valid at the time of testing.

---

## Certificate Renewal

Automatic renewal is handled by the Certbot Snap package.

```bash
sudo systemctl list-timers | grep certbot
```

Output:

```text
snap.certbot.renew.timer
```

This timer automatically performs certificate renewal checks to ensure the SSL certificate remains valid.

---

## Verification

HTTPS access was verified by connecting to:

```text
https://jithr.au
```

Successful SSL negotiation confirmed that encrypted HTTPS connections were functioning correctly.