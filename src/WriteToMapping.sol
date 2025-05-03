// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToMapping {
    mapping(uint256 index => uint256) public writeHere;

    function main(uint256 index, uint256 value) external {
        assembly {
            let slotno := writeHere.slot
            mstore(0x00,index)
            mstore(0x20,slotno) //cuz stored like key + slotno
            let elemetsnum := keccak256(0x00,0x40)
            sstore(elemetsnum,value)
            // your code here
            // store `value` at the `index` in the mapping `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
