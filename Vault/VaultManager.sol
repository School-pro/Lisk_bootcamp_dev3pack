// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./VaultBase.sol";

/**
 * @title VaultManager
  * Implements deposit and withdrawal logic.
   */
   contract VaultManager is VaultBase {
        function deposit() external payable {
                    require(msg.value > 0, "Cannot deposit 0 ETH");
                            balances[msg.sender] = balances[msg.sender].add(msg.value);
                                    emit Deposited(msg.sender, msg.value);
        }

            function withdraw(uint256 amount) external {
                        require(amount > 0, "Withdraw amount must be greater than 0");
                                require(balances[msg.sender] >= amount, "Insufficient balance");

                                        balances[msg.sender] = balances[msg.sender].sub(amount);
                                                (bool sent, ) = payable(msg.sender).call{value: amount}("");
                                                        require(sent, "Failed to send Ether");

                                                                emit Withdrawn(msg.sender, amount);
            }
   }
            }
        }
   }