// 반복문, 제어문
// for 지정된 횟수를 반복할 때 > 배열
// while 언제 끝날 지 모를 때, 0 ~ 무한대, 1 ~ 무한대(do while)
// for구구단 3 ~ 5단 출력
// for (let i = 3; i <= 5; i++) { // 3~5
//     for (let j = 1; j <= 9; j++) { //1~9
//         // js 문자열 포맷팅 방식이 모던 스크립트에서 추가 됨 (표준방식 : ``)
//         console.log(`${i} x ${j} = ${i * j} `)
//     }
// }
// --------------------------------------------
// for ~ each 방식 > 배열에서 데이터를 뽑아서 작업
 // * 참고 : Ctral + a 누른 후 k랑 f 누르면 자동 정렬
 // Array : [] 순서가 존재한다
 // Object (객체 : Class 기반 생성) : {}
 let data = ['A','B','C']
 // 배열 data 에서 데이터를 하나씩 꺼내서 출력 하기 위해 for each 사용
//  for(idx in data){
//     console.log(idx, data[idx])
//  }

 // 위의 방식은 진정한 for ~ each가 아니다. 데이터가 순수하게 나와야 한다. ~> for of 사용
 for(item2 of data){
     console.log(item2)
 }
 
// let data =[11,12,13,14,15,16,17,18,19,20]
// // // 모든값 출력
// for(item of data){
//     if(item==7) {
//         break
//         }
// //     // 추출한 데이터가 2 혹은 4면 출력하지 않고 다시 조건문으로 이동
//     if(item==2||item==4) {
//     continue
//     }
//         if(item%2==0){  // 위의 데이터에서 짝수만 출력하시오.
//             console.log(item)
//         }
// }

// -----------------------
// 1 ~ 10까지의 수 출력
// let a = 1
// while(a<10){
//     console.log(a++)    
// }