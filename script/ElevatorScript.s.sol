// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Elevator} from "src/elevator/Elevator.sol";
import {Building} from "src/elevator/Building.sol";

contract ElevatorScript is Script {
    Building internal b;
    Elevator internal e;

    function setUp() public virtual {
        b = Building(0x790A59aE38f563777342D7444338c2118Eb89b31);
        e = Elevator(0x17c059f135ad4222A8BD3d9917C8AAf4c3c94E26);
    }

    function run() public virtual {
        vm.startBroadcast();
        console2.log(e.top());
        console2.log(e.floor());
        b.goTo(100);
        console2.log(e.top());
        console2.log(e.floor());
        vm.stopBroadcast();
    }
}
