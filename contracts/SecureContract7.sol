{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "bb8b3f76-cc72-44a2-9c3b-249b6d5f53a9",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract SecureReentrancy {\n",
    "    mapping(address => uint256) public balances;\n",
    "\n",
    "    function deposit() external payable {\n",
    "        balances[msg.sender] += msg.value;\n",
    "    }\n",
    "\n",
    "    function withdraw() external {\n",
    "        uint256 amount = balances[msg.sender];\n",
    "        require(amount > 0, \"No balance to withdraw\");\n",
    "        balances[msg.sender] = 0; // Secure: State change happens before external call\n",
    "        (bool success, ) = msg.sender.call{value: amount}(\"\");\n",
    "        require(success, \"Transfer failed\");\n",
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
