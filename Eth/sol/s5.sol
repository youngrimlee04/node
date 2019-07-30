pragma solidity ^0.5.7;

// 조건문 반복문 제어문 등
// 기본 문법은 기존 언어(자바, 자바스크립트 등)과 크게 다르지 않음

// if, for, while, do-while, break, continue
// 삼항연산자
contract BasicForWhileTest{

    function getCoffeePrice(uint price) public pure returns (int){
        // 입력값이 1,500 이상이면 1을 리턴
        // 1,500 미만이면 -1을 리턴
        // 1,500과 같으면 0을 리턴
        if(price>1500){
            return 1;}
        else if(price<1500){
            return -1;}
        else{
            return 0;}
    }
    
    // 삼항 연산자 : 상황이 2개, 값을 리턴 
    function threeCheck(uint x) public pure returns (uint result)
    {
        result = x >10 ? 1 : 0;
    }
    
    // for 
    // value에 5를 넣으면 1+2+3+4+5 를 출력
    // 1부터 해당 인자값까지의 누적값 구하기 
    function forCheck (uint value) public pure returns (uint){
        uint sum = 0;
        
        for(uint i=1; i<=value; i++){
            sum+=i;
        }
        return sum; 
    }
    
    // forCheck2를 구현, 누적합과 누적곱(1x2x3x...value2) 구하기
    function forCheck2 (uint value) public pure returns (uint, uint){
        uint sum = 0;
        uint mul = 1;
        
        for(uint i=1; i<=value; i++){
            sum+=i;
            mul *=i;
        }
        
        return (sum, mul);
    }
    
    // while
    function whileCheck(uint value) public pure returns (uint, uint)
    {
        uint n = 0;
        uint n2 = 0;
        uint i = 0;
        
        // 0 ~ 무한대
        while(i<value){
            n +=1;
            if(i>10){
                break;
            }
            i++;
        }
        
        // 1~ 무한대
        i = 0;
        do{
            i++;
            if ( i%2 ==0){
                continue;
            }
            if(i>10){
                break;
            }
            n2 += 1;
            // 1 , 3, 5, 7, 9
        } while(i<value);
        return (n, n2);
            
    }
    
}