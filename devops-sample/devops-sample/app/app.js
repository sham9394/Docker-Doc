const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({
    message: "Hello from DevOps sample app!",
    hostname: require('os').hostname(),
    timestamp: new Date().toISOString()
  });
});

app.get('/health', (req, res) => res.send('OK'));

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
