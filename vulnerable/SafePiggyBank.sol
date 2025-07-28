// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecurePiggyBank {
        address public owner;

            event Deposited(address indexed user, uint256 amount);
                event Withdrawn(address indexed owner, uint256 amount);

                    constructor() {
                                owner = msg.sender;
                    }

                        modifier onlyOwner() {
                                    require(msg.sender == owner, "Not owner");
                                            _;
                        }

                            function deposit() public payable {
                                        require(msg.value > 0, "Must send ETH");
                                                emit Deposited(msg.sender, msg.value);
                            }

                                function withdraw() public onlyOwner {
                                            uint256 balance = address(this).balance;
                                                    require(balance > 0, "No funds to withdraw");
                                                            payable(owner).transfer(balance);
                                                                    emit Withdrawn(owner, balance);
                                }

                                    function getBalance() public view returns (uint256) {
                                                return address(this).balance;
                                    }
}
                                    }
                                }
                            }
                        }
                    }
}