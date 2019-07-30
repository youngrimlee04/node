pragma solidity ^0.5.7;

// 변수의 저장 위치 
contract BasicVariable{

// 1. storage : 상태 변수(멤버변수 : 컨트랙트 내부 but 함수 바깥쪽), 함수 내의 로컬 변수
// 2. memory : 함수의 매개 변수, 함수의 리턴값 -> 대부분 명시적 표현

    int a = 10; // 상태변수(멤버변수)로 storage에 저장됨

    function main() public view returns (int, int)
    {
        // b는 지역변수
        int b = a;
        return (b, a);
    }
    
    
// 생성자  
// 생성자 인자값이 존재 시 배포할 때 deploy 옆 값 입력
// 컨트랙의 이름을 사용하지 않고 constructor 키워드에 함수 형태로 구현
    constructor (int _a) public
{
    a= _a;

    }
}