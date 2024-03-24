// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.20;

import "../interfaces/IStrategyManager.sol";
import "../interfaces/IDelegationManager.sol";
import "../interfaces/ISlashManager.sol";


abstract contract DelegationManagerStorage is IDelegationManager {
    bytes32 public constant DOMAIN_TYPEHASH =
        keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");

    bytes32 public constant STAKER_DELEGATION_TYPEHASH =
        keccak256("StakerDelegation(address staker,address operator,uint256 nonce,uint256 expiry)");

    bytes32 public constant DELEGATION_APPROVAL_TYPEHASH =
        keccak256("DelegationApproval(address delegationApprover,address staker,address operator,bytes32 salt,uint256 expiry)");

    bytes32 internal _DOMAIN_SEPARATOR;

    uint256 public constant MAX_WITHDRAWAL_DELAY_BLOCKS = 216000;

    mapping(address => mapping(IStrategy => uint256)) public operatorShares;

    mapping(address => OperatorDetails) internal _operatorDetails;

    mapping(address => address) public delegatedTo;

    mapping(address => uint256) public stakerNonce;

    mapping(address => mapping(bytes32 => bool)) public delegationApproverSaltIsSpent;

    uint256 public minWithdrawalDelayBlocks;

    mapping(bytes32 => bool) public pendingWithdrawals;

    mapping(address => uint256) public cumulativeWithdrawalsQueued;

    address private __deprecated_stakeRegistry;

    mapping(IStrategy => uint256) public strategyWithdrawalDelayBlocks;

    uint256[39] private __gap;
}
