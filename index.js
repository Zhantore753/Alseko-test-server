const express = require('express');
const personRouter = require('./routes/personRoute');
const materialRouter = require('./routes/materialRoute');
const corsMiddleware = require('./corsMiddleware');
const PORT = process.env.PORT || 8080;
const app = express();

app.use(corsMiddleware);
app.use(express.json());
app.use('/api', personRouter);
app.use('/api', materialRouter);

app.listen(PORT, () => console.log(`Сервер стартовал на пороту ${PORT}`));
