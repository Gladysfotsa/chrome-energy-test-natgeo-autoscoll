FROM node:18-slim

# Install dependencies and Chrome
RUN apt-get update && apt-get install -y \
    wget gnupg2 ca-certificates fonts-liberation libappindicator3-1 \
    libasound2 libatk-bridge2.0-0 libatk1.0-0 libcups2 libdbus-1-3 \
    libgdk-pixbuf2.0-0 libnspr4 libnss3 libx11-xcb1 libxcomposite1 \
    libxdamage1 libxrandr2 xdg-utils libgbm-dev libgtk-3-0 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN npm install puppeteer

COPY auto-scroll.js /usr/local/bin/auto-scroll.js
COPY chrome-entry.sh /usr/local/bin/chrome-entry.sh
RUN chmod +x /usr/local/bin/chrome-entry.sh

CMD ["/usr/local/bin/chrome-entry.sh"]
