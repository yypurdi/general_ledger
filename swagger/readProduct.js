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
 * /readProduct:
 *   get:
 *     tags:
 *       - Administration
 *     description: readProduct
 *     summary: ProductRead
 *     consumes:
 *       - application/json
 *     produces:
 *       - application/json
 *     parameters: 
 *       - name: id
 *         description: Integer 
 *         in: query
 *         type: Integer
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
    jsonObj.rowid = 0;
    
    var readProduct = new Promise((resolve, reject) => {
        dao.readProduct(jsonObj,function(err,rows) {
            if(err) res.status(err.code).end();
            else{
                if(rows[0]===undefined) res.status(404).end();
                else{ 
                    jsonObj = rows[0];
                    resolve(jsonObj);
                }
            }
        });
    });
    
    var productAccount = new Promise((resolve, reject) => {
        dao.searchProductAccount(jsonObj,function(err,rows) {
            jsonObj.productAccount = rows;
            resolve(jsonObj);
        });        
    });
    
    var stockMaster = new Promise((resolve, reject) => {
        dao.searchStockMaster(jsonObj,function(err,rows) {
            jsonObj.stockMaster = rows;
            resolve(jsonObj);
        });        
    });
    
    var sendResult = (results) => {
        console.log(jsonObj)
        res.status(200).send(jsonObj);
    }
    
    Promise.all([readProduct,productAccount,stockMaster]).then(sendResult);
});

module.exports = router;
