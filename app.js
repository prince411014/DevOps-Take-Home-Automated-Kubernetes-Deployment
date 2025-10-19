const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello, World! This is the DevOps take-home app. \n');
});

app.get('/healthz', (req, res) => {
  res.json({status: 'ok'});
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
