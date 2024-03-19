// 1_Counter.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 count;

    function getCount() public view returns (uint256) {
        return count;
    }

    function incrementCount() public {
        count++;
    }
}


// 2_Variables.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables {
    // State Variables
    int256 public myInt = 1;
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;

    string public myString = "Hello, World!";
    bytes32 public myBytes32 = "Hello, World!";

    address public myAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    struct MyStruct {
        uint256 myUint256;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, World!");

    // Local Variables
    function getValue() public pure returns (uint256) {
        uint256 value = 1;
        return value;
    }
}

//3_Arrays.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrays {
    uint256[] public uint256Array = [1, 2, 3];
    string[] public stringArray = ["apple", "banana", "carrot"];
    string[] public values;
    uint256[][] public array2D = [[1, 2, 3], [4, 5, 6]];

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns (uint256) {
        return values.length;
    }
}

//4_Mappings.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mappings {
    mapping(uint256 => string) public names;
    mapping(uint256 => Book) public books;
    mapping(address => mapping(uint256 => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }

    function addBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}

//5_Conditionals.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Conditionals {
    uint256[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function countEvenNumbers() public view returns (uint256) {
        uint256 count = 0;

        for (uint256 i = 0; i < numbers.length; i++) {
            if (isEvenNumber(numbers[i])) {
                count++;
            }
        }

        return count;
    }

    function isEvenNumber(uint256 _number) public pure returns (bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    function isOwner() public view returns (bool) {
        return (msg.sender == owner);
    }
}

//6_HotelRoom.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Showcase payment transfers, enums, modifiers & events

contract HotelRoom {
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses public currentStatus;

    event Occupy(address _occupant, uint256 _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant() {
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }

    modifier costs(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;

        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);

        emit Occupy(msg.sender, msg.value);
    }
}

//7_Secret.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Showcase contract inheritance

contract Ownable {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }
}

contract Secret is Ownable {
    address secretVault;

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return SecretVault(secretVault).getSecret();
    }
}