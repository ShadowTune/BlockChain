// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Logger.sol";
import "./Owner.sol";
import "./IFaucet.sol";

contract Faucet is Owner, Logger, IFaucet {

    uint public balance;
    uint public numfunders;
    
    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    function emitLog() public override pure returns(bytes32) {
        return "Hello World";
    }

    receive() external payable {
        balance += msg.value;
    }

    modifier limitWithdraw(uint withdrawAmount) {
        require(
            withdrawAmount <= 100000000000000000, 
            "Withdraw amount not valid"
        );
        _;
    }

    function AddFunds() external override payable {
        balance += msg.value;
        // funders.push(msg.sender);
        uint index = numfunders++;
        // funders[index] = msg.sender;
        address funder = msg.sender;
        if (!funders[funder]) {
            numfunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function WithDraw(uint withdrawAmount) external override limitWithdraw(withdrawAmount) {
        payable(msg.sender).transfer(withdrawAmount);
    }

    function ReturnFunds() external view returns (uint) {
        return address(this).balance;
    }

    function GetFunders() external view returns(address[] memory) {
        address[] memory _funders = new address[](numfunders);
        for (uint i = 0; i < numfunders; i++) {
            _funders[i] = lutFunders[i];
        }
        return _funders;
    } 

    function GetFundersPos(uint8 index) external view returns(address) {
        // address[] memory _funders = this.GetFunders();
        return lutFunders[index];
    }  
}

// const instance = await Faucet.deployed();

// instance.AddFunds({from: accounts[0], value: "2000000000000000000"})
// instance.AddFunds({from: accounts[1], value: "2000000000000000000"})

// instance.Withdraw("500000000000000000", {from: accounts[1]})

// instance.GetFundersPos(0)
// instance.GetFunders()
 