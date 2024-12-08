// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureExample22_2 {
    
        uint256 public total;

        function add(uint256 value) public {{
            require(value <= type(uint256).max - total, "Overflow protection");
            total += value; // Safe from overflow
        }}
        
}
