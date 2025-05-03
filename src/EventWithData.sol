// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithData {
    // EMIT ME!!!
    event MyEvent(uint256 number);

    function main(uint256 _number) external {
        assembly {
            mstore(0x00,"MyEvent(uint256)")
            let eventSignature := keccak256(0x00,16)  //how 16 cuz the count e-v-e-n-t-(-u-i-n-t-2-5-6-) so its 16 bytes
            mstore(0x20,_number)
            log1(0x20,0x20,eventSignature)
            // your code here
            // emit the `MyEvent(uint256)` event
            // the event has one topic and one non-indexed field:
            //   topic 0: The event signature hash (keccak256("MyEvent(uint256)"))
            //   data: The `number` value as the payload
            // Hint: Use `log1` to emit the event with the hash as the topic and `number` as data
        }
    }
}
