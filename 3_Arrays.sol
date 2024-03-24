// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrays {
    uint256[] public uint256Array = [1, 2, 3]; // 기본적인 정수 배열로 0을 입력하면 해당 자리에 있는 1을 출력
    string[] public stringArray = ["apple", "banana", "carrot"]; // 문자열 형태의 배열로 0을 입력하면 apple을 출력
    string[] public values; // 빈 배열 생성
    uint256[][] public array2D = [[1, 2, 3], [4, 5, 6]]; // 2차원 배열 0,0을 입력하면 1을 출력

    // 위 컨트랙트에서 생성한 빈배열 values에 순서대로 값들을 배열로 add 하는 함수
    function addValue(string memory _value) public {
        values.push(_value);
    }

    // 위 addValue함수에서 values에 값들을 add할때마다 카운트해서 몇번 넣었는지 배열의 길이를 확인하는 함수
    function valueCount() public view returns (uint256) {
        return values.length;
    }
}
