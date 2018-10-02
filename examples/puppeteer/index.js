const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.setViewport({
    width: 1600,
    height: 900,
  });
  await page.goto('https://thingspeak.com/channels/12397', {
    'waitUntil': 'networkidle0',
  });
  await page.screenshot({
    path: 'example.png',
    fullPage: true,
  });

  await browser.close();
})();
