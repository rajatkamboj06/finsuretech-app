const express = require('express');
const path = require('path');
const app = express();
const port = 3001;

// Serve static files from 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

app.listen(port, () => {
  console.log(`FinSureTech app running at http://localhost:${port}`);
});


