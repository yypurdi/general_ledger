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
    Title:'AppRoomNew',
    Heading:'AppRoom',
    MeetingRoom:{label :'MeetingRoom'},
    Subject:{label :'Subject'},
    Participant:{label :'Participant'},
    StartDate:{label :'StartDate'},
    EndDate:{label :'EndDate'},
    Status:{label :'Status'},
    RefValue:{label :'RefValue'},
    }

router.get('/', sessionChecker, function(req, res, next) {
    parameter = {
        session: req.session,
        cookies: req.cookies,
        resource: appresource,
        dateFormat: dateFormat,
        statusCode:100,
        statusMessage:'',        
        record:{meetingRoom:'',
        subject:'',
        participant:'',
        startDate:'',
        endDate:'',
        status:'',
        refValue:'',
        }
    }
    res.render('AppRoomNewPage',parameter);
    console.log(parameter);
});
router.post('/', sessionChecker, function(req, res, next) {
    var jsonObj = req.body;
    parameter = {
        session: req.session,
        cookies: req.cookies,
        resource: appresource,
        dateFormat: dateFormat,
    }    
    dao.newAppRoom(jsonObj,function(err,rows) {
        if(err==null){
            parameter.statusCode = 200;
            parameter.statusMessage = 'Successfully created';
        }else{
            parameter.statusCode = err.code;
            parameter.statusMessage = err.message;
        }
        parameter.record = jsonObj;
        res.render('AppRoomNewPage',parameter);
        console.log(parameter);        
    });
});

module.exports = router;
