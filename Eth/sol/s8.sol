pragma solidity ^0.5.7;

// 문자열, 아직 컴파일러가 발전하는 단계이므로 우리가 편히 사용 했던 라이브러리 많이 없음
// 일일이 만들어줘야 함

contract BasicString{
    // 문자열 기초 라이브러리 만들기
    // byte [] -> String
    function byteArrayToString( byte [] memory src) public pure returns (string memory){
        // byte [] > bytes > string
        // byte > bytes
        bytes memory buffer = new bytes (src.length);
        // 인덱스 별로 카피
        for(uint8 i = 0; i<src.length; i++){
            buffer[i] = src[i];
            
        }
        // 문자열 변환, 모든 데이터는 bytes에 담겼으므로 string으로 변환하면 됨 
        return string (buffer);
    }
    // string을 bytes > byte [] 로 뽑고 이걸 다시 bytes> string으로 뽑으면 양쪽이 일치함

    function stringToByteArray (string memory src) public pure returns (byte [] memory){
        // String > bytes로 
        bytes memory tmp = bytes( src );
        // bytes > byte []
        byte [] memory buffer = new byte[] (tmp.length);
        for(uint8 i =0; i<tmp.length; i++){
            buffer[i]= byte(tmp[i]);
        }
            return buffer;
        
    }
    
    // T E S T 
    // string > bytes > byte > bytes > string
    function testSTBAT(string memory src) public pure returns (string memory){
        return byteArrayToString(stringToByteArray(src));
    }
    
    
    // 문자열 더하기 addString
    // input : string, string => string > bytes > 
    // output : string
    // 입력된 문자열을 이어 붙여서 리턴하는 함수
    
    function addString(string memory a, string memory b) public pure returns (string memory) {
        
        // 2. input string > bytes로 2개 변환 s1가 s2
        bytes memory s1 = bytes(a);
        bytes memory s2= bytes(b);
        
        // 3. 2개 합한 크기로 버퍼를 만들어 dynamci create
        bytes memory buffer = new bytes(s1.length+ s2.length);
        
        // 4.copy
        for(uint8 i=0; i<s1.length; i++){
            buffer[i] = s1[i];
        }
    
        for(uint8 i=0; i<s2.length; i++){
            buffer[i+s1.length] = s2[i];
        }
    
        return string (buffer);
     }
    
    // 문자열 자르기 subString()
    // input : string, offset(시작위치), len(길이)
    // output : string
    function subString (string memory src, uint offset, uint size) public pure returns(string memory)
    { 
     // string > bytes로 빼
    bytes memory tmp= bytes (src);
    
    // checkpoint : offset + size 가 tmp.length <=
    if( offset+ size > tmp.length) {
    return src;
    }  
    
    // 정상적으로 자를 수 있다 ( 단 한글 배제, 바이트 수가 달라서 방식이 다름)
    // 자른 문자열이 들어갈 버퍼 생성

    bytes memory buffer = new bytes(size);
    
    for(uint i=0; i<size; i++){
        buffer[i] = tmp[i+offset];
        }
    
    return string(buffer);
    }
}