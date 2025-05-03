// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            let slotno := writeHere.slot
            let length := mload(x)
            let kekslotno := keccak256(slotno,0x20)
            sstore(slotno,length)
            for{let i := 0 } lt(i,length) {i:= add(i,1)}{
                let elementsno := add(kekslotno,i)
                let value := mload(add(add(x,0x20),mul(i,0x20)))
                sstore(elementsno,value)
            }
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
