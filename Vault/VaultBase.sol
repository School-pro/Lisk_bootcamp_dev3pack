// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SafeMath.sol";

contract VaultBase {
    using SafeMath for uint256;

    mapping(address => uint256) internal balances;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }
}
