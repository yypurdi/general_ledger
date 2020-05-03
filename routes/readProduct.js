/*
 * script route generated by KOMA
 * @author : Yan Yan Purdiansah
 */    
var express = require('express');
var router = express.Router();
var dateFormat = require('dateformat');    
var database = require('./dao');
var dao = new database.Dao();    
var sessionChecker = require('./security');
var appresource = {
    Title:'ProductRead',
    Heading:'Product',
    Id:{label :'Id'},
    Code:{label :'Code'},
    Parent:{label :'Parent'},
    Name:{label :'Name'},
    Description:{label :'Description'},
    DiscountCategory:{label :'DiscountCategory'},
    TaxId:{label :'TaxId'},
    Serialised:{label :'Serialised'},
    ProductAccount:{Heading:'ProductAccount',
        Id:{header:'Id'},
        Code:{header:'Code'},
        Name:{header:'Name'},
        Description:{header:'Description'},
        Type:{header:'Type'},
        AccStock:{header:'AccStock'},
        AccAdjgl:{header:'AccAdjgl'},
        AccPurchase:{header:'AccPurchase'},
        AccMaterial:{header:'AccMaterial'},
        AccWip:{header:'AccWip'},
        },
    StockMaster:{Heading:'StockMaster',
        Id:{header:'Id'},
        Code:{header:'Code'},
        Units:{header:'Units'},
        Mbflag:{header:'Mbflag'},
        Lastcurcostdate:{header:'Lastcurcostdate'},
        Actualcost:{header:'Actualcost'},
        Lastcost:{header:'Lastcost'},
        Materialcost:{header:'Materialcost'},
        Labourcost:{header:'Labourcost'},
        Overheadcost:{header:'Overheadcost'},
        Lowestlevel:{header:'Lowestlevel'},
        Discontinued:{header:'Discontinued'},
        Controlled:{header:'Controlled'},
        Eoq:{header:'Eoq'},
        Volume:{header:'Volume'},
        Kgs:{header:'Kgs'},
        Barcode:{header:'Barcode'},
        Discountcategory:{header:'Discountcategory'},
        Taxcatid:{header:'Taxcatid'},
        Serialised:{header:'Serialised'},
        Appendfile:{header:'Appendfile'},
        Perishable:{header:'Perishable'},
        Decimalplaces:{header:'Decimalplaces'},
        Nextserialno:{header:'Nextserialno'},
        Pansize:{header:'Pansize'},
        Shrinkfactor:{header:'Shrinkfactor'},
        },
    }

router.get('/', sessionChecker, function(req, res, next) {
    var jsonObj = req.query;
    jsonObj.rowid = 0;
    req.session.previouspath = 'readProduct?'+req._parsedUrl.query;
    parameter = {
        session: req.session,
        cookies: req.cookies,
        resource: appresource,
        dateFormat: dateFormat,
    }
    var readProduct = new Promise((resolve, reject) => {
        setTimeout(() => {
            dao.readProduct(jsonObj,function(err,rows) {
                if(err) res.status(err.code).end();
                else{
                    if(rows[0]===undefined) res.redirect('/searchProduct');
                    else{ 
                        jsonObj = rows[0];
                        resolve(jsonObj);
                    }
                }
            });
        },1000);
    });
    
    var productAccount = new Promise((resolve, reject) => {
        setTimeout(() => {
            dao.searchProductAccount(jsonObj,function(err,rows) {
                jsonObj.productAccount = rows;
                resolve(jsonObj);
            });
        },1000);
    });
    
    var stockMaster = new Promise((resolve, reject) => {
        setTimeout(() => {
            dao.searchStockMaster(jsonObj,function(err,rows) {
                jsonObj.stockMaster = rows;
                resolve(jsonObj);
            });
        },1000);
    });
    
    var sendResult = (results) => {
        console.log(jsonObj)
        parameter.record = jsonObj;        
        res.render('ProductReadPage',parameter);
    }    
    Promise.all([readProduct,productAccount,stockMaster]).then(sendResult);
});

module.exports = router;
