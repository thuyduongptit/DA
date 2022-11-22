
'use strict';

const checkpoint = async (req, res) => {
    return res.status(200).json({ jwtDecoded: req.jwtDecoded });
};
module.exports = checkpoint;
