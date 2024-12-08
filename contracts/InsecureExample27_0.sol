// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsecureExample27_0 {
    
        mapping(address => uint256) public balances;

        function deposit() external payable {{
            balances[msg.sender] += msg.value;
        }}

        function withdraw() external {{
            uint256 amount = balances[msg.sender];
            require(amount > 0, "No balance to withdraw");
            (bool success, ) = msg.sender.call{{value: amount}}("");
            require(success, "Transfer failed");
            balances[msg.sender] = 0; // Vulnerable: State change happens after external call
        }}
        
}
