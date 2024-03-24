// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables {
    // State Variables (상태 변수) : 함수 밖에서 선언되며 블록체인에 저장돼 영속성을 가진다.
    int256 public myInt = -1; // 정수
    uint256 public myUint256 = 1; // 0을 포함한 양의 정수
    uint8 public myuint8 = 1; // 1byte = 8bit 사이즈의 uint

    string public myString = "Hello, World!"; // 문자열
    bytes32 public myBytes32 = "Hello, World!"; // Bytes32

    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // 지갑주소

    // Global Variables (전역 변수) : 블록체인에 대한 정보를 얻는데 사용되는 특수변수 (주로 블록타임스탬프, 컨트랙트만든주소 등을 얻음)
    uint256 public blockTime = block.timestamp;
    address public ownerAddress = msg.sender;

    // struct (구조체) : 우리만의 타입. 다시 말해 사용자 정의 자료형.
    struct MyStruct {
        uint256 myUint256;
        string myString;
    }

    // 첫번째 parameter는 uint, 두번째 parameter는 string타입의 구조체.
    MyStruct public myStruct = MyStruct(1, "Hello, World!");

    // getMyStruct 함수를 실행해보면 위에서 만든 구조체에 입력시킨 두가지의 데이터를 받아 볼 수 있다.
    function getMyStruct() public view returns(MyStruct memory) {
        return myStruct;
    }


    // Local Variables (지역 변수) : 함수 안에서 선언되는 변수이고 블록체인에 기록되지 않는다.
    // view : 컨트랙트의 변수를 읽기만 할 때
    // pure : 컨트랙트의 변수를 읽지도, 쓰지도 않을 때
    function getValue() public pure returns (uint256) {
        uint256 value = 1;
        return value;
    }
}
