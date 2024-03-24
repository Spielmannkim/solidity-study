// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Conditionals {
    uint256[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; // 자리 0~9 까지 있는 배열을 담은 변수 numbers 생성

    address public owner; // 변수 생성

    constructor() {
        owner = msg.sender; // owner는 컨트랙트 디플로이한 지갑주소
    }

    // 변수 numbers 배열의 수들 중 짝수의 개수를 알려주는 함수
    function countEvenNumbers() public view returns (uint256) {
        uint256 count = 0; // count에 0이라는 값을 넣고

        for (uint256 i = 0; i < numbers.length; i++) { // 반복문을 통해 numbers 배열의 길이만큼 반복
            if (isEvenNumber(numbers[i])) { // 해당 위치의 값이 짝수라면 count에 +1 (27line에 작성한 함수를 실행하여 true이면 19line의 count에 +1)
                count++;
            }
        }

        return count; // 총 count된 값을 출력
    }

    // 짝수인지 확인하는 함수
    function isEvenNumber(uint256 _number) public pure returns (bool) {
        if (_number % 2 == 0) { // _number / 2 의 나머지 값이 0 인경우 짝수
            return true; // 맞으면 true로 계속진행
        } else {
            return false; // 아니면 false로 멈춤
        }
    }

    // 함수 실행자가 이 컨트랙트를 디플로이한 지갑인지 확인하는 함수
    function isOwner() public view returns (bool) {
        return (msg.sender == owner);
    }
}
