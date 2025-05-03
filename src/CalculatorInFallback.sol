// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CalculatorInFallback {
    uint256 public result;

    fallback() external {
        assembly {
            // Load function selector (first 4 bytes of calldata)
            let selector := calldataload(0)
            
            // Check for add(uint256,uint256) selector
            if eq(selector, 0x771602f7) {
                let a := calldataload(4)   // First argument at position 4
                let b := calldataload(36)  // Second argument at position 36
                sstore(result.slot, add(a, b))
                stop()
            }
            
            // Check for sub(uint256,uint256) selector
            if eq(selector, 0xb67d77c5) {
                let a := calldataload(4)
                let b := calldataload(36)
                sstore(result.slot, sub(a, b))
                stop()
            }
            
            // Check for mul(uint256,uint256) selector
            if eq(selector, 0xc8a4ac9c) {
                let a := calldataload(4)
                let b := calldataload(36)
                sstore(result.slot, mul(a, b))
                stop()
            }
            
            // Check for div(uint256,uint256) selector
            if eq(selector, 0xa391c15b) {
                let a := calldataload(4)
                let b := calldataload(36)
                sstore(result.slot, div(a, b))
                stop()
            }
            
            // Revert if no matching selector found
            revert(0, 0)
        }
    }
}
// 4 bytes se chalu hota 1st variable (its like 1-3 func selector 
                //in evm abi code  )
// then 1st is 32 bytes then 32 ... so (4+32=36 so 36 se 2nd var)

        // your code here
        // compare the function selector in the calldata with the any of the selectors below, then
        // execute a logic based on the right function selector and store the result in `result` variable.
        // assumming operations won't overflow

        // add(uint256,uint256) -> 0x771602f7 (add two numbers and store result in storage)
        // sub(uint256,uint256) -> 0xb67d77c5 (sub two numbers and store result in storage)
        // mul(uint256,uint256) -> 0xc8a4ac9c (mul two numbers and store result in storage)
        // div(uint256,uint256) -> 0xa391c15b (div two numbers and store result in storage)