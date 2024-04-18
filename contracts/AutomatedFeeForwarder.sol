// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "./HATTimelockController.sol";
import "./HATVaultsRegistry.sol";

contract AutomatedFeeForwarder {
    using SafeERC20 for IERC20;

    address public immutable feeReceiver;
    HATTimelockController public immutable timelockController;
    HATVaultsRegistry public immutable registry;

    constructor (HATTimelockController _timelockController, HATVaultsRegistry _registry, address _feeReceiver) {
        timelockController = _timelockController;
        registry = _registry;
        feeReceiver = _feeReceiver;
    }

    function forwardFees(IERC20[] calldata _assets) external {
        for (uint256 i = 0; i < _assets.length;) {
            address[] memory beneficiaries;
            timelockController.swapAndSend(registry, address(_assets[i]), beneficiaries, 0, address(this), abi.encodeWithSignature("forwardFee(address)", _assets[i]));
            unchecked { ++i; }
        }
    }

    function forwardFee(address _asset) external {
        IERC20(_asset).safeTransferFrom(msg.sender, feeReceiver, HATVaultsRegistry(msg.sender).governanceHatReward(address(_asset)));
    }
}
