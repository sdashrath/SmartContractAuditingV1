{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "f4e6bd63-6362-46b0-9dff-bd73b6787f09",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract InsecureContract3 {\n",
    "    mapping(address => uint256) public balances;\n",
    "\n",
    "    function deposit(uint256 amount) external {\n",
    "        balances[msg.sender] += amount; // Potential overflow vulnerability\n",
    "    }\n",
    "\n",
    "    function withdraw(uint256 amount) external {\n",
    "        if (balances[msg.sender] >= amount) {\n",
    "            balances[msg.sender] -= amount; // No proper validation for underflow\n",
    "            payable(msg.sender).transfer(amount); // Direct transfer without checks\n",
    "        }\n",
    "    }\n",
    "\n",
    "    function transfer(address recipient, uint256 amount) external {\n",
    "        balances[msg.sender] -= amount; // No validation\n",
    "        balances[recipient] += amount;\n",
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
