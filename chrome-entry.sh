#!/bin/bash

# Default URL fallback
export URL_TO_VISIT="${URL_TO_VISIT:-https://www.nationalgeographic.com}"

echo "Launching Puppeteer to auto-scroll National Geographic..."
node /usr/local/bin/auto-scroll.js

# Keep container alive briefly after script completes
sleep 10
