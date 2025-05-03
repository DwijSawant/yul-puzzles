// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    function main() external pure {
        assembly {
            // Function selector for `Error(string)`
            mstore(0x00, 0x08c379a000000000000000000000000000000000000000000000000000000000) 
            // Offset for string data (32 bytes from selector)
            mstore(0x04, 0x20) 
            // String length (12 characters for "RevertRevert")
            mstore(0x24, 0x0c) 
            // Correctly store "RevertRevert" in memory (left-aligned, padded to 32 bytes)
            mstore(0x44, 0x5265766572745265766572740000000000000000000000000000000000000000)
            // Revert with the full encoded message
            revert(0x00, 0x64)
        }
    }
}
