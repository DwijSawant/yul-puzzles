// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnArrayOfUint256 {
    function main(uint256 a, uint256 b, uint256 c) external pure returns (uint256[] memory) {
        assembly {
            let memptr := mload(0x40)
            mstore(memptr,3)
            mstore(add(memptr,0x20),a)
            mstore(add(memptr,0x40),b)
            mstore(add(memptr,0x60),c)
            return(memptr,0x80)
            // your code here
            // return an array of [a,b,c]
        }
    }
}
