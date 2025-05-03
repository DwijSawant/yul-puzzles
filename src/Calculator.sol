// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Calculator {
    // perform the arithmetic operations assumming they won't overflow or underflow
    // the list of math operations can be found here:
    // https://docs.soliditylang.org/en/latest/yul.html#evm-dialect

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            let addition := add(x,y)
            mstore(0x00, addition)
            return(0x00,0x20)
            // your code here
            // add x and y
        }
    }

    function sub(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            let subtraction := sub(x,y)
            mstore(0x00, subtraction)
            return(0x00,0x20)
            // your code here
            // subtract y from x
        }
    }

    function mul(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            let multiplication := mul(x,y)
            mstore(0x00, multiplication)
            return(0x00, 0x20)

            // your code here
            // multiply x by y
        }
    }

    function div(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            let division := div(x,y)
            mstore(0x00, division)
            return(0x00,0x20)
            // your code here
            // div x by y
        }
    }
}
