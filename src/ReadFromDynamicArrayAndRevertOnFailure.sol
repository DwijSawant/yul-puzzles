// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArrayAndRevertOnFailure {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(int256 index) external view returns (uint256) {
        assembly {
            let slot := readMe.slot
            let elementslotnum := add(keccak256(slot,0x20),index)
            let resulty := sload(elementslotnum)
            if eq(resulty,0){
                mstore(0x00,0x4e487b7100000000000000000000000000000000000000000000000000000000)
                mstore(0x04,0x32)
                revert(0x00, 0x24)
            }
            {mstore(0x00,resulty)
            return(0x00 ,0x20)}
            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Revert with Solidity panic on failure, use error code 0x32 (out-of-bounds or negative index)
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
