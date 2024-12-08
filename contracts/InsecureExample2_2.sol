// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsecureExample2_2 {
    
        uint256 public total;

        function add(uint256 value) public {{
            total += value; // Vulnerable to overflow
        }}
        
}
