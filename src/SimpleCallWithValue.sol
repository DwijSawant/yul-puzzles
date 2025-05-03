// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SimpleCallWithValue {

    function main(address t) external payable {
        assembly {
            mstore(0x00,0xc298557800000000000000000000000000000000000000000000000000000000)
            let success := call(gas(),t,callvalue(),0x00,0x04,0,0)
            // your code here
            // call "t.foo()" while sending msg.value
            // hint: "foo()" has function selector 0xc2985578
            // hint: callvalue() returns the value of the current call
       }
    }
}