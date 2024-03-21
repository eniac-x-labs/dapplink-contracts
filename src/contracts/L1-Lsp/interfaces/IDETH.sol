// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Permit.sol";

interface IDETH is IERC20, IERC20Permit {
    /// @notice Mint dETH to the staker.
    /// @param staker The address of the staker.
    /// @param amount The amount of tokens to mint.
    function mint(address staker, uint256 amount) external;

    /// @notice Burn dETH from the msg.sender.
    /// @param amount The amount of tokens to burn.
    function burn(uint256 amount) external;
}
