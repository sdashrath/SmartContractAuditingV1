// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsecureExample1_1 {
    
        address public owner;

        constructor() {{
            owner = msg.sender;
        }}

        function withdrawFunds() public {{
            // No access control mechanism
            payable(msg.sender).transfer(address(this).balance);
        }}

        receive() external payable {{}}
        
}
