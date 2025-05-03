// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnOppositeBool {
    function main(bool _bool) external pure returns (bool) {
        assembly {
            let invert := xor(_bool,1)
            mstore(0x00,invert)
            return(0x00,0x20)
            // your code here
            // return the opposite of `_bool`
        }
    }
}
