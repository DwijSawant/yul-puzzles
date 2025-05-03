// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnString {
    function main() external pure returns (string memory) {
        assembly {
            mstore(0x00,"Hello, RareSkills")
            return(0x00,0x11)
            // your code here
            // return the exact string: `Hello, RareSkills`
        }
    }
}
