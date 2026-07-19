const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const userRoutes = require('./routes/userRoutes');

const app = express();
const PORT = process.env.PORT || 3000;
const MONGO_URI = process.env.MONGO_URI || 'mongodb://db:27017/mydb';

mongoose.connect(MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });

app.use(bodyParser.json());
app.use('/api/users', userRoutes);

app.listen(PORT, () => {
  console.log(`API server running on port ${PORT}`);
});


