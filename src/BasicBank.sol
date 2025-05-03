// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BasicBank {
    // emit these
    event Deposit(address indexed depositor, uint256 amount);
    event Withdraw(address indexed withdrawer, uint256 amount);

    error InsufficientBalance();

    mapping(address => uint256) public balances;

    function deposit() external payable {
        bytes32 depositSelector = Deposit.selector;
        assembly {
            mstore(0x00,caller())
            mstore(0x20, balances.slot)
            let elesing := keccak256(0x00,0x40)
            let oldbal := sload(elesing)
            sstore(elesing,add(oldbal,callvalue()))
            mstore(0x00,"Deposit(address,uint256)")
            let eventsig1 := keccak256(0x00,24)
            mstore(0x20,callvalue())
            log2(0x20,0x20,eventsig1,caller())

            

            // emit Deposit(msg.sender, msg.value)
            // increment the balance of the msg.sender by msg.value
        }
    }

    function withdraw(uint256 amount) external returns (uint256 bal) {
        bytes32 withdrawSelector = Withdraw.selector;
        bytes4 insufficientBalanceSelector = InsufficientBalance.selector;
        assembly {
            mstore(0x00,caller())
            mstore(0x20,balances.slot)
            let eleslot2 := keccak256(0x00,0x40)
            let oldball := sload(eleslot2)
            if lt(oldball,amount) {
                mstore(0x00,"InsufficientBalance()")
                let hasedinsuf := keccak256(0x00,21)
                mstore(0x00,hasedinsuf) // selector for InsufficientBalance()
                revert(0x00, 0x04)
            }
            {sstore(eleslot2,sub(oldball,amount))
            mstore(0x00,"Withdraw(address,uint256)")
            let eventsig2 := keccak256(0x00,25)
            mstore(0x20,amount)
            log2(0x20,0x20,eventsig2,caller())}
            // emit Withdraw(msg.sender, amount)
            // if the balance is less than amount, revert InsufficientBalance()
            // decrement the balance of the msg.sender by amount
            // send the amount to the msg.sender
        }
    }
}