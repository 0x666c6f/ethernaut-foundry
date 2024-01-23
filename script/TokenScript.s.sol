// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Token} from "src/token/Token.sol";
import {TokenTransferer} from "src/token/TokenTransferer.sol";

contract TokenScript is Script {
    Token internal token;
    TokenTransferer internal tokenTransferer;

    function setUp() public virtual {
        token = Token(0x0A53a9d89A2EFdd6475102E6F26e91239A0de5e4);
        tokenTransferer = TokenTransferer(
            0x1dac25e656F9639F67e83AC76b3F61EF7Da667e0
        );
    }

    function run() public virtual {
        vm.startBroadcast();
        console2.log(token.balanceOf(msg.sender));
        bool res = tokenTransferer.transfer(msg.sender, 222000000);
        console2.log(res == true);
        console2.log(token.balanceOf(msg.sender));
        vm.stopBroadcast();
    }
}
