const express = require('express');
const VideoRouter = express.Router();

// container
const { CREATE, UPDATE, GET_LIST, DELETE } = require('../controller/video.controller');

VideoRouter.route('/api/video').post(CREATE).get(GET_LIST).put(UPDATE);
VideoRouter.route('/api/video/:id').delete(DELETE);

module.exports = VideoRouter;
