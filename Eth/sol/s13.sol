pragma solidity ^0.5.7;
// storage, memory, stack
// storage : 컨트랙트의 상태를 정의, sendTransaction을 통해 상태 변경 가능
// memory : 함수 호출 시 내부에만 존재하는 임시 변수, storage 보다 저렴, contract level 에서 사용 불가
// stack : 개수가 제한적이고 비용이 거의 들지 않는 영역

// storage는 구조체, 매핑 등 선언에 유용(default로 storage에 저장), 상태 변수
// memory는 함수 인자, 함수 리턴값
// stack은 위에서 언급되지 않은 케이스의 경우 stack에 저장

// f2() 의 인자는 memory 
// f2()를 호출할 때 상태변수를 넣으면 주소값이 전달되는 것이 아니라
// 사본이 전달됨 > 따라서 수정을 해도 사본이 수정되고 원본인 상태변수는 그대로임

contract VarTest{
    uint [20] public x;
    // test 1: f() call 
    function f() public returns (uint){
        f2(x);
        return x[2];
    }
     // test 2: fEx() call 
     // fEx()의 인자는 storage 이므로 상태변수를 인자로 넣으면 
    // 참조값 즉 실체가 전달되므로 조작하면 원본도 조작된다
    function fEx() public returns (uint){
        f3(x);
        return x[2];
    }
    function f2(uint[20] memory y) internal pure {
        y[2] = 3;
        
    }
    function f3(uint[20] storage y) internal {
        y[2] = 4;
        
    }
}