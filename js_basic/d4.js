// 로그인 처리하는 일련의 과정을 함수로 구성하여 함수를 호출함으로써 아이디와 비번을 전달
// 결과를 돌려받는 구조로 업그레이드 => 서버 개발자는 해당 함수를 호출함으로써 로그인의 결과를 얻을 수 있음
var mysql = require('mysql');

function selectLogin(uid, upw, cb) { //아래 results에 대한 함수 cb(이름은 본인이 정함)
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'mysql',
        database: 'node'
    });

    connection.connect((err) => {
        // 연결 종료
        if (err) {
            console.log('접속 오류', err)
        } else {
            // 본 쿼리는 아이디, 비번이 고정되어 있어서 재사용성이 떨어짐 => 아이디와 비번을 sql 문장에서 뜯어내고 외부에서 세팅될 수 있게 조정
            let sql = `SELECT * FROM users WHERE uid=? AND upw=?;`
            connection.query(sql, [uid, upw], (err, rows) => {
                cb(err, rows) //rows 보내면서 cb 함수 호출
                connection.end();
            })
        }
    });
}
// 함수 내부가 비동기 상황이니 콜백함수 사용 : 콜백함수 하나 보내고 결과 나오면 그 콜백함수 호출해줌
selectLogin('guest', '2', (err, results) => {
    if (results.length > 0)
        console.log('회원이다', results[0].name + '님 반갑습니다.')
    else
        console.log('회원확인실패', '아이디나 비번을 확인 하세요.')
    //console.log('cb함수 호출한 결과 받았음',results, err)// cb함수 호출한 결과 받아옴
}) // 함수 호출해서 게스트 찍기 