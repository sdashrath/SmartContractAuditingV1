{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "fa7641b1-7d1b-41db-b9a7-e176bb3e9f40",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract SecureAccessControl {\n",
    "    address public owner;\n",
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
    "    function withdrawFunds() public onlyOwner {\n",
    "        payable(msg.sender).transfer(address(this).balance);\n",
    "    }\n",
    "\n",
    "    receive() external payable {}\n",
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
