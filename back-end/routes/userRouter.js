const express = require("express");
const UserRouter = express.Router();

// container
const {
	CREATE,
	LOGIN,
	GET_LIST,
	UPDATE,
} = require("../controller/user.controller");

UserRouter.route("/api/user").post(CREATE).get(GET_LIST).put(UPDATE);
UserRouter.route("/api/user/login").post(LOGIN);

module.exports = UserRouter;
