// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface INaughtCoin {
    function INITIAL_SUPPLY() external view returns (uint256);

    function balanceOf(address _owner) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) external returns (bool);
}
