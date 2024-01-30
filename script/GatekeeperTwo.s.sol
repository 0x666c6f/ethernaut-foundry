// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {GatekeeperTwo} from "src/gatekeepertwo/GatekeeperTwo.sol";
import {GatemasterTwo} from "src/gatekeepertwo/GateMaster.sol";

contract GateKeeperTwoScript is Script {
    GatekeeperTwo internal gatekeepertwo;

    function setUp() public virtual {
        gatekeepertwo = GatekeeperTwo(
            0xF542166Cd250Eb130aC316cF4fB3BaC20DC8A8aD
        );
    }

    function run() public virtual {
        vm.startBroadcast();
        setUp();
        new GatemasterTwo(address(gatekeepertwo));

        vm.stopBroadcast();
    }
}
