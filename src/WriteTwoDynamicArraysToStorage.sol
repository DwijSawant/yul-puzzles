// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {
            let slot1 := writeHere1.slot
            let length1 := x.length
            mstore(0x00,slot1)
            let hashedslot1 := keccak256(0x00,0x20)
            sstore(slot1,length1)
            
            for {let i := 0} lt(i,length1) {i := add(i,1)}{
            let ele1slot := add(hashedslot1,i)
            let value1 := calldataload(add(x.offset,mul(i,0x20)))
            sstore(ele1slot , value1)
            }

            
            let slot2 := writeHere2.slot
            let length2 := y.length
            mstore(0x00,slot2)
            let hashedslot2 := keccak256(0x00,0x20)
            sstore(slot2,length2)
            for {let t := 0} lt(t,length2) {t := add(t,1)} {
            let ele2slot := add(hashedslot2,t)
            let value2 := calldataload(add(y.offset,mul(t,0x20)))
            sstore(ele2slot,value2)
            } 
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`
        }
    }
}
