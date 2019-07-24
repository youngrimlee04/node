// class, 객체 -> 멤버변수와 멤버 함수를 구성원으로 가짐
// js의 class 정의법은 4 + 1(모던 스크립트) 방식이 존재한다.
// 1번 형태 => 객체 리터럴
// 용도 : 1회성 객체, 이름 없음, 함수 호출이 진행될 때 넘길 데이터가 많으면 사용
// 기호 => {} 자바스크립트 객체
let obj = {
    name:'서울역', // 클래스 안에 있으니 멤버변수
    getName: function() {
        return this.name
    } // 멤버함수

} // 객체 생성
console.log(obj)
// 객체 멤버들을 바깥에서 사용할 경우 객체명.변수, 객체명.함수
console.log(obj.name, obj.getName())
