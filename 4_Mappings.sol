// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mappings {
    mapping(uint256 => string) public names; // uint256 타입의 key와 string 타입의 value를 매핑하여 입력가능한 변수 names 생성
    mapping(uint256 => Book) public books; // uint256 타입의 key와 Book을 value로 매핑하는 변수 books 생성
    mapping(address => mapping(uint256 => Book)) public myBooks; // address 타입의 key와 mapping 타입의 매핑이고 해당 매핑은 uint256 타입의 key와 Book을 value로 이중 매핑한 변수 myBooks 생성

    // Book이라는 struct에 매개변수 두개를 담을 수 있게 생성
    struct Book {
        string title;
        string author;
    }

    // uint256타입의 key 1, 2, 3 마다 각각 string타입의 value를 가지고 있고 constructor로 변화 불가하게 지정 
    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }

    // books라는 변수에 uint256 타입의 _id, string타입의 책 제목과 작가이름을 입력하여 DB에 책 정보를 업로드하는 함수
    function addBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author); // key값인 _id를 입력하면 제목과 작가이름을 알 수 있다.
    }

    // myBooks라는 변수에는 2중 매핑이 사용되는데 _id, _title, _author세가지 정보를 addMyBook함수를 사용하여 입력하면 입력한 address를 key로 하여 2중매핑을 블록체인에 입력할 수 있다. 
    function addMyBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author); // address와 _id를 입력하면 책 제목과 작가이름을 알 수 있다.
    }
}
