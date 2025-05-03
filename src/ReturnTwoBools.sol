// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTwoBools {
    function main(bool a, bool b) external pure returns (bool, bool) {
        assembly {
            mstore(0x00,a)
            mstore(0x20,b)
            return(0x00,0x40)
            // your code here
            // return the tuple (a,b)
        }
    }
}
