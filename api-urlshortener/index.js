require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const dns = require('dns');
const urlParser = require('url');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use('/public', express.static(`${process.cwd()}/public`));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

let urlDatabase = {};
let id = 0;

// Обработка POST запроса на сокращение URL
app.post('/api/shorturl', function(req, res) {
  const originalUrl = req.body.url;
  const hostname = urlParser.parse(originalUrl).hostname;

  if (!hostname) {
    res.json({ error: 'invalid url' });
    return;
  }

  dns.lookup(hostname, (err) => {
    if (err) {
      res.json({ error: 'invalid url' });
    } else {
      id++;
      urlDatabase[id] = originalUrl;
      res.json({
        original_url: originalUrl,
        short_url: id
      });
    }
  });
});

// Перенаправление по сокращенному URL
app.get('/api/shorturl/:id', function(req, res) {
  const shortUrl = req.params.id;
  const originalUrl = urlDatabase[shortUrl];
  if (originalUrl) {
    res.redirect(originalUrl);
  } else {
    res.json({ error: 'No short URL found' });
  }
});

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});
