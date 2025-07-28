// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SafeMath Library
  * Provides basic arithmetic operations with safety checks.
   */
   library SafeMath {
        function add(uint256 a, uint256 b) internal pure returns (uint256) {
                    uint256 c = a + b;
                            require(c >= a, "Addition overflow");
                                    return c;
        }

            function sub(uint256 a, uint256 b) internal pure returns (uint256) {
                        require(b <= a, "Subtraction overflow");
                                return a - b;
            }
   }
            }
        }
   }