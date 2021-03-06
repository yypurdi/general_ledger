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
    Title:'StockMasterWrite',
    Heading:'StockMaster',
    Id:{label :'Id'},
    Code:{label :'Code'},
    Units:{label :'Units'},
    Mbflag:{label :'Mbflag'},
    Lastcurcostdate:{label :'Lastcurcostdate'},
    Actualcost:{label :'Actualcost'},
    Lastcost:{label :'Lastcost'},
    Materialcost:{label :'Materialcost'},
    Labourcost:{label :'Labourcost'},
    Overheadcost:{label :'Overheadcost'},
    Lowestlevel:{label :'Lowestlevel'},
    Discontinued:{label :'Discontinued'},
    Controlled:{label :'Controlled'},
    Eoq:{label :'Eoq'},
    Volume:{label :'Volume'},
    Kgs:{label :'Kgs'},
    Barcode:{label :'Barcode'},
    Discountcategory:{label :'Discountcategory'},
    Taxcatid:{label :'Taxcatid'},
    Serialised:{label :'Serialised'},
    Appendfile:{label :'Appendfile'},
    Perishable:{label :'Perishable'},
    Decimalplaces:{label :'Decimalplaces'},
    Nextserialno:{label :'Nextserialno'},
    Pansize:{label :'Pansize'},
    Shrinkfactor:{label :'Shrinkfactor'},
    }

router.get('/', sessionChecker, function(req, res, next) {
    var jsonObj = req.query;
    parameter = {
        session: req.session,
        cookies: req.cookies,
        resource: appresource,
        dateFormat: dateFormat,
        statusCode:100,
        statusMessage:'',
    }
    dao.readStockMaster(jsonObj,function(err,rows) {
        parameter.record = rows[0];
        res.render('StockMasterWritePage',parameter);
        console.log(parameter);        
    });
});
router.post('/', sessionChecker, function(req, res, next) {
    var jsonObj = req.body;
    parameter = {
        session: req.session,
        cookies: req.cookies,
        resource: appresource,
        dateFormat: dateFormat,        
    }
    dao.writeStockMaster(jsonObj,function(err,rows) {    
        if(err==null){
            parameter.statusCode = 200;
            parameter.statusMessage = 'Successfully created';
        }else{
            parameter.statusCode = err.code;
            parameter.statusMessage = err.message;
        }
        parameter.record = jsonObj;
        res.render('StockMasterWritePage',parameter);
        console.log(parameter);        
    });
});

module.exports = router;
