// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithComplexData {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, address[] players, uint256[] scores);

    function main(address emitter, address[] memory players, uint256[] memory scores) external {
        assembly {
            mstore(0x00,"MyEvent(address,address,uint256)")
            let mysign :=keccak256(0x00,34)
            mstore(0x20,scores)
            log2(0x20,0x40,mysign,emitter)
            // your code here
            // emit the `MyEvent(address,address[],uint256[])` event
            // Hint: Use `log2` to emit the event with the hash as the topic0 and `emitter` as topic1, then the data
        }
    }
}
