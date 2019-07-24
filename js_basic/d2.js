var mysql      = require('mysql'); 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root', 
  password : 'mysql', 
  database : 'node' 
});

connection.connect( (err)=>{
    // 연결 종료
    if(err){
        console.log('접속 오류', err)
    }else{
        // 쿼리 수행 
        // connection.query(sql문, 파라미터(생략가능), (err, rows)=>{} )
        // 따옴표 쓸 때 1번 앞에 키 쓰기 (``)
        let sql = `SELECT * FROM users WHERE uid='guest' AND upw='1';` 
        connection.query(sql, (err, rows)=>{            
            console.log(err,rows[0].name) // 게스트라는 문구를 출력하게 rows를 표현
            connection.end();
            console.log('접속종료')
        } )
        
    }
});
 

