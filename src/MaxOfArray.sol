// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            let length := mload(arr)
            if iszero(length){
                revert(0x00,0x00)
            }
            let firstvaule := add(arr,0x20) //imagine first value as 0 of the total vaules in array 
            //its like from here its starting like as in location
            let end := add(firstvaule, mul(length,0x20)) //multiplication is total elements to go 
            //and addition is from where the memory address is staring

            let maxvalue := mload(firstvaule) //declare max for now

            for{let pvt := add(firstvaule,0x20)} lt(pvt,end) {pvt := add(pvt,0x20)} {
                let current := mload(pvt)
                if gt(current,maxvalue){
                    maxvalue:= current
                }
            }
            mstore(0x00,maxvalue)
            return(0x00,0x20)


            // your code here
            // return the maximum value in the array
            // revert if array is empty
        }
    }
}
