// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BatchEvents {
    event MyEvent(address indexed emitter, bytes32 indexed id, uint256 num);

    function main(address[] memory emitters, bytes32[] memory ids, uint256[] memory nums) external {
        assembly {
            // Load the length of the arrays
            let length := mload(emitters)
            
            // Iterate over each element in the arrays
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                // Get the current emitter, id, and num
                let emitter := mload(add(emitters, add(0x20, mul(i, 0x20))))
                let id := mload(add(ids, add(0x20, mul(i, 0x20))))
                let num := mload(add(nums, add(0x20, mul(i, 0x20))))
                
                // Store num in memory
                mstore(0x00, num)
                
                // Emit the event
                log3(0x00, 0x20, emitter, id, 0)
            }
        }
    }
}