// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked64 {
    uint64 public someValue1 = 7;
    uint64 public writeHere = 1;
    uint64 public someValue2 = 7;
    uint64 public someValue3 = 7;

    function main(uint256 v) external {
        assembly{
            let slot := someValue3.slot
            let data := sload(slot)
            let masking := shl(64,0xFFFFFFFFFFFFFFFF)
            let clearedata := and(data,not(masking))
            let newvalue := or(clearedata,shl(64,v))
            // mstore(0x00,slot)
            sstore(slot,newvalue)
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
        
        }
    }
}
