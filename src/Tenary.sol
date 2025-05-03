// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Tenary {
    uint256 public result;

    function main(uint256 a, uint256 b, uint256 c) external {
        assembly {
            let resultslotno := result.slot
            if gt(a,b){ //a>b
                sstore(resultslotno,10)
            }if and(iszero(gt(a,b)),gt(b,c)){ //b>c
                sstore(resultslotno,20)
                }
             if and(iszero(gt(a,b)),iszero(gt(b,c))){
                sstore(resultslotno,30)
            }

            // your code here
            // store `10` in the storage variable `result` if a > b,
            // else if b > c, store `20`,
            // else, store `30`
        }
    }
}
