const express = require('express');
const app = express();
const port = process.env.PORT || 3001;

app.get('/api', (req, res) => {
  res.json({ message: 'Hello from the backend!' });
});

app.listen(port, () => {
  console.log(`Backend running on port ${port}`);
});
