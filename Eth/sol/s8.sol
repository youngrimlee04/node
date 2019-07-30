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
    // 
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
    
}
