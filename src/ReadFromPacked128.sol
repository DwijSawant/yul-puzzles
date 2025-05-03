// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromPacked128 {
    uint128 someValue;
    uint128 readMe;

    function setValue(uint128 v1, uint128 v2) external {
        someValue = v1;
        readMe = v2;
    }

    function main() external view returns (uint256) {
        assembly {
            let slot := someValue.slot
            let data := sload(slot)

            let readMevalue := shr(128,data) // packed is somevalue + readMe = 256 

            mstore(0x00,readMevalue)
            return(0x00,0x20)
            //here we didnt mention readme cuz its already stored sequence like mentioned so 
            //by default somevalue was first then read me what we did is we shifter somevalue to right side of readme

            // your code here
            // unpack and read data from the storage variable `readMe` of type uint128
            // then return it
        }
    }
}
