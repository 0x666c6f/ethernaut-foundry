// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {King} from "src/king/King.sol";
import {KingMaker} from "src/king/KingMaker.sol";

contract KingScript is Script {
    King internal king;
    KingMaker internal kingMaker;

    function setUp() public virtual {
        king = King(payable(0xe650403d1fe6B13625E07392ae0021C036b7f978));
        kingMaker = KingMaker(
            payable(0xDCFc2a79D08D65B9d1A21e7c781F96340Fa8835f)
        );
    }

    function run() public virtual {
        vm.startBroadcast();
        console2.log(king._king());
        kingMaker.makeKing{value: king.prize() + 10000 wei}();
        console2.log(king._king());
        vm.stopBroadcast();
    }
}
