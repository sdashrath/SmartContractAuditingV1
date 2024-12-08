{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "3c5c7c91-9a24-4c19-975f-3679b9fa7612",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "import \"@openzeppelin/contracts/utils/math/SafeMath.sol\";\n",
    "\n",
    "contract SecureSafeMath {\n",
    "    using SafeMath for uint256;\n",
    "\n",
    "    uint256 public totalSupply = 255;\n",
    "\n",
    "    function incrementSupply() public {\n",
    "        totalSupply = totalSupply.add(1);\n",
    "    }\n",
    "\n",
    "    function decrementSupply() public {\n",
    "        totalSupply = totalSupply.sub(1);\n",
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
