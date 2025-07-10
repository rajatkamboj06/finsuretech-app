const express = require('express');
const path = require('path');
const app = express();
const client = require('prom-client');
const port = 3001;

// Serve static files from 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// 📊 Collect default Prometheus metrics (CPU, memory, etc.)
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics();

// 📈 Expose /metrics endpoint for Prometheus scraping
app.get('/metrics', async (req, res) => {
  try {
    res.set('Content-Type', client.register.contentType);
    res.end(await client.register.metrics());
  } catch (err) {
    res.status(500).end(err);
  }
});

// 🔊 Start server and listen on all interfaces so Prometheus can access
app.listen(port, '0.0.0.0', () => {
  console.log(`FinSureTech app running at http://localhost:${port}`);
});




