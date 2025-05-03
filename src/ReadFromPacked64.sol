// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromPacked64 {
    uint64 someValue1;
    uint64 someValue2;
    uint64 readMe;
    uint64 someValue3;

    function setValue(uint64 v1, uint64 v2, uint64 v3, uint64 v4) external {
        someValue1 = v1;
        someValue2 = v2;
        readMe = v3;
        someValue3 = v4;
    }

    function main() external view returns (uint256) {
        assembly {
            let slot := someValue3.slot
            let data := sload(slot)
            let target := shr(128,data)
            target:= and(target,0xFFFFFFFFFFFFFFFF)
            mstore(0x00,target)
            return(0x00 ,0x20)
            // your code here
            // unpack and read data from the storage variable `readMe` of type uint64
            // then return it
        }
    }
}
