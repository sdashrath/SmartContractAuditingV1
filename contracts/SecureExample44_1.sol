// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureExample44_1 {
    
        address public owner;

        modifier onlyOwner() {{
            require(msg.sender == owner, "Not the owner");
            _;
        }}

        constructor() {{
            owner = msg.sender;
        }}

        function withdrawFunds() public onlyOwner {{
            payable(owner).transfer(address(this).balance);
        }}

        receive() external payable {{}}
        
}
