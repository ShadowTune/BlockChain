// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Storage {

    mapping(uint => uint) public aa; // slot 0
    mapping(address => uint) public bb; // slot 1

    uint[] public cc; // slot 2

    uint8 public a = 7; // 1 byte
    uint16 public b = 10; // 2 bytes
    address public c = 0x648FaaD551af1DA6d6556f0E3C41B37B6055bAD1; // 20bytes
    bool d = true; // 1 byte
    uint64 public e = 15; // 8 bytes
    // 32 bytes, all values will be stored in slot 3

    // 0x 0f 01 648faad551af1da6d6556f0e3c41b37b6055bad1 000a 07

    uint256 public f = 200; // 32 bytes -> slot 4

    uint8 public g = 40; // 1 byte -> slot 5
    

    uint256 public h = 789; // 32 bytes -> slot 6

    constructor() {
        cc.push(10);
        cc.push(100);
        cc.push(1000);
        aa[2] = 4;
        aa[3] = 10;
        bb[0xf8929048D74164582E5FA0897fC654CbF0c096C6] = 100;
    }
}