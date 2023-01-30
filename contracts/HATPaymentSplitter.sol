// SPDX-License-Identifier: MIT
// Disclaimer https://github.com/hats-finance/hats-contracts/blob/main/DISCLAIMER.md

pragma solidity 0.8.16;

import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
import "./tokenlock/ITokenLock.sol";

contract HATPaymentSplitter is PaymentSplitter {

    // solhint-disable-next-line no-empty-blocks
    constructor (address[] memory payees, uint256[] memory shares_) payable PaymentSplitter(payees, shares_) {}

    /**
     * @notice Releases tokens from a tokenlock contract
     * @param _tokenLock The tokenlock to release from
     */
    function releaseFromTokenLock(ITokenLock _tokenLock) external {
        _tokenLock.release();
    }

    /**
     * @notice Withdraws surplus, unmanaged tokens from a tokenlock contract
     * @param _tokenLock The tokenlock to withdraw surplus from
     * @param _amount Amount of tokens to withdraw
     */
    function withdrawSurplusFromTokenLock(ITokenLock _tokenLock, uint256 _amount) external {
        _tokenLock.withdrawSurplus(_amount);
    }

    /**
     * @notice Sweeps out accidentally sent tokens from a tokenlock contract
     * @param _tokenLock The tokenlock to call sweepToken on
     * @param _token Address of token to sweep
     */
    function sweepTokenFromTokenLock(ITokenLock _tokenLock, IERC20 _token) external {
        _tokenLock.sweepToken(_token);
    }


}
