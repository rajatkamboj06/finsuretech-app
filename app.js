const express = require('express');
const app = express();
const port = 3001;

app.get('/', (req, res) => {
  res.send('Welcome to FinSureTech Web App!');
});
app.get('/', (req, res) => {
  res.send('We are Group 5');
});

app.listen(port, () => {
  console.log(`App running at http://localhost:${port}`);
});
