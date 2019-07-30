pragma solidity ^0.5.7;

contract BasicFunc{
    int age = 1;
    
    function t() public view returns (int){
        return age;
    }
    
    function t2() public returns(int){
        age++;
        return age;
    }
    
    function t3() public pure returns(int){
        return 10;
    }
    // 부호 없는 정수 2개를 입력 받아서 더한 값 리턴
    function t4(uint a, uint b) public pure returns(uint) {
        uint c = a+b;
        
        return c;
    }
    
    function a() external pure {
        // external은 외부에서만 사용 가능
    }
    
    function b() private pure {
        
    }
    

    // 리턴할 변수를 returns에서 미리 지정하면 변수 선언 및 return 생략도 가능
    function t5(uint x, uint y) public pure returns (uint z) {
        t3();
        
        // a(); external은 외부에서만 사용 가능
        b();
        z = x+y;
    }
}
// 함수 
// 구조 : function 함수명 ( 타입 x1, 타입 x2, ...) option returns ( 타입 x1(생략 가능), 타입 x2, ...)
/* {
 // statement; ...
return(...) // <- 생략 가능
}
*/

/* options 
1) 가시성 : 접근제어자 (access modifier)
 - external : 컨트랙트상 명시된 것만 외부에 공개
 - public : 모든 컨트랙트의 내외부에 공개 
 - internal : 해당 컨트랙트와 상속 컨트랙트에만 공개(자바에서 protected)
 - private : 오직 해당 컨트랙트에만 공개

2) 비용 측면 
 - constant ( 더이상 사용되지 않음) > 이렇게 정의된 함수는 gas를 소모하지 않음 > 비용 발생X
 - view : 다음 행위를 함수 내부에서 하지 않음
	1) 상태변수 값 변경
	2) 이벤트 발생 ( 이벤트 > 컨트랙트 > nodejs로 이벤트 전달)
	3) 다른 컨트랙트 생성
	4) 이더 전송(송금)
	5) view나 pure로 선언되지 않은 함수 호출

 - pure : 다음 행위를 함수 내부에서 하지 않음
	1) 상태변수 읽기
	2) xxx. balance 잔액 확인 등 접근 시도
	3) 컨트렉트 사전에 이미 정의된 전역 객체들 block, tx, msg 등을 접근하는 행위
	4) pure로 정의되어 있지 않는 함수 호출

- payable : 비용 발생
	1) contract가 멤버함수를 통해서 다른 지갑(타인)에 이더를 송금하거나 받는 등
	 > 함수 자체가 지불 가능한 형태가 되는 경우 사용 
	2)


*/
