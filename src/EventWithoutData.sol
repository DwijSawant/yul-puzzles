// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithoutData {
    event MyEvent();

    function main() external {
        assembly {
            // Store "MyEvent()" in memory (9bytes)
            mstore(0x00,"MyEvent()")
            
            // Calculate event signature hash
            // Option 1: Exact length (9 bytes)
            let eventSignature := keccak256(0x00,9)
            
            // Option 2: Use 0x20 (32 bytes) - also works but includes padding
            // let eventSignature := keccak256(0x00, 0x20)
            
            // Emit the event in format (memorystart , memory length , topic0 aka uska start)
            log1(0x00, 0x00,eventSignature)
        }
    }
}