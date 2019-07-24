// 조건문, 반복문, 제어문, 연산자 
// ----------------------------
// 조건문 예시 : 아이스아메리카노 1500원이면 싸다, 1500원보다 높으면 비싸다, 1000원이면 굿이라고 출력 
// let ice_coffee = 2500
// if(ice_coffee == 1500){
//     console.log('싸다')
//     // 수행문이 한 줄이면 {} 생략 가능
// }
// else if(ice_coffee>1500){
//     console.log('비싸다')
// }
// else{
//     console.log('굿')
// }

// 1500원 이하면 무조건 싸고 나머지는 다 비싸다
// let ice = 3500
// if(ice<=1500){
//     console.log('싸다')
// }
// else{
//     console.log('비싸다')
// }

// 상황이 2개이고 해야할 일이 값을 세팅하는 것이라면 삼항연산자 사용
let result
let ice_c = 1000
if (ice_c <= 1500) {
    result = '싸다'
} else {
    result = '비싸다'
}
//console.log(result)

// 삼항연산자 조건? 참일 때 값 : 거짓일 때 값

result = ice_c <= 1500 ? '싸다' : '비싸다'
console.log(result)

let result2
let icecoffe=25500

result2 = icecoffe <=20000? '싸다' : '비싸다'
console.log(result2)