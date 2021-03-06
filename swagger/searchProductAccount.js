/*
 * script route generated by KOMA
 * @author : Yan Yan Purdiansah
 */    
var express = require('express');
var router = express.Router();
var database = require('./dao');
var dao = new database.Dao();
        
/**
 * @swagger
 * /searchProductAccount:
 *   get:
 *     tags:
 *       - Administration
 *     description: searchProductAccount
 *     summary: ProductAccountSearch
 *     consumes:
 *       - application/json
 *     produces:
 *       - application/json
 *     parameters: 
 *       - name: id
 *         description: Integer
 *         in: query
 *         type: Integer
 *       - name: code
 *         description: String
 *         in: query
 *         type: String
 *       - name: name
 *         description: String
 *         in: query
 *         type: String
 *       - name: description
 *         description: String
 *         in: query
 *         type: String
 *       - name: type
 *         description: String
 *         in: query
 *         type: String
 *       - name: accStock
 *         description: String
 *         in: query
 *         type: String
 *       - name: accAdjgl
 *         description: String
 *         in: query
 *         type: String
 *       - name: accPurchase
 *         description: String
 *         in: query
 *         type: String
 *       - name: accMaterial
 *         description: String
 *         in: query
 *         type: String
 *       - name: accWip
 *         description: String
 *         in: query
 *         type: String
 *     responses:
 *       '200':
 *         description: OK
 *       '401':
 *         description: Unauthorized
 *       '403':
 *         description: Forbidden
 *       '404':
 *         description: Not Found 
 *       '500':
 *         description: Internal Server Problem
 */    

router.get('/', function(req, res, next) {
    var jsonObj = req.query;
    if(jsonObj.rowid===undefined) jsonObj.rowid = 0;
    dao.searchProductAccount(jsonObj,function(err,rows) {    
        if(err) res.status(err.code).end();
        else {
            jsonObj.productAccount = rows;
            res.status(200).send(jsonObj);
        }
        console.log(jsonObj);        
    });
});

module.exports = router;
