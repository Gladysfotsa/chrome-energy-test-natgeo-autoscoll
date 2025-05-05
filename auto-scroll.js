const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    headless: true,
    args: ['--no-sandbox', '--disable-gpu']
  });

  const page = await browser.newPage();
  await page.goto(process.env.URL_TO_VISIT || 'https://www.nationalgeographic.com', {
    waitUntil: 'networkidle2',
  });

  // Auto-scroll down the page gradually
  await page.evaluate(async () => {
    await new Promise((resolve) => {
      let totalHeight = 0;
      const distance = 500;
      const timer = setInterval(() => {
        window.scrollBy(0, distance);
        totalHeight += distance;

        if (totalHeight >= document.body.scrollHeight) {
          clearInterval(timer);
          resolve();
        }
      }, 1000); // scroll every second
    });
  });

  await new Promise(r => setTimeout(r, 10000)); // Wait 10 sec after scrolling
  await browser.close();
})();
