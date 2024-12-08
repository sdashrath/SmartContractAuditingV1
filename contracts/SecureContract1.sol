{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "71491a30-47ad-4bd8-8e52-e205ab13250a",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract SecureContract {\n",
    "    address public owner;\n",
    "    mapping(address => uint256) private balances;\n",
    "\n",
    "    modifier onlyOwner() {\n",
    "        require(msg.sender == owner, \"Caller is not the owner\");\n",
    "        _;\n",
    "    }\n",
    "\n",
    "    constructor() {\n",
    "        owner = msg.sender;\n",
    "    }\n",
    "\n",
    "    function deposit() external payable {\n",
    "        require(msg.value > 0, \"Deposit amount must be greater than 0\");\n",
    "        balances[msg.sender] += msg.value;\n",
    "    }\n",
    "\n",
    "    function withdraw(uint256 amount) external {\n",
    "        require(amount > 0, \"Withdraw amount must be greater than 0\");\n",
    "        require(balances[msg.sender] >= amount, \"Insufficient balance\");\n",
    "\n",
    "        balances[msg.sender] -= amount;\n",
    "        (bool success, ) = msg.sender.call{value: amount}(\"\");\n",
    "        require(success, \"Transfer failed\");\n",
    "    }\n",
    "\n",
    "    function setOwner(address newOwner) external onlyOwner {\n",
    "        require(newOwner != address(0), \"Invalid address\");\n",
    "        owner = newOwner;\n",
    "    }\n",
    "\n",
    "    function getBalance(address user) external view returns (uint256) {\n",
    "        return balances[user];\n",
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
