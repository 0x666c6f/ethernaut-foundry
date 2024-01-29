// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Script, console2} from "forge-std/Script.sol";
import {Reentered} from "src/reeantrancy/Reentered.sol";

contract ReentranceScript is Script {
    Reentered internal re;

    function setUp() public virtual {
        re = Reentered(0x358997b8a22A59fE334Cd24BcdD916eca22D39C6);
    }

    function run() public virtual {
        vm.startBroadcast();
        re.donate{value: 0.001 ether}();
        re.withdraw(0.001 ether);
        vm.stopBroadcast();
    }
}
