const express = require('express');
const StudyProgramRouter = express.Router();

// container
const { CREATE, UPDATE, GET_LIST } = require('../controller/study.program.controller');

StudyProgramRouter.route('/api/studyprogram').post(CREATE).get(GET_LIST).put(UPDATE);

module.exports = StudyProgramRouter;
