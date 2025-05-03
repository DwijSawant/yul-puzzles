// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithMultipleData {
    // EMIT ME!!!
    event MyEvent(address emitter, uint256 num, bool isActive);

    function main(address emitter, uint256 num, bool isActive) external {
        assembly {
            // your code here
            mstore(0x00,"MyEvent(address,uint256,bool)")
            let mysig := keccak256(0x00,29)
            mstore(0x20,emitter)
            mstore(0x40,num)
            mstore(0x60,isActive)
            log1(0x20,0x60,mysig)
            // emit the `MyEvent(address,uint256,bool)` event
            // the event has three fields of data: an address, a uint256, and a bool
            // use `log1` to emit the event with one topic (the event signature hash) and the data payload
            // Hint: Pack the `emitter`, `num`, and `isActive` values in memory for the data payload
            // Note: Ensure the data layout in memory matches the event parameter order
        }
    }
}
