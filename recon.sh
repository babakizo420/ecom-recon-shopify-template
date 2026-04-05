#!/bin/bash
# ecom-recon.sh — Passive recon for e-commerce stores
# Usage: ./recon.sh <domain>
# No intrusion, no exploitation. Public endpoints only.

set -e

TARGET="${1:?Usage: ./recon.sh <domain>}"

echo "============================================="
echo "  PASSIVE RECON: $TARGET"
echo "============================================="

echo ""
echo "=== 1. DNS TXT Records ==="
dig txt "$TARGET" +short 2>/dev/null || echo "  No TXT records or dig unavailable"

echo ""
echo "=== 2. SSL Certificate ==="
echo | openssl s_client -connect "$TARGET":443 -servername "$TARGET" 2>/dev/null | openssl x509 -noout -subject -issuer -dates 2>/dev/null || echo "  Could not retrieve certificate"

echo ""
echo "=== 3. HTTP Headers ==="
curl -sI "https://$TARGET" 2>/dev/null | head -20

echo ""
echo "=== 4. Tech Fingerprinting ==="
if command -v whatweb &>/dev/null; then
  whatweb -q "https://$TARGET" 2>/dev/null
else
  echo "  whatweb not installed — skipping"
  echo "  Install: sudo apt install whatweb"
fi

echo ""
echo "============================================="
echo "  RECON COMPLETE: $TARGET"
echo "============================================="
