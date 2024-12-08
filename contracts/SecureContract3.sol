{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "61ac48e7-039f-4647-9143-e0626704a81e",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract SecureContract3 {\n",
    "    address public owner;\n",
    "    bool public paused;\n",
    "\n",
    "    mapping(address => uint256) private balances;\n",
    "\n",
    "    modifier onlyOwner() {\n",
    "        require(msg.sender == owner, \"Not the contract owner\");\n",
    "        _;\n",
    "    }\n",
    "\n",
    "    modifier whenNotPaused() {\n",
    "        require(!paused, \"Contract is paused\");\n",
    "        _;\n",
    "    }\n",
    "\n",
    "    constructor() {\n",
    "        owner = msg.sender;\n",
    "        paused = false;\n",
    "    }\n",
    "\n",
    "    function deposit() external payable whenNotPaused {\n",
    "        require(msg.value > 0, \"Amount must be greater than 0\");\n",
    "        balances[msg.sender] += msg.value;\n",
    "    }\n",
    "\n",
    "    function withdraw(uint256 amount) external whenNotPaused {\n",
    "        require(balances[msg.sender] >= amount, \"Insufficient balance\");\n",
    "        balances[msg.sender] -= amount;\n",
    "        (bool success, ) = msg.sender.call{value: amount}(\"\");\n",
    "        require(success, \"Transfer failed\");\n",
    "    }\n",
    "\n",
    "    function pauseContract() external onlyOwner {\n",
    "        paused = true;\n",
    "    }\n",
    "\n",
    "    function unpauseContract() external onlyOwner {\n",
    "        paused = false;\n",
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
