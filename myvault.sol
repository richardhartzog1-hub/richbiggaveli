// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MyVault {
    mapping(address => uint256) public balances;

    // Deposit test ETH into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw your ETH back
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // View your stored balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    } 
    
    receive() external payable {
    balances[msg.sender] += msg.value;
    }
    
    }
