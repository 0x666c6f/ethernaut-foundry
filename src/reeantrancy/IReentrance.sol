// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

interface IReentrance {
    function donate(address _to) external payable;

    function balanceOf(address _who) external view returns (uint balance);

    function withdraw(uint _amount) external;
}
