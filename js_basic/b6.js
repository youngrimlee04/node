// 모듈 가져오기 :  자바로 비유하자면 import 
// b6가 b6_mod 안에 있는 변수, 함수 객체 가져오기 위해 require() 사용

// 1. require('Third pary Module Name')
let exp = require('mysql')

// npm init -y => 지금 있는 js_basic 내에 package.json 생성
// npm i --save mysql 아래 터미널에 쳐지면 require 안에 mysql 있어도 node b6.js 실행 시 오류 안남

// 2. require('상대경로법으로 표현한 내가 만든 모듈명)
let mod = require('./b6_mod')
console.log('mod:',mod) // b6_mode.js에 exports 했기 때문에 b6_mode.js에 있는 변수 땡겨 씀 
console.log('mod', mod.pi2)
console.log('mod:', mod.sub())

// 3. require('./폴더명') 쓰면 무조건 ./폴더명/index.js를 가져온다 (즉 index.js를 생략할 수 있는 규칙이 하나 있음)