# AutomatedFeeForwarder









## Methods

### feeReceiver

```solidity
function feeReceiver() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### forwardFee

```solidity
function forwardFee(address _asset) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _asset | address | undefined |

### forwardFees

```solidity
function forwardFees(contract IERC20[] _assets) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _assets | contract IERC20[] | undefined |

### registry

```solidity
function registry() external view returns (contract HATVaultsRegistry)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract HATVaultsRegistry | undefined |

### timelockController

```solidity
function timelockController() external view returns (contract HATTimelockController)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract HATTimelockController | undefined |




