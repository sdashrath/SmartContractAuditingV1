{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "1c46a9e0-62c7-49b6-bd7e-3bf9e7564b5c",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "import \"@openzeppelin/contracts/utils/math/SafeMath.sol\";\n",
    "\n",
    "contract SecureContract {\n",
    "    using SafeMath for uint256;\n",
    "    address public owner;\n",
    "    mapping(address => uint256) public balances;\n",
    "\n",
    "    constructor() {\n",
    "        owner = msg.sender;\n",
    "    }\n",
    "\n",
    "    modifier onlyOwner() {\n",
    "        require(msg.sender == owner, \"Not the contract owner\");\n",
    "        _;\n",
    "    }\n",
    "\n",
    "    function deposit() public payable {\n",
    "        balances[msg.sender] = balances[msg.sender].add(msg.value);\n",
    "    }\n",
    "\n",
    "    function withdraw(uint256 amount) public {\n",
    "        require(balances[msg.sender] >= amount, \"Insufficient balance\");\n",
    "        balances[msg.sender] = balances[msg.sender].sub(amount);\n",
    "        payable(msg.sender).transfer(amount);\n",
    "    }\n",
    "\n",
    "    function destroyContract() public onlyOwner {\n",
    "        selfdestruct(payable(owner));\n",
    "    }\n",
    "}\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.12.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
