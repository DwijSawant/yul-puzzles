// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromFixedArray {
    uint256[5] readMe;

    function setValue(uint256[5] calldata x) external {
        readMe = x;
    }

    function main(uint256 index) external view returns (uint256) {
        assembly {
            let slotnum := readMe.slot
            let elementslotnum := add(slotnum,index) //if there was dynamic array here we wont be able to 
            //add the slot directly cuz its fking dynamic so we take hash of slot starting frm of 32 bits
            let result := sload(elementslotnum)
            mstore(0x00,result)
            return(0x00,0x20)
            
            // your code here
            // read the value at the `index` in the fixed array `readMe`
            // and return it
            // Assume `index` is <= to the length of readMe
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
