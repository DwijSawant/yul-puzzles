// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArray {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(uint256 index) external view returns (uint256) {
        assembly {
            let slotnum := readMe.slot
            let eleslotnum := add(keccak256(slotnum ,0x20),index)
            let result := sload(eleslotnum)
            mstore(0x00, result )
            return(0x00 , 0x20)
            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Assume `index` is <= to the length of readMe
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}

