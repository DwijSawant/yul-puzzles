// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithSelector {
    error RevertData(); // selector: 0xa3b7e096 here the issue is 0xa3b7e0960000000000000..total 0x pakadke 32 

    function main() external pure {
        assembly {
                mstore(0x00,0xa3b7e09600000000000000000000000000000000000000000000000000000000) //make sure u fill in 32 bytes of code
                //0xsomething is not equal to 0xsomething00000000000000000000000 
                //okay so here mstore is of format (memory to start storing shit location , ur data eg: 0xFF(ye 0x00..FF) hoga);
                //and revert is nothing but (memory read starting location , total memory slides )
                revert(0x00,0x04)
                // here we have put in 0x04 as we just need 4 byte return cuz selector is 0x8 charecters which is like 4 bytes na
            // your code here
            // revert with the custom error "RevertData"
            // do the Solidity equivalent of
            // `revert RevertData()`
            // but in assembly
            // hint: https://www.rareskills.io/post/assembly-revert
        }
    }
}
