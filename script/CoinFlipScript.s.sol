// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import "src/coinflip/CoinFlip.sol";
import "src/coinflip/CoinFlipper.sol";

contract CoinFlipScript is Script {
    CoinFlipper internal coinFlipper;
    CoinFlip internal coinFlip;

    function setUp() public virtual {
        coinFlip = CoinFlip(0x8edF4469B93dd1bB9fE35C4507B36221Baa1F009);
        coinFlipper = CoinFlipper(0x9950E6b830aF9Dd055305E66526f7eECd94cf87a);
    }

    function run() public virtual {
        vm.startBroadcast();
        coinFlipper.flip();
        console2.log(coinFlip.consecutiveWins());
        vm.stopBroadcast();
    }
}
