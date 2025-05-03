// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {

    function main(address[] calldata recipients) external payable {
        assembly {
            let length := recipients.length
            let start := recipients.offset //points to element 0 
            let amounties := div(selfbalance(),length)  //declare before sending or else it will send 
            //like half for the first time and half ka half the secound time 
            for {let i := 0} lt(i,length) {i :=add(i,1)} {
                let addr := calldataload(add(start,mul(i,0x20)))
                let sendpay := call(gas(),addr,amounties,0,0,0,0)
            }
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length

        }
    }
}