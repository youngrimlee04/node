// 모듈화
var mysql      = require('mysql'); 

exports.selectLogin = (uid, upw, cb) => { 
    if(results.length > 0)
        console.log('회원이다',results[0].name+'님 반갑습니다.')
    else
        console.log('회원확인실패', '아이디나 비번을 확인 하세요.')
} 