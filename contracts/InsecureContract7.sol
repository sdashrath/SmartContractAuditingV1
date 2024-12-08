{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ca8d9212-d09b-43b1-9222-92ed8b686501",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract InsecureAccessControl {\n",
    "    address public owner;\n",
    "\n",
    "    constructor() {\n",
    "        owner = msg.sender;\n",
    "    }\n",
    "\n",
    "    function withdrawFunds() public {\n",
    "        // No access control mechanism\n",
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
