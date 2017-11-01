'use strict';

const puppeteer = require('puppeteer');
const express = require('express');
const path = require('path');
const app = express();

app.use('/static', express.static(path.join(__dirname, 'public')))

app.get('/take', function(req, res){
  (async () => {
      const browser = await puppeteer.launch({
        args: ['--no-sandbox', '--disable-setuid-sandbox']
      });
      const page = await browser.newPage();
      await page.goto('https://example.com');
      await page.screenshot({path: 'public/image.png'});

      await browser.close();

      res.redirect('/static/image.png');
  })();
});

app.listen(process.env.PORT || 3000)
