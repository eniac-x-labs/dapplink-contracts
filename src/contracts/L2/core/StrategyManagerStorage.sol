// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.20;

import "../interfaces/IStrategyManager.sol";
import "../interfaces/IStrategy.sol";
import "../interfaces/IDelegationManager.sol";
import "../interfaces/ISlashManager.sol";

abstract contract StrategyManagerStorage is IStrategyManager {
    bytes32 public constant DOMAIN_TYPEHASH =
        keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");

    bytes32 public constant DEPOSIT_TYPEHASH =
        keccak256("Deposit(address staker,address strategy,address token,uint256 amount,uint256 nonce,uint256 expiry)");

    uint8 internal constant MAX_STAKER_STRATEGY_LIST_LENGTH = 32;

    bytes32 internal _DOMAIN_SEPARATOR;

    mapping(address => uint256) public nonces;

    address public strategyWhitelister;

    uint256 internal withdrawalDelayBlocks;

    mapping(address => mapping(IStrategy => uint256)) public stakerStrategyShares;

    mapping(address => IStrategy[]) public stakerStrategyList;

    mapping(bytes32 => bool) public withdrawalRootPending;

    mapping(address => uint256) internal numWithdrawalsQueued;

    mapping(IStrategy => bool) public strategyIsWhitelistedForDeposit;

    mapping(address => uint256) internal beaconChainETHSharesToDecrementOnWithdrawal;


    mapping(IStrategy => bool) public thirdPartyTransfersForbidden;


    uint256[39] private __gap;
}
