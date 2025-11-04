const express = require('express');
const app = express();
app.get('/health', (req, res) => res.json({status: 'ok'}));
app.get('/', (req, res) => res.send('Hello from Node.js App!'));
const port = process.env.PORT || 3000;
app.listen(port, () => console.log('Server running on', port));
