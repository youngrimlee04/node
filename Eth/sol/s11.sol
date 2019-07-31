pragma solidity ^0.5.7;
// 상속
// 컨트랙트 상속, 부모의 멤버들을 그대로 사용 가능
// 자식은 재정의 , 멤버 추가 가능
contract A{
    function f() public pure returns (uint)
    {
        return 10;
    }
}

contract B{
    function f() public pure returns (uint)
    {
        return 20;
    }
    function f2() public pure returns (uint)
    {
        return 30;
    }
}

// 상속받은 함수들이 동일하면 이후 상속 받은 함수가 최종
contract C is A, B {}

contract D is B, A {}

// 재정의(override)
contract E is B, A {
    function f() public pure returns (uint)
    {
        return 100;
    }
}

// 추상 컨트랙트(함수가 선언만 되어 있음)
// 스스로 생성 불가, 상속 받아서 구현하는 구조
contract Form {
    function eat(string memory food) public pure returns (bool);
    
}

contract F is Form {
    function eat(string memory food) public pure returns(bool){
        return true;
    }
}
    // 인터페이스(순수한 틀)
    interface Form2
    {
        function eat(string calldata food) external pure returns(bool);
        
    }
    // 인터페이스 구현 시 앞에 클래스와 동일한 함수가 겹치면 오류가 발생
    contract G is Form2{
          function eat(string memory food) public pure returns(bool){
             return true;
         } 
    }
