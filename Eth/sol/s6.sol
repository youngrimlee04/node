pragma solidity ^0.5.7;

// 형변환

contract BasicTypeCasting{
    // 타입의 형변환 
    // 1. 암묵적 형변환 : 작은 타입이 큰 타입으로 (ex) uint 8이 uint 256으로
    // 2. 명시적 형변환 : 큰 타입이 작은 타입으로  (ex) uint 256이 uint 8으로
    // 명시적 형변환은 데이터를 자르고 자료형을 고정 하는 행위가 진행
     function asTest() public pure returns (uint256, int8)
     {
         uint8 a = 1; // uint는 256 error
         uint256 b = 1;
         
    // 암묵적 형변환
         uint256 c = a;
         
    // 명시적 형변환
      int8 d = int8(b);
      return (c,d);
     }
}