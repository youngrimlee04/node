pragma solidity ^0.5.7;

// 복합 타입 : 배열, 구조체, 문자열, 이벤트 , ...

contract BasicArrayTest{
    // 배열 선언
    uint8[2] myArr;
    
    // 배열 선언 및 초기화
    uint8[2] myArr2 = [1,2];
    
    // 배열 선언 및 초기화의 사이즈 생략
    uint8 [] myArr3 = [1,2];
    uint256 [] myArr4 = [1,2];
    
    // 함수 memory 키워드 사용
    // 메모리 변수는 명시적으로 memory 키워드를 사용해야 함
    // 함수 호출 시 내부에만 존재하는 임시 변수로 storage 변수 대비 저렴하다
    function arrTest1() public view returns(uint256){
        uint8 [3] memory arr1 = [1,2,3];
        uint8 [] memory arr2 = new uint8[](arr1.length);
        
    // 상태변수(전역변수, 컨트랙트 안에서 사용)를 지역변수(함수 내에서만 사용)에 대입하는 행위 > 복사의 개념
    // 상태변수를 memory 변수에 넣고 지역 변수를 수정하면 상태변수에 영향을 미치지 않는다 
    // 상태변수 값이 복사 되기 때문에
        uint256 [] memory arr5 = myArr4;
        arr5[0] = 10;
        return arr5[0];
    }   
    
    function arrTest1_sub() public view returns (uint256)
    {
        return myArr4[0];
    }
    
    // 바이트 배열
    // byte, bytes 의 차이점 기억
    function byteTest() public pure returns (byte and_v, byte or_v, byte xor_v, byte neg_v)
    {
        byte a = 0x00;
        byte b = 0xff;
        
        and_v = a&b;
        or_v = a|b;
        xor_v = a^b;
        neg_v = ~a;
    }
    
    // bytes : 정적 바이트 배열, 선언 시 고정 크기 가짐
    function bytesTest() public pure returns (bytes2 arr)
    {
        arr;
        arr = "AB";
        // 사이즈 overFull , arr = "ABC";
        
        // 바이트 배열을 동적으로 구성해서 사이즈 초과 시 사용하면
        // 유동적으로 조절이 됨 > gas가 발생됨 따라서 고정 크기를 권장
        bytes memory dyBytesArr = new bytes(2);
        dyBytesArr = "ABC";
        
        // 동적 생성된 변수는 리턴이 불가함
        
    }
    
    // 바이츠 > 바이트 배열에 복사
    // 메모리로 선언된 변수를 리턴
    function bytesToByteArr() public pure returns (byte[] memory){
        // bytes > byte []
        bytes memory tmp = new bytes(5);
        tmp = "ABCDE";
        byte [] memory result = new byte [](tmp.length);
        for(uint8 i =0; i<tmp.length; i++){
            result [i] = tmp[i];
        }
        return result;
    }
    // bytes > string
    function bytesToString() public pure returns (string memory)
    {
        bytes memory tmp = new bytes(5);
        tmp = "ABC1234@!간가나";
        string memory s = string (tmp);
        return s;
    }
}