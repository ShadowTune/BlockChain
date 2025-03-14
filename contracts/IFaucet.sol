// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.21;
 
interface IFaucet {
   function AddFunds() external payable;
   function WithDraw(uint withdrawAmount) external;
 }