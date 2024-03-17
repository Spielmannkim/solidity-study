// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter{
    uint256 count;

    //getCount 함수는 count라는 변수에 입력된 값을 출력한다.
    function getCount() public view returns (uint256) {
        return count;
    }

    //incrementCount 함수를 실행하면 count라는 변수의 값을 1 상승 시킨다.
    function incrementCount() public {
        count++;
    }
}
