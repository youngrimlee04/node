// nodejs에서 mysql을 access 하여 sql을 수행하는 코드
// $npm i --save mysql
// --save : 설치 시 package.json에 버전 포함 기입
// -------------------------- https://www.npmjs.com/package/mysql 참조
// 1. 모듈 가져오기
var mysql      = require('mysql'); 

// 2. 접속 경로 세팅
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root', //heidsql의 user, 공식 서비스할 때는 root X
  password : 'mysql', //heidsql의 pw
  database : 'node' //heidsql의 db
});

// 3. 연결 : 연결 행위 자체가 비동기라서 콜백함수를 등록하여 연결 결과가 나오면 호출되게 구성
// 이런 경우 콜백함수의 1번 인자에 통상적으로 에러를 넣는다.
connection.connect( (err)=>{
    // 연결 종료
    if(err){
        console.log('접속 오류', err)
    }else{
        connection.end();
        console.log('접속종료')
    }
});
 
    // connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
    //   if (error) throw error;
    //   console.log('The solution is: ', results[0].solution);
    // });
 
