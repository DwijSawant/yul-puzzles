// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PushToDynamicArray {
    uint256[] pushToMe = [23, 4, 19, 3, 44, 88];

    function main(uint256 newValue) external {
        assembly {
            let slotno := pushToMe.slot
            let length := sload(slotno)
            let baseslot := keccak256(slotno,0x20)

            let elementslot := add(baseslot,length) //length is nothing but index na 
            sstore(elementslot,newValue)
            sstore(slotno, add(length,1))
            // your code here
            // push the newValue to the dynamic array `pushToMe`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[] memory) {
        return pushToMe;
    }
}
