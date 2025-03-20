// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Owner {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
}
