// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnBytes {
    function main(address a, uint256 b) external pure returns (bytes memory) {
        assembly {
            // Allocate memory for return data (starts at free memory pointer)
            let ptr := mload(0x40)

            // First 32 bytes: length of the returned bytes array (0x40 = 64 bytes)

            // Next 32 bytes: address `a` stored at offset ptr + 0x20
            mstore(add(ptr, 0x20), a)

            // Next 32 bytes: uint256 `b` stored at offset ptr + 0x40
            mstore(add(ptr, 0x40), b)

            // Return the full bytes array (length + contents = 0x60 bytes)
            return(ptr, 0x60)
        }
    }
}
