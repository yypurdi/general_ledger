/*
 * script route generated by KOMA
 * @author : Yan Yan Purdiansah
 */
var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('mobile', {session: req.session, cookies: req.cookies});
});

module.exports = router;
