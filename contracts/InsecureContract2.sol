{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "6e03ffd6-b4cd-47c7-9bfa-68cc9deca12c",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract InsecureContract {\n",
    "    mapping(address => uint256) private balances;\n",
    "\n",
    "    function deposit() external payable {\n",
    "        balances[msg.sender] += msg.value;\n",
    "    }\n",
    "\n",
    "    function withdraw(uint256 amount) external {\n",
    "        if (balances[msg.sender] >= amount) {\n",
    "            (bool success, ) = msg.sender.call{value: amount}(\"\"); // Vulnerable to reentrancy\n",
    "            if (success) {\n",
    "                balances[msg.sender] -= amount;\n",
    "            }\n",
    "        }\n",
    "    }\n",
    "\n",
    "    function setBalance(address user, uint256 newBalance) external {\n",
    "        balances[user] = newBalance; // No access control\n",
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
