const express = require('express');
const app = express();
const methodOverride = require('method-override');
const path = require('path');
const con = require('./config/db.js');
const bodyParser = require('body-parser');
const cors = require('cors');

// include router
const uploadRouter = require('./routes/uploadRouter');
const UserRouter = require('./routes/userRouter');
const CategoryRouter = require('./routes/categoryRouter');
const ProductRouter = require('./routes/productRouter');
const StudyProgramRouter = require('./routes/studyProgramRouter');
const VideoRouter = require('./routes/videoRouter');
const CartRouter = require('./routes/cartRouter');
const TransactionRouter = require('./routes/transactionRouter');
const OpenProductRouter = require('./routes/opentProductRouter');
const authorRoutes = require('./routes/auth.router');

// connecting route to database
app.use(function (req, res, next) {
    req.con = con;
    next();
});

const corsOptions = {
    origin: 'http://localhost:3000',
    optionsSuccessStatus: 200,
};
// app.use(cors(corsOptions));
// parsing body request
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));
app.use(bodyParser.json({ limit: '50mb' }));
app.use(methodOverride('_method'));

// routing
app.use('/api/file', uploadRouter); // Thao tác với dữ liệu người dùng
app.use(UserRouter);
app.use(CategoryRouter);
app.use(ProductRouter);
app.use(StudyProgramRouter);
app.use(VideoRouter);
app.use(CartRouter);
app.use(TransactionRouter);
app.use(OpenProductRouter);
app.use(authorRoutes);
const PORT = 2021;
// starting server
app.listen(PORT, function () {
    console.log(`server listening on port ${PORT}`);
});
