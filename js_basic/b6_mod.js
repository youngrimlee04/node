// 모듈용 파일 
let pi = 3.14
// exports 써서 일반 모듈화 정의 
exports.pi2 =3.144

const add = ()=> 10

exports.sub = function(){
    return 5 + add()
}

// 객체를 모듈화 한 것을 대표 모듈이라고 함, module.exports = {} 