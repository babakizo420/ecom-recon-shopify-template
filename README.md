# ecom-recon-shopify-template
## Recon Report: Dormant Shopify Store (target-ecom-store.com)

🔍 A real-world recon walkthrough of an inactive Shopify e-commerce site using passive OSINT techniques only.  
All scans were performed on public endpoints. No login, intrusion, or exploitation.

---

## 🧠 Objective

Understand how much can be discovered about a target from passive recon alone.  
Target: `target-ecom-store.com`  
Status: ⚠️ Store unavailable — Shopify 402

---

## 🔧 Recon Steps

### 1. DNS TXT Records
```bash
dig txt target-ecom-store.com
    No TXT records

    Hosted on Google Domains (ns-cloud-d1)
```
### 2. SSL Certificate Inspection
```bash
openssl s_client -connect target-ecom-store.com:443

    ✅ Valid TLS certificate (Google Trust Services)

    ✅ Uses TLS 1.3, strong cipher suite

    ⏳ Expires in ~90 days

    No handshake errors
``` 
### 3. HTTP Headers + Status Check
```bash
curl -I https://target-ecom-store.com

    HTTP/2 402 Payment Required

    Powered by Shopify

    Headers show CSP, HSTS, Cloudflare, etc.

    Indicates paused or inactive storefront
```
4. Tech Fingerprinting
```bash
whatweb https://target-ecom-store.com

    Shopify detected

    Cloudflare CDN

    HTML5 + jQuery

    Hosted in Canada
```
🎯 Conclusion

Even "offline" stores leak:

    TLS metadata

    Hosting and CDN info

    Shopify-specific headers

    Useful for asset discovery, threat mapping, and client pre-audit reports

🛡️ Created by BlessedOps
🎯 Part of the  Recon Series
📬 Request your free risk scan


---
