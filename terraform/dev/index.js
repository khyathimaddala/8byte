const express = require('express');
const app = express();
app.use(express.static('public')); // Serves files from the 'public' directory
app.listen(3000, () => console.log('Server running on port 3000'));
