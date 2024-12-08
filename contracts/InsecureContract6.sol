{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "f4b7d3f8-49b1-4921-8cd4-02d3a37c68f9",
   "metadata": {},
   "outputs": [],
   "source": [
    "// SPDX-License-Identifier: MIT\n",
    "pragma solidity ^0.8.0;\n",
    "\n",
    "contract InsecureOverflow {\n",
    "    uint8 public totalSupply = 255;\n",
    "\n",
    "    function incrementSupply() public {\n",
    "        // Overflow occurs here when totalSupply exceeds 255\n",
    "        totalSupply += 1;\n",
    "    }\n",
    "\n",
    "    function decrementSupply() public {\n",
    "        // Underflow occurs here when totalSupply is 0\n",
    "        totalSupply -= 1;\n",
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
